
void setup(){
  size(700, 700);
  background(245);
  noStroke();
  frameRate(60);
  smooth(); 
  
  float f = 225;
  PFont font;
  font = loadFont("Arial.vlw");
  textFont(font);
  fill(f);
  text("Click and drag your mouse", 197, 340);
  text("while on the canvas to paint", 191, 370);

}
void draw(){

}
 
void mouseDragged(){

float  r = random(255);
float  g = random(255);
float  b = 255;
float  a = random(8);
fill(r, g, b, a);
 
for(int i = 0; i < 35; i ++){
 
float x2 = random(700);
float y2 = random(700);
float x3 = random(700);
float y3 = random(700);
float x4 = random(700);
float y4 = random(700);
 
  quad(mouseX, mouseY, x2, y2, x3, y3, x4, y4);
}
}


