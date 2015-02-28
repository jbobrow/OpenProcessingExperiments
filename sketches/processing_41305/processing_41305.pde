
PImage img;
PFont font;
  
void setup() {
  font= loadFont ("AcademyEngravedLetPlain-50.vlw");
  textFont (font);
  size (500,500);
 
  img = loadImage("vampires-nosferatu.jpg");
}
 
void draw() {
  image(img, mouseX,mouseY,200,200);
  text ("I'm Cute", 25,60);
   
}
                
                                
