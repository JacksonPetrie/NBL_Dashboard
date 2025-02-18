box::use(
  dplyr[arrange, case_when, mutate],
  stringr[str_to_title]
)

# TODO: 2017-2018 GAME 5 finals match scores missing
# TODO: convert UTC time to local time
# TODO: state location of games


#' @export
wide_clean <- function(results_wide) {

  # Fix Match Names for Finals
  clean_data  <- results_wide |>
    mutate(
      round_number = as.integer(
        case_when(
          season == "1980" & match_id == "27741" ~ "19",
          season == "1980" & match_id == "27742" ~ "19",
          season == "1980" & match_id == "27743" ~ "20",
          season == "1981" & match_id == "27876" ~ "19",
          season == "1981" & match_id == "27877" ~ "19",
          season == "1981" & match_id == "27878" ~ "20",
          season == "1982" & match_id == "28061" ~ "23",
          season == "1982" & match_id == "28062" ~ "23",
          season == "1982" & match_id == "28063" ~ "24",
          season == "1983" & match_id == "28252" ~ "20",
          season == "1983" & match_id == "28253" ~ "20",
          season == "1983" & match_id == "28254" ~ "21",
          season == "1984" & match_id == "28571" ~ "18",
          season == "1984" & match_id == "28573" ~ "18",
          season == "1984" & match_id == "28575" ~ "18",
          season == "1984" & match_id == "28577" ~ "18",
          season == "1984" & match_id == "28579" ~ "19",
          season == "1984" & match_id == "28581" ~ "19",
          season == "1984" & match_id == "28583" ~ "20",
          season == "1984" & match_id == "28585" ~ "20",
          season == "1984" & match_id == "28587" ~ "21",
          season == "1986" & match_id == "29246" ~ "22",
          season == "1986" & match_id == "29247" ~ "22",
          season == "1986" & match_id == "29248" ~ "23",
          season == "1986" & match_id == "29250" ~ "23",
          season == "1986" & match_id == "29251" ~ "24",
          season == "1986" & match_id == "29253" ~ "24",
          season == "1986" & match_id == "29255" ~ "24",
          season == "1987" & match_id == "32591" ~ "25",
          season == "1988" & match_id == "32752" ~ "23",
          season == "1988" & match_id == "32753" ~ "23",
          season == "1988" & match_id == "32754" ~ "23",
          season == "1988" & match_id == "32755" ~ "24",
          season == "1988" & match_id == "32756" ~ "24",
          season == "1988" & match_id == "32757" ~ "24",
          season == "1989" & match_id == "32922" ~ "24",
          season == "1989" & match_id == "32923" ~ "24",
          season == "1989" & match_id == "32924" ~ "24",
          season == "1989" & match_id == "32925" ~ "24",
          season == "1989" & match_id == "32926" ~ "25",
          season == "1989" & match_id == "32927" ~ "25",
          season == "1990" & match_id == "33113" ~ "24",
          season == "1990" & match_id == "33114" ~ "24",
          season == "1990" & match_id == "33117" ~ "25",
          season == "1990" & match_id == "33118" ~ "25",
          season == "1990" & match_id == "33119" ~ "25",
          season == "1990" & match_id == "33120" ~ "26",
          season == "1990" & match_id == "33121" ~ "26",
          season == "1990" & match_id == "33122" ~ "26",
          season == "1991" & match_id == "33307" ~ "25",
          season == "1991" & match_id == "33308" ~ "25",
          season == "1991" & match_id == "33309" ~ "25",
          season == "1991" & match_id == "33310" ~ "26",
          season == "1991" & match_id == "33311" ~ "26",
          season == "1991" & match_id == "33312" ~ "26",
          season == "1991" & match_id == "33313" ~ "26",
          season == "1991" & match_id == "33314" ~ "27",
          season == "1991" & match_id == "33315" ~ "27",
          season == "1991" & match_id == "33316" ~ "27",
          season == "1992" & match_id == "33477" ~ "23",
          season == "1992" & match_id == "33478" ~ "23",
          season == "1992" & match_id == "33479" ~ "23",
          season == "1992" & match_id == "33480" ~ "23",
          season == "1992" & match_id == "33481" ~ "23",
          season == "1992" & match_id == "33482" ~ "24",
          season == "1992" & match_id == "33483" ~ "24",
          season == "1992" & match_id == "33484" ~ "24",
          season == "1992" & match_id == "33485" ~ "24",
          season == "1992" & match_id == "33486" ~ "24",
          season == "1992" & match_id == "33487" ~ "25",
          season == "1992" & match_id == "33488" ~ "25",
          season == "1992" & match_id == "33489" ~ "25",
          season == "1993" & match_id == "33676" ~ "24",
          season == "1993" & match_id == "33677" ~ "24",
          season == "1993" & match_id == "33678" ~ "24",
          season == "1993" & match_id == "33679" ~ "24",
          season == "1993" & match_id == "33680" ~ "24",
          season == "1993" & match_id == "33681" ~ "25",
          season == "1993" & match_id == "33682" ~ "25",
          season == "1993" & match_id == "33683" ~ "25",
          season == "1993" & match_id == "33684" ~ "25",
          season == "1993" & match_id == "33685" ~ "25",
          season == "1993" & match_id == "33686" ~ "26",
          season == "1993" & match_id == "33687" ~ "26",
          season == "1993" & match_id == "33688" ~ "26",
          season == "1994" & match_id == "33883" ~ "24",
          season == "1994" & match_id == "33884" ~ "24",
          season == "1994" & match_id == "33885" ~ "25",
          season == "1994" & match_id == "33886" ~ "25",
          season == "2003-2004" & match_id == "35698" ~ "24",
          season == "2003-2004" & match_id == "35699" ~ "24",
          season == "2003-2004" & match_id == "35700" ~ "25",
          season == "2003-2004" & match_id == "35701" ~ "25",
          season == "2003-2004" & match_id == "35702" ~ "25",
          season == "2003-2004" & match_id == "35703" ~ "25",
          season == "2003-2004" & match_id == "35704" ~ "26",
          season == "2003-2004" & match_id == "35705" ~ "26",
          season == "2003-2004" & match_id == "35706" ~ "26",
          season == "2003-2004" & match_id == "35707" ~ "26",
          season == "2003-2004" & match_id == "35708" ~ "26",
          season == "2004-2005" & match_id == "35887" ~ "23",
          season == "2004-2005" & match_id == "35888" ~ "23",
          season == "2004-2005" & match_id == "35889" ~ "24",
          season == "2004-2005" & match_id == "35890" ~ "24",
          season == "2004-2005" & match_id == "35891" ~ "24",
          season == "2004-2005" & match_id == "35892" ~ "24",
          season == "2004-2005" & match_id == "35893" ~ "25",
          season == "2004-2005" & match_id == "35894" ~ "25",
          season == "2004-2005" & match_id == "35895" ~ "25",
          season == "2005-2006" & match_id == "36074" ~ "25",
          season == "2005-2006" & match_id == "36075" ~ "25",
          season == "2005-2006" & match_id == "36076" ~ "26",
          season == "2005-2006" & match_id == "36077" ~ "26",
          season == "2005-2006" & match_id == "36078" ~ "26",
          season == "2005-2006" & match_id == "36079" ~ "26",
          season == "2005-2006" & match_id == "36080" ~ "27",
          season == "2005-2006" & match_id == "36081" ~ "27",
          season == "2005-2006" & match_id == "36082" ~ "27",
          season == "2006-2007" & match_id == "36284" ~ "23",
          season == "2006-2007" & match_id == "36285" ~ "23",
          season == "2006-2007" & match_id == "36286" ~ "24",
          season == "2006-2007" & match_id == "36287" ~ "24",
          season == "2006-2007" & match_id == "36288" ~ "24",
          season == "2006-2007" & match_id == "36289" ~ "24",
          season == "2006-2007" & match_id == "36290" ~ "25",
          season == "2006-2007" & match_id == "36291" ~ "25",
          season == "2006-2007" & match_id == "36292" ~ "25",
          season == "2006-2007" & match_id == "36293" ~ "25",
          season == "2007-2008" & match_id == "36491" ~ "24",
          season == "2007-2008" & match_id == "36492" ~ "24",
          season == "2007-2008" & match_id == "36493" ~ "25",
          season == "2007-2008" & match_id == "36494" ~ "25",
          season == "2007-2008" & match_id == "36495" ~ "25",
          season == "2007-2008" & match_id == "36496" ~ "25",
          season == "2007-2008" & match_id == "36497" ~ "25",
          season == "2007-2008" & match_id == "36498" ~ "26",
          season == "2007-2008" & match_id == "36499" ~ "26",
          season == "2007-2008" & match_id == "36500" ~ "26",
          season == "2007-2008" & match_id == "36501" ~ "26",
          season == "2007-2008" & match_id == "36502" ~ "26",
          season == "2009-2010" & match_id == "36777" ~ "21",
          season == "2009-2010" & match_id == "36778" ~ "21",
          season == "2009-2010" & match_id == "36779" ~ "21",
          season == "2009-2010" & match_id == "36780" ~ "21",
          season == "2009-2010" & match_id == "36781" ~ "21",
          season == "2009-2010" & match_id == "36782" ~ "22",
          season == "2009-2010" & match_id == "36783" ~ "22",
          season == "2009-2010" & match_id == "36784" ~ "22",
          season == "2010-2011" & match_id == "36911" ~ "26",
          season == "2010-2011" & match_id == "36912" ~ "26",
          season == "2010-2011" & match_id == "36913" ~ "26",
          season == "2010-2011" & match_id == "36914" ~ "26",
          season == "2010-2011" & match_id == "36915" ~ "26",
          season == "2010-2011" & match_id == "36916" ~ "26",
          season == "2010-2011" & match_id == "36917" ~ "27",
          season == "2010-2011" & match_id == "36918" ~ "27",
          season == "2010-2011" & match_id == "36919" ~ "27",
          season == "2011-2012" & match_id == "37046" ~ "26",
          season == "2011-2012" & match_id == "37047" ~ "26",
          season == "2011-2012" & match_id == "37048" ~ "26",
          season == "2011-2012" & match_id == "37049" ~ "26",
          season == "2011-2012" & match_id == "37050" ~ "26",
          season == "2011-2012" & match_id == "37051" ~ "26",
          season == "2011-2012" & match_id == "37052" ~ "27",
          season == "2011-2012" & match_id == "37053" ~ "27",
          season == "2011-2012" & match_id == "37054" ~ "27",
          season == "2012-2013" & match_id == "37167" ~ "25",
          season == "2012-2013" & match_id == "37168" ~ "25",
          season == "2012-2013" & match_id == "37169" ~ "25",
          season == "2012-2013" & match_id == "37170" ~ "25",
          season == "2012-2013" & match_id == "37171" ~ "26",
          season == "2012-2013" & match_id == "37172" ~ "26",
          season == "2012-2013" & match_id == "37173" ~ "26",
          season == "2013-2014" & match_id == "37286" ~ "24",
          season == "2013-2014" & match_id == "37287" ~ "24",
          season == "2013-2014" & match_id == "37288" ~ "24",
          season == "2013-2014" & match_id == "37289" ~ "24",
          season == "2013-2014" & match_id == "37290" ~ "24",
          season == "2013-2014" & match_id == "37291" ~ "25",
          season == "2013-2014" & match_id == "37292" ~ "25",
          season == "2013-2014" & match_id == "37293" ~ "25",
          season == "2014-2015" & match_id == "91204" ~ "21",
          season == "2014-2015" & match_id == "91205" ~ "21",
          season == "2014-2015" & match_id == "91207" ~ "21",
          season == "2014-2015" & match_id == "91208" ~ "21",
          season == "2014-2015" & match_id == "91210" ~ "22",
          season == "2014-2015" & match_id == "91211" ~ "22",
          season == "2015-2016" & match_id == "269179" ~ "20",
          season == "2015-2016" & match_id == "269180" ~ "20",
          season == "2015-2016" & match_id == "269181" ~ "20",
          season == "2015-2016" & match_id == "269182" ~ "20",
          season == "2015-2016" & match_id == "269183" ~ "20",
          season == "2015-2016" & match_id == "269185" ~ "21",
          season == "2015-2016" & match_id == "269186" ~ "21",
          season == "2015-2016" & match_id == "269187" ~ "21",
          season == "2016-2017" & match_id == "574998" ~ "20",
          season == "2016-2017" & match_id == "574999" ~ "20",
          season == "2016-2017" & match_id == "575000" ~ "20",
          season == "2016-2017" & match_id == "575001" ~ "20",
          season == "2016-2017" & match_id == "575002" ~ "20",
          season == "2016-2017" & match_id == "579821" ~ "21",
          season == "2016-2017" & match_id == "579822" ~ "21",
          season == "2016-2017" & match_id == "579823" ~ "21",
          season == "2017-2018" & match_id == "833458" ~ "20",
          season == "2017-2018" & match_id == "833459" ~ "20",
          season == "2017-2018" & match_id == "833461" ~ "20",
          season == "2017-2018" & match_id == "833462" ~ "20",
          season == "2017-2018" & match_id == "848102" ~ "21",
          season == "2017-2018" & match_id == "848103" ~ "21",
          season == "2017-2018" & match_id == "848104" ~ "21",
          season == "2017-2018" & match_id == "848105" ~ "21",
          season == "2017-2018" & match_id == "848106" ~ "21",
          season == "2018-2019" & match_id == "1104660" ~ "19",
          season == "2018-2019" & match_id == "1104661" ~ "19",
          season == "2018-2019" & match_id == "1104662" ~ "19",
          season == "2018-2019" & match_id == "1104663" ~ "19",
          season == "2018-2019" & match_id == "1111775" ~ "20",
          season == "2018-2019" & match_id == "1111776" ~ "20",
          season == "2018-2019" & match_id == "1113357" ~ "20",
          season == "2018-2019" & match_id == "1113358" ~ "20",
          season == "2019-2020" & match_id == "1553687" ~ "21",
          season == "2019-2020" & match_id == "1553688" ~ "21",
          season == "2019-2020" & match_id == "1553689" ~ "21",
          season == "2019-2020" & match_id == "1553691" ~ "21",
          season == "2019-2020" & match_id == "1573185" ~ "21",
          season == "2019-2020" & match_id == "1576300" ~ "21",
          season == "2019-2020" & match_id == "1585312" ~ "22",
          season == "2019-2020" & match_id == "1585313" ~ "22",
          season == "2019-2020" & match_id == "1585314" ~ "22",
          season == "2020-2021" & match_id == "1889796" ~ "22",
          season == "2020-2021" & match_id == "1889797" ~ "22",
          season == "2020-2021" & match_id == "1889798" ~ "22",
          season == "2020-2021" & match_id == "1889799" ~ "22",
          season == "2020-2021" & match_id == "1891188" ~ "22",
          season == "2020-2021" & match_id == "1891192" ~ "22",
          season == "2020-2021" & match_id == "1891805" ~ "23",
          season == "2020-2021" & match_id == "1891806" ~ "23",
          season == "2020-2021" & match_id == "1894782" ~ "23",
          season == "2021-2022" & match_id == "2087733" ~ "22",
          season == "2021-2022" & match_id == "2087734" ~ "22",
          season == "2021-2022" & match_id == "2087735" ~ "22",
          season == "2021-2022" & match_id == "2087736" ~ "22",
          season == "2021-2022" & match_id == "2087737" ~ "22",
          season == "2021-2022" & match_id == "2090350" ~ "23",
          season == "2021-2022" & match_id == "2090351" ~ "23",
          season == "2021-2022" & match_id == "2090352" ~ "23",
          season == "2022-2023" & match_id == "2237135" ~ "19",
          season == "2022-2023" & match_id == "2237136" ~ "19",
          season == "2022-2023" & match_id == "2238356" ~ "20",
          season == "2022-2023" & match_id == "2238357" ~ "21",
          season == "2022-2023" & match_id == "2238358" ~ "21",
          season == "2022-2023" & match_id == "2238359" ~ "21",
          season == "2022-2023" & match_id == "2238360" ~ "21",
          season == "2022-2023" & match_id == "2238361" ~ "21",
          season == "2022-2023" & match_id == "2238362" ~ "21",
          season == "2022-2023" & match_id == "2241866" ~ "22",
          season == "2022-2023" & match_id == "2241867" ~ "22",
          season == "2022-2023" & match_id == "2241868" ~ "22",
          season == "2022-2023" & match_id == "2241869" ~ "22",
          season == "2022-2023" & match_id == "2241870" ~ "22",
          season == "2023-2024" & match_id == "2414834" ~ "21",
          season == "2023-2024" & match_id == "2414842" ~ "21",
          season == "2023-2024" & match_id == "2414843" ~ "22",
          season == "2023-2024" & match_id == "2417314" ~ "23",
          season == "2023-2024" & match_id == "2417315" ~ "23",
          season == "2023-2024" & match_id == "2417316" ~ "23",
          season == "2023-2024" & match_id == "2417317" ~ "23",
          season == "2023-2024" & match_id == "2417318" ~ "23",
          season == "2023-2024" & match_id == "2417319" ~ "23",
          season == "2023-2024" & match_id == "2426437" ~ "24",
          season == "2023-2024" & match_id == "2426438" ~ "24",
          season == "2023-2024" & match_id == "2426439" ~ "24",
          season == "2023-2024" & match_id == "2426440" ~ "24",
          season == "2023-2024" & match_id == "2426441" ~ "24",
          TRUE ~ round_number
        )
      ),
      match_type = case_when(
        season == "1980" & round_number >= 19 ~ "Finals",
        season == "1981" & round_number >= 19 ~ "Finals",
        season == "1982" & round_number >= 23 ~ "Finals",
        season == "1983" & round_number >= 20 ~ "Finals",
        season == "1984" & round_number >= 18 ~ "Finals",
        season == "1985" & round_number >= 19 ~ "Finals",
        season == "1986" & round_number >= 22 ~ "Finals",
        season == "1987" & round_number >= 23 ~ "Finals",
        season == "1988" & round_number >= 22 ~ "Finals",
        season == "1989" & round_number >= 23 ~ "Finals",
        season == "1990" & round_number >= 24 ~ "Finals",
        season == "1991" & round_number >= 25 ~ "Finals",
        season == "1992" & round_number >= 23 ~ "Finals",
        season == "1993" & round_number >= 24 ~ "Finals",
        season == "1994" & round_number >= 23 ~ "Finals",
        season == "1995" & round_number >= 22 ~ "Finals",
        season == "1996" & round_number >= 25 ~ "Finals",
        season == "1997" & round_number >= 25 ~ "Finals",
        season == "1998-1999" & round_number >= 24 ~ "Finals",
        season == "1999-2000" & round_number >= 25 ~ "Finals",
        season == "2000-2001" & round_number >= 25 ~ "Finals",
        season == "2001-2002" & round_number >= 25 ~ "Finals",
        season == "2002-2003" & round_number >= 23 ~ "Finals",
        season == "2003-2004" & round_number >= 23 ~ "Finals",
        season == "2004-2005" & round_number >= 22 ~ "Finals",
        season == "2005-2006" & round_number >= 24 ~ "Finals",
        season == "2006-2007" & round_number >= 22 ~ "Finals",
        season == "2007-2008" & round_number >= 23 ~ "Finals",
        season == "2008-2009" & round_number >= 23 ~ "Finals",
        TRUE ~ str_to_title(match_type)
      ),
      match_name = case_when(
        season == "1980" & round_number == 19 ~ "Semi Final",
        season == "1980" & round_number == 20 ~ "Grand Final",
        season == "1981" & round_number == 19 ~ "Semi Final",
        season == "1981" & round_number == 20 ~ "Grand Final",
        season == "1982" & round_number == 23 ~ "Semi Final",
        season == "1982" & round_number == 24 ~ "Grand Final",
        season == "1983" & round_number == 20 ~ "Semi Final",
        season == "1983" & round_number == 21 ~ "Grand Final",
        season == "1984" & round_number == 18 ~ "Quarter Final",
        season == "1984" & round_number == 19 ~ "Elim Final",
        season == "1984" & round_number == 20 ~ "Semi Final",
        season == "1984" & round_number == 21 ~ "Grand Final",
        season == "1985" & round_number == 19 ~ "Elim Final",
        season == "1985" & round_number == 20 ~ "Semi Final",
        season == "1985" & round_number == 21 ~ "Grand Final",
        season == "1986" & round_number == 22 ~ "Elim Final",
        season == "1986" & round_number == 23 ~ "Semi Final",
        season == "1986" & round_number == 24 ~ "Grand Final",
        season == "1987" & round_number == 23 ~ "Elim Final",
        season == "1987" & round_number == 24 ~ "Semi Final",
        season == "1987" & round_number == 25 ~ "Grand Final",
        season == "1988" & round_number == 22 ~ "Elim Final",
        season == "1988" & round_number == 23 ~ "Semi Final",
        season == "1988" & round_number == 24 ~ "Grand Final",
        season == "1989" & round_number == 23 ~ "Elim Final",
        season == "1989" & round_number == 24 ~ "Semi Final",
        season == "1989" & round_number == 25 ~ "Grand Final",
        season == "1990" & round_number == 24 ~ "Elim Final",
        season == "1990" & round_number == 25 ~ "Semi Final",
        season == "1990" & round_number == 26 ~ "Grand Final",
        season == "1991" & round_number == 25 ~ "Elim Final",
        season == "1991" & round_number == 26 ~ "Semi Final",
        season == "1991" & round_number == 27 ~ "Grand Final",
        season == "1992" & round_number == 23 ~ "Quarter Final",
        season == "1992" & round_number == 24 ~ "Semi Final",
        season == "1992" & round_number == 25 ~ "Grand Final",
        season == "1993" & round_number == 24 ~ "Quarter Final",
        season == "1993" & round_number == 25 ~ "Semi Final",
        season == "1993" & round_number == 26 ~ "Grand Final",
        season == "1994" & round_number == 23 ~ "Quarter Final",
        season == "1994" & round_number == 24 ~ "Semi Final",
        season == "1994" & round_number == 25 ~ "Grand Final",
        season == "1995" & round_number == 22 ~ "Quarter Final",
        season == "1995" & round_number == 23 ~ "Semi Final",
        season == "1995" & round_number == 24 ~ "Grand Final",
        season == "1996" & round_number == 25 ~ "Quarter Final",
        season == "1996" & round_number == 26 ~ "Semi Final",
        season == "1996" & round_number == 27 ~ "Grand Final",
        season == "1997" & round_number == 25 ~ "Elim Final",
        season == "1997" & round_number == 26 ~ "Semi Final",
        season == "1997" & round_number == 27 ~ "Grand Final",
        season == "1998" & round_number == 20 ~ "Elim Final",
        season == "1998" & round_number == 21 ~ "Semi Final",
        season == "1998" & round_number == 22 ~ "Grand Final",
        season == "1998-1999" & round_number == 24 ~ "Qualify Final",
        season == "1998-1999" & round_number == 25 ~ "Semi Final",
        season == "1998-1999" & round_number == 26 ~ "Grand Final",
        season == "1999-2000" & round_number == 25 ~ "Elim Final",
        season == "1999-2000" & round_number == 26 ~ "Semi Final",
        season == "1999-2000" & round_number == 27 ~ "Grand Final",
        season == "2000-2001" & round_number == 25 ~ "Qualify Final",
        season == "2000-2001" & round_number == 26 ~ "Semi Final",
        season == "2000-2001" & round_number == 27 ~ "Grand Final",
        season == "2001-2002" & round_number == 25 ~ "Qualify Final",
        season == "2001-2002" & round_number == 26 ~ "Semi Final",
        season == "2001-2002" & round_number == 27 ~ "Grand Final",
        season == "2002-2003" & round_number == 23 ~ "Qualify Final",
        season == "2002-2003" & round_number == 24 ~ "Semi Final",
        season == "2002-2003" & round_number == 25 ~ "Grand Final",
        season == "2003-2004" & round_number == 23 ~ "Elim Final",
        season == "2003-2004" & round_number == 24 ~ "Elim Final",
        season == "2003-2004" & round_number == 25 ~ "Semi Final",
        season == "2003-2004" & round_number == 26 ~ "Grand Final",
        season == "2004-2005" & round_number == 22 ~ "Elim Final",
        season == "2004-2005" & round_number == 23 ~ "Elim Final",
        season == "2004-2005" & round_number == 24 ~ "Semi Final",
        season == "2004-2005" & round_number == 25 ~ "Grand Final",
        season == "2005-2006" & round_number == 24 ~ "Elim Final",
        season == "2005-2006" & round_number == 25 ~ "Elim Final",
        season == "2005-2006" & round_number == 26 ~ "Semi Final",
        season == "2005-2006" & round_number == 27 ~ "Grand Final",
        season == "2006-2007" & round_number == 22 ~ "Elim Final",
        season == "2006-2007" & round_number == 23 ~ "Elim Final",
        season == "2006-2007" & round_number == 24 ~ "Semi Final",
        season == "2006-2007" & round_number == 25 ~ "Grand Final",
        season == "2007-2008" & round_number == 23 ~ "Elim Final",
        season == "2007-2008" & round_number == 24 ~ "Elim Final",
        season == "2007-2008" & round_number == 25 ~ "Semi Final",
        season == "2007-2008" & round_number == 26 ~ "Grand Final",
        season == "2008-2009" & round_number == 23 ~ "Elim Final",
        season == "2008-2009" & round_number == 24 ~ "Semi Final",
        season == "2008-2009" & round_number == 25 ~ "Grand Final",
        season == "2009-2010" & round_number == 21 ~ "Semi Final",
        season == "2009-2010" & round_number == 22 ~ "Grand Final",
        season == "2010-2011" & round_number == 26 ~ "Semi Final",
        season == "2010-2011" & round_number == 27 ~ "Grand Final",
        season == "2011-2012" & round_number == 26 ~ "Semi Final",
        season == "2011-2012" & round_number == 27 ~ "Grand Final",
        season == "2012-2013" & round_number == 25 ~ "Semi Final",
        season == "2012-2013" & round_number == 26 ~ "Grand Final",
        season == "2013-2014" & round_number == 24 ~ "Semi Final",
        season == "2013-2014" & round_number == 25 ~ "Grand Final",
        season == "2014-2015" & round_number == 21 ~ "Semi Final",
        season == "2014-2015" & round_number == 22 ~ "Grand Final",
        season == "2015-2016" & round_number == 20 ~ "Semi Final",
        season == "2015-2016" & round_number == 21 ~ "Grand Final",
        season == "2016-2017" & round_number == 20 ~ "Semi Final",
        season == "2016-2017" & round_number == 21 ~ "Grand Final",
        season == "2017-2018" & round_number == 20 ~ "Semi Final",
        season == "2017-2018" & round_number == 21 ~ "Grand Final",
        season == "2018-2019" & round_number == 19 ~ "Semi Final",
        season == "2018-2019" & round_number == 20 ~ "Grand Final",
        season == "2019-2020" & round_number == 21 ~ "Semi Final",
        season == "2019-2020" & round_number == 22 ~ "Grand Final",
        season == "2020-2021" & round_number == 22 ~ "Semi Final",
        season == "2020-2021" & round_number == 23 ~ "Grand Final",
        season == "2021-2022" & round_number == 22 ~ "Semi Final",
        season == "2021-2022" & round_number == 23 ~ "Grand Final",
        season == "2022-2023" & round_number == 19 ~ "Qualify Final",
        season == "2022-2023" & round_number == 20 ~ "Elim Final",
        season == "2022-2023" & round_number == 21 ~ "Semi Final",
        season == "2022-2023" & round_number == 22 ~ "Grand Final",
        season == "2023-2024" & round_number == 21 ~ "Qualify Final",
        season == "2023-2024" & round_number == 22 ~ "Elim Final",
        season == "2023-2024" & round_number == 23 ~ "Semi Final",
        season == "2023-2024" & round_number == 24 ~ "Grand Final",
        TRUE ~ "Regular"
      )
    ) |>
    arrange(match_time_utc)

  return(clean_data)

}