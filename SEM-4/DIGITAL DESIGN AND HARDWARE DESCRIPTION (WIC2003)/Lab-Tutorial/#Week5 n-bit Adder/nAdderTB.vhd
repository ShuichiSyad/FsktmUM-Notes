library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity nAdderTB is
generic (n: positive :=3);
end nAdderTB;

architecture stimulus of nAdderTB is

component nAdder is --- <--- from entity 
generic (n: positive :=3);
	port (
		a: in std_logic_vector(n downto 0);
		b: in std_logic_vector(n downto 0);
		c_in: in std_logic;
		sum: out std_logic_vector(n downto 0);
		c_out: out std_logic
		);
end component;

component nAdderStruct is
	port (
		a: in std_logic_vector(3 downto 0);
		b: in std_logic_vector(3 downto 0);
		c_in: in std_logic;
		sum: out std_logic_vector(3 downto 0);
		c_out: out std_logic
	);
end component;

constant period : time := 100ns;
signal s_a : std_logic_vector(n downto 0);
signal s_b : std_logic_vector(n downto 0);
signal s_c_in: std_logic;
signal s_sum, s_sum1 : std_logic_vector(n downto 0);
signal s_c_out, s_c_out1 : std_logic;
signal done : boolean := false;

begin
		
	DUT:	nAdder port map(
				
			a => s_a, -- (component mapped to signal)
			b => s_b,
			c_in => s_c_in,
			sum => s_sum,
			c_out => s_c_out
		);

	DUT2:	nAdderStruct port map(
			
			a => s_a, 
			b => s_b,
			c_in => s_c_in,
			sum => s_sum1,
			c_out => s_c_out1

		);
		
		stimulus1: process
		begin
			s_a <= "0111";
			s_b <= "0010";
			s_c_in <= '1';
			WAIT FOR PERIOD;
			

			
			assert s_sum = "1010" -- <--- assert untuk kepastian, sahkan nilai variable
			report "answer should be 1010" -- <--- output of report
			severity error; -- level of severity (error, warning)
			
			assert s_sum = s_sum1 and s_c_out = s_c_out1	
			report "implementations have different outputs"
			severity error;	


			done <= true;
			wait;
			
			end process stimulus1;

--	verify : process is
--	begin
--		wait for PERIOD;
--		assert s_sum = s_sum1 and s_c_out = s_c_out1 -- <--- compare between two DUTs/components, to ensure the outputs are the same
--		report "implementations have different outputs"
--		severity error;	
--		end process verify;
			
end stimulus;