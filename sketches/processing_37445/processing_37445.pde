
//a set of square grids where the largest set moves according to mouse placement

void setup() {

  size(600, 600);
}

void draw() {

  background(23, 23, 23);



  for (int y=0; y<=600; y+=16) { 
    for (int x=0; x<=600; x+=16) {
      fill(200);
      rect(y, x, 10, 10);
//small light grey squares
      stroke(150);
      line(y-5, 0, y-5, 600);
      line(0, y-5, 600, y-5);
     //slightly darker grid lines
    }
  }

  for (int p=0; p<=576; p+=32) { 
    for (int t=0; t<=576; t+=32) {
      stroke(50, 150, 255);
      fill(0, 100, 100);
      rect(p, t, 16, 16);
      //larger blue squares
    }
  }
  for (int r=0; r<=576; r+=64) { 
    for (int q=0; q<=576; q+=64) {
      stroke(50, 150, 255);
      fill(20, 180);
      rect(r, q, mouseX,mouseY);
      //larger movable translucent squares.
    }
  }
}


