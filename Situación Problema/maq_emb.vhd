library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity maq_emb is
    port (Clk, Reset, X: in STD_LOGIC;
			S_0, S_1, S_2 : out STD_LOGIC);	-- S_0: posición, S_1: lleno, S_2: sellado
end maq_emb;

architecture behavioral of maq_emb is

type State is (S0, S1, S2);					-- Declaración de tipo de dato State con valores S0, S1 y S2
signal CurrentState, NextState: State;		-- Señales de tipo State

begin
	registros: process (Clk, Reset)
	begin
		if Reset = '1' then						-- Reset asíncrónico
			CurrentState <= S0;
		elsif rising_edge(Clk) then			-- Sincronización de estados
			CurrentState <= NextState;			-- Asignación de estado siguiente en transición positiva de reloj
		end if;
end process registros;

	combinational: process(CurrentState,X)	-- Lógica combinaciónal de la máquina de estados finita
	begin
		NextState <= CurrentState;
		S_1 <= '0';
		S_2 <= '0';
		case CurrentState is
			when S0 =>								-- Estado S0 posición
				S_0 <= '1';
				S_1 <= '0';
				S_2 <= '0';			
				if X >= '1' then					-- si X = '1', siguiente estado S1
					NextState <= S1;
				else									-- si X = '0', siguiente estado S0
					NextState <= S0;
				end if;
			when S1 =>								-- Estado S1 lleno
				S_1 <= '1';
				S_0 <= '0';
				S_2 <= '0';
				if X >= '1' then					-- si X = '1', siguiente estado S2
					NextState <= S2;
				 else									-- si X = '0', siguiente estado S1
						NextState <= S1;
				end if;
			when S2 =>								-- Estado S2 sellado
				S_2 <= '1';
				S_1 <= '0';
				S_0 <= '0';
				if X  >= '1' then					-- si X = '1', siguiente estado S0
					NextState <= S0;
            else
            	NextState <= S2;				-- si X = '0', siguiente estado S2
				end if;
		end case;
	end process combinational;
end architecture behavioral;