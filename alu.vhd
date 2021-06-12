LIBRARY IEEE;
LIBRARY STD;
USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;

entity ALU is
	port(clk, reset, op1_ready, op2_ready, opID_ready: in bit;
	opID: IN BIT_VECTOR(1 downto 0);
	res_ready: out bit;
	data: INOUT STD_LOGIC_VECTOR(31 downto 0));
end ALU;


ARCHITECTURE behavioral_seq OF ALU IS
BEGIN PROCESS(clk, reset, op1_ready, op2_ready, opID_ready, opID)
VARIABLE operation: BIT_VECTOR(1 downto 0);
VARIABLE A,B: STD_LOGIC_VECTOR(31 downto 0);
VARIABLE ZWISCHEN: STD_LOGIC_VECTOR(63 DOWNTO 0);
VARIABLE state: BIT_VECTOR(2 downto 0);
BEGIN
if (clk='1') then
	if (reset='1') then
		res_ready <= '0';
		data <= "00000000000000000000000000000000";
		state := "000";
		A := "00000000000000000000000000000000";
		B := "00000000000000000000000000000000";
		ZWISCHEN := "0000000000000000000000000000000000000000000000000000000000000000";
		report "reset";
	elsif (opID_ready='1') then
		operation := opID;
		state(1) := '1';
		report "opID ready";
	elsif (op1_ready='1') then
		A := data;
		state(0) := '1';
		report "op1 ready";
	elsif (op2_ready='1') then
		B := data;
		state(2) := '1';
		report "op2 ready";
	elsif (state="111") then 
		CASE operation is
		when "00" =>
			-- Addition
			--ZWISCHEN := internal_data + data;
			--data <= ZWISCHEN(31 DOWNTO 0);
			--report to_hstring(A);
			--report to_hstring(B);
			data <= A + B;
		when "01"|"10" =>
			-- Subtraktion
			data <= A - B;
		when "11" =>
			-- Multiplikation
			ZWISCHEN := A * B;
			data <= ZWISCHEN(31 DOWNTO 0);
		when others =>
			-- F für Fehler anzeigen
		END CASE;
		report "res ready";
		res_ready <= '1';
	end if;
end if;

END PROCESS;
END behavioral_seq;
