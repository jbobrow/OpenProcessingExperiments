
PImage title_scotland, title_england, flag_Moldova, flag_Scotland, flag_Cyprus, flag_England, flag_Sweden, flag_Slovenia ;
PImage bigFlag_scotland, bigFlag_england, vs;
PImage title1, title2, title3, title4, title5, title6, title7, title8, title1_h, title2_h, title3_h, title4_h, title5_h, title6_h, title7_h, title8_h;
PImage big_title1, big_title2, big_title3, big_title4, big_title5, big_title6, big_title7, big_title8;

PImage sf_ManchesterCity, sf_ManchesterUnited, sf_TottenhamHotspur, sf_Chelsea, sf_Arsenal, sf_NewcastleUnited, sf_Liverpool, sf_StokeCity, sf_AstonVilla, sf_Everton, sf_NorwichCity, sf_Queens, sf_West, sf_Swansea, sf_Wolverhampton, sf_Fulham, sf_Sunderland, sf_Blackburn, sf_Bolton, sf_Wigan;
PImage sf_Southampton, sf_WestHamUnited, sf_CardiffCity, sf_Middlesbrough, sf_LeedsUnited, sf_BrightonHoveAlbion, sf_Blackpool, sf_HullCity, sf_LeicesterCity, sf_Burnley, sf_Reading, sf_CrystalPalace, sf_Barnsley, sf_BirminghamCity, sf_DerbyCounty, sf_PeterboroughUnited, sf_Watford, sf_Portsmouth, sf_Millwall, sf_BristolCity, sf_IpswichTown, sf_NottinghamForest, sf_DoncasterRovers, sf_CoventryCity;
PImage sf_CharltonAthletic, sf_SheffieldWednesday, sf_HuddersfieldTown, sf_MiltonKeynesDons, sf_SheffieldUnited, sf_NottsCounty, sf_Brentford, sf_CarlisleUnited, sf_Stevenage, sf_Bury, sf_TranmereRovers, sf_OldhamAthletic, sf_HartlepoolUnited, sf_PrestonNorthEnd, sf_ColchesterUnited, sf_AFCBournemouth, sf_ExeterCity, sf_LeytonOrient, sf_ScunthorpeUnited, sf_Rochdale, sf_Walsall, sf_YeovilTown, sf_WycombeWanderers, sf_Chesterfield;
PImage sf_SouthendUnited, sf_CrawleyTown, sf_CheltenhamTown, sf_ShrewsburyTown, sf_Burton, sf_SwindonTown, sf_Gillingham, sf_Morecambe, sf_OxfordUnited, sf_TorquayUnited, sf_RotherhamUnited, sf_PortVale, sf_AFCWimbledon, sf_MacclesfieldTown, sf_CreweAlexandra, sf_AldershotTown, sf_AccringtonStanley, sf_BristolRovers, sf_Barnet, sf_HerefordUnited, sf_NorthamptonTown, sf_BradfordCity, sf_DagenhamRedbridge, sf_PlymouthArgyle;
PImage sf_Rangers, sf_Celtic, sf_Motherwell, sf_StJohnstone, sf_HeartofMidlothian, sf_Kilmarnock, sf_StMirren, sf_DundeeUnited, sf_InvernessCT, sf_Hibernian, sf_DunfermlineAthletic, sf_Aberdeen;
PImage sf_RossCounty, sf_Falkirk, sf_Dundee, sf_PartickThistle, sf_Livingston, sf_Morton, sf_HamiltonAcademical, sf_QueenoftheSouth, sf_AyrUnited, sf_RaithRovers;
PImage sf_Cowdenbeath, sf_Arbroath, sf_Stenhousemuir, sf_Dumbarton, sf_EastFife, sf_AlbionRovers, sf_AirdrieUnited, sf_BrechinCity, sf_ForfarAthletic, sf_StirlingAlbion;
PImage sf_AnnanAthletic, sf_AlloaAthletic, sf_ElginCity, sf_Stranraer, sf_BerwickRangers, sf_Clyde, sf_QueensPark, sf_Montrose, sf_EastStirlingshire, sf_Peterhead;

