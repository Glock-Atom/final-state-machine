-- Project: Register
-----------------------------------------------------------------
-- File:   nbitRegister.vhdl 
-- Author: Glock-Atom
-- Date:   January 19, 2021
-----------------------------------------------------------------
-- n-bit Register
-----------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity nbitRegister is
generic(N : integer);
port(
	clk : in std_logic;
	r : in std_logic;
	en : in std_logic;
	d : in std_logic_vector(N-1 downto 0);
	q : out std_logic_vector(N-1 downto 0)
  );    
end nbitRegister;

architecture behavior of nbitRegister is

-- declaration part

begin -- architecture body

reg: process(clk, r)
begin
	if(r = '0') then q <= (others => '0');
	elsif(clk'event and (clk = '1') and (en = '1')) then
		q <= d;
	end if;
end process;
	
end behavior;
