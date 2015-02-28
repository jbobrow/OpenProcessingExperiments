
/*
* A really (REALLY!) simple implementation of a parallax effect.
* Coded by: Rodrigo Amaya, follow me @ramayac
*/

PImage back, middle, front;
PVector vback, vmiddle, vfront;

void setup(){
  back = loadImage("back.png");
  middle = loadImage("middle.png");
  front = loadImage("front.png");
  
  size(640, 420);
  vback = new PVector(0, 0);
  vmiddle = new PVector(0, 0);
  vfront = new PVector(0, 5); //just fixing the position of the image
  
  frameRate(24);
}

void paraDraw(PImage img, PVector pos, float vel){
  pos.sub(vel, 0, 0);
  
  int r = (int)pos.x+img.width;

  if(r < width) image(img, r, pos.y);
  if(pos.x < width) image(img, pos.x-img.width, pos.y);  
  if(pos.x < -img.width) pos.x = width;
  //println("r: " + r + ", pos.x: " +pos.x);
  
  image(img, pos.x, pos.y);
  //fill(#ff0000);
  //rect(pos.x, 0, img.width, img.height);
}

void draw(){
  background(255);
  
  paraDraw(back, vback, 1);
  paraDraw(middle, vmiddle, 2);
  paraDraw(front, vfront, 3);
}

