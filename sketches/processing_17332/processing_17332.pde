
PFont myfont; 
PImage owl;
int x = 0;

void setup(){
  size(400,400);
  myfont = loadFont("Anivers-Italic-36.vlw");
  owl = loadImage("barn_owl.jpg");
}

void draw(){
  background(0);
  
  x=x+1;
  
  image(owl,0,0);
  
//  println("the width of the image is=" +owl.width);
//  println("the height of the image is=" +owl.height);
  
  fill(255);
  textFont(myfont);
  text("why hello! " +x, 100, mouseY);
  
}



