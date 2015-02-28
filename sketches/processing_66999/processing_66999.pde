
////////////////////////////////
//This sketch is an animation for 2012 London Olympics Victory Ceremony. It is developed on zenbullets's work on his website,
//#43: Ink Trails. (http://abandonedart.org/?p=402) What I did is to tide up the trials and lower done the randomness made by noise function, and make the "pen"
//drawing several circles, which is going to made up of the logo of Olympics.
//
//Idea9204 Assignment1
//Ren Zhu 311284949
//08.2012
//
//*below is the original reference comment
/////////////////////////////////
// Feb 2009
// http://www.abandonedart.org
// http://www.zenbullets.com
//
// This work is licensed under a Creative Commons 3.0 License.
// (Attribution - NonCommerical - ShareAlike)
// http://creativecommons.org/licenses/by-nc-sa/3.0/
// 
// This basically means, you are free to use it as long as you:
// 1. give http://www.zenbullets.com a credit
// 2. don't use it for commercial gain
// 3. share anything you create with it in the same way I have
//
// These conditions can be waived if you want to do something groovy with it 
// though, so feel free to email me via http://www.zenbullets.com


//================================= global vars

int _num = 1;    
Circle[] pArr = new Circle[_num*5];

PFont myFont;
  
String title="Victory Ceremony";
String word="2012 London Olympics";

//================================= init

void setup() {
  size(800, 600);
  smooth(); 
  frameRate(200);
  
  clearBackground();
  
  for (int i=0;i<_num;i++) {
    pArr[i] = new Circle(i,0);
    pArr[i].init(200, 200, 60);
  }
  for (int i=0;i<_num;i++) {
    pArr[i+1*_num] = new Circle(i+1*_num,1);
    pArr[i+1*_num].init(280, 200, 60);
  }
  for (int i=0;i<_num;i++) {
    pArr[i+2*_num] = new Circle(i+2*_num,2);
    pArr[i+2*_num].init(360, 200, 60);
  }
  for (int i=0;i<_num;i++) {
    pArr[i+3*_num] = new Circle(i+3*_num,3);
    pArr[i+3*_num].init(240, 280, 60);
  }
  for (int i=0;i<_num;i++) {
    pArr[i+4*_num] = new Circle(i+4*_num,4);
    pArr[i+4*_num].init(320, 280, 60);
  }
    
    
   myFont= loadFont("Inkburrow-48.vlw");
  textFont(myFont);
  
}

void clearBackground() {
  background(255);
}

//================================= frame loop

void draw() {
  
  for (int i=0;i<_num*5;i++) {
    pArr[i].update();
  }
  
 
  fill(180);
  textSize(58);
  
  text(word,240,410);
  textSize(48);
  text(title,240,450);
  fill(255,255,255,1);
  rect(-10,-10,810,610);
  
  //fill(200,0,0);
  //noStroke();
  //rect(0, (height/2)-25, width, 50);
}



//================================= interaction
/*
void mousePressed() { 
  clearBackground();
  for (int i=0;i<_num;i++) {
    pArr[i].init(mouseX, mouseY, random(height/2));
  }
}

*/
//================================= objects


class Circle {
  int id;
  float angnoise, radiusnoise;
  float widnoise, heinoise;
  float angle = 180;
  float radius = 100;
  float centreX = width/2;
  float centreY = height/2;
  float strokeCol = 254;
  float lastX = 9999;
  float lastY, lastAng;
  
  float r1;
  float colorswitch;
  
  
  Circle (int num, float aswitch) {
    id = num;
    
    colorswitch = aswitch;
    
    // init();
  }
  
  void trace(String str) {
    println("Particle " + id + ": " + str);
  }
  
  void init(float ex, float why, float r) {
    trace("init");
    centreX = ex;
    centreY = why;
    radius = r;
    r1 = r;
  
    angnoise = random(10);
    radiusnoise = random(10);
    widnoise = random(10);
    heinoise = random(10);
    strokeCol = 254;
  }
  
  void update() {
    radiusnoise += 0.005;
    
    radius = (map(noise(radiusnoise),0,1,0.6,1) * (r1));
    
    //println(noise(radiusnoise));
  
    angnoise += 0.005;
    angle += (noise(angnoise) * 6) - 3;
    
    //if (angle > 360) { angle -= 360; }
    if (angle < 0) { angle += 360; }
    
    widnoise += 0.05;
    float wid = (noise(widnoise) * 15);
  
    float rad = radians(angle);
    float x1 = centreX + (radius * cos(rad));
    float y1 = centreY + (radius * sin(rad));
    
    float diff = abs(angle-lastAng);
    
    strokeCol = diff * 150+100;
    println(strokeCol);
    
    if (strokeCol > 250) {
      noStroke();
    } else {
      
    if (colorswitch == 0)   stroke(5,131,232,strokeCol);//blue
    if (colorswitch == 1)   stroke(strokeCol);//black
    if (colorswitch == 2)   stroke(255,0,0,strokeCol);//red
    if (colorswitch == 3)   stroke(255,255,0,strokeCol);//yellow
    if (colorswitch == 4)   stroke(0,255,0,strokeCol);//green
  
    }
    strokeWeight(wid);
    if (lastX != 9999) {
      line(x1, y1, lastX, lastY);
    }
    
    lastX = x1;
    lastY = y1;
    lastAng = angle;
  }
  
}


