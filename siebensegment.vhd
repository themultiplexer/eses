LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY SIEBENSEGMENT IS
port(NUM: in bit_vector(3 downto 0);
RESET: in BIT;
OUTPUT: out bit_vector(0 to 6));
end SIEBENSEGMENT;

ARCHITECTURE BEHAVIOUR OF SIEBENSEGMENT IS
BEGIN PROCESS(NUM, RESET)
BEGIN
if RESET = '1' then
  OUTPUT <= "1111111";
else
  CASE NUM is
    when "0000" =>
        OUTPUT <= "0000001"; -- 0
    when "0001" =>
        OUTPUT <= "1001111"; -- 1
    when "0010" =>
        OUTPUT <= "0010010"; -- 2
    when "0011" =>
        OUTPUT <= "0000110"; -- 3
    when "0100" =>
        OUTPUT <= "0001100"; -- 4
    when "0101" =>
        OUTPUT <= "0100100"; -- 5
    when "0110" =>
        OUTPUT <= "0100000"; -- 6
    when "0111" =>
        OUTPUT <= "0001111"; -- 7
    when "1000" =>
        OUTPUT <= "0000000"; -- 8
    when "1001" =>
        OUTPUT <= "0000100"; -- 9
    when others =>
        OUTPUT <= "0111000"; -- F für Fehler anzeigen
  END CASE;
end if;
END PROCESS;
END BEHAVIOUR;