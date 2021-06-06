LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY siebensegmenttest IS END siebensegmenttest;

ARCHITECTURE testdriver OF siebensegmenttest IS 
  SIGNAL NUM:BIT_VECTOR(3 DOWNTO 0);
  SIGNAL RESET:BIT;
  SIGNAL OUTPUT:BIT_VECTOR(0 to 6);

  SIGNAL clk: BIT := '0';

  COMPONENT SIEBENSEGMENT PORT(
    NUM: in bit_vector(3 downto 0);
    RESET: in BIT;
    OUTPUT: out bit_vector(0 to 6));
  END COMPONENT;

  FOR ALL:SIEBENSEGMENT USE ENTITY work.siebensegment(behaviour);

BEGIN
  DuT : SIEBENSEGMENT PORT MAP(NUM, RESET, OUTPUT);
  clk <= NOT clk AFTER 20 ns;

  stimulus: PROCESS
    BEGIN
    RESET <= '0';  -- Eingänge zurücksetzten
    NUM <= "0000"; -- Eingänge zurücksetzten

    WAIT UNTIL clk'EVENT AND clk= '1';

    -- Alle Zahlen von 0-15 durchtesten
    for i in 0 to 15 loop
       NUM <= To_bitvector(std_logic_vector(to_unsigned(i, 4)));
       WAIT UNTIL clk'EVENT AND clk= '1';
    end loop;

    RESET <= '1'; -- RESET Testen
    WAIT UNTIL clk'EVENT AND clk= '1';
  END PROCESS;

END testdriver;