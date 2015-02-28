
//classes example 1:
//Inheritance and Aggregation
player p  = new player(100,100,24.0);
ballgroup bg = new ballgroup();

boolean kup = false;
boolean kdown = false;
boolean kleft = false;
boolean kright = false;
boolean mbleft = false;
boolean mbright = false;

void setup(){
  size(500,500);
  frameRate(60);
}

void draw(){
  p.update();
  bg.update();
  background(0);
  p.display();
  bg.display();
}

