library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.pkg_report.all;



-- internal test bench
-- no pins necessary
entity top_tb is
end entity top_tb;



architecture bh of top_tb is
  signal x, y, a: std_logic;
begin
-- this device
-- is under test
DUT: entity work.top port map (x, y, a);

p_init: process
begin
  -- need report.log?
  report_init("report.log");

  -- case 0
  x <= '0';
  y <= '0';
  wait for 10 ns;
  report_assert(ID_SIM, error, "case 0 failed!", a = '0');
  
  -- case 1
  x <= '1';
  y <= '0';
  wait for 10 ns;
  report_assert(ID_SIM, error, "case 1 failed!", a = '1');
  
  -- case 2
  x <= '0';
  y <= '1';
  wait for 10 ns;
  report_assert(ID_SIM, error, "case 2 failed!", a = '1');
  
  -- case 3
  x <= '1';
  y <= '1';
  wait for 10 ns;
  report_assert(ID_SIM, error, "case 3 failed!", a = '1');
  
  report_log(ID_SIM, note, "OR tests passed.");
  wait;
  -- test done
  -- so just wait
end process;
end architecture bh;
