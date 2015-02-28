
PImage lol;

PImage awesome;

void setup(){
  size(1000,1000);
  lol=loadImage("lol.jpg");
  awesome=loadImage("Awesome.png");
}
  void draw (){
 
    tint(mouseX,mouseY,mouseX,mouseY);
  image(lol,24,23,600,400);
  
  fill(238,123,231,232);
  rect(10,463,273,283);
  
  tint(mouseX,mouseY,mouseX,mouseY);
  image(awesome,354,235,600,600);
  }

