library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;


entity digital_clk2 is
    Port ( clk,reset : in  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (6 downto 0);
			  f: in std_logic;
			  r: in std_logic;
			 
           dis0,dis1,dis2,dis3,dis4,dis5 : out  STD_LOGIC);
end digital_clk2;

architecture Behavioral of digital_clk2 is
signal g: std_logic_vector(21 downto 0);
signal h: std_logic_vector(12 downto 0);
signal i: std_logic_vector(18 downto 0);
signal m: std_logic_vector(16 downto 0);
signal k: std_logic;
signal j: std_logic_vector(11 downto 0);





signal clk_1Hz: std_logic;
signal clk_800Hz: std_logic;
signal clk_10Hz: std_logic;
signal clk_50Hz: std_logic;
signal clk_100Hz: std_logic;

signal mod_6:std_logic_vector (2 downto 0);


signal s1: std_logic_vector (3 downto 0);
signal s2: std_logic_vector (3 downto 0);
signal m1: std_logic_vector (3 downto 0);
signal m2: std_logic_vector (3 downto 0);
signal h1: std_logic_vector (3 downto 0);
signal h2: std_logic_vector (3 downto 0);

signal x: std_logic_vector (4 downto 0);

signal x1: std_logic_vector (3 downto 0);
signal x2: std_logic_vector (3 downto 0);
signal x3: std_logic_vector (3 downto 0);
signal x4: std_logic_vector (3 downto 0);
signal x5: std_logic_vector (3 downto 0);
signal x6: std_logic_vector (3 downto 0);

signal y: std_logic_vector (3 downto 0);

begin
process (f)
begin
if ( f='0') then
  k<=clk_1Hz;
else
  k<=clk_100Hz;
end if;
end process;   


process (reset,clk)
begin
if (reset='1') then
g<="0000000000000000000000";

elsif (rising_edge(clk)) then
g<= g+'1';
	if (g="1111010000100100000000") then 
		g<="0000000000000000000000";
   end if;
end if;
end process;
clk_1Hz<=g(21);

process (reset,clk)
begin
if (reset='1') then
j<="000000000000";

elsif (rising_edge(clk)) then
j<= j+'1';
	if (j="111110100000") then 
		j<="000000000000";
   end if;
end if;
end process;
clk_100Hz<=j(11);
 
 
 
 
process (reset,clk)
begin
if (reset='1') then
h<="0000000000000";
elsif (rising_edge(clk)) then
h<= h+'1';
	if (h="1001110001000") then
		h<="0000000000000";
   end if;
end if;
end process;
clk_800Hz<=h(12);



process (reset,clk)
begin
if (reset='1') then
i<="0000000000000000000";
elsif (rising_edge(clk)) then
     i<= i+'1';
	   if (i="1100001101010000000") then 
	     	i<="0000000000000000000";
   end if;
end if;
end process;
clk_10Hz<=i(18);



process (reset,clk)
begin
if (reset='1') then
         m<="00000000000000000";

elsif (rising_edge(clk)) then
     m<= m+'1';
	   if (m="10011100010000000") then 
	     	m<="00000000000000000";
   end if;
end if;
end process;
clk_50Hz<=m(16);
  
process(reset,k,s1,s2,m1,m2,h1,h2)
begin
if(reset='1')then
	s1<="0000";
	s2<="0000";
	m1<="0000";
	m2<="0000";
	h1<="0000";
	h2<="0000";
	
	
elsif(rising_edge(k)) then
	s1<=s1+'1';
	if(s1="1001") then
		s2<=s2+'1';
		s1<="0000";
	end if;
	
	if (s2="0101" and s1="1001") then
		m1<=m1+'1';
		s1<="0000";
		s2<="0000";
	end if;
			
	if(m1="1001" and s2="0101" and s1="1001") then
		m2<=m2+'1';
		s1<="0000";
		s2<="0000";
		m1<="0000";
	end if;
		
	if (m2="0101" and m1="1001" and s2="0101" and s1="1001") then
		h1<=h1+'1';
		s1<="0000";
		s2<="0000";
		m1<="0000";
		m2<="0000";
	end if;
		
	if (h1="1001" and m2="0101" and m1="1001" and s2="0101" and s1="1001") then
		h2<=h2+'1';
		s1<="0000";
		s2<="0000";
		m1<="0000";
		m2<="0000";
		h1<="0000";
	end if;
	
	if (h2="0010" and h1="0011" and m2="0101" and m1="1001" and s2="0101" and s1="1001") then
		s1<="0000";
		s2<="0000";
		m1<="0000";
		m2<="0000";
		h1<="0000";
		h2<="0000";
	end if;
end if;
end process;

process (clk_800Hz,reset,r)
begin
if(r='0') then
      if(reset='1') then
    	   mod_6<="000";
      elsif(rising_edge(clk_800Hz)) then
      mod_6<=mod_6+'1';
	     if (mod_6="101") then
	 	  mod_6<="000";
	    end if;
		 end if;
else
	mod_6<="010";
end if;
	

end process;

process(mod_6)
begin



if(mod_6="000") then
	dis0<='0';
	dis1<='1';
	dis2<='1';
	dis3<='1';
	dis4<='1';
	dis5<='1';
	
	x1<=s1;
	x2<="0000";
	x3<="0000";
	x4<="0000";
	x5<="0000";
	x6<="0000";

elsif(mod_6="001") then
	dis0<='1';
	dis1<='0';
	dis2<='1';
	dis3<='1';
	dis4<='1';
	dis5<='1';

	x1<="0000";
	x2<=s2;
	x3<="0000";
	x4<="0000";
	x5<="0000";
	x6<="0000";
	
elsif(mod_6="010") then
	dis0<='1';
	dis1<='1';
	dis2<='0';
	dis3<='1';
	dis4<='1';
	dis5<='1';

	x1<="0000";
	x2<="0000";
	x3<=m1;
	x4<="0000";
	x5<="0000";
	x6<="0000";
	
elsif(mod_6="011") then
	dis0<='1';
	dis1<='1';
	dis2<='1';
	dis3<='0';
	dis4<='1';
	dis5<='1';

	x1<="0000";
	x2<="0000";
	x3<="0000";
	x4<=m2;
	x5<="0000";
	x6<="0000";
	
elsif(mod_6="100") then
	dis0<='1';
	dis1<='1';
	dis2<='1';
	dis3<='1';
	dis4<='0';
	dis5<='1';

	x1<="0000";
	x2<="0000";
	x3<="0000";
	x4<="0000";
	x5<=h1;
	x6<="0000";
	
elsif(mod_6="101") then
	dis0<='1';
	dis1<='1';
	dis2<='1';
	dis3<='1';
	dis4<='1';
	dis5<='0';

	x1<="0000";
	x2<="0000";
	x3<="0000";
	x4<="0000";
	x5<="0000";
	x6<=h2;
	
end if;
end process;

process(y)
begin
case y is
when "0000" =>s<="0000001";
when "0001" =>s<="1001111";
when "0010" =>s<="0010010";
when "0011" =>s<="0000110";
when "0100" =>s<="1001100";
when "0101" =>s<="0100100";
when "0110" =>s<="0100000";
when "0111" =>s<="0001111";
when "1000" =>s<="0000000";
when "1001" =>s<="0000100";
when others =>s<="0000001";
end case;
end process;




y<= (x1 or x2 or x3 or x4 or x5 or x6);



end Behavioral;