PImage borders_scotland, borders_england, borders_scotland_h, borders_england_h;

PImage bg, infoBg1, bg_title, bg_oneTeamRow;
PImage back, back_h, arrow_up, arrow_down, same;
PImage logo_eng_pl, logo_eng_champ, logo_eng_league1, logo_eng_league2; 
PImage logo_scot_pl, logo_scot_leagues;

int[] internationalResults = new int[2];
String topGoalScorersArray[][] = new String[8][4];

boolean scot_info_show = false, eng_info_show = false, leagueStatsLoaded = false;

boolean main_page = true, eng_prem = false, eng_div_1 = false, eng_div_2 = false, eng_div_3 = false, scot_prem = false, scot_div_1 = false, scot_div_2 = false, scot_div_3 = false;

boolean click, clickBack;

String[][] leagueInfoArray = new String[30][30];

void setup() {
  size(800, 600); 


  bigFlag_scotland = loadImage("images/flags/Scotland-128.png");
  bigFlag_england = loadImage("images/flags/England-Flag-128.png");

  vs = loadImage("images/vs.png");
  bg = loadImage("images/bg.png");
  infoBg1 = loadImage("images/infobg.png");
  bg_title = loadImage("images/titleBG_02.png");
  bg_oneTeamRow = loadImage("images/oneTeamRow.png");

  back = loadImage("images/back.png");
  back_h = loadImage("images/back_h.png");
  arrow_up = loadImage("images/arrow_up.png");
  arrow_down = loadImage("images/arrow_down.png");
  same = loadImage("images/same.png");

  sf_ManchesterCity = loadImage("images/teamFlags/eng/pl/small/extrasmall/mancity.jpg");
  sf_ManchesterUnited = loadImage("images/teamFlags/eng/pl/small/extrasmall/man_utd.jpg");
  sf_TottenhamHotspur = loadImage("images/teamFlags/eng/pl/small/extrasmall/tottenham.jpg");
  sf_Chelsea = loadImage("images/teamFlags/eng/pl/small/extrasmall/chelsea.jpg");
  sf_Arsenal = loadImage("images/teamFlags/eng/pl/small/extrasmall/arsenal.jpg");
  sf_NewcastleUnited = loadImage("images/teamFlags/eng/pl/small/extrasmall/newcastle.jpg");
  sf_Liverpool = loadImage("images/teamFlags/eng/pl/small/extrasmall/liverpool.jpg");
  sf_StokeCity = loadImage("images/teamFlags/eng/pl/small/extrasmall/stoke.jpg");
  sf_AstonVilla = loadImage("images/teamFlags/eng/pl/small/extrasmall/aston_villa.jpg");
  sf_Everton = loadImage("images/teamFlags/eng/pl/small/extrasmall/everton.jpg");
  sf_NorwichCity = loadImage("images/teamFlags/eng/pl/small/extrasmall/norwich.jpg");
  sf_Queens = loadImage("images/teamFlags/eng/pl/small/extrasmall/qpr.jpg");
  sf_West = loadImage("images/teamFlags/eng/pl/small/extrasmall/westbrom.jpg");
  sf_Swansea = loadImage("images/teamFlags/eng/pl/small/extrasmall/swansea.jpg");
  sf_Wolverhampton = loadImage("images/teamFlags/eng/pl/small/extrasmall/wolves.jpg");
  sf_Fulham = loadImage("images/teamFlags/eng/pl/small/extrasmall/fulham.jpg");
  sf_Sunderland = loadImage("images/teamFlags/eng/pl/small/extrasmall/sunderland.jpg");
  sf_Blackburn = loadImage("images/teamFlags/eng/pl/small/extrasmall/blackburn.jpg");
  sf_Bolton = loadImage("images/teamFlags/eng/pl/small/extrasmall/bolton.jpg");
  sf_Wigan = loadImage("images/teamFlags/eng/pl/small/extrasmall/wigan.jpg");
  //---
  sf_Southampton = loadImage("images/teamFlags/eng/champ/small/extrasmall/Southampton.jpg");
  sf_WestHamUnited = loadImage("images/teamFlags/eng/champ/small/extrasmall/WestHamUnited.jpg");
  sf_CardiffCity = loadImage("images/teamFlags/eng/champ/small/extrasmall/CardiffCity.jpg");
  sf_Middlesbrough = loadImage("images/teamFlags/eng/champ/small/extrasmall/Middlesbrough.jpg");
  sf_LeedsUnited = loadImage("images/teamFlags/eng/champ/small/extrasmall/LeedsUnited.jpg");
  sf_BrightonHoveAlbion = loadImage("images/teamFlags/eng/champ/small/extrasmall/BrightonHoveAlbion.jpg");
  sf_Blackpool = loadImage("images/teamFlags/eng/champ/small/extrasmall/Blackpool.jpg");
  sf_HullCity = loadImage("images/teamFlags/eng/champ/small/extrasmall/HullCity.jpg");
  sf_LeicesterCity = loadImage("images/teamFlags/eng/champ/small/extrasmall/LeicesterCity.jpg");
  sf_Burnley = loadImage("images/teamFlags/eng/champ/small/extrasmall/Burnley.jpg");
  sf_Reading = loadImage("images/teamFlags/eng/champ/small/extrasmall/Reading.jpg");
  sf_CrystalPalace = loadImage("images/teamFlags/eng/champ/small/extrasmall/CrystalPalace.jpg");
  sf_Barnsley = loadImage("images/teamFlags/eng/champ/small/extrasmall/Barnsley.jpg");
  sf_BirminghamCity = loadImage("images/teamFlags/eng/champ/small/extrasmall/BirminghamCity.jpg");
  sf_DerbyCounty = loadImage("images/teamFlags/eng/champ/small/extrasmall/DerbyCounty.jpg");
  sf_PeterboroughUnited = loadImage("images/teamFlags/eng/champ/small/extrasmall/PeterboroughUnited.jpg");
  sf_Watford = loadImage("images/teamFlags/eng/champ/small/extrasmall/Watford.jpg");
  sf_Portsmouth = loadImage("images/teamFlags/eng/champ/small/extrasmall/Portsmouth.jpg");
  sf_Millwall = loadImage("images/teamFlags/eng/champ/small/extrasmall/Millwall.jpg");
  sf_BristolCity = loadImage("images/teamFlags/eng/champ/small/extrasmall/BristolCity.jpg");
  sf_IpswichTown = loadImage("images/teamFlags/eng/champ/small/extrasmall/IpswichTown.jpg");
  sf_NottinghamForest = loadImage("images/teamFlags/eng/champ/small/extrasmall/NottinghamForest.jpg");
  sf_DoncasterRovers = loadImage("images/teamFlags/eng/champ/small/extrasmall/DoncasterRovers.jpg");
  sf_CoventryCity = loadImage("images/teamFlags/eng/champ/small/extrasmall/CoventryCity.jpg");
  //---
  sf_CharltonAthletic = loadImage("images/teamFlags/eng/league1/small/extrasmall/CharltonAthletic.jpg");
  sf_SheffieldWednesday = loadImage("images/teamFlags/eng/league1/small/extrasmall/SheffieldWednesday.jpg");
  sf_HuddersfieldTown = loadImage("images/teamFlags/eng/league1/small/extrasmall/HuddersfieldTown.jpg");
  sf_MiltonKeynesDons = loadImage("images/teamFlags/eng/league1/small/extrasmall/MiltonKeynesDons.jpg");
  sf_SheffieldUnited = loadImage("images/teamFlags/eng/league1/small/extrasmall/SheffieldUnited.jpg");
  sf_NottsCounty = loadImage("images/teamFlags/eng/league1/small/extrasmall/NottsCounty.jpg");
  sf_Brentford = loadImage("images/teamFlags/eng/league1/small/extrasmall/Brentford.jpg");
  sf_CarlisleUnited = loadImage("images/teamFlags/eng/league1/small/extrasmall/CarlisleUnited.jpg");
  sf_Stevenage = loadImage("images/teamFlags/eng/league1/small/extrasmall/Stevenage.jpg");
  sf_Bury = loadImage("images/teamFlags/eng/league1/small/extrasmall/Bury.jpg");
  sf_TranmereRovers = loadImage("images/teamFlags/eng/league1/small/extrasmall/TranmereRovers.jpg");
  sf_OldhamAthletic = loadImage("images/teamFlags/eng/league1/small/extrasmall/OldhamAthletic.jpg");
  sf_HartlepoolUnited = loadImage("images/teamFlags/eng/league1/small/extrasmall/HartlepoolUnited.jpg");
  sf_PrestonNorthEnd = loadImage("images/teamFlags/eng/league1/small/extrasmall/PrestonNorthEnd.jpg");
  sf_ColchesterUnited = loadImage("images/teamFlags/eng/league1/small/extrasmall/ColchesterUnited.jpg");
  sf_AFCBournemouth = loadImage("images/teamFlags/eng/league1/small/extrasmall/AFCBournemouth.jpg");
  sf_ExeterCity = loadImage("images/teamFlags/eng/league1/small/extrasmall/ExeterCity.jpg");
  sf_LeytonOrient = loadImage("images/teamFlags/eng/league1/small/extrasmall/LeytonOrient.jpg");
  sf_ScunthorpeUnited = loadImage("images/teamFlags/eng/league1/small/extrasmall/ScunthorpeUnited.jpg");
  sf_Rochdale = loadImage("images/teamFlags/eng/league1/small/extrasmall/Rochdale.jpg");
  sf_Walsall = loadImage("images/teamFlags/eng/league1/small/extrasmall/Walsall.jpg");
  sf_YeovilTown = loadImage("images/teamFlags/eng/league1/small/extrasmall/YeovilTown.jpg");
  sf_WycombeWanderers = loadImage("images/teamFlags/eng/league1/small/extrasmall/WycombeWanderers.jpg");
  sf_Chesterfield = loadImage("images/teamFlags/eng/league1/small/extrasmall/Chesterfield.jpg");
  //---
  sf_SouthendUnited = loadImage("images/teamFlags/eng/league2/small/extrasmall/SouthendUnited.jpg");
  sf_CrawleyTown = loadImage("images/teamFlags/eng/league2/small/extrasmall/CrawleyTown.jpg");
  sf_CheltenhamTown = loadImage("images/teamFlags/eng/league2/small/extrasmall/CheltenhamTown.jpg");
  sf_ShrewsburyTown = loadImage("images/teamFlags/eng/league2/small/extrasmall/ShrewsburyTown.jpg");
  sf_Burton = loadImage("images/teamFlags/eng/league2/small/extrasmall/Burton.jpg");
  sf_SwindonTown = loadImage("images/teamFlags/eng/league2/small/extrasmall/SwindonTown.jpg");
  sf_Gillingham = loadImage("images/teamFlags/eng/league2/small/extrasmall/Gillingham.jpg");
  sf_Morecambe = loadImage("images/teamFlags/eng/league2/small/extrasmall/Morecambe.jpg");
  sf_OxfordUnited = loadImage("images/teamFlags/eng/league2/small/extrasmall/OxfordUnited.jpg");
  sf_TorquayUnited = loadImage("images/teamFlags/eng/league2/small/extrasmall/TorquayUnited.jpg");
  sf_RotherhamUnited = loadImage("images/teamFlags/eng/league2/small/extrasmall/RotherhamUnited.jpg");
  sf_PortVale = loadImage("images/teamFlags/eng/league2/small/extrasmall/PortVale.jpg");
  sf_AFCWimbledon = loadImage("images/teamFlags/eng/league2/small/extrasmall/AFCWimbledon.jpg");
  sf_MacclesfieldTown = loadImage("images/teamFlags/eng/league2/small/extrasmall/MacclesfieldTown.jpg");
  sf_CreweAlexandra = loadImage("images/teamFlags/eng/league2/small/extrasmall/CreweAlexandra.jpg");
  sf_AldershotTown = loadImage("images/teamFlags/eng/league2/small/extrasmall/AldershotTown.jpg");
  sf_AccringtonStanley = loadImage("images/teamFlags/eng/league2/small/extrasmall/AccringtonStanley.jpg");
  sf_BristolRovers = loadImage("images/teamFlags/eng/league2/small/extrasmall/BristolRovers.jpg");
  sf_Barnet = loadImage("images/teamFlags/eng/league2/small/extrasmall/Barnet.jpg");
  sf_HerefordUnited = loadImage("images/teamFlags/eng/league2/small/extrasmall/HerefordUnited.jpg");
  sf_NorthamptonTown = loadImage("images/teamFlags/eng/league2/small/extrasmall/NorthamptonTown.jpg");
  sf_BradfordCity = loadImage("images/teamFlags/eng/league2/small/extrasmall/BradfordCity.jpg");
  sf_DagenhamRedbridge = loadImage("images/teamFlags/eng/league2/small/extrasmall/DagenhamRedbridge.jpg");
  sf_PlymouthArgyle = loadImage("images/teamFlags/eng/league2/small/extrasmall/PlymouthArgyle.jpg");
  //------
  sf_RossCounty = loadImage("images/teamFlags/scot/div1/small/extrasmall/RossCounty.jpg");
  sf_Falkirk = loadImage("images/teamFlags/scot/div1/small/extrasmall/Falkirk.jpg");
  sf_Dundee = loadImage("images/teamFlags/scot/div1/small/extrasmall/Dundee.jpg");
  sf_PartickThistle = loadImage("images/teamFlags/scot/div1/small/extrasmall/PartickThistle.jpg");
  sf_Livingston = loadImage("images/teamFlags/scot/div1/small/extrasmall/Livingston.jpg");
  sf_Morton = loadImage("images/teamFlags/scot/div1/small/extrasmall/Morton.jpg");
  sf_HamiltonAcademical = loadImage("images/teamFlags/scot/div1/small/extrasmall/HamiltonAcademical.jpg");
  sf_QueenoftheSouth = loadImage("images/teamFlags/scot/div1/small/extrasmall/QueenoftheSouth.jpg");
  sf_AyrUnited = loadImage("images/teamFlags/scot/div1/small/extrasmall/AyrUnited.jpg");
  sf_RaithRovers = loadImage("images/teamFlags/scot/div1/small/extrasmall/RaithRovers.jpg");
  //---
  sf_Rangers = loadImage("images/teamFlags/scot/pl/small/extrasmall/Rangers.jpg");  
  sf_Celtic = loadImage("images/teamFlags/scot/pl/small/extrasmall/Celtic.jpg");  
  sf_Motherwell = loadImage("images/teamFlags/scot/pl/small/extrasmall/Motherwell.jpg");  
  sf_StJohnstone = loadImage("images/teamFlags/scot/pl/small/extrasmall/StJohnstone.jpg");  
  sf_HeartofMidlothian = loadImage("images/teamFlags/scot/pl/small/extrasmall/HeartofMidlothian.jpg");  
  sf_Kilmarnock = loadImage("images/teamFlags/scot/pl/small/extrasmall/Kilmarnock.jpg");  
  sf_StMirren = loadImage("images/teamFlags/scot/pl/small/extrasmall/StMirren.jpg");  
  sf_DundeeUnited = loadImage("images/teamFlags/scot/pl/small/extrasmall/DundeeUnited.jpg");  
  sf_InvernessCT = loadImage("images/teamFlags/scot/pl/small/extrasmall/InvernessCT.jpg");  
  sf_Hibernian = loadImage("images/teamFlags/scot/pl/small/extrasmall/Hibernian.jpg");  
  sf_DunfermlineAthletic = loadImage("images/teamFlags/scot/pl/small/extrasmall/DunfermlineAthletic.jpg");  
  sf_Aberdeen = loadImage("images/teamFlags/scot/pl/small/extrasmall/Aberdeen.jpg");  
  //---
  sf_Cowdenbeath = loadImage("images/teamFlags/scot/div2/small/extrasmall/Cowdenbeath.jpg");
  sf_Arbroath = loadImage("images/teamFlags/scot/div2/small/extrasmall/Arbroath.jpg");
  sf_Stenhousemuir = loadImage("images/teamFlags/scot/div2/small/extrasmall/Stenhousemuir.jpg");
  sf_Dumbarton = loadImage("images/teamFlags/scot/div2/small/extrasmall/Dumbarton.jpg");
  sf_EastFife = loadImage("images/teamFlags/scot/div2/small/extrasmall/EastFife.jpg");
  sf_AlbionRovers = loadImage("images/teamFlags/scot/div2/small/extrasmall/AlbionRovers.jpg");
  sf_AirdrieUnited = loadImage("images/teamFlags/scot/div2/small/extrasmall/AirdrieUnited.jpg");
  sf_BrechinCity = loadImage("images/teamFlags/scot/div2/small/extrasmall/BrechinCity.jpg");
  sf_ForfarAthletic = loadImage("images/teamFlags/scot/div2/small/extrasmall/ForfarAthletic.jpg");
  sf_StirlingAlbion = loadImage("images/teamFlags/scot/div2/small/extrasmall/StirlingAlbion.jpg");
  //---
  sf_AnnanAthletic = loadImage("images/teamFlags/scot/div3/small/extrasmall/AnnanAthletic.jpg");
  sf_AlloaAthletic = loadImage("images/teamFlags/scot/div3/small/extrasmall/AlloaAthletic.jpg");
  sf_ElginCity = loadImage("images/teamFlags/scot/div3/small/extrasmall/ElginCity.jpg");
  sf_Stranraer = loadImage("images/teamFlags/scot/div3/small/extrasmall/Stranraer.jpg");
  sf_BerwickRangers = loadImage("images/teamFlags/scot/div3/small/extrasmall/BerwickRangers.jpg");
  sf_Clyde = loadImage("images/teamFlags/scot/div3/small/extrasmall/Clyde.jpg");
  sf_QueensPark = loadImage("images/teamFlags/scot/div3/small/extrasmall/QueensPark.jpg");
  sf_Montrose = loadImage("images/teamFlags/scot/div3/small/extrasmall/Montrose.jpg");
  sf_EastStirlingshire = loadImage("images/teamFlags/scot/div3/small/extrasmall/EastStirlingshire.jpg");
  sf_Peterhead = loadImage("images/teamFlags/scot/div3/small/extrasmall/Peterhead.jpg");
  //---

  logo_eng_pl = loadImage("images/league_logos/eng_spl.png");
  logo_eng_champ = loadImage("images/league_logos/eng_championship.png");
  logo_eng_league1 = loadImage("images/league_logos/eng_l1.png");
  logo_eng_league2 = loadImage("images/league_logos/eng_l2.png");
  logo_scot_pl = loadImage("images/league_logos/scot_spl.png");
  logo_scot_leagues = loadImage("images/league_logos/scot_sfl123.png");


  // images\Barclays Prem League Flags\Resized\small


  borders_scotland = loadImage("images/borders/scotland_borders.png");
  borders_england = loadImage("images/borders/england_borders.png");
  borders_scotland_h = loadImage("images/borders/scotland_borders_h.png");
  borders_england_h = loadImage("images/borders/england_borders_h.png");

  title_scotland = loadImage("images/scotland_title.png");
  title_england = loadImage("images/england_title.png");
  title1 = loadImage("images/div/titles_01.png");
  title2 = loadImage("images/div/titles_02.png");
  title3 = loadImage("images/div/titles_03.png");
  title4 = loadImage("images/div/titles_04.png");
  title5 = loadImage("images/div/titles_05.png");
  title6 = loadImage("images/div/titles_06.png");
  title7 = loadImage("images/div/titles_07.png");
  title8 = loadImage("images/div/titles_08.png");
  title1_h = loadImage("images/div/titles_01_h.png");
  title2_h = loadImage("images/div/titles_02_h.png");
  title3_h = loadImage("images/div/titles_03_h.png");
  title4_h = loadImage("images/div/titles_04_h.png");
  title5_h = loadImage("images/div/titles_05_h.png");
  title6_h = loadImage("images/div/titles_06_h.png");
  title7_h = loadImage("images/div/titles_07_h.png");
  title8_h = loadImage("images/div/titles_08_h.png");

  big_title1 = loadImage("images/league_names/big_title01.png");
  big_title2 = loadImage("images/league_names/big_title02.png");
  big_title3 = loadImage("images/league_names/big_title03.png");
  big_title4 = loadImage("images/league_names/big_title04.png");
  big_title5 = loadImage("images/league_names/big_title05.png");
  big_title6 = loadImage("images/league_names/big_title06.png");
  big_title7 = loadImage("images/league_names/big_title07.png");
  big_title8 = loadImage("images/league_names/big_title08.png");

  flag_Moldova = loadImage("images/flags/Moldova-Flag-32.png");
  flag_Scotland = loadImage("images/flags/Scotland-32.png");
  flag_Cyprus = loadImage("images/flags/Cyprus-Flag-32.png");
  flag_England = loadImage("images/flags/England-Flag-32.png");
  flag_Sweden= loadImage("images/flags/Sweden-Flag-32.png");
  flag_Slovenia = loadImage("images/flags/Slovenia-Flag-32.png");

  frameRate(30);

  internationalResults =  howMuch(); // This should be put into a loop
  topGoalScorersArray = topGoalScorers();
}

