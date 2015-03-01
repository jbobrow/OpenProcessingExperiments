
XML xmlSearch;
XML xmlNews;

String title = "뉴스트렌드";
String searchname = "api";


String[] data;
PFont EBnanum;
PFont Bnanum;
PFont Mnanum;

final int margin = 100;
final int totalCategory = 8;

float xGap, xWidth;

int buttonID = 0;
boolean graphsCheck = false;
boolean semibuttonsCheck = false;


Button buttons;

Button buttons1, buttons2, buttons3, buttons4, buttons5, buttons6, buttons7, buttons8;



SearchText searchs;
SimpleGraph graphs;

void setup() {

  size(1200, 700);
  background(255);
  smooth();
  xGap = width/totalCategory;
  xWidth = xGap-10;


  //  searchname = loadStrings("kor.csv");
  //  println("searchname : " + searchname[0]);


  Mnanum = createFont("NanumGothic", 15, true);
  Bnanum = createFont("NanumGothicBold", 18, true);
  EBnanum = createFont("NanumGothicExtraBold", 35, true);


  //  buttons = new Button(margin, 45);

  fill(30);
  rect(0, 0, width, 30);

  fill(0, 255, 0);
  textFont(Bnanum);
  text(title, width/20, 20);
}


void draw() {

  stroke(0, 30);
  strokeWeight(.5);
  noFill();
  buttons = new Button(margin, 60);

  buttons1 = new Button("etnewsButton");
  buttons2 = new Button("dtButton");
  buttons3 = new Button("zdnetButton");
  buttons4 = new Button("ddailyButton");
  buttons5 = new Button("mediaitButton");
  buttons6 = new Button("ebuzzButton");
  buttons7 = new Button("bloterButton");
  buttons8 = new Button("inews24Button");



  float d = dist(mouseX, mouseY, buttons.x, buttons.y);


  if (d < buttons.r) {


    stroke(0, 30);
    strokeWeight(.5);
    fill(255, 0, 0);
    buttons = new Button(margin, 60);

    if (mouseButton == LEFT) { 
      //체크표시추가
      fill(255, 0, 0);
      searchs = new SearchText(searchname);
    } else if (mouseButton == RIGHT) { 
      fill(0, 0, 255);
      graphs = new SimpleGraph(searchname, buttonID);
      graphsCheck = true;
    }
  } else {
    stroke(104);
    strokeWeight(.5);
    fill(255);
    buttons = new Button(margin, 60);

    fill(0);
    textAlign(LEFT, CENTER);
    textFont(Mnanum);
    text(searchname, buttons.x + 20, buttons.y);
  }

  //  if (overRect(buttons1.rx, buttons1.ry, 10, 10) == true) {
  if (overRect(200, 500, 10, 10) == true) {
    fill(255, 0, 0);      
    buttons1 = new Button("etnewsButton");
  } else if (overRect(250, 500, 10, 10) == true) {
    fill(255, 0, 0);      
    buttons2 = new Button("dtButton");
  } else  if (overRect(300, 500, 10, 10) == true) {
    fill(255, 0, 0);      
    buttons3 = new Button("zdnetButton");
  } else if (overRect(350, 500, 10, 10) == true) {
    fill(255, 0, 0);      
    buttons4 = new Button("ddailyButton");
  } else  if (overRect(400, 500, 10, 10) == true) {
    fill(255, 0, 0);      
    buttons5 = new Button("mediaitButton");
  } else if (overRect(450, 500, 10, 10) == true) {
    fill(255, 0, 0);      
    buttons6 = new Button("ebuzzButton");
  } else if (overRect(500, 500, 10, 10) == true) {
    fill(255, 0, 0);      
    buttons7 = new Button("bloterButton");
  } else if (overRect(550, 500, 10, 10) == true) {
    fill(255, 0, 0);      
    buttons8 = new Button("inews24Button");
  }

  semibuttonsCheck = true;
}




