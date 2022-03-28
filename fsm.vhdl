-----------------------------------------------------------------
-- Project: fsm
-----------------------------------------------------------------
-- File:   fsm.vhdl 
-- Author: Hamza Tekin
-- Date:   March 16, 2021
-----------------------------------------------------------------
-- simple fsm
-----------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity fsm is
port(
  clk  : in std_logic;		-- positive edge-triggered clock
  arst : in std_logic;		-- asynchronous active-low reset
  x    : in std_logic;		-- data input
  z    : out std_logic		-- data output
  );
end fsm;

architecture behavior of fsm is

-- declaration part

type statetype is (idle, st1, st2, stw);
signal state, nxt_state : statetype;

begin -- architecture body

-- output function
with state select
  z <= '1' when st2,
	   '0' when others;
	   
-- state register
sreg: process(clk, arst)
begin
  if(arst='0') then state <= idle;
  elsif(clk'event and (clk = '1')) then
	state <= nxt_state;
  end if;
end process;

-- next-state function
nsf: process(x, state)
  begin
	case state is
	  when idle => 
		if x = '0' then nxt_state <= idle;
				   else nxt_state <= st1;
		end if;
	  when st1 =>
	    if x = '0' then nxt_state <= idle;
				   else nxt_state <= st2;
		end if;
	  when st2 =>
	    if x = '0' then nxt_state <= idle;
				   else nxt_state <= stw;
		end if;
	  when stw =>
	    if x = '0' then nxt_state <= idle;
				   else nxt_state <= stw;
		end if;
	end case;
  end process;

with state select
	z <= '1' when st2,
		 '0' when others;

end behavior;