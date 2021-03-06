LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY testadd IS END testadd;

ARCHITECTURE testdriver OF testadd IS 
  constant wortbreite : integer := 32;

  SIGNAL A,B:BIT_VECTOR(wortbreite-1 DOWNTO 0);
  SIGNAL CIN: BIT;
  SIGNAL SUM:BIT_VECTOR(wortbreite-1 DOWNTO 0);
  SIGNAL COUT: BIT;
  SIGNAL clk: BIT := '0';

  COMPONENT NBITADDER PORT(
    A,B: IN BIT_VECTOR(wortbreite-1 DOWNTO 0);
    CIN: IN BIT;
    S: OUT BIT_VECTOR(wortbreite-1 DOWNTO 0);
    COUT: OUT BIT);
  END COMPONENT;

  FOR ALL:NBITADDER USE ENTITY work.nbitadder(struct) GENERIC MAP (wortbreite => wortbreite);

BEGIN
  DuT : NBITADDER PORT MAP(A,B,CIN, SUM, COUT);
  clk <= NOT clk AFTER 50 ns;

  stimulus: PROCESS
    BEGIN
    -- Eingänge zurücksetzten
    A <= "00000000000000000000000000000000";
    B <= "00000000000000000000000000000000";
    CIN <= '0';
    WAIT UNTIL clk'EVENT AND clk= '1';
    A <= "00000000000000000000000000111110";
    B <= "00000000000000000000000000000010"; -- 62 + 2 = 64
    WAIT UNTIL clk'EVENT AND clk= '1';
    -- Eingänge zurücksetzten
    A <= "00000000000000000000000000000000";
    B <= "00000000000000000000000000000000";
    CIN <= '0';
    WAIT UNTIL clk'EVENT AND clk= '1';
    A <= "11111111111111111111111111111111"; 
    B <= "00000000000000000000000000000001";
    CIN <= '1';
    WAIT UNTIL clk'EVENT AND clk= '1';
    -- Eingänge zurücksetzten
    A <= "00000000000000000000000000000000";
    B <= "00000000000000000000000000000000";
    CIN <= '0';
    WAIT UNTIL clk'EVENT AND clk= '1';
    A <= "01111111111111111111111111111111"; -- 2147483647 + 1 = 2147483648
    B <= "00000000000000000000000000000001"; -- Alle (internen) Carry Signale werden getestet
    WAIT UNTIL clk'EVENT AND clk= '1';
    -- Eingänge zurücksetzten
    A <= "00000000000000000000000000000000";
    B <= "00000000000000000000000000000000";
    CIN <= '0';
    WAIT UNTIL clk'EVENT AND clk= '1';
    A <= "00000000000000000000000000000001"; -- 1 + 2147483647 = 2147483648
    B <= "01111111111111111111111111111111"; -- Alle (internen) Carry Signale werden getestet (andere Richtung)
    WAIT UNTIL clk'EVENT AND clk= '1';
    -- Eingänge zurücksetzten
    A <= "00000000000000000000000000000000";
    B <= "00000000000000000000000000000000";
    CIN <= '0';
    WAIT UNTIL clk'EVENT AND clk= '1';
    A <= "10101010101010101010101010101010"; -- 2863311530 + 2863311530 = 5726623060
    B <= "10101010101010101010101010101010"; -- COUT = 1, S = 01010101010101010101010101010100
    WAIT UNTIL clk'EVENT AND clk= '1';
    -- Eingänge zurücksetzten
    A <= "00000000000000000000000000000000";
    B <= "00000000000000000000000000000000";
    CIN <= '0';
    WAIT UNTIL clk'EVENT AND clk= '1';
    A <= "11111111111111111111111111111111"; -- 4294967295 + 4294967295 = 8589934590
    B <= "11111111111111111111111111111111"; -- COUT sollte 1 sein und alle Bits 1, außer Bit 0 
    WAIT UNTIL clk'EVENT AND clk= '1';
    -- Eingänge zurücksetzten
    A <= "00000000000000000000000000000000";
    B <= "00000000000000000000000000000000";
    CIN <= '0';
    WAIT UNTIL clk'EVENT AND clk= '1';
    A <= "11111111111111111111111111111111";
    B <= "11111111111111111111111111111111"; 
    CIN <= '1';
    WAIT UNTIL clk'EVENT AND clk= '1';
  END PROCESS;

END testdriver;