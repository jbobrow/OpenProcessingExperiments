

XML xmlSearch;
XML xmlNews;

String title = "NaverNewsTrend";
//String searchname = "api";
String[] searchname;
String[] data;
PFont EBnanum;
PFont Bnanum;
PFont Mnanum;

int startTime = 0;

Button buttons;
SearchText searchs;
SimpleGraph graphs;

void setup() {

  size(1200, 700);
  background(255);
  smooth();
  noStroke();
  searchname = loadStrings("kor.csv");
  println("searchname : " + searchname[0]);
  

  Mnanum = createFont("NanumGothic", 15);
  Bnanum = createFont("NanumGothicBold", 18);
  EBnanum = createFont("NanumGothicExtraBold", 35);

  buttons = new Button(width/2, 120, 40);

  fill(0);
  textFont(EBnanum);
  text(title, width/20, height/12);
}


void draw() {

  noStroke();
  float d = dist(mouseX, mouseY, buttons.x, buttons.y);
  if (d < 110) {
    fill(255, 0, 0, 20);
    noStroke();
    buttons = new Button(width/2, 120, 110);

    if (mousePressed) {
      if (mouseButton == LEFT) {

        /*
        stroke(0, 30);
         strokeWeight(1);
         line(buttons.x, buttons.y, width/3, height/2);
         line(buttons.x, buttons.y, width-(width/3), height/2);
         */

        noStroke();

//        searchs = new SearchText(searchname);
        searchs = new SearchText(searchname[0]);
      } else if (mouseButton == RIGHT) {
        graphs = new SimpleGraph(searchname[0]);
      }
    } else if (mousePressed == false) {
      fill(255, 0, 0, 20);
      noStroke();
      buttons = new Button(width/2, 120, 110);
    }
  } else {
    fill(255);
    buttons = new Button(width/2, 120, 110);
  }
  noStroke();
  fill(0, 120);
  textAlign(CENTER, CENTER);
  textFont(Bnanum);
//  text(searchname, buttons.x, buttons.y);
  text(searchname[0], buttons.x, buttons.y);
}


class Beziter { //this is bezier mode^^
  float x, y;
  float lc; // Line drawing count
  float rc = 0;   // 360 checking
  int slp = -50; // Line drawing Start point
  String name;
  //leftClick ver
  Beziter(float x_, float y_, float lc_) {

    lc = lc_;
    x = x_;
    y = y_;

    pushMatrix();
    translate(x, y);
    for (int i = 0; i < lc; i++) {
      stroke(0, 10);
      noFill();
      rotate((PI / 180) * (rc = rc + (360 / lc)));  // rotate Line
      Line00();
    }
    popMatrix();
  }
  
  // rightClick ver
  Beziter(String name_, float x_, float y_, float lc_) {
    name = name_;
    lc = (lc_ * 100);
    x = x_;
    y = y_;

    pushMatrix();
    translate(x, y);
    for (int i = 0; i < lc; i++) {
      stroke(0, 10);
      noFill();
      rotate((PI / 180) * (rc = rc + (360 / lc)));  // rotate Line
      Line01();
    }
    popMatrix();
    if (lc > 50) {
      noStroke();
      fill(0, 180);
    } else {
      noStroke();
      fill(255);
    }
    textFont(Mnanum);
    text(name, x, y);
  }

  void Line00() {
    float a = random(500);     
    float b = random(200); 
    float c = random(-10, 10);  
    float d = random(300); 
    bezier(0, 0, a, b, a, b, sqrt(lc), (sqrt(lc)) ); // radius count

  }
  void Line01() {
    float a = random(10, 30);
    float b = random(10, 30);
    float c = random(50, 90);
    float d = random(50, 90);
    bezier(0, 0, a, b, c, d, 30, 30);
  }
}


class Button {

  float x, y;
  float r;

  Button() {
  }

  Button(float x_, float y_, float r_) {    

    x = x_;
    y = y_;
    r = r_;

    noFill();
    noStroke();

    ellipseMode(CENTER);
    //    stroke(104);


    ellipse(x, y, 110, 110);
  }
}

class SimpleGraph {
  
  Beziter beziters2;

  float x, y;
  float w, h;
  String searchName;  
  String[] dateFinal;

  int etnewsCount;
  int ddailyCount;
  int zdnetCount;
  int bloterCount;
  int dtCount;
  int ebuzzCount;
  int mediaitCount;
  int inews24Count;

  SimpleGraph() {
  }

