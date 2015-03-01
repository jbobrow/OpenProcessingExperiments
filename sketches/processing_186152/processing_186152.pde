
/*
 
John Cherry
Assignment #2 "Tweaked" Create a character, logo or any illustration with processing (it does not have to be interactive).
DMS 110
 
*/

PImage Glo, Glo2;
float x,y,r,g,b;

void setup() {  
  size(640, 480);
  Glo = loadImage("gloglo.jpg");
  Glo2 = loadImage("gloj.jpg");
  background(255);  
  frameRate(20);
}
 
void draw() {  
  r = random(255);
  g = random(255);
  b = random(255);
  fill(r,g,b);
  background(r,g,b); 
  x = mouseX;
  y = mouseY;
  
  if(mouseX < width/2){
     image(Glo,365,160);
     fill(0,0,0);
     rect(0,0,width/2,height);
  } else {
     image(Glo2,75,150);
     fill(0,0,0);
     rect(width/2,0,width/2,height);
  }
  
  //rectMode(CENTER);
  fill(x/2,y/2,45);
  //rect(x,y,120,120);
  fill(x/3,y/3,100);
  ellipse(x+2, y +18, 90,10); 
  ellipse(x-30, y -20, 10,10);
  ellipse(x+30, y -20, 10,10);
  ellipse(x+2, y -2, 10,10);
  ellipse(x+2, y +27, 90,10); 
  
}
