
import simpleML.*;

HTMLRequest WashingtonPost;
HTMLRequest USAToday;
HTMLRequest WashingtonTimes;
HTMLRequest NYTimes;
HTMLRequest Pravda;
HTMLRequest MoscowNews;
HTMLRequest RussiaProfile;
HTMLRequest RussiaGlobalAffairs;

String html_WashingtonPost = "";
String html_USAToday ="";
String html_WashingtonTimes = "";
String html_NYTimes = "";
String html_Pravda = "";
String html_MoscowNews = "";
String html_RussiaProfile = "";
String html_RussiaGlobalAffairs = "";

int ChinaUS = 0;
int ChinaRS = 0;
int RussiaUS = 0;
int USRS = 0;

// holds the current HTML from our url source
String html = "";

// use this to time for the draw function
float startTime;

// checks to see if requested HTML data is ready
boolean gotnew = false;

int w = 500;
int h = 500;
int fps = 10;

// for the timer
float x = 0;
int interval = 10000;
float jump = w/(fps*interval/1000);

//start sizes for elements
int csize1 = 10;
int csize2 = 10;
int rsize = 10;
int usize = 10;


float now = millis();
//setup
void setup() {
  size(500,500);
  background(0);
  smooth();
  frameRate(fps);
  WashingtonPost = new HTMLRequest(this, "http://www.washingtonpost.com/world");
  USAToday = new HTMLRequest(this, "http://www.usatoday.com/news/world/index");
  WashingtonTimes = new HTMLRequest(this, "http://www.washingtontimes.com/news/world/");
  NYTimes = new HTMLRequest(this, "http://www.nytimes.com/pages/world/index.html");
  Pravda = new HTMLRequest(this, "http://english.pravda.ru/world/");
  MoscowNews = new HTMLRequest(this, "http://themoscownews.com/international/");
  RussiaProfile =  new HTMLRequest(this, "http://russiaprofile.org/international/");
  RussiaGlobalAffairs = new HTMLRequest(this, "http://eng.globalaffairs.ru/");
  WashingtonPost.makeRequest();
  USAToday.makeRequest();
  WashingtonTimes.makeRequest();
  NYTimes.makeRequest();
  Pravda.makeRequest();
  MoscowNews.makeRequest();
  RussiaProfile.makeRequest();
  RussiaGlobalAffairs.makeRequest();
   startTime = now;
   PFont font = createFont("ChemistPeriodic",48);
   textFont(font);
}

//draws it out
void draw() {
  stroke(0,255,0);
  strokeWeight(2);
  line(250,0,250,500);
  noStroke();
  
  
  // labels
  fill(0,155,255);
  text("RUSSIA",325,475);
  text("US",125,475);
  
  
  //makes it fade
  fill(0,50);
  rectMode(CORNER);
  rect(0,0,500,500);
  
  // what time is it
  float now = millis();
  
  // checks website ever five seconds
  if(now>startTime + interval) {
    WashingtonPost.makeRequest();
  USAToday.makeRequest();
  WashingtonTimes.makeRequest();
  NYTimes.makeRequest();
  Pravda.makeRequest();
  MoscowNews.makeRequest();
  RussiaProfile.makeRequest();
  RussiaGlobalAffairs.makeRequest();
    startTime = now;
  }

  //x is part of the timer, checks for the edge
  x+=jump;
  if(x>=width) {
    x =0;
  }
  if(gotnew) {
    gotnew = false;
    
    // counting all the instances these are found in these sources
    ChinaUS = getMatchCount("China", html_WashingtonPost);
    ChinaUS += getMatchCount("China", html_USAToday);
    ChinaUS += getMatchCount("China", html_WashingtonTimes);
    ChinaUS += getMatchCount("China", html_NYTimes);
    ChinaUS += getMatchCount("Chinese", html_WashingtonPost);
    ChinaUS += getMatchCount("Chinese", html_USAToday);
    ChinaUS += getMatchCount("Chinese", html_WashingtonTimes);
    ChinaUS += getMatchCount("Chinese", html_NYTimes);
    
    ChinaRS = getMatchCount("China", html_Pravda);
    ChinaRS += getMatchCount("China", html_MoscowNews);
    ChinaRS += getMatchCount("China", html_RussiaProfile);
    ChinaRS += getMatchCount("China", html_RussiaGlobalAffairs);
    ChinaRS += getMatchCount("Chinese", html_Pravda);
    ChinaRS += getMatchCount("Chinese", html_MoscowNews);
    ChinaRS += getMatchCount("Chinese", html_RussiaProfile);
    ChinaRS += getMatchCount("Chinese", html_RussiaGlobalAffairs);
    
    USRS = getMatchCount("U.S.", html_Pravda);
    USRS += getMatchCount("U.S.", html_MoscowNews);
    USRS += getMatchCount("U.S.", html_RussiaProfile);
    USRS += getMatchCount("U.S.", html_RussiaGlobalAffairs);
    USRS += getMatchCount("US", html_Pravda);
    USRS += getMatchCount("US", html_MoscowNews);
    USRS += getMatchCount("US", html_RussiaProfile);
    USRS += getMatchCount("US", html_RussiaGlobalAffairs);
    USRS += getMatchCount("American", html_Pravda);
    USRS += getMatchCount("American", html_MoscowNews);
    USRS += getMatchCount("American", html_RussiaProfile);
    USRS += getMatchCount("American", html_RussiaGlobalAffairs);
    USRS += getMatchCount("Americans", html_Pravda);
    USRS += getMatchCount("Americans", html_MoscowNews);
    USRS += getMatchCount("Americans", html_RussiaProfile);
    USRS += getMatchCount("Americans", html_RussiaGlobalAffairs);
  
    RussiaUS = getMatchCount("Russia", html_WashingtonPost);
    RussiaUS += getMatchCount("Russia", html_USAToday);
    RussiaUS += getMatchCount("Russia", html_WashingtonTimes);
    RussiaUS += getMatchCount("Russia", html_NYTimes);
    RussiaUS += getMatchCount("Russian", html_WashingtonPost);
    RussiaUS += getMatchCount("Russian", html_USAToday);
    RussiaUS += getMatchCount("Russian", html_WashingtonTimes);
    RussiaUS += getMatchCount("Russian", html_NYTimes);
    RussiaUS += getMatchCount("Russians", html_WashingtonPost);
    RussiaUS += getMatchCount("Russians", html_USAToday);
    RussiaUS += getMatchCount("Russians", html_WashingtonTimes);
    RussiaUS += getMatchCount("Russians", html_NYTimes);
    
    println("RussiaUS: " + RussiaUS);
    println("USRS: " + USRS);
    println("ChinaRS: " + ChinaRS);
    println("ChinaUS: " + ChinaUS);
    
       // resets the element size whenever we have new data shows
    
    rsize = 10;
    usize = 10;
    csize1 = 10;
    csize2 = 10;
  }
  
  drawChinaUS();
  drawChinaRS();
  drawUSRS();
  drawRussiaUS();
  
    // draw timer line
  stroke(255,20);
  strokeWeight(2);
  line(x,0,x,height);

}

