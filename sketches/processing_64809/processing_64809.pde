
//5A collage.motion

PImage kyle;
PImage butters;
PImage kenny;
 
float angle;
float rad =160;
float cx, cy;
float a=0;
float b=0;
 
void setup() {
 
  size (400, 400);
  smooth();
  kyle = loadImage ("kyle1.png");
  butters = loadImage("butters1.png");
  kenny = loadImage("kenny1.png");
  imageMode(CENTER);
  frameRate(10);
  cx = width/2;
  cy= height/2;
}
 
void draw() {
  float angle = frameCount/30.0;
 
  float x =cx + cos(angle)*rad;
  float y =cy + sin(angle)*rad;
 
  angle = radians(45);
  background(0);
  
  pushMatrix();
  translate(0, 0);
  rotate(frameCount/200.0);
  image(kyle,x,y, 70, 70);
  popMatrix();
  
   
    image(kyle, tan(x), y);
  image(kenny, tan(y), x);
  image(butters, x+y, cos(y));
  
  
  pushMatrix();
  image(butters, x+30, y+200, 250, 250);
  popMatrix();
}


