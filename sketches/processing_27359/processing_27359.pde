
//Problem Set 4
//Question 1
//Matt Iannacci

PImage img;
String message = "TERROR!";


void setup() {
  
 size(300,150);
  PFont font = loadFont("ComicSansMS-48.vlw");
  textFont(font);
  img = loadImage("terror2.jpg");
  smooth();
  textSize(50);
  textAlign(LEFT,CENTER);
  
}
 
void draw() {
  background(0);
  fill(random(255,0),random(150,255),random(100,255));
  image(img,0,0);
  text("TERROR!",random(110),random(90));
  //image(img,0,0); 
}