void draw() {

  image(bg, 0, 0); // background

  if (main_page == true) {

    image(title_england, 110, 60);
    image(title_scotland, 520, 60);

    eng_info_show = hoverButton(borders_england, borders_england_h, 130, 135, eng_info_show);
    scot_info_show = hoverButton(borders_scotland, borders_scotland_h, 538, 135, scot_info_show);

    click = clickButton(title1, title1_h, 110, 300, click);
    if (click == true) {
      main_page = false; 
      eng_prem = true; 
      eng_div_1 = false; 
      eng_div_2 = false; 
      eng_div_3 = false; 
      scot_prem = false; 
      scot_div_1 = false; 
      scot_div_2 = false; 
      scot_div_3 = false;
      click = false;
    }
    click = clickButton(title3, title3_h, 110, 335, click);
    if (click == true) {
      main_page = false; 
      eng_prem = false; 
      eng_div_1 = true; 
      eng_div_2 = false; 
      eng_div_3 = false; 
      scot_prem = false; 
      scot_div_1 = false; 
      scot_div_2 = false; 
      scot_div_3 = false;
      click = false;
    }
    click = clickButton(title5, title5_h, 110, 370, click);
    if (click == true) {
      main_page = false; 
      eng_prem = false; 
      eng_div_1 = false; 
      eng_div_2 = true; 
      eng_div_3 = false; 
      scot_prem = false; 
      scot_div_1 = false; 
      scot_div_2 = false; 
      scot_div_3 = false;
      click = false;
    }
    click = clickButton(title7, title7_h, 110, 405, click);
    if (click == true) {
      main_page = false; 
      eng_prem = false; 
      eng_div_1 = false; 
      eng_div_2 = false; 
      eng_div_3 = true; 
      scot_prem = false; 
      scot_div_1 = false; 
      scot_div_2 = false; 
      scot_div_3 = false;
      click = false;
    }

    click = clickButton(title2, title2_h, 530, 300, click);
    if (click == true) {
      main_page = false; 
      eng_prem = false; 
      eng_div_1 = false; 
      eng_div_2 = false; 
      eng_div_3 = false; 
      scot_prem = true; 
      scot_div_1 = false; 
      scot_div_2 = false; 
      scot_div_3 = false;
      click = false;
    }
    click = clickButton(title4, title4_h, 530, 335, click);
    if (click == true) {
      main_page = false; 
      eng_prem = false; 
      eng_div_1 = false; 
      eng_div_2 = false; 
      eng_div_3 = false; 
      scot_prem = false; 
      scot_div_1 = true; 
      scot_div_2 = false; 
      scot_div_3 = false;
      click = false;
    }
    click = clickButton(title6, title6_h, 530, 370, click);
    if (click == true) {
      main_page = false; 
      eng_prem = false; 
      eng_div_1 = false; 
      eng_div_2 = false; 
      eng_div_3 = false; 
      scot_prem = false; 
      scot_div_1 = false; 
      scot_div_2 = true; 
      scot_div_3 = false;
      click = false;
    }
    click = clickButton(title8, title8_h, 530, 405, click);
    if (click == true) {
      main_page = false; 
      eng_prem = false; 
      eng_div_1 = false; 
      eng_div_2 = false; 
      eng_div_3 = false; 
      scot_prem = false; 
      scot_div_1 = false; 
      scot_div_2 = false; 
      scot_div_3 = true;
      click = false;
    }

    englandVsScotland();

    if (eng_info_show == true) { 
      display_eng_info();
    }
    if (scot_info_show == true) { 
      display_scot_info();
    }
  }
  else if (eng_prem  == true) {
    image(bg_title, 0, 50);
    image(big_title1, 174, 50);

    image(logo_eng_pl, 6, 12);

    loadSStats(1);

    backButton();
  }
  else if (eng_div_1 == true) {
    image(bg_title, 0, 50);
    image(big_title3, 174, 50);

    image(logo_eng_champ, 6, 12);



    loadSStats(2);


    backButton();
  }
  else if (eng_div_2 == true) {
    image(bg_title, 0, 50);
    image(big_title5, 174, 50);

    image(logo_eng_league1, 6, 12);

    loadSStats(3);

    backButton();
  }
  else if (eng_div_3 == true) {
    image(bg_title, 0, 50);
    image(big_title7, 174, 50);

    image(logo_eng_league2, 6, 12);

    loadSStats(4);
    backButton();
  }
  else if (scot_prem == true) {
    image(bg_title, 0, 50);
    image(big_title2, 174, 50);

    image(logo_scot_pl, 6, 12);

    loadSStats(5);

    backButton();
  }
  else if (scot_div_1 == true) {
    image(bg_title, 0, 50);
    image(big_title4, 174, 50);

    image(logo_scot_leagues, 6, 12);

    loadSStats(6);

    backButton();
  }
  else if (scot_div_2 == true) {
    image(bg_title, 0, 50);
    image(big_title6, 174, 50);

    image(logo_scot_leagues, 6, 12);

    loadSStats(7);

    backButton();
  }
  else if (scot_div_3 == true) {
    image(bg_title, 0, 50);
    image(big_title8, 174, 50);

    image(logo_scot_leagues, 6, 12);

    loadSStats(8);

    backButton();
  }

  // println(mouseX+" "+mouseY);
}


