
// Xavier Wong 2013-09-11
float colorR, colorG, colorB;// 

void setup() {
  size(300,300);// Sets the window size to 300 x 300 pixels
  frameRate(30);
  background(0);
  smooth();



}

void draw() {
 triangle(150, 75, 75, 225, 225, 225);
 triangle(150, 90, 90, 215, 210, 215);
 triangle(150, 105, 105, 205, 195, 205);
 triangle(150, 120, 120, 195, 180, 195);
 triangle(150, 135, 135, 185, 165, 185);
 triangle(0,40,0,70,30,60);
 triangle(60,80,100,70,100,120);
 triangle(210,260,250,230,280,280);
 triangle(230,30,270,60,200,80);
 triangle(49,170,10,200,70,250);
 triangle(240,130,270,170,250,190);

 noStroke();
 fill(0,15);
 
  colorR = random(255);
  colorG = random(255);
  colorB = random(255);
  stroke(colorR,colorG,colorB);
  }

void mouseMoved() {
  ellipse(mouseX, mouseY, 100, 100);
 

 
}
