
PImage a, b, c;
float offset;
 
void setup() {
  size(600, 600);
  a = loadImage("Utopia.jpg");  
  b = loadImage("Utopia.jpg");
  c = loadImage("Diaphanous.jpg");  
  frameRate(60);
}
 
void draw() {
  image(a, 0, 0);
  float offsetTarget = map(mouseX, 0, width, -b.width/2 - width/2, 0);
  offset += (offsetTarget-offset)*0.05;
  tint(255, 50);
  image(b, offset, 20);
  image(c, 800,800);
}



