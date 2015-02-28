
int x;
int y;
color c;
int canvassize = 600;
int ballsize = 12;
int fade = 25;

void setup() {
  size(canvassize, canvassize);
  background(255);
  smooth();
}  

void draw() {

  noStroke();

  //pink
  drawfour(mouseX, mouseY, color(249, 192, 205));

  //red
  drawfour(mouseY, mouseX, color(245, 144, 126));

  //  light brown
  drawfour(300-mouseX, 300-mouseY, color(197, 164, 110));

  //  dark brown
  drawfour(300-mouseY, 300-mouseX, color(164, 135, 123));

  //  light blue
  drawfour(mouseX-300, mouseY, color(164, 205, 212));

  //   dark blue
  drawfour(mouseY-300,mouseX, color(151,171,199));
 
   //light green
  drawfour(mouseX,mouseY-300, color(205,210,77));
 
   //dark green
  drawfour(mouseY,mouseX-300, color(162,207,115));   

  fill(255, fade);
  rect(0, 0, width, width);
}

void drawfour(int x, int y, color c) {
  fill(c);
  if (x>width) {
    x=x-width;
  }
  if (x<0) {
    x=x+width;
  }
  if (y>height) {
    y=y-width;
  }
  if (y<0) {
    y=y+width;
  }
  ellipse(x, y, ballsize, ballsize);
  ellipse(width-x, width-y, ballsize, ballsize);
  ellipse(x, width-y, ballsize, ballsize);
  ellipse(width-x, y, ballsize, ballsize);
}
                
