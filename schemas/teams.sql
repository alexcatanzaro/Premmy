BEGIN;

SET client_encoding TO 'UNICODE';

CREATE TABLE clubs(
  canonical_name TEXT, 
  club_name TEXT NOT NULL,
  alt_club_name TEXT NOT NULL,
  established_year integer NOT NULL, 
  three_letter_club_name character(3) NOT NULL,
  ground_name TEXT NOT NULL,
  website_url TEXT NOT NULL,
  CONSTRAINT canonical_name_pk PRIMARY KEY (canonical_name)
);

COPY clubs (canonical_name, club_name, alt_club_name, established_year, three_letter_club_name, ground_name, website_url) FROM stdin DELIMITER '|';
Chelsea|Chelsea FC|FC Chelsea|1905|CHE|Stamford Bridge|www.chelseafc.com
Arsenal|Arsenal FC|FC Arsenal|1886|ARS|Emirates Stadium|www.arsenal.com
Tottenham Hotspur|Tottenham Hotspur FC|Tottenham|Spurs|1882|TOT|White Hart Lane|www.tottenhamhotspur.com
West Ham United|West Ham United FC|West Ham|1895|WHU|Boleyn Ground|www.whufc.com
Crystal Palace|Crystal Palace FC|C Palace|Palace|Crystal P|1905|CRY|Selhurst Park|www.cpfc.co.uk
Manchester United|Manchester United FC|Man Utd|Man United|Manchester U.|Manchester U|1878|MUN|Old Trafford|www.manutd.com
Manchester City|Manchester City FC|Man City|Man. City|Manchester C|1880|MCI|Etihad Stadium|www.mcfc.co.uk
Everton|Everton FC|FC Everton|1878|EVE|Goodison Park|www.evertonfc.com
Liverpool|Liverpool FC|FC Liverpool|1892|LIV|Anfield|www.liverpoolfc.com
West Bromwich Albion|West Bromwich Albion FC|West Bromwich|West Brom|Albion|1878|WBA|The Hawthorns|www.wba.co.uk
Newcastle United|Newcastle United FC|Newcastle|1892|NEW|St James' Park|www.nufc.co.uk
Stoke City|Stoke City FC|Stoke|1863|STK|Britannia Stadium|www.stokecityfc.com
Sunderland|Sunderland AFC|AFC Sunderland|1879|SUN|Stadium of Light|www.safc.com
Aston Villa|Aston Villa FC|Villa|1874|AVL|Villa Park|www.avfc.co.uk
Southampton|Southampton FC|FC Southampton|1885|SOU|St Mary's Stadium|www.saintsfc.co.uk
Leicester City|Leicester|Leicester City FC|1884|LEI|King Power Stadium|www.lcfc.com
Bournemouth|AFC Bournemouth|A.F.C. Bournemouth|Bournemouth FC|1890|BOU|Dean Court|www.afcb.co.uk
Norwich|Norwich City|Norwich City FC|Norwich City F.C.|1890|NOR|Carrow Road|www.canaries.co.uk
Watford|Watford FC|Watford F.C.|1881|WAT|Vicarage Road|www.watfordfc.com

COMMIT;

ANALYZE clubs;