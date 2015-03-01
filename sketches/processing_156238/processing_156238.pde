

int[] counter;
final int margin = 100;

float xPos = margin;
float yPos = 20;
float yGap = 12;



SearchNews searchs;
String searchNames = "naver";

PFont Mnanum;

void setup() {
  size(1600, 1200);
  smooth();
  background(255);

  Mnanum = createFont("NanumGothic", 12);
  textFont(Mnanum);

  textSize(120);
  fill(#009836);
  textAlign(RIGHT, CENTER);
  text(searchNames, width-margin, margin);   

  textAlign(RIGHT, CENTER);
  fill(50);
  searchs  = new SearchNews(searchNames);
}


void draw() {

  //  searchs = new SearchNews(searchName);
}

int c1;
int startPoint = 1;
int endPoint = 100;
class SearchNews {

  String searchnames;
  XML xmlNews;
  StringList a;
  String[] item;

  SearchNews(String searchnames_) {
    a = new StringList();
    searchnames = searchnames_;

    for (int c1 = 0; c1 < 9; c1++) {
      xmlNews = loadXML("http://openapi.naver.com/search?key=270dc6b5103d044541d2c08445946c3f&query=" + searchnames +"&target=news&start=" + startPoint +"&display=100");
      XML news = xmlNews.getChild("channel");
      XML[] newsItem = news.getChildren("item");

      for (int i = 0; i < newsItem.length; i++) {
        XML linkCode = newsItem[i].getChild("originallink"); 
        String originalLink = linkCode.getContent();
        a. append(originalLink);
      }

      startPoint += 100;
      endPoint = endPoint += 100;
      println("loadRange : " + startPoint + "~" + endPoint);
      item = a.array();
    }
    //item은 가로로 길다.
    for (int j = 0; j < item.length; j++) {
      if (item[j].indexOf("www.") != -1) {
        String[] siteValues = split(item[j], "http://"); //siteValues[1] : www.dailygrid.net/news/articleView.html?idxno=27959siteValues.length는 2다.
        String[] siteFinals = split(siteValues[1], "/"); //siteFinal[0] : www.fnnews.com
        String[] siteFinals2 = split(siteFinals[0], ".");       

        siteSave(siteFinals2[1]);
      }
    }
    println("acrofanCount : " + etcCount);

    siteDisplay(  "  acrofan  ", acrofanCount  );
    siteDisplay(  "  ahatv  ", ahatvCount  );
    siteDisplay(  "  ajunews  ", ajunewsCount  );
    siteDisplay(  "  anewsa  ", anewsaCount  );
    siteDisplay(  "  apparelnews  ", apparelnewsCount  );
    siteDisplay(  "  asiatoday  ", asiatodayCount  );
    siteDisplay(  "  betanews  ", betanewsCount  );
    siteDisplay(  "  bizwatch  ", bizwatchCount  );
    siteDisplay(  "  breaknews  ", breaknewsCount  );
    siteDisplay(  "  ccdailynews  ", ccdailynewsCount  );
    siteDisplay(  "  cctvnews  ", cctvnewsCount  );
    siteDisplay(  "  christiantoday  ", christiantodayCount  );
    siteDisplay(  "  chungnamilbo  ", chungnamilboCount  );
    siteDisplay(  "  cstimes  ", cstimesCount  );
    siteDisplay(  "  daejeontoday  ", daejeontodayCount  );
    siteDisplay(  "  dailian  ", dailianCount  );
    siteDisplay(  "  dailygame  ", dailygameCount  );
    siteDisplay(  "  dailygrid  ", dailygridCount  );
    siteDisplay(  "  datanews  ", datanewsCount  );
    siteDisplay(  "  domin  ", dominCount  );
    siteDisplay(  "  dt  ", dtCount  );
    siteDisplay(  "  ebn  ", ebnCount  );
    siteDisplay(  "  edaily  ", edailyCount  );
    siteDisplay(  "  enewstoday  ", enewstodayCount  );
    siteDisplay(  "  etnews  ", etnewsCount  );
    siteDisplay(  "  etoday  ", etodayCount  );
    siteDisplay(  "  fnnews  ", fnnewsCount  );
    siteDisplay(  "  gamemeca  ", gamemecaCount  );
    siteDisplay(  "  gametoday  ", gametodayCount  );
    siteDisplay(  "  gimhaenews  ", gimhaenewsCount  );
    siteDisplay(  "  gjdream  ", gjdreamCount  );
    siteDisplay(  "  gpkorea  ", gpkoreaCount  );
    siteDisplay(  "  gukjenews  ", gukjenewsCount  );
    siteDisplay(  "  gvalley  ", gvalleyCount  );
    siteDisplay(  "  gwnews  ", gwnewsCount  );
    siteDisplay(  "  hani  ", haniCount  );
    siteDisplay(  "  hankyung  ", hankyungCount  );
    siteDisplay(  "  hkbs  ", hkbsCount  );
    siteDisplay(  "  ikld  ", ikldCount  );
    siteDisplay(  "  imaeil  ", imaeilCount  );
    siteDisplay(  "  inews365  ", inews365Count  );
    siteDisplay(  "  interview365  ", interview365Count  );
    siteDisplay(  "  kado  ", kadoCount  );
    siteDisplay(  "  kbench  ", kbenchCount  );
    siteDisplay(  "  khan  ", khanCount  );
    siteDisplay(  "  koreaherald  ", koreaheraldCount  );
    siteDisplay(  "  ksilbo  ", ksilboCount  );
    siteDisplay(  "  kyeonggi  ", kyeonggiCount  );
    siteDisplay(  "  kyeongin  ", kyeonginCount  );
    siteDisplay(  "  lec  ", lecCount  );
    siteDisplay(  "  mediapen  ", mediapenCount  );
    siteDisplay(  "  mediaus  ", mediausCount  );
    siteDisplay(  "  moneyweek  ", moneyweekCount  );
    siteDisplay(  "  mt  ", mtCount  );
    siteDisplay(  "  newscj  ", newscjCount  );
    siteDisplay(  "  newsis  ", newsisCount  );
    siteDisplay(  "  newspim  ", newspimCount  );
    siteDisplay(  "  newstomato  ", newstomatoCount  );
    siteDisplay(  "  newstown  ", newstownCount  );
    siteDisplay(  "  newsway  ", newswayCount  );
    siteDisplay(  "  nocutnews  ", nocutnewsCount  );
    siteDisplay(  "  ohmynews  ", ohmynewsCount  );
    siteDisplay(  "  osen  ", osenCount  );
    siteDisplay(  "  pressian  ", pressianCount  );
    siteDisplay(  "  readersnews  ", readersnewsCount  );
    siteDisplay(  "  rookie  ", rookieCount  );
    siteDisplay(  "  segye  ", segyeCount  );
    siteDisplay(  "  siminilbo  ", siminilboCount  );
    siteDisplay(  "  sportsworldi  ", sportsworldiCount  );
    siteDisplay(  "  tenasia  ", tenasiaCount  );
    siteDisplay(  "  thisisgame  ", thisisgameCount  );
    siteDisplay(  "  tvreport  ", tvreportCount  );
    siteDisplay(  "  upkorea  ", upkoreaCount  );
    siteDisplay(  "  vop  ", vopCount  );
    siteDisplay(  "  welfarenews  ", welfarenewsCount  );
    siteDisplay(  "  wikitree  ", wikitreeCount  );
    siteDisplay(  "  womennews  ", womennewsCount  );
    siteDisplay(  "  wowtv  ", wowtvCount  );
    siteDisplay(  "  yeongnam  ", yeongnamCount  );
    siteDisplay(  "  etc  ", etcCount  );
  }

  void siteDisplay(String titlename_, int titleCount_) {

    String titlename = titlename_;
    int titleCount = titleCount_;  

    float colorCode = colorConvert(titleCount);
    float wSize = wordle(titleCount);
    float incodeX = incoder(titleCount);

    noStroke();

    fill(0, 80+colorCode);   
    textSize(wSize);
    text(titlename, random(400, width-margin), random(350, 800));

    textSize(12);
    textAlign(RIGHT, CENTER);
    //    fill(0, 255, 0);

    //RECT
    fill(0, 80+colorCode);
    rect(xPos, yPos, incodeX, 8);


    fill(0, 80+colorCode);
    text(titlename, xPos, yPos);

    textSize(10);
    textAlign(LEFT, CENTER);
    text(titleCount, xPos+incodeX + 5, yPos );
    textAlign(RIGHT, CENTER);




    yPos += yGap;
  }
  void siteSave(String siteFinalname_) {

    String siteFinalname = siteFinalname_;    
    if (siteFinalname.indexOf("acrofan") == 0)acrofanCount++;
    else if (siteFinalname.indexOf("ahatv") == 0)ahatvCount++;
    else if (siteFinalname.indexOf("ajunews") == 0)ajunewsCount++;
    else if (siteFinalname.indexOf("anewsa") == 0)anewsaCount++;
    else if (siteFinalname.indexOf("apparelnews") == 0)apparelnewsCount++;
    else if (siteFinalname.indexOf("asiatoday") == 0)asiatodayCount++;
    else if (siteFinalname.indexOf("betanews") == 0)betanewsCount++;
    else if (siteFinalname.indexOf("bizwatch") == 0)bizwatchCount++;
    else if (siteFinalname.indexOf("breaknews") == 0)breaknewsCount++;
    else if (siteFinalname.indexOf("ccdailynews") == 0)ccdailynewsCount++;
    else if (siteFinalname.indexOf("cctvnews") == 0)cctvnewsCount++;
    else if (siteFinalname.indexOf("christiantoday") == 0)christiantodayCount++;
    else if (siteFinalname.indexOf("chungnamilbo") == 0)chungnamilboCount++;
    else if (siteFinalname.indexOf("cstimes") == 0)cstimesCount++;
    else if (siteFinalname.indexOf("daejeontoday") == 0)daejeontodayCount++;
    else if (siteFinalname.indexOf("dailian") == 0)dailianCount++;
    else if (siteFinalname.indexOf("dailygame") == 0)dailygameCount++;
    else if (siteFinalname.indexOf("dailygrid") == 0)dailygridCount++;
    else if (siteFinalname.indexOf("datanews") == 0)datanewsCount++;
    else if (siteFinalname.indexOf("domin") == 0)dominCount++;
    else if (siteFinalname.indexOf("dt") == 0)dtCount++;
    else if (siteFinalname.indexOf("ebn") == 0)ebnCount++;
    else if (siteFinalname.indexOf("edaily") == 0)edailyCount++;
    else if (siteFinalname.indexOf("enewstoday") == 0)enewstodayCount++;
    else if (siteFinalname.indexOf("etnews") == 0)etnewsCount++;
    else if (siteFinalname.indexOf("etoday") == 0)etodayCount++;
    else if (siteFinalname.indexOf("fnnews") == 0)fnnewsCount++;
    else if (siteFinalname.indexOf("gamemeca") == 0)gamemecaCount++;
    else if (siteFinalname.indexOf("gametoday") == 0)gametodayCount++;
    else if (siteFinalname.indexOf("gimhaenews") == 0)gimhaenewsCount++;
    else if (siteFinalname.indexOf("gjdream") == 0)gjdreamCount++;
    else if (siteFinalname.indexOf("gpkorea") == 0)gpkoreaCount++;
    else if (siteFinalname.indexOf("gukjenews") == 0)gukjenewsCount++;
    else if (siteFinalname.indexOf("gvalley") == 0)gvalleyCount++;
    else if (siteFinalname.indexOf("gwnews") == 0)gwnewsCount++;
    else if (siteFinalname.indexOf("hani") == 0)haniCount++;
    else if (siteFinalname.indexOf("hankyung") == 0)hankyungCount++;
    else if (siteFinalname.indexOf("hkbs") == 0)hkbsCount++;
    else if (siteFinalname.indexOf("ikld") == 0)ikldCount++;
    else if (siteFinalname.indexOf("imaeil") == 0)imaeilCount++;
    else if (siteFinalname.indexOf("inews365") == 0)inews365Count++;
    else if (siteFinalname.indexOf("interview365") == 0)interview365Count++;
    else if (siteFinalname.indexOf("kado") == 0)kadoCount++;
    else if (siteFinalname.indexOf("kbench") == 0)kbenchCount++;
    else if (siteFinalname.indexOf("khan") == 0)khanCount++;
    else if (siteFinalname.indexOf("koreaherald") == 0)koreaheraldCount++;
    else if (siteFinalname.indexOf("ksilbo") == 0)ksilboCount++;
    else if (siteFinalname.indexOf("kyeonggi") == 0)kyeonggiCount++;
    else if (siteFinalname.indexOf("kyeongin") == 0)kyeonginCount++;
    else if (siteFinalname.indexOf("lec") == 0)lecCount++;
    else if (siteFinalname.indexOf("mediapen") == 0)mediapenCount++;
    else if (siteFinalname.indexOf("mediaus") == 0)mediausCount++;
    else if (siteFinalname.indexOf("moneyweek") == 0)moneyweekCount++;
    else if (siteFinalname.indexOf("mt") == 0)mtCount++;
    else if (siteFinalname.indexOf("newscj") == 0)newscjCount++;
    else if (siteFinalname.indexOf("newsis") == 0)newsisCount++;
    else if (siteFinalname.indexOf("newspim") == 0)newspimCount++;
    else if (siteFinalname.indexOf("newstomato") == 0)newstomatoCount++;
    else if (siteFinalname.indexOf("newstown") == 0)newstownCount++;
    else if (siteFinalname.indexOf("newsway") == 0)newswayCount++;
    else if (siteFinalname.indexOf("nocutnews") == 0)nocutnewsCount++;
    else if (siteFinalname.indexOf("ohmynews") == 0)ohmynewsCount++;
    else if (siteFinalname.indexOf("osen") == 0)osenCount++;
    else if (siteFinalname.indexOf("pressian") == 0)pressianCount++;
    else if (siteFinalname.indexOf("readersnews") == 0)readersnewsCount++;
    else if (siteFinalname.indexOf("rookie") == 0)rookieCount++;
    else if (siteFinalname.indexOf("segye") == 0)segyeCount++;
    else if (siteFinalname.indexOf("siminilbo") == 0)siminilboCount++;
    else if (siteFinalname.indexOf("sportsworldi") == 0)sportsworldiCount++;
    else if (siteFinalname.indexOf("tenasia") == 0)tenasiaCount++;
    else if (siteFinalname.indexOf("thisisgame") == 0)thisisgameCount++;
    else if (siteFinalname.indexOf("tvreport") == 0)tvreportCount++;
    else if (siteFinalname.indexOf("upkorea") == 0)upkoreaCount++;
    else if (siteFinalname.indexOf("vop") == 0)vopCount++;
    else if (siteFinalname.indexOf("welfarenews") == 0)welfarenewsCount++;
    else if (siteFinalname.indexOf("wikitree") == 0)wikitreeCount++;
    else if (siteFinalname.indexOf("womennews") == 0)womennewsCount++;
    else if (siteFinalname.indexOf("wowtv") == 0)wowtvCount++;
    else if (siteFinalname.indexOf("yeongnam") == 0)yeongnamCount++;

    else etcCount++;
  }

  float wordle (float counterNum) {        
    return map(counterNum, 0, 300, 10, 200);
  }
  float incoder (float counterNumber) {        
    return map(counterNumber, 0, 300, 0, width/2);
  }
  float colorConvert(float counterNums) {
    return map(counterNums, 0, 300, 0, 170);
  }
}

int acrofanCount;
int ahatvCount;
int ajunewsCount;
int anewsaCount;
int apparelnewsCount;
int asiatodayCount;
int betanewsCount;
int bizwatchCount;
int breaknewsCount;
int ccdailynewsCount;
int cctvnewsCount;
int christiantodayCount;
int chungnamilboCount;
int cstimesCount;
int daejeontodayCount;
int dailianCount;
int dailygameCount;
int dailygridCount;
int datanewsCount;
int dominCount;
int dtCount;
int ebnCount;
int edailyCount;
int enewstodayCount;
int etnewsCount;
int etodayCount;
int fnnewsCount;
int gamemecaCount;
int gametodayCount;
int gimhaenewsCount;
int gjdreamCount;
int gpkoreaCount;
int gukjenewsCount;
int gvalleyCount;
int gwnewsCount;
int haniCount;
int hankyungCount;
int hkbsCount;
int ikldCount;
int imaeilCount;
int inews365Count;
int interview365Count;
int kadoCount;
int kbenchCount;
int khanCount;
int koreaheraldCount;
int ksilboCount;
int kyeonggiCount;
int kyeonginCount;
int lecCount;
int mediapenCount;
int mediausCount;
int moneyweekCount;
int mtCount;
int newscjCount;
int newsisCount;
int newspimCount;
int newstomatoCount;
int newstownCount;
int newswayCount;
int nocutnewsCount;
int ohmynewsCount;
int osenCount;
int pressianCount;
int readersnewsCount;
int rookieCount;
int segyeCount;
int siminilboCount;
int sportsworldiCount;
int tenasiaCount;
int thisisgameCount;
int tvreportCount;
int upkoreaCount;
int vopCount;
int welfarenewsCount;
int wikitreeCount;
int womennewsCount;
int wowtvCount;
int yeongnamCount;
int etcCount;




