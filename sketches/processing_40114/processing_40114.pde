
//elippses and rectangles interpretation of Monet's sunset in venice

PImage img;//use Monet's painting as original image source

void setup() {
  size(300, 300);
  img=loadImage("sunsetmonet.jpg");//load Monet's painting
  noStroke();
  smooth();
}

int cellSize=30;//limit the size of rectangles and ellipses

void draw() {
  background(img);
  for (int y=0;y<=width;y+=cellSize) {
    for (int x=0;x<=height;x+=cellSize) {
      //add the painting color to rectangles and ellipses
      color c=img.get(x, y); 
      fill(c);
      if (mousePressed) {
        rect(x, y, mouseX, mouseY);
        //draw rectangles representation
      } 
      else {
        ellipseMode(CORNER);
        ellipse(x, y, mouseX, mouseY);
        //draw ellipses representation
      }
    }
  }
}







