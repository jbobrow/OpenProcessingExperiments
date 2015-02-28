
void setup() {
  background(0); // background black
  size (400, 400); //frame size
}

void draw () {
  
  int distance = 40;
  int xRadious = 10;
  int yRadious = 10;
  
  
  for (int x = distance; x < width; x+=distance) { // x Starts x at 20, continues for the frame width, and increases by distance)
    for (int y = distance; y < width; y+=distance) { // x Starts y at 20, continues for the frame width, and increases by distance)
        
        //if ((dist(mouseX, mouseY, x, y) < xRadious/2) && (dist(mouseX, mouseY, x, y) < yRadious/2)) {
          //fill (100);
        //}else{
          //fill (255);
        
      //ellipse (x, y, xRadious, yRadious);
     
      float size = dist(mouseX,mouseY,x,y);
      ellipse (x, y, size, size);
    }
  }

  }


