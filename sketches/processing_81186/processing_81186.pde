
PImage img;
PFont font;
float angle = 0.0;

void setup(){
  background(255);
size(591,450);
smooth();
font = loadFont("AbadiMT-CondensedLight-48.vlw");
textFont(font);
img = loadImage("spin.jpg");
}

void draw(){
  
  pushMatrix();
  
  translate(mouseX, mouseY);
  rotate(angle);
  image(img,0,0);
  fill(20);
  textSize(20);
  text("Spinning", width/50, height/50);
  angle += 0.1;
  popMatrix();
  translate(mouseX, mouseY);
  rotate(angle);
  fill(#34ef00);
  textSize(16);
  text("Spin", width/20, height/20);
  angle -= 0.2;
   
  
}
//got code from http://www.openprocessing.org/sketch/25414 
//move mouse, image attached to mouse, image and word spins

