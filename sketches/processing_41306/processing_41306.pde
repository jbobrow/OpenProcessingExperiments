
PImage mono;
PFont font;
int x=10;
int c=50;
int v= 200;

void setup(){
  font = loadFont("Papyrus-Condensed-48.vlw");
  textFont(font);
   background(0);
  size(600,600);
  mono = loadImage ("mono-malo1.jpg");
}
    
  void draw(){
    if   (mousePressed) {
      background(0);
      fill(0);
ellipse(mouseX,mouseY,50,50);
      float x= mouseY;
    float y= mouseX;
    image(mono,mouseX,mouseY,250,250);
   fill(20,150,120);   
    text("TE AMO",300-5,300+12,mouseY,mouseX);
    
 
}
 
 
else {
      
    
    float x= mouseY;
    float y= mouseX;
    smooth();
  background(0);
      
    noStroke();
  fill(255);
  ellipse(mouseX,mouseY,50,50);
 
  }}

