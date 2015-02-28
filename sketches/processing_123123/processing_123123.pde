
 /*@pjs preload="johnycash.png";*/ 

PImage img; 
  int x2,y2;
void setup(){
  size(600,600);
  smooth();
  frameRate(24);
  background(0);
  img = loadImage("johnycash.png");    

}

void draw(){
  stroke(255);
  float x=random(width);
  float y=random(height);
  x2=floor(random(width));
  y2=floor(random(height));
  line(x,y,x2,y2);
  fill(random(255));
  ellipse(x,y,200,200);
  image(img, x-(154/2), y-(154/2));
}


