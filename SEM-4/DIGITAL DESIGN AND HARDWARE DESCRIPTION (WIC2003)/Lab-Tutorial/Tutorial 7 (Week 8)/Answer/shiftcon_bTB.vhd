library ieee;
use ieee.std_logic_1164.all;

entity shiftcon_bTB is
end shiftcon_bTB;

architecture stimulus of shiftcon_bTB is

	component shiftcon_b is
		port (
			mode: in std_logic_vector (1 downto 0);
			rst, d, clock: in std_logic;
			q: out std_logic_vector (7 downto 0)
		);
	end component;
	
	constant period: time:= 100ns;
	signal s_mode: std_logic_vector (1 downto 0);
	signal s_rst, s_d, s_clock: std_logic;
	signal s_q: std_logic_vector (7 downto 0);
	
	signal done: boolean:= false;
	
	begin
	
		DUT:	shiftcon_b port map (
			
			mode => s_mode,
			rst => s_rst,
			d => s_d,
			clock => s_clock,
			q => s_q
		
		);
		
		stimulus1: process
		begin
		
			s_rst <= '1';
			wait for 10ns;
			
			s_rst<= '0';
			wait for 90ns;
		
		end process stimulus1;
		
		stimulus2: process
		begin
		
			s_d <= '1';
			wait for 30ns;
			
			s_d <= '0';
			wait for 70ns;
			
		end process stimulus2;
		
		stimulus3: process
		begin
		
			s_clock <= '1';
			wait for 5 ns;
			
			s_clock <= '0';
			wait for 5ns;
			
			--------------------
			
			s_clock <= '1';
			wait for 5 ns;
			
			s_clock <= '0';
			wait for 5ns;
			
			--------------------
			
			s_clock <= '1';
			wait for 5 ns;
			
			s_clock <= '0';
			wait for 5ns;
			
			--------------------
			
			s_clock <= '1';
			wait for 5 ns;
			
			s_clock <= '0';
			wait for 5ns;
			
			--------------------
			
			s_clock <= '1';
			wait for 5 ns;
			
			s_clock <= '0';
			wait for 5ns;
			
			--------------------
			
			s_clock <= '1';
			wait for 5 ns;
			
			s_clock <= '0';
			wait for 5ns;
			
			--------------------
			
			s_clock <= '1';
			wait for 5 ns;
			
			s_clock <= '0';
			wait for 5ns;
			
			--------------------
			
			s_clock <= '1';
			wait for 5 ns;
			
			s_clock <= '0';
			wait for 5ns;
			
			--------------------
			
			s_clock <= '1';
			wait for 5 ns;
			
			s_clock <= '0';
			wait for 5ns;
			
			--------------------
			
			s_clock <= '1';
			wait for 5 ns;
			
			s_clock <= '0';
			wait for 5ns;
			
			--------------------
		end process stimulus3;
		
		stimulus4: process
		begin
		
			s_mode <= "00";
			wait for 20ns;
			
			s_mode <= "01";
			wait for 20ns;
			
			s_mode <= "10";
			wait for 20ns;
			
			s_mode <= "11";
			wait for 20ns;
		
		end process stimulus4;
		
		done <= true;
		
end stimulus;