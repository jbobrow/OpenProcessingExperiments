
/* 
 Daniel C. Young
 Microsoft Logo #2
 10/06/2011
 */

PImage bg;
float xval, yval;
float x, y;

void setup(){
  size(800, 800);
  smooth();
  frameRate(1);
  bg = loadImage("mountain.jpg");
  x = width/2;
  y = height/2;
}

void draw(){
  image(bg,0,0);
  tint(255, 60);
  
  strokeWeight(50);
  stroke(254,100);
  
  line(255,155,200+xval,415+yval);
  stroke(250,100);
  line(200+xval,415+yval,270-xval,480-yval);
  stroke(251,100);
  line(270-xval,480-yval,255,585);
  
  stroke(252,100);
  line(405,155,430+xval,275+yval);
  stroke(253,100);
  line(430+xval,275+yval,375-xval,350-yval);
  stroke(254,100);
  line(375-xval,350-yval,400,585);
  
  stroke(254,100);
  line(545,155,540+xval,330+yval);
  stroke(253,100);
  line(540+xval,330+yval,585-xval,415-yval);
  stroke(252,100);
  line(585-xval,415-yval,545,585);
  
  xval = random(-30,30);
  yval = random(-30,30);
}

void mousePressed(){
  println(mouseX+","+mouseY);
}

void keyPressed() {
  if (keyCode == 83) {
    saveFrame("ms03-##.tif");
  }
}

