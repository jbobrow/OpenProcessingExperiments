
//Variables
PImage img;
PImage img2;
PFont f;
PFont f2;
String windDS = "";
String temp = "";
String date = "";
String seastate = "";

//Setup
void setup() {
  getWind();
  getTemp();
  getDate();
  getSeastate();
  size (700, 500);
  //Fonts loaded
  f = loadFont("BerlinSansFB-Reg-48.vlw");
  f2 = loadFont("BerlinSansFBDemi-Bold-48.vlw");
}

//Draw
void draw() {
  background(0);
  img = loadImage("waves.jpg");
  img2 = loadImage("map.jpg");
  image(img, 0, 0, 700, 500);
  drawWind();
  drawTemp();
  drawDate();
  drawSeastate();
  frameRate(0);
  image(img2, 480, 140, 150, 250);

  //Text for Day and Date displayed at top of page
  fill(0);
  textFont(f, 35);
  text("Day and Date:", 240, 60);
  line(242, 62, 452, 62);


  //Titles of information to be shown
  text("Temperature:", 80, 230);
  ellipse(57, 220, 10, 10);
  text("Wind:", 80, 320);
  ellipse(57, 310, 10, 10);
  text("Sea State:", 80, 410);
  ellipse(57, 397, 10, 10);
  
  fill(255, 102, 51);
  textFont(f2, 30);
  text("Tayvallich", 280, 140);
}

//Date
void getDate() {
  String[] ln = loadStrings("http://easytide.ukho.gov.uk/EasyTide/EasyTide/ShowPrediction.aspx?PortID=0387&PredictionLength=1");
  String pg = "";
  for ( int i=0; i<ln.length-100;i++) {
    //println(i+"] "+ln[i]);
    pg = pg+ln[i];
  }

  //String for the Date information
  String[] datepart = split(pg, "<span id=\"PredictionSummary1_lblPredictionStart\">");

  String[] datepart2 = split(datepart[1], "<small>(Standard Local Time)</small></span></p>");
  //println(trim(datepart2[0]));

  float val = float (trim(datepart2[0]));
  date = datepart2[0];
}

//Draw the Date
void drawDate() {
  fill(255, 255, 61);
  textFont(f2, 30);
  text(date, 100, 100);
}

//Wind
void getWind() {
  String[] ln = loadStrings("http://weather.uk.msn.com/tenday.aspx?&wealocations=wc%3A7390502&q=Tayvallich%2C+Scotland&setunit=C");
  String pg = "";
  for ( int i=0; i<ln.length-100;i++) {
    //println(i+"] "+ln[i]);
    pg = pg+ln[i];
  }

  //String for the Wind information
  String[] windpart = split(pg, "<div class=\"row r3\">");

  String[] windpart2 = split(windpart[1], "</div>");
  //println(trim(windpart2[0]));

  float val = float (trim(windpart2[0]));

  windDS = windpart2[0];
}

//Draw the Wind
void drawWind() {
  fill(255, 61, 61);
  textFont(f2, 20);
  text(windDS, 130, 350);
}

//Temperature
void getTemp() {
  String[] ln = loadStrings("http://weather.uk.msn.com/tenday.aspx?&wealocations=wc%3A7390502&q=Tayvallich%2C+Scotland&setunit=C");
  String pg = "";
  for (int i=0; i<ln.length;i++) {
    //println(i+"]"+ln[i]);
    pg = pg+ln[i];
  }

  //String for Temperature
  String[] temppart = split(pg, "<div>Hi : <span class=\"dfbold\">");

  String[] temppart2 = split(temppart[1], "</span></div>");
  //println(trim(temppart2[0]));

  float val3 = float (trim(temppart2[0]));
  temp = temppart2[0];
}

//Draw the Temperature
void drawTemp() {
  fill(255, 61, 61);
  textFont(f2, 20);
  text(temp, 130, 260);
}

//Sea State
void getSeastate() {
  String[] ln = loadStrings("http://www.bbc.co.uk/weather/coast_and_sea/shipping_forecast#area-27");
  String pg = "";
  for ( int i=0; i<ln.length;i++) {
    //println(i+"] "+ln[i]);
    pg = pg+ln[i];
  }


  //String for Sea State
String[] seastatepart = split(pg, "<li class=\"state\"><h3>Sea State</h3> <span>");
//seastatepart = split(seastatepart[25],"<li class=\"state\"><h3>Sea State</h3> <span>");
String[] seastatepart2 = split(seastatepart[25],".</span>");
//println((seastatepart.length));
//for ( int i=0; i<seastatepart.length;i++) {
  //println(i+"] "+seastatepart[25]);
 // println("\n\n");


float val = float (trim(seastatepart2[0]));
  seastate = seastatepart2[0];
  //println(trim(seastatepart2[0]));
}

//Draw SeaState
void drawSeastate() {
  fill(255, 61, 61);
  textFont(f2, 20);
  text(seastate, 130, 440);
}

