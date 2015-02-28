
/* Title    : Weather Station Data Gift
   Synopsis : Small data gift for family, Weather station
   Authors  : Michael hawthorne, Forbes Ramsay
   Data     : 01/12/2011
   Version  : 0.1.4
   ChangeLog: optimised, added controlP5, colour coded graph tips 
*/
import controlP5.*;
ControlP5 TthreshSlide;
ControlP5 TlowthreshSlide;
ControlP5 RthreshSlide;
ControlP5 RlowthreshSlide;
ControlP5 WthreshSlide;
ControlP5 WlowthreshSlide;
ControlP5 reset;
ControlP5 resetlive;

int tHigh = 0, tLow = 100, tfHigh = 0, tfLow = 200, rHigh = 0, rLow = 101, whigh = 0, wlow = 100;

String[] master;
String[] splitString;
String[] reducedLine;
String[] singleE;
String[] tempArray;
String[] hArray;
int TF;
int T;
int H;
String[] wifinal;
String W;
int Wi;
String Humidity;
String Temp;
String Pressure;
String Conditions;
String Wind;
String WindD;

PFont F;
PImage M;
graphData G;
String url = "http://wublast.wunderground.com/cgi-bin/WUBLAST?lat=55.95000076&lon=-3.34999990&zoom=3&width=192&height=192&key=sat_ir4_thumb&basemap=1&gtt=0&num=1&timelabel=0&delay=25&borders=1&theme=WUBLAST_WORLD&extension=png&proj=ll&rand=1320967977";

int Tlow = 10;
int Thigh = 25;

int Rlow = 40;
int Rhigh = 80;

int Wlow = 4;
int Whigh = 25;

int timer = 0;