void drawChinaUS() {
  if(ChinaUS>10) {
    fill(0,255,100);
    text("It's war, we mentioned China more", 30,350,20);
    text("than 10 times!", 30, 400,20);
  }
  if(ChinaUS>0) {
   fill(255,0,0);
   rect(50,0,65,csize1);
    csize1 +=10;
  }
  ChinaUS --;
}

void drawChinaRS() {
  if(ChinaRS > 0){
    fill(255,0,0);
    rect(300,0,65,csize2);
    csize2 +=10;
  }
  ChinaRS --;
}

void drawUSRS() {
  if(USRS>50) {
    fill(255,100,0);
    text("Holy Crap! US is going to attack!",50,250,20);
    text("We mention them more than 50 times", 20, 300,20);
  }
  if(USRS > 0) {
    fill(255,0,0);
    rect(415,0,5,usize);
    fill(255);
    rect(420,0,5,usize);
    fill(255,0,0);
    rect(425,0,5,usize);
    fill(255);
    rect(430,0,5,usize);
    fill(255,0,0);
    rect(435,0,5,usize);
    fill(255);
    rect(440,0,5,usize);
    fill(255,0,0);
    rect(445,0,5,usize);
    fill(255);
    rect(450,0,5,usize);
    fill(255,0,0);
    rect(455,0,5,usize);
    fill(255);
    rect(460,0,5,usize);
    fill(255,0,0);
    rect(465,0,5,usize);
    fill(255);
    rect(470,0,5,usize);
    fill(255,0,0);
    rect(475,0,5,usize);
    
    usize +=10;
  }
  USRS --;
}

void drawRussiaUS() {
  if(RussiaUS > 0) {
    fill(255,215,0);
    rect(155,0,65,usize);
    rsize +=10;
  }
  RussiaUS --;
}
    

//netEvent is called when makeRequest() is finished in response to returned HTML
  void netEvent(HTMLRequest r) {
    html_WashingtonPost = WashingtonPost.readRawSource();
    html_USAToday = USAToday.readRawSource();
    html_WashingtonTimes = WashingtonTimes.readRawSource();
    html_NYTimes = NYTimes.readRawSource();
    html_Pravda = Pravda.readRawSource();
    html_MoscowNews = MoscowNews.readRawSource();
    html_RussiaProfile = RussiaProfile.readRawSource();
    html_RussiaGlobalAffairs = RussiaGlobalAffairs.readRawSource();
    gotnew = true;
  }
  
  // a function to find how many times the string " " is found 
  int getMatchCount(String find, String s) {
    int m = s.split(find).length;
    return m-1;
  }
    
  


