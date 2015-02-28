
PImage orange;
PImage blue;
PFont comic;
boolean mouseOnLeft;

void setup () {
  size (800, 600);
  background(250);
  orange = loadImage( "orange.jpg");
  blue = loadImage( "blue.jpg");
  comic = loadFont ("comic.vlw");
  
  mouseOnLeft = true;
}


void draw () {
    background(250);
  if (mouseX<=width/2) {
  mouseOnLeft =true;
  }
  
  else{mouseOnLeft=false;
    
  }
  
  if (mouseOnLeft ==true) {
  image (orange, 0,0, 300, 500);
  fill (245,12,218);
  textFont(comic);
  text ("Do you love me?", 400, 200);
  }
  else {
  image (blue, width/2+width/8, 0, 300,500);
  fill (245,12,218);
  textFont(comic);
  text ("Of course!", 100, 200);
  }
  
// 
//  
//  if (mouseOnLeft ==true) {
//  image (orange, 0,0, 300, 500);
//  fill (245,12,218);
//  textFont(comic);
//  text ("Why?", 400, 200);
//  }
//  else {
//  image (blue, width/2+width/8, 0, 300,500);
//  fill (245,12,218);
//  textFont(comic);
//  text ("Because you're beautiful!", 100, 200);
//  }
//  
  
}


