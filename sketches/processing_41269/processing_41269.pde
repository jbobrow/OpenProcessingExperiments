

                
PImage img;
 
int smallPoint = 3;
int largePoint;
int top, left;
 
void setup() {
  size(500, 667);
  frameRate(5£000);
  img = loadImage("gaby 23.jpg");
  //img = loadImage("sunflower.jpg");  // an alternative image
  noStroke();
  background(255);
  smooth();
  largePoint = min(width, height) / 10;
  // center the image on the screen
  left = (width - img.width) / 2;
  top = (height - img.height) / 2;
}
 
void draw() {
  float pointillize = map(mouseX, 0, width, smallPoint, largePoint);
  int x = int(random(img.width));
  int y = int(random(img.height));
  color pix = img.get(x, y);
  fill(pix, 128);
  rect(left + x, top + y, pointillize, pointillize);
 ellipse(left+x,top+y,pointillize,pointillize);
}
 
void keyPressed(){
//presiona tecla para borrar el Background
background(255);
}
void mouseClicked(){
//presiona tecla para borrar el Background
background(0);
}
