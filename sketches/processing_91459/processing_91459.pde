
PImage img;
PFont font;
 
void setup(){
  size(800, 800);
  img = loadImage("paleoman_concept.jpg");
  font = loadFont("BadaBoomBB-48.vlw");
  textFont(font);
}
 
void draw(){
  image(img, 0, 0);
  textSize(48);
  text("PALEO MAN", 320, height/2);

   
}



