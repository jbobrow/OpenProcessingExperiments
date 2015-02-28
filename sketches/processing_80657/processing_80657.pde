
PFont font;
float x = 170;
float y = 300;
  
void setup(){
  size(450, 337);
  smooth();
  background(0);
  font = loadFont("SansSerif-48.vlw");
  textFont(font);
   img= loadImage("16.jpg");
}

void draw() {
  frameRate(3);
  fill(255);
  textSize(random(3, 60));
  image(img,0,0);
  text("HELLO?", random(y), random(x));
 
}
PImage img; 


