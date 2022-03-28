-----------------------------------------------------------------
-- Project: fsm (final state machine)
-----------------------------------------------------------------
-- File:   fsm_tb.vhdl 
-- Author: Hamza Tekin
-- Date:   March 23, 2021
-----------------------------------------------------------------
-- simple fsm
-----------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity fsm_tb is   
end fsm_tb;

architecture simulation of fsm_tb is

-- declaration part

component fsm
port(
  clk  : in std_logic;		-- positive edge-triggered clock
  arst : in std_logic;		-- asynchronous active-low reset
  x    : in std_logic;		-- data input
  z    : out std_logic		-- data output
);
end component;

signal cclk : std_logic;
signal aarst : std_logic;
signal xx : std_logic;
signal zz : std_logic;

begin -- architecture body

uut : fsm port map(
  clk  => cclk,
  arst => aarst,
  x    => xx, 
  z    => zz
);

aarst <= '1';

gen_clk: process
begin
	cclk <= '0';
	wait for 10 us;
	cclk <= '1';
	wait for 10 us;
end process;

gen_x: process
begin
	xx<='0';
	wait for 25 us;
	xx<='1';
	wait for 20 us;
	xx<='0';
	wait for 10 us;
	xx<='1';
	wait for 10 us;
	xx<='0';
	wait for 20 us;
	xx<='1';
	wait for 30 us;
end process;

end simulation;