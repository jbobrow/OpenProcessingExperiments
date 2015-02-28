
PImage img;
PFont font;
 
void setup(){
  size(432, 432);
  img = loadImage("game.jpg");
  font = loadFont("Handwriting-Dakota-48.vlw");
  textFont(font);
}
 
void draw(){
  image(img, 0, 0);
  textSize(30);
  text("A Boy who lost his way...", 50, 300);
  textSize(28);
  text("Can his dog get him home?", 40, 370 );
   
}