boolean overRect(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && 
    mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
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

    if (lc < 50) {
      fill(10);
    } else {

      fill(233);
    }
    textAlign(CENTER, CENTER);
    textFont(EBnanum);
    //      text(newsString, width/20, height/12);      
    textFont(Mnanum);
    text("News Scripts", width/20, height/12+35);
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
    noStroke();
    fill(80);
    textAlign(CENTER, CENTER);
    textFont(Mnanum);
    text(name, x, y + 55);
  }

  void Line00() {
    float a = random(400);     
    float b = random(200); 

    bezier(0, 0, a, b, a, b, sqrt(lc), (sqrt(lc)) ); // radius count
  }
  void Line01() {
    float a = random(10, 30);
    float b = random(10, 30);
    float c = random(50, 90);
    float d = random(50, 90);
    bezier(0, 0, a, b, a, b, 30, 30);
  }
}
class Button {

  float x, y;
  float r = 20;

  int rx;
  int ry = height - (margin*2);
  int w =  10;
  int h = 10;
  String codes;

  Button() {
  }

  Button(float x_, float y_) {    

    x = x_;
    y = y_;

    ellipseMode(CENTER);
    ellipse(x, y, r, r);
  }

  Button(String codes_) {
    codes = codes_;
    //
    //
    if (codes == "etnewsButton") rx = 200;    
    else if (codes == "dtButton") rx = 250;
    else if (codes == "zdnetButton") rx = 300;
    else if (codes == "ddailyButton") rx = 350;
    else if (codes == "mediaitButton") rx = 400;
    else if (codes == "ebuzzButton") rx = 450;
    else if (codes == "bloterButton") rx = 500;
    else if (codes == "inews24Button") rx = 550;  


    fill(104);
    rect(rx, ry, w, h);
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
//    xmlNews = loadXML("http://openapi.naver.com/search?key=270dc6b5103d044541d2c08445946c3f&query=" + searchName +"&target=news&start=1&display=100", "UTF-8");
    xmlNews = loadXML("http://openapi.naver.com/search?key=270dc6b5103d044541d2c08445946c3f&query=" + searchName +"&target=news&start=1&display=100");
    XML[] news = xmlNews.getChildren("channel");

    beziters = new Beziter[news.length];
    graphs = new SimpleGraph[news.length];
    for (int i = 0; i < 1; i++) {
      XML newsCount = news[i].getChild("total");
      String newsString = newsCount.getContent("title");
      float newsBall = newsCount.getFloatContent();
      beziters[i] = new Beziter(width/2, 200, newsBall);



      textFont(EBnanum);
      text(newsString, beziters[i].x, beziters[i].y);      
      textFont(Mnanum);
      text(searchName + "관련 뉴스기사 수", beziters[i].x, beziters[i].y + 35);
    }
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
  int jan, feb, mar, april, may, jun, jul, aug, sep, oct, nov, dec;



  SimpleGraph() {
  }

  SimpleGraph(String searchName_, int buttonsID_) {
    String[] dateFinal;
    searchName = searchName_; 


    //    xmlNews = loadXML("http://openapi.naver.com/search?key=270dc6b5103d044541d2c08445946c3f&query=" + searchName +"&target=news&start=1&display=100");
    xmlNews = loadXML("http://openapi.naver.com/search?key=270dc6b5103d044541d2c08445946c3f&query=" + searchName +"&target=news&start=1&display=100&sort=sim");
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

      String originalLink2 = originalLink + originalLink;


      println(originalLink2);
      if (originalLink.indexOf("http") != -1) {
        // originalLink : http://www.etnews.com/20140718000201

          String[] dateValues = split(pubDate, ","); // dateValues[0] : Sun , dateValues[1] : 21 Jul 2014 08:17:00 +0900

        float[] dateNumber = float(split(dateValues[1], " ")); // dateNumber[1] : 21.0 , [3]: 2014, [4] 18:22:22
        String[] dateString = split(dateValues[1], " "); // dateString[2] : Jul ,  dateString[4] : 00:42:00


        String[] siteValues = split(originalLink, "//"); //siteValues[1] : www.dailygrid.net/news/articleView.html?idxno=27959      
        String[] siteFinals = split(siteValues[1], "/"); //siteFinal[0] : www.fnnews.com
        //        println("siteFinals[0] : " + siteFinals[0]);
        //        println(siteFinals[0].indexOf("www.etnews.com"));


        balls(siteFinals[0], dateString[2]);
        if(semibuttonsCheck == true){

        println("etbuttons ok!!!" );
        }
      }
    }

    beziters2 = new Beziter("전자신문", 200, height-margin, etnewsCount);
    beziters2 = new Beziter("디지털타임즈", 300, height-margin, dtCount);
    beziters2 = new Beziter("ZDNet Korea", 400, height-margin, zdnetCount);
    beziters2 = new Beziter("디지털데일리", 500, height-margin, ddailyCount);
    beziters2 = new Beziter("미디어잇", 600, height-margin, mediaitCount);
    beziters2 = new Beziter("ebuzz", 700, height-margin, ebuzzCount);
    beziters2 = new Beziter("블로터닷넷", 800, height-margin, bloterCount);
    beziters2 = new Beziter("아이뉴스24", 900, height-margin, inews24Count);
  }

