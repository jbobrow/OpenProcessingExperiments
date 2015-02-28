
// Dan Sztanga
// dsztanga@gmail.com
// (C) 2012 Dan Sztanga. All rights reserved.
// HW_6 Scroll and Bounce

//  Controls
//  Hit Any Key to Reset Montion


//Variables and Arrays
color col;

float x, y ,wd, ht;
float xdelta, ydelta;

float x2, y2;
float xdelta2;

float theta, angdelta;

float[] pastwd = new float[1];
float[] pastht = new float[1];
color[] pastcol = new color[1];


//Setup
void setup(){
  smooth();
  size(1000, 500);
  background(225);
  noStroke();
  
  x = random(width);
  y = random(height);
  x2 = 0;
  y2 = random(0, height);
  wd = random(50, 200);
  ht = wd;
  col = color(random(225), 50);
  
  angdelta = 1;
  xdelta = random(1, 10);
  ydelta = random(1, 10);
  xdelta2 = random(1, 10);
}

//"Table of Contents"
void draw(){
  background(225); 
  pastEllipse(x, y);
  pastEllipse(x2, y2);
  spin(x, y, wd, ht);
  spin(x2, y2, wd, ht);
  bounceSpin();
  scrollSpin();
}

//Draws Arc
void spin(float xs, float ys, float wds, float hts){
  theta = theta + angdelta;
  if(theta <= 359) {
  fill(col);
  arc(xs ,ys, wds, hts, radians(0), radians(theta));
  }
  else if(theta >= 360){
    pastwd = append(pastwd, wd);
    pastht = append(pastht, ht);
    pastcol = append(pastcol, col);    
    theta = 0;
    col = color(random(225), 50);
    wd = random(50, 200);
    ht = wd;
  }
}
 //Draws Past Ellipses
void pastEllipse(float xs, float ys){
  for(int i = 0; i < pastwd.length; i++){
    fill(pastcol[i]);
    ellipse(xs, ys, pastwd[i], pastht[i]);
  }
}

//Bounces Arcs and Past Ellipses
void bounceSpin(){
  x = x + xdelta;
  if(x + wd * .5 >= width){
   xdelta = -xdelta; 
  }
  else if(x - wd * .5 <= 0){
    xdelta = -xdelta;
  }
  y = y + ydelta;
  if(y + ht * .5 >= height){
   ydelta = -ydelta; 
  }
  else if(y - ht * .5 <= 0){
    ydelta = -ydelta;
  }
}

void scrollSpin(){
  x2 = x2 + xdelta2;
  if(x2 > width + wd * .5){
   x2 = -wd * .5;
   y2 = random(height);
  }
}

void keyPressed(){
  x = random(width);
  y = random(height);
  x2 = 0;
  y2 = random(0, height);
  xdelta = random(1, 10);
  ydelta = random(1, 10);
  xdelta2 = random(1, 10);
}