  SimpleGraph(String searchName_) {
    String[] dateFinal;
    searchName = searchName_;    

    xmlNews = loadXML("http://openapi.naver.com/search?key=270dc6b5103d044541d2c08445946c3f&query=" + searchName +"&target=news&start=1&display=100");
    XML news = xmlNews.getChild("channel"); // 4 and 6ver
    XML[] newsItems = news.getChildren("item");
    println("newsItems.length : " + newsItems.length);

    for (int j = 0; j < newsItems.length; j++) {
      XML titleCode = newsItems[j].getChild("title");  //titleCode is with tag
      String title = titleCode.getContent(); // title is only Stings
      fill(0, 90);
      textFont(Mnanum);
//      text(title, random(0, width), random(0, height) );

      ////////// pubDate division START////////////
      XML pubDateCode = newsItems[j].getChild("pubDate");
      String pubDate = pubDateCode.getContent();



      XML linkCode = newsItems[j].getChild("originallink"); 
      String originalLink = linkCode.getContent();
      if (originalLink.indexOf("http") != -1) {
        // originalLink : http://www.etnews.com/20140718000201

          String[] dateValues = split(pubDate, ","); // dateValues[0] : Sun , dateValues[1] : 21 Jul 2014 08:17:00 +0900

        float[] dateNumber = float(split(dateValues[1], " ")); // dateNumber[1] : 21.0 , [3]: 2014, [4] 18:22:22
        String[] dateString = split(dateValues[1], " "); // dateString[4] : 00:42:00


        String[] siteValues = split(originalLink, "//"); //siteValues[1] : www.dailygrid.net/news/articleView.html?idxno=27959      
        String[] siteFinals = split(siteValues[1], "/"); //siteFinal[0] : www.fnnews.com
        println("siteFinals[0] : " + siteFinals[0]);
        println(siteFinals[0].indexOf("www.etnews.com"));

        if (siteFinals[0].indexOf("www.etnews.com") == 0) etnewsCount++;
        else if (siteFinals[0].indexOf("www.ddaily.co.kr") == 0) ddailyCount++;
        else if (siteFinals[0].indexOf("www.zdnet.co.kr") == 0)  zdnetCount++;
        else if (siteFinals[0].indexOf("www.inews24.com") == 0)  inews24Count++;
        else if (siteFinals[0].indexOf("www.it.co.kr") == 0) mediaitCount++;
        else if (siteFinals[0].indexOf("www.bloter.net") == 0) bloterCount++;
        else if (siteFinals[0].indexOf("www.ebuzz.co.kr") == 0) ebuzzCount++;
        else if (siteFinals[0].indexOf("www.dt.co.kr") == 0) dtCount++;
   

        //        println("dateString[2] : " + dateString[2]); // pubDayName
        //        println("dateString[4] : " + dateString[4]); // pubDayName
        //        println("dateNumber[3] : " + dateNumber[3]); // pubYear
        //        println("dateNumber[4] : " + dateNumber[4] + "\n"); // pubTime

      }
    }
    println("etnewsCount : " + ebuzzCount);
    println("zdnetCount : " + zdnetCount);

    beziters2 = new Beziter("전자신문", 200, 350, etnewsCount);
    beziters2 = new Beziter("디지털타임즈", 300, 350, dtCount);
    beziters2 = new Beziter("ZDNet Korea", 400, 350, zdnetCount);
    beziters2 = new Beziter("디지털데일리", 500, 350, ddailyCount);
    beziters2 = new Beziter("미디어잇", 600, 350, mediaitCount);
    beziters2 = new Beziter("ebuzz", 700, 350, ebuzzCount);
    beziters2 = new Beziter("블로터닷넷", 800, 350, bloterCount);
    beziters2 = new Beziter("아이뉴스24", 900, 350, inews24Count);
    
  }
}
class SearchText {
  XML xmlNews;
  Beziter[] beziters;
  SimpleGraph[] graphs;

  String searchName;
  float dx, dy;
  int startPoint = 1;

  SearchText() {
  }

  SearchText(String searchName_) {
    searchName = searchName_;

    //        xmlNews = loadXML("http://openapi.naver.com/search?key=270dc6b5103d044541d2c08445946c3f&query=" + searchName +"&target=news&start=" + startPoint +"&display=100");
    xmlNews = loadXML("http://openapi.naver.com/search?key=270dc6b5103d044541d2c08445946c3f&query=" + searchName +"&target=news&start=1&display=100");
    XML[] news = xmlNews.getChildren("channel");

    beziters = new Beziter[news.length];
    graphs = new SimpleGraph[news.length];
    for (int i = 0; i < 1; i++) {

      XML newsCount = news[i].getChild("total");
      String newsString = newsCount.getContent("title");
      float newsBall = newsCount.getFloatContent();
      text(title, width/20, height/12);
      beziters[i] = new Beziter(width/20, height/12, newsBall);

      if (newsBall < 50) {
        fill(10);
      } else {

        fill(233);
      }
      textAlign(CENTER, CENTER);
      textFont(EBnanum);
      text(newsString, width/20, height/12);      
      textFont(Mnanum);
      text("News Scripts", width/20, height/12+35);
    }
  }
}



