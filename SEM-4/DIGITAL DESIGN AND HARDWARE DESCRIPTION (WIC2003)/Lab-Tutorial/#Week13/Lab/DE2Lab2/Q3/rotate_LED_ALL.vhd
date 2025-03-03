library ieee;
use ieee.std_logic_1164.all;

entity rotate_LED_ALL is
	port (
		CLOCK_50: in std_logic;
		SW: in std_logic_vector (1 downto 1);
		HEX0: out std_logic_vector (6 downto 0);
		HEX1: out std_logic_vector (6 downto 0);
		HEX2: out std_logic_vector (6 downto 0);
		HEX3: out std_logic_vector (6 downto 0)
	);
end entity;

architecture behav of rotate_LED_ALL is
	
	component counter is
		port (
			clock_50: in std_logic;
			clock_out: out std_logic
		
		);
	end component;
	
	component rotate_LED is
		port (
			CLOCK: in std_logic;
			RST: in std_logic;
			HEX0: out std_logic_vector (6 downto 0);
			HEX1: out std_logic_vector (6 downto 0);
			HEX2: out std_logic_vector (6 downto 0);
			HEX3: out std_logic_vector (6 downto 0)
		);
	end component;

	signal s_clockout: std_logic;
	signal s_HEX0: std_logic_vector (6 downto 0);
	signal s_HEX1: std_logic_vector (6 downto 0);
	signal s_HEX2: std_logic_vector (6 downto 0);
	signal s_HEX3: std_logic_vector (6 downto 0);
	
	begin
	
	counter0: counter port map (CLOCK_50, s_clockout);
	rotate_LED0: rotate_LED port map (s_clockout, SW(1), s_HEX0, s_HEX1, s_HEX2, s_HEX3);
	
	HEX0 <= s_HEX0;
	HEX1 <= s_HEX1;
	HEX2 <= s_HEX2;
	HEX3 <= s_HEX3;
	
end behav;