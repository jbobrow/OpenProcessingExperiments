
import simpleML.*;

HTMLRequest r;

String html = "";

float startTime;

boolean gotnew = false;

int w = 720;
int h = 720;
int fps = 12;

float x = 0;
int interval = 5000;
float jump = w/(fps*interval/100);

int oil = 0;
int nuclear = 0;
int electric = 0;
int solar = 0;
int wind = 0;

PImage e;
PImage t;
PImage g;

int po = 0;
int ro = 0;
int eo = 255;


void setup () {
background(255);
size(720,720);
smooth();
noCursor();
frameRate(fps);
r = new HTMLRequest(this,"http://energy.gov/news-blog");
r.makeRequest();
e = loadImage("earth.jpeg");
tint(255,255,255,eo);
image(e,110,110);
}

void draw() {
  
  
  float now = millis();
  
  if(now > startTime + interval) {
      r.makeRequest();
      startTime = now;
  }
  
  x+=jump;
  if(x >= width) x = 0;
  
  if(gotnew) {
    gotnew = false;
    
    oil = getMatchCount("oil", html);
    nuclear = getMatchCount("Nuclear", html);
    electric = getMatchCount("Electric", html);
    solar = getMatchCount("Solar" , html);
    wind = getMatchCount("Wind" , html);
    
    println("oil: "+oil);
    println("Nuclear: "+nuclear);
    println("Electric: "+electric);
    println("Solar: "+solar);
    println("Wind: "+wind);
  }
  
  mouseReleased();
  drawRecycle();
  drawPollution();
  
  stroke(255,20);
  strokeWeight(2);
  //line(x,0,x,height);
}

void drawPollution() {
    if(oil + nuclear > solar + wind + electric) {
      t = loadImage("toxic.png"); 
      tint(255,255,255,po+5);
      image(t,100,100);
      eo--;
    } else {
     g = loadImage("recycle.png");
     tint(255,255,255,ro++);
     image(g,235,240);
  }
}
    
void drawRecycle() {
  if(mousePressed == true) {
  if(solar + wind + electric > oil+nuclear/2) {
    //noLoop();
    g = loadImage("recycle.png");
    tint(255,255,255,ro++);
    image(g,235,240);
    }
  }
  if(mousePressed == false) {
    drawPollution();
  }
}
    
  


         

void netEvent(HTMLRequest r) {
  html = r.readRawSource();
  gotnew = true;
}

int getMatchCount(String find, String s) {
  int m = s.split(find).length;
  return m - 1;
}


    



/*t = loadImage("toxic.png");
tint(255,255,255,155);
image(t,100,100);

PImage g;
g = loadImage("recycle.png");
image(g,235,240);*/



