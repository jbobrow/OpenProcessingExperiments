
boolean mOver = false;
int distance, xDiameter, yDiameter, increase, decrease;
float xRadious, yRadious, size;

void setup() {

  size (400, 400); //frame size
}

void draw () {

  distance = 40;
  xDiameter = 10;
  yDiameter = 10;
  xRadious = xDiameter/2;
  yRadious = yDiameter/2;
  increase = 5;
  decrease = -5;
  background(0); // background black

  for (int x = distance; x < width; x+=distance) { // x Starts x at 20, continues for the frame width, and increases by distance)
    for (int y = distance; y < width; y+=distance) { // x Starts y at 20, continues for the frame width, and increases by distance)

      if ((dist(mouseX, mouseY, x, y) < xRadious) && (dist(mouseX, mouseY, x, y) < yRadious)) {
        mOver = true;
        fill(0,0,200);
        xDiameter += increase;
        yDiameter += increase;
      }
      else {
        mOver = false;
        fill(200,0,0);
        
      }
     
     ellipse (x, y, xDiameter, yDiameter);

    if (mOver == true) {
        xDiameter += decrease;
        yDiameter += decrease;
      }
      
  }
}
}



