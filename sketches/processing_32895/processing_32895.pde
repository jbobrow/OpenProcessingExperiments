
/*

Liz Rutledge
Day 5 In-Class PHOTOS!
August 5, 2011

*/


PImage myImage;
PImage sweetElephant;
float xpos = 100;

void setup(){
  size(600,400);
  background(0);
  myImage = loadImage("kitten.jpg");
  sweetElephant = loadImage("elephant.png");
  
}

void draw(){
  imageMode(CORNER);
  image(myImage, 0, 0);
  
  imageMode(CENTER);
  image(sweetElephant,  xpos, height/2+100);
  
  xpos++;
  
  //make it come back from the left side to keep scrolling when it disappears
  if(xpos>width+150){
    xpos=-150;
  }  
}