void setup()
{
  size(700,600);
  F = loadFont("ArialMT-48.vlw");
  M = loadImage(url, "png");
  background(0);
  G = new graphData();
  smooth();
  frameRate(15);
  getData();
  G.addVal(T, H,Wi);
  TthreshSlide = new ControlP5(this);
  TlowthreshSlide = new ControlP5(this);
  RthreshSlide = new ControlP5(this);
  RlowthreshSlide = new ControlP5(this);
  WthreshSlide = new ControlP5(this);
  WlowthreshSlide = new ControlP5(this);
  reset = new ControlP5(this);
  resetlive = new ControlP5(this);
  
  reset.setColorForeground(color(#AD0000));
  reset.setColorActive(color(#D80000));
  reset.setColorBackground(color(#CE0000));
  reset.addButton("RESET", 0, 81, 575, 69, 25);
  
  resetlive.setColorForeground(color(#AD0000));
  resetlive.setColorActive(color(#D80000));
  resetlive.setColorBackground(color(#CE0000));
  resetlive.addButton("RESET_LIVE", 0, 0, 575, 80, 25);
  
  TthreshSlide.addSlider("Thigh", 25, 40, 28, 10, 350, 10, 50);
  TlowthreshSlide.addSlider("Tlow", -10, 25, 10, 50, 350, 10, 50);
  RthreshSlide.addSlider("Rhigh", 50, 100, 75, 10, 430, 10, 50);
  RlowthreshSlide.addSlider("Rlow", 0, 50, 20, 50, 430, 10, 50);
  WthreshSlide.addSlider("Whigh", 21, 60, 27, 10, 510, 10, 50);
  WlowthreshSlide.addSlider("Wlow", 0, 20, 5, 50, 510, 10, 50);
  
}

void draw()
{
  background(30);
  drawStatic();
  if(timer == 1200)
  {
    getData();
    timer = 0;
  }
  drawClock();
  
    textAlign(LEFT);
    textFont(F, 12);
    String Date = day() + " / " + month() + " / " + year();
    text(Date,618,90);
    fill(200,200,200);
    textFont(F, 30);
    text(Temp, 240, 135);
    text(Humidity, 240, 170); 
    text(Pressure, 240, 205);
    text(Conditions, 240 , 240);
    text(Wind, 240 , 275); 
    text(WindD, 240 , 310);
    //text(timer,10,30);
    
    if(TF > tfHigh || T > tHigh)
    {
      tfHigh = TF;
      tHigh = T;
    }
    if(H > rHigh)
    {
      rHigh = H;
    }
    if(TF < tfLow || T < tLow)
    {
      tfLow = TF;
      tLow = T;
    }
    if(H < rLow)
    {
      rLow = H;
    }
    if(Wi > whigh)
    {
      whigh = Wi;
    }
    if(Wi < wlow)
    {
      wlow = Wi;
    }
    
    textFont(F,10);
    fill(200,200,200);
    text(tHigh + "C", 115,380);
    text(tLow + "C", 114,400);
  
    text(rHigh + "%", 115,460);
    text(rLow + "%", 114,480);
  
    text(whigh + "mph", 115,540);
    text(wlow + "mph", 114,560);
    
    if(timer == 1199)
    {
      G.addVal(T, H,Wi);
    }
    G.drawData();
    G.drawpointData();
    timer++;
}


/*
    getData() - downloads xml data and assigns to vars
    No params
    No returns
*/
void getData()
{
    master = loadStrings("http://rss.wunderground.com/auto/rss_full/global/stations/03160.xml");
    splitString = split(master[21], "[CDATA[");
    reducedLine = split(splitString[1], "<img src");
    singleE = split(reducedLine[0], "|");
    tempArray = split(singleE[0], "&deg;");
    hArray = split(singleE[1], "Humidity: ");
    TF = int(tempArray[0].substring(13, tempArray[0].length()));
    T = int(tempArray[1].substring(4, tempArray[1].length()));
    H = int(hArray[1].substring(0, hArray[1].length() - 2));
    wifinal = split(singleE[5], "mph");
    W = wifinal[0].substring(12,wifinal[0].length());
    W = trim(W);
    Wi = int(W);
    //println(Wi);
    Humidity = "Humidity        : " + H + "%";
    Temp = "Temperature : " + T + "c" + " / " + TF + "f";
    Pressure = singleE[2].substring(1, singleE[2].length() - 9);
    Conditions = singleE[3].substring(1, singleE[3].length() - 1);
    Wind = singleE[5].substring(1, singleE[5].length());
    WindD = singleE[4].substring(1, singleE[4].length());
    M = loadImage(url, "png");  
}


/*
    drawStatic() - Draws static data 
    No Params
    No Returns
*/
void drawStatic()
{
  stroke(255);
  strokeWeight(2);
  line(0,100,width,100); // Top Line
  textAlign(LEFT);
  textFont(F,50);
  fill(200,200,200);
  text("Digital Weather Station", 80,60);
  textFont(F,25);
  text("Edinburgh - EGPH", 230,90);
  noFill();
  textAlign(CENTER);
  ///End of Title bar
  stroke(255);
  //splitter
  line(0,330, width, 330);
  line(230,100,230,330);
  
  // Map
  noFill();
  strokeWeight(1);
  rect(10,110,210,210);
  image(M,20,120);
  
  //control splitter
  line(150,330,150,height);
  line(80,330,80,height);
  
  
  strokeWeight(0.4);
  line(160,400,width - 20, 400);
  //graphlines
  strokeWeight(0.8);
  line(170,350,170, 410); //templine
  line(170,410,width - 20, 410);
  
   //graphlines
  strokeWeight(0.8);
  line(170,430,170, 490); //RHline
  line(170,490,width - 20, 490);
  
  //graphlines
  strokeWeight(0.8);
  line(170,510,170, 570); //windline
  line(170,570,width - 20, 570);
  
  //+-
  textFont(F,12);
  text("+", 164,398);
  textFont(F,15);
  text("-", 165,409);
  
  //graphdata T
  textFont(F,10);
  text("40", 163,355);
  text("20", 163,378);
  
  
  //graphdata H
  textFont(F,10);
  text("0", 163,490);
  text("50", 163,461);
  text("100", 160,435);
  
  //graphdata W
  textFont(F,10);
  text("0", 163,570);
  text("25", 163,542);
  text("50", 163,515); 
 
  //high low
  textFont(F,15);
  fill(200,200,200);
  text("Temp", 115,360);
  text("RH", 115,440);
  text("Wind", 115,520); 
 
  textFont(F,10);
  fill(200,200,200);
  text("High", 95,380);
  text("Low", 94,400);
  
  text("High", 95,460);
  text("Low", 94,480);
  
  text("High", 95,540);
  text("Low", 94,560);
  
}

/*
    RESET() - controlP5 method for button
*/
public void RESET() 
{
  tHigh = T;
  tLow = T;
  tfHigh = 0;
  tfLow = 200;
  rHigh = H;
  rLow = H;
  whigh = Wi;
  wlow = Wi;
}

/*
    RESET_LIVE() - controlP5 method for button
*/
public void RESET_LIVE() 
{
  G.setcounter();
}

/*
    drawClock() - draws clock
    No Params
    No Returns
*/
void drawClock()
{
  int cp = 650;
  int cy = 40;
  int href = 27;
  noFill(); 
  strokeWeight(2);
  for (int i = 0; i < 12; i++) {
    float dx = cos(i * TWO_PI / 12);
    float dy = sin(i * TWO_PI / 12); 
    stroke(255,255,255);
    line(cp + href * dx, cy + href * dy, cp + href * dx, cy + href * dy);
  }
  strokeWeight(3);
  drawH(15, hour(), 12);
  strokeWeight(2);
  drawH(25, minute(), 60);
  strokeWeight(1);
  stroke(#ff0000);
  drawH(25, second(), 60);
  strokeWeight(5);
  stroke(#00FFEC);
  point(650,40);
}

/*
    drawH() - Draws hands of clock
    Params - radius, value, divide
    No Returns
*/
void drawH(float r, float v, int d) {
  int cpx = 650;
  int cpy = 40;
  float x = cpx + r * cos(v * TWO_PI / d - PI / 2.0f);
  float y = cpy + r * sin(v * TWO_PI / d - PI / 2.0f); 
  line(cpx, cpy, x, y);
}

/*
    Graphing class
*/
class graphData
{
  int [] Temp;
  int [] Rh;
  int [] Wind;
  int [] tcolCode;
  int [] rcolCode;
  int [] wcolCode;
  int counter;
  int posX;

  graphData()
  {
    Temp = new int[510];
    Rh = new int[510];
    Wind = new int[510];
    tcolCode = new int[510];
    rcolCode = new int[510];
    wcolCode = new int[510];
    posX = 170;
    counter = 0;
  }
  
  public void setcounter()
  {
    counter = 0;
    
  }

  void addVal(int T, int R, int W)
  {
    Temp[counter] = T;
    if(T < Tlow)
    {
      tcolCode[counter] = 1;
    }
    else if(T > Thigh)
    {
      tcolCode[counter] = 3;
    }
    else tcolCode[counter] = 2;
    
    Rh[counter] = R;
    if(R < Rlow)
    {
      rcolCode[counter] = 1;
    }
    else if(R > Rhigh)
    {
      rcolCode[counter] = 3;
    }
    else rcolCode[counter] = 2;
    
    Wind[counter] = W;
    if(W < Wlow)
    {
      wcolCode[counter] = 1;
    }
    else if(W > Whigh)
    {
      wcolCode[counter] = 3;
    }
    else wcolCode[counter] = 2;
    
    counter++;
    if (counter == 509)
    { 
      counter = 0;
    }
  }

  int getVal(int type, int c)
  {
    if (type == 1)
    {
      return Temp[c];
    }
    if (type == 2)
    {
      return Rh[c];
    }
    if (type == 3)
    {
      return Wind[c];
    }
    
    if (type == 4)
    {
      return tcolCode[c];
    }
    if (type == 5)
    {
      return rcolCode[c];
    }
    if (type == 6)
    {
      return wcolCode[c];
    }
    return 0;
  }

  void drawData()
  {
    int startPosx = 171;
    for (int i = 0; i < counter; i++)
    {
      stroke(150);
      strokeWeight(0.5);      
      line(startPosx, 400, startPosx, 400 - map(getVal(1, i), -10, 40, -10, 40));
      line(startPosx, 490, startPosx, 490 - map(getVal(2, i), 0, 100, 0, 60));
      line(startPosx, 570, startPosx, 570 - map(getVal(3, i), 0, 50, 0, 60));
      startPosx++;
    }
    if(startPosx == 510)
    {
      startPosx = 171;
    }
  }
  
  void drawpointData()
  {
    int startPosx = 171;
    strokeWeight(2);
    for (int i = 0; i < counter; i++)
    {
      if(getVal(4, i) == 1)
      {
        stroke(0,0,255);
      }
      else if(getVal(4, i) == 3)
      {
        stroke(255,0,0);
      }
      else stroke(0,255,0);
      point(startPosx, 400 - map(getVal(1, i), -10, 40, -10, 40));
      
      if(getVal(5, i) == 1)
      {
        stroke(0,0,255);
      }
      else if(getVal(5, i) == 3)
      {
        stroke(255,0,0);
      }
      else stroke(0,255,0);
      point(startPosx, 490 - map(getVal(2, i), 0, 100, 0, 60));
      
      if(getVal(6, i) == 1)
      {
        stroke(0,0,255);
      }
      else if(getVal(6, i) == 3)
      {
        stroke(255,0,0);
      }
      else stroke(0,255,0);
      point(startPosx, 570 - map(getVal(3, i), 0, 50, 0, 60));
      startPosx++;
    }
    if(startPosx == 510)
    {
      startPosx = 171;
    }
  }
}

