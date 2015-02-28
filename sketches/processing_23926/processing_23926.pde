
PImage img;
PFont font;
void setup(){
  size(800, 600);
  img = loadImage("bellyrub3.jpg");
  image(img,0,0);
    
}
 
void draw(){
}
 
void keyPressed(){
  float d= random(-10,20);
  float s= random(20);
  float x= random(width);
  float y= random(height);
  float o= random(30,50);
 
   
  rotate (radians(d));
  font = loadFont("CaviarDreams-48.vlw");
  textFont(font, s);
  fill(#f36e9d);
 
  
  text("I love you ", x, y);
}


void keyReleased() {
  if(keyCode == DELETE || keyCode == BACKSPACE) {
    background(255);
    image(img,0,0);
  }
}
void mousePressed(){
  float d= random(-10,20);
  float s= random(50);
  float x= random(width);
  float y= random(height);
  float o= random(30,50);
 
   
  rotate (radians(d));
  font = loadFont("CaviarDreams-48.vlw");
  textFont(font, s);
  fill(#f9acac);
  
  text("baby ", x, y);
}

void mouseReleased() {
  if(keyCode == DELETE || keyCode == BACKSPACE) {
    background(255);
    image(img,0,0);
  }
}

