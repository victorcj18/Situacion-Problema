library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_maq_emb is
end entity tb_maq_emb;

architecture behavioral of tb_maq_emb is
	signal Clk, Reset, X: STD_LOGIC := '0';
	signal S_0, S_1, S_2 : STD_LOGIC;

begin

DUT: entity work.maq_emb(behavioral)
	port map (Clk, Reset, X,
		S_0 => S_0,
		S_1 => S_1,
		S_2 => S_2);

Clk_gen: process
begin
	while Now < 100 ns loop
		Clk <= '0';
      wait for 5 ns;
      Clk <= '1';
      wait for 5 ns;
	end loop;
   wait;
end process Clk_gen;

	Stim: process
	begin
		Reset <= '1';
		X <= '0';
		wait until falling_edge(Clk);
		
		Reset <= '0';
		X <= '0';
		wait until falling_edge(Clk);
		
		X <= '1';
		wait until rising_edge(Clk);
		
		X <= '0';
		wait until falling_edge(Clk);
		
		X <= '1';
		wait until rising_edge(Clk);
		
		X <= '0';
		wait until falling_edge(Clk);
		
		X <= '1';
		wait until rising_edge(Clk);

		X <= '0';
		wait until falling_edge(Clk);

		X <= '1';
		wait until rising_edge(Clk);

		X <= '0';
		wait until falling_edge(Clk);

		X <= '1';
		wait until rising_edge(Clk);

		X <= '0';
		wait until falling_edge(Clk);

		X <= '1';
		wait until rising_edge(Clk);

		X <= '0';
		wait until falling_edge(Clk);

		X <= '1';
		wait until rising_edge(Clk);

		X <= '0';
		wait until falling_edge(Clk);

		X <= '1';
		wait until rising_edge(Clk);
		wait;
	end process Stim;
end architecture behavioral;