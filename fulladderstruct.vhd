LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_arith.all;
USE work.all;

ENTITY ORGATE IS
PORT ( A, B : IN BIT;
Z : OUT BIT);
END ORGATE;

ARCHITECTURE behave OF ORGATE IS
BEGIN
Z <= A OR B;
END behave;


entity FULLADD is
	port(A, B, CIN : in bit;
	SUM, CARRY : out bit);
end FULLADD;

architecture STRUCT of FULLADD is
	signal I1, I2, I3 : bit;

	component HALFADD
	port(A,B        : in bit  ;SUM, CARRY : out bit  );
	end   component;

	component ORGATE
	port(A,B : in bit;Z: out bit);
	end component;


begin
	
	U1:HALFADD port map(A,B,I1,I2);
	U2:HALFADD port map(I1,CIN,SUM,I3);
	U3:ORGATE port map(I3,I2,CARRY);

end STRUCT;