LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY WASCHMASCHINE IS
port(clk, reset, start, abbruch, tuere_zu, wasser_ok, temp_ok,
waschen_ok, spuelen_ok, pumpen_taste, pumpen_ok, schleuder_taste,
schleudern_ok: IN BIT;
wasser_auf, heizen, waschen, spuelen, pumpen, schleudern: OUT BIT);
end WASCHMASCHINE;

ARCHITECTURE BEHAVIOUR OF WASCHMASCHINE IS
TYPE State_type IS (S0, S1, S2, S3, S4);
SIGNAL State : State_Type;

BEGIN PROCESS(STATE, clk, reset, start, abbruch, tuere_zu, wasser_ok, temp_ok,
waschen_ok, spuelen_ok, pumpen_taste, pumpen_ok, schleuder_taste,
schleudern_ok)
BEGIN
if CLK'event and RESET = '1' then
  STATE <= S0;
else
 case STATE is 
  when S0 =>
    if start = '1' and tuere_zu = '1' then
      wasser_auf <= '1';
      STATE <= S1;
    end if;
  when S1 => 
    if wasser_ok = '1' then
      wasser_auf <= '0';
      heizen <= '1';
      STATE <= S2;
    end if;
  when S2 => 
    if temp_ok = '1' then
      heizen <= '0';
      waschen <= '1';
      STATE <= S3;
    end if;
  when S3 =>
    if waschen_ok = '1' then
      waschen <= '0';
      spuelen <= '1';
      STATE <= S4;
    end if;
  when S4 =>
    if spuelen_ok = '1' then
      if pumpen_taste = '1' or schleuder_taste = '1' then
        STATE <= S0;
      end if;
    end if;
  end case; 
end if;
END PROCESS;
END BEHAVIOUR;
