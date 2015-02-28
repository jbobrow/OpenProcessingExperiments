
// Jan 2009
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

int _num = 10;    
float _angnoise, _radiusnoise, _widnoise, _heinoise;
float _angle = -PI/2;
float _radius = 100;
float _strokeCol = 254;

//================================= init

void setup() {
  size(920,500);
  smooth(); 
  frameRate(30);
  
  clearBackground();
  
  _angnoise = random(10);
  _radiusnoise = random(10);
  _widnoise = random(10);
  _heinoise = random(10);
}

void clearBackground() {
  background(255);
}

//================================= frame loop

void draw() {
  
  _radiusnoise += 0.005;
  _radius = (noise(_radiusnoise) * 250) +5;
  
  _angnoise += 0.005;
  _angle += (noise(_angnoise) * 6) - 3;
  if (_angle > 360) { _angle -= 360; }
  if (_angle < 0) { _angle += 360; }
  
  float centreX = width/2;
  float centreY = height/2;
  
  //tube size
  _widnoise += 0.005;
  _heinoise += 0.005;
  float wid = (noise(0,_widnoise) * 425) ;
  float hei = (noise(0,_heinoise) * 425) ;
  
  float rad = radians(_angle);
  float x1 = centreX + 3*(_radius * cos(rad));
  float y1 = centreY + 1.5*(_radius * sin(rad));
  
  //noFill();
  fill(255,0,0,50);
  if (_strokeCol > 0) { _strokeCol -=2; } // fade in
  stroke(_strokeCol, 50);
  ellipse(x1, y1, wid, hei);
}


//================================= interaction

void mousePressed() { 
  clearBackground();
}
//===========SaveImage
void keyReleased() {
  if (key=='s' || key=='S') saveFrame(timestamp()+".png"); }
  String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
 
//==============