  void balls (String siteFinalsElement, String monthElement) {
    
    String sitename;
    String monthname; 
    sitename = siteFinalsElement;
    monthname = monthElement;        

    if (sitename.indexOf("www.etnews.com") == 0) {
      etnewsCount++;
      monthSave(monthname);
      fill(255, 0, 0);
      if(semibuttonsCheck == true) monthDisplay();

    } else if (sitename.indexOf("www.ddaily.co.kr") == 0) {
      ddailyCount++;
      monthSave(monthname);
      fill(0, 255, 0);
      //      monthDisplay();
    } else if (sitename.indexOf("www.zdnet.co.kr") == 0) {
      zdnetCount++;
      monthSave(monthname);
      fill(0, 0, 255);
      //      monthDisplay();
    } else if (sitename.indexOf("www.inews24.com") == 0) {
      inews24Count++;
      monthSave(monthname);
      //      monthDisplay();
    } else if (sitename.indexOf("www.it.co.kr") == 0) {
      mediaitCount++;
      monthSave(monthname);
      //      monthDisplay();
    } else if (sitename.indexOf("www.bloter.net") == 0) {
      bloterCount++;
      monthSave(monthname);
      //      monthDisplay();
    } else if (sitename.indexOf("www.ebuzz.co.kr") == 0) {
      ebuzzCount++;
      monthSave(monthname);
      //      monthDisplay();
    } else if (sitename.indexOf("www.dt.co.kr") == 0) {
      dtCount++;
      monthSave(monthname);
      //      monthDisplay();
    }
  }


  void monthSave(String month) {
    if (month.indexOf("Jan") == 0) jan++;
    else if (month.indexOf("Feb") == 0) feb++;
    else if (month.indexOf("Mar") == 0) mar++;
    else if (month.indexOf("April") == 0) april++;
    else if (month.indexOf("May") == 0) may++;
    else if (month.indexOf("Jun") == 0) jun++;
    else if (month.indexOf("Jul") == 0) jul++;
    else if (month.indexOf("Aug") == 0) aug++;
    else if (month.indexOf("Sep") == 0) sep++;
    else if (month.indexOf("Oct") == 0) oct++;
    else if (month.indexOf("Nov") == 0) nov++;
    else if (month.indexOf("Dec") == 0) dec++;
  }

