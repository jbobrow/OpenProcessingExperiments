
PFont fonty;
PFont fonty2;
PImage lulzy;

void setup(){
  size(600,600);
  background(255,255,255);
  fonty=loadFont("font.vlw");
  fonty2=loadFont("Algerian-32.vlw");
 lulzy=loadImage("trollface.png");
  }
  
  void draw(){
    tint(255,255,255,10);
    image(lulzy,mouseX,mouseY);
    fill(0);
    textFont(fonty);
text("Trolololol",50,50); 

 fill(0);
    textFont(fonty2);
text("Ho Ho Ho",70,70); 
  }

