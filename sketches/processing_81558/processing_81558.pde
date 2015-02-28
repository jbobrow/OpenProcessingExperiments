
PImage img;
PFont font;
float x = 0;
float y = 0;
float a = 0;
float b = 0;
float c = 0;
float d = 255;
 
void setup () {
  img = loadImage("in6.jpg");
  size (500, 568);
  image(img,0,0);
  smooth ();

}
 
void draw () {
  
  if(mousePressed) {
    textFont(font,40);
  } else {
    fill (255,10);
  }   
  c = random (1, 100);
  font = createFont ("Verdana", 20);
  pushMatrix();
  translate(30, 20, 30);
  textFont (font, 24);
  textAlign (CENTER);
  text ("BUBBLE", mouseX, mouseY);
  rotate(PI);
  popMatrix();
   
}


