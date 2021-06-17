LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY testwasch IS END testwasch;

ARCHITECTURE testdriver OF testwasch IS 
  SIGNAL clk, reset, start, abbruch, tuere_zu, wasser_ok, temp_ok, waschen_ok, spuelen_ok, pumpen_taste, pumpen_ok, schleuder_taste, schleudern_ok: BIT;
  SIGNAL wasser_auf, heizen, waschen, spuelen, pumpen, schleudern: BIT;

  COMPONENT WASCHMASCHINE IS
  port(clk, reset, start, abbruch, tuere_zu, wasser_ok, temp_ok, waschen_ok, spuelen_ok, pumpen_taste, pumpen_ok, schleuder_taste, schleudern_ok: IN BIT;
    wasser_auf, heizen, waschen, spuelen, pumpen, schleudern: OUT BIT);
  end COMPONENT;

BEGIN
  DuT : WASCHMASCHINE PORT MAP(clk, reset, start, abbruch, tuere_zu, wasser_ok, temp_ok,
waschen_ok, spuelen_ok, pumpen_taste, pumpen_ok, schleuder_taste,
schleudern_ok, wasser_auf, heizen, waschen, spuelen, pumpen, schleudern);
  clk <= NOT clk AFTER 20 ns;

  stimulus: PROCESS
    BEGIN

    WAIT UNTIL clk'EVENT AND clk= '1';
    start <= '1';
    WAIT UNTIL clk'EVENT AND clk= '1';
    tuere_zu <= '1';
    WAIT UNTIL clk'EVENT AND clk= '1';
    WAIT UNTIL clk'EVENT AND clk= '1';
    wasser_ok <= '1';
    WAIT UNTIL clk'EVENT AND clk= '1';
    WAIT UNTIL clk'EVENT AND clk= '1';
    WAIT UNTIL clk'EVENT AND clk= '1';
    temp_ok <= '1';
    WAIT UNTIL clk'EVENT AND clk= '1';
    WAIT UNTIL clk'EVENT AND clk= '1';
    WAIT UNTIL clk'EVENT AND clk= '1';
    waschen_ok <= '1';
    WAIT UNTIL clk'EVENT AND clk= '1';
    spuelen_ok <= '1';
    WAIT UNTIL clk'EVENT AND clk= '1';


  END PROCESS;

END testdriver;