  void monthDisplay() {

    pushMatrix();
    translate(0, height-200);

    // vertex - S -
    fill(80);
    stroke(80);
    strokeWeight(.5);
    beginShape();
    println("jan: " + jun);
    println("-monYpoint(jan) : " + -monYpoint(jan));
    println("-monYpoint(feb) : " + -monYpoint(feb));
    println("-monYpoint(mar) : " + -monYpoint(mar));
    println("-monYpoint(april) : " + -monYpoint(april));
    println("-monYpoint(may) : " + -monYpoint(may));
    println("-monYpoint(jun) : " + -monYpoint(jun));
    println("-monYpoint(jul) : " + -monYpoint(jul));
    println("-monYpoint(aug) : " + -monYpoint(aug));
    println("-monYpoint(sep) : " + -monYpoint(sep));
    println("-monYpoint(oct) : " + -monYpoint(oct));
    println("-monYpoint(nov) : " + -monYpoint(nov));
    println("-monYpoint(dec) : " + -monYpoint(dec));
    
    vertex(100, -monYpoint(jan));
    vertex(150, -monYpoint(jan));
    vertex(150, -monYpoint(feb));
    vertex(200, -monYpoint(feb));
    vertex(200, -monYpoint(mar));
    vertex(250, -monYpoint(mar));
    vertex(250, -monYpoint(april));
    vertex(300, -monYpoint(april));
    vertex(300, -monYpoint(may));
    vertex(350, -monYpoint(may));
    vertex(350, -monYpoint(aug));
    vertex(400, -monYpoint(aug));
    vertex(400, -monYpoint(jun));
    vertex(450, -monYpoint(jun));
    vertex(450, -monYpoint(jul));
    vertex(500, -monYpoint(jul));
    vertex(500, -monYpoint(sep));
    vertex(550, -monYpoint(sep));
    vertex(550, -monYpoint(oct));
    vertex(600, -monYpoint(oct));
    vertex(600, -monYpoint(nov));
    vertex(650, -monYpoint(nov));
    vertex(650, -monYpoint(dec));
    //    vertex(650, -monYpoint(dec));
    endShape(CLOSE);
    
    
    noStroke();
    fill(204);
    textFont(Mnanum);
    textAlign(CENTER, TOP);
    
    float labelMargin = 15;
    
    text("1월", 100, labelMargin);
    text("2월", 150, labelMargin);
    text("3월", 200, labelMargin);
    text("4월", 250, labelMargin);
    text("5월", 300, labelMargin);
    text("6월", 350, labelMargin);
    text("7월", 400, labelMargin);
    text("8월", 450, labelMargin);
    text("9월", 500, labelMargin);
    text("10월", 550, labelMargin);
    text("11월", 600, labelMargin);
    text("12월", 650, labelMargin);
    
    // vertex - E -

    /*
    ellipse(100, -jan*20, 10, 10);
     ellipse(150, -feb*20, 10, 10);
     ellipse(200, -mar*20, 10, 10);
     ellipse(250, -april*20, 10, 10);
     ellipse(300, -may*20, 10, 10);
     ellipse(350, -jun*20, 10, 10);
     ellipse(400, -jul*20, 10, 10);
     ellipse(450, -aug*20, 10, 10);
     ellipse(500, -sep*20, 10, 10);
     ellipse(550, -oct*20, 10, 10);
     ellipse(600, -nov*20, 10, 10);
     ellipse(650, -dec*20, 10, 10);
     */
    popMatrix();
  }


  float monYpoint( int mon ) {

    return map(mon, 0, 10, 0, 300);
  }
}


/*
        if (siteFinals[0].indexOf("www.etnews.com") == 0) {
 etnewsCount++;
 
 monthSave(dateString[2]);
 fill(255, 0, 0);
 monthDisplay();
 } else if (siteFinals[0].indexOf("www.ddaily.co.kr") == 0) {
 ddailyCount++;
 monthSave(dateString[2]);
 fill(0, 255, 0);
 monthDisplay();
 } else if (siteFinals[0].indexOf("www.zdnet.co.kr") == 0) {
 zdnetCount++;
 monthSave(dateString[2]);
 fill(0, 0, 255);
 monthDisplay();
 } else if (siteFinals[0].indexOf("www.inews24.com") == 0) {
 inews24Count++;
 monthSave(dateString[2]);
 monthDisplay();
 } else if (siteFinals[0].indexOf("www.it.co.kr") == 0) {
 mediaitCount++;
 monthSave(dateString[2]);
 monthDisplay();
 } else if (siteFinals[0].indexOf("www.bloter.net") == 0) {
 bloterCount++;
 monthSave(dateString[2]);
 monthDisplay();
 } else if (siteFinals[0].indexOf("www.ebuzz.co.kr") == 0) {
 ebuzzCount++;
 monthSave(dateString[2]);
 monthDisplay();
 } else if (siteFinals[0].indexOf("www.dt.co.kr") == 0) {
 dtCount++;
 monthSave(dateString[2]);
 monthDisplay();
 }
 */


