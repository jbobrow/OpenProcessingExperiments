

import simpleML.*;

HTMLRequest r;
BouncingBall[] xbox_balls;
BouncingBall[] wii_balls;
BouncingBall[] ps3_balls;

String html = "";
float startTime;
boolean gotnew = false;

int w = 500;
int h = 500;
int fps = 30;
float x = 0;
int interval = 5000;
float jump = w/(fps*interval/1000);

int xbox = 0;
int wii = 0;
int ps3 = 0;

void setup() {
  size(800, 500);
  smooth();
  frameRate(fps);
  r = new HTMLRequest(this, "http://www.ign.com/");
  
  r.makeRequest();
  startTime = millis();
  
  xbox_balls = new BouncingBall[1999];
  wii_balls = new BouncingBall[1999];
  ps3_balls = new BouncingBall[1999];
  for(int i = 0; i < 1999; i++)
  {
    xbox_balls[i] = new BouncingBall( (int) random(2, 20), (int) random(0, 400),(int) random(0, 400), (int) random(1, 5) , (int)random(1, 5), color(0, random(255), random(0,30), random(100,255)));
    wii_balls[i] = new BouncingBall((int) random(2, 20),(int) random(0, 400), (int) random(0, 400), (int) random(1, 5) , (int) random(1, 5), color(0, 0, random(100,255),random(10,255)));
    ps3_balls[i] = new BouncingBall((int) random(2, 20),(int) random(0, 400),(int)random(0, 400), (int) random(1, 5) ,(int) random(1, 5), color(random(100,255),random(0,55), random(0, 55), random(100,255)));
  }
}

void draw() {
  
  
  noStroke();
 
  // make things fade
  fill(250, 20);
  rectMode(CORNER);
  rect(0,0,800,500);
  
  // what time is it
  float now = millis();
   
  // every five seconds, check the website
  if(now > startTime + interval) {
      r.makeRequest();
      startTime = now;
  }

  if(gotnew) {
    gotnew = false;
    xbox += getMatchCount("Xbox", html);
    xbox += getMatchCount("Microsoft", html);
    wii += getMatchCount("Wii", html);
    wii += getMatchCount("Nintendo", html);
    ps3 += getMatchCount("Ps3", html);
    ps3 += getMatchCount("PlayStation", html);
    ps3 += getMatchCount("Sony", html);
    println("xboxes: " + xbox);
    println("wiis: " + wii);
    println("ps3s: " + ps3);
  }
  drawBalls(xbox, wii, ps3);

}
 
void drawBalls(int num_xbox, int num_wii, int num_ps3)
{
  for(int i = 0; i < num_xbox; i++)
  {
    xbox_balls[i].update();
  }
  for(int i = 0; i < num_wii; i++)
  {
    wii_balls[i].update();
  }
  for(int i = 0; i < num_ps3; i++)
  {
    ps3_balls[i].update();
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

class BouncingBall {
  
int x = 0;
int y = 0;
int xspeed = 5;
int yspeed = 6;
int s;
color c;
boolean hitedge; 

  BouncingBall (int siz, int x_start, int y_start, int xspd, int yspd, color col){
    int neg = (int) random(0,2);
    if(neg > 1)
      neg = 1;
    else
      neg = -1;
    x = x_start;
    y = y_start;
    xspeed = neg * xspd;
    yspeed = neg * yspd;
    c = col;
    s = siz;
  }
  
  void update(){
    moveBall();
    bounceBall();
    colorBall();
    drawBall();
  }
  void colorBall() {
    if(hitedge) {
      hitedge = false;
      c = color(random(255), random(255), random(255));
    }  
  } 
  void moveBall(){
    x = x + xspeed;
    y = y + yspeed;
  }
  void bounceBall(){
    if(x > width || x <0) 
      xspeed = xspeed*-1; 
    if(y > height || y <0) 
      yspeed = yspeed*-1;
}
void drawBall(){
  fill(c);
  ellipse(x,y,s,s);
}
}

