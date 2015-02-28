
  /* @pjs preload="1.jpg"; */
   PImage img;
   
void setup() {
  size(960,600);
   img = loadImage("1.jpg");
   image(img, 0, 0);
}
 
void draw() {
    stroke(0);
    smooth();
    strokeWeight(8);
    if(mousePressed){
    drawLine(mouseX, mouseY, pmouseX, pmouseY);
  }
}
 
void drawLine(int x, int y, int x2, int y2) {
  if(x >= 200 && y < 200) {
    line(y, x, y2, x2);
  } else if(x >= 400 && y >= 400) {
    line(600-y, 600-x, 600-y2, 600-x2);
  } else if(x < 200 && y <200){
    line(600-x, 600-y, 600-x2, 600-y2);
  } else {
    line(600-x, 600-y, 600-x2, 600-y2);
  }
   if (keyPressed) {
    PImage bg;
    bg = loadImage("1.jpg");
    background(bg);
    fill(0);
   }
}


