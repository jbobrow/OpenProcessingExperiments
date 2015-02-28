
PFont archer;
PImage myImage; 

void setup(){
  size(1000,1000);
   
   
   archer = loadFont("Archer-ExtraLight-72.vlw");
  myImage = loadImage("Emily.gif");
}
void draw (){
  background(0,0,0);
  
  
  image(myImage,50,50);
 

  textFont(archer);
  text("I don't feel so good..",mouseX,mouseY);
   
  
  fill(255);
  text("BLARGHHHASK",400,500);
}

