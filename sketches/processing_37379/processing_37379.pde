
void setup() {
  size(200, 600);
}

void draw() {
  background(0); //black background
  for (int x=0; x<width; x+=20) { //start x at 0, finish at width, space it at 20)
    for (int y=0;y<height;y+=50) { // start y at 0, finish at height, space at 50)
      strokeWeight(0); //light stroke
      stroke(mouseX, x, mouseY); //controls the color change for broken circles
      noFill(); //no fill on circles
      ellipse(x, y, 50, 50); //controls the ellipse spacing and repetition
    }
  }
  for (int x=0; x<width; x+=10) { //start x 0, finish at width, increment of 10)
    for (int y=0; y<height; y+=10) { //start at 0, finish at height, increment of 10)

      stroke(0); // black lines blend with background to cause the blotchy effect
      strokeWeight(2); 
      line(x, 10, x, 600); //controls the horizontal lines
      line(0, y, 200, y); //cpntrols the verticle lines
    }
  }
}


