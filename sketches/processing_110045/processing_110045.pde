
//algortihmic sketch

int a = 0;
int b = 0; 
int squareSize = 20; 


void setup() {
  size(800, 800); 
  background(200);
  ellipseMode(CORNER); 
}

void draw() { 

  if (random(1) > 0.5) {

    fill(0);

    ellipse(a, b, squareSize, squareSize);
  }
  else { 

    fill(255); 

    ellipse(a, b, squareSize, squareSize);
  }

  a+=squareSize;

  if ( a > width) {
    a = 0; 
    b += squareSize;
  }

  if (b > height) { 
    if (frameCount % 50 == 0) {
      invert();
    }
  }
}
void invert() { 

  for (int i = 0;  i< width; i+=squareSize) {
    for (int j = 0; j< height; j+=squareSize) {  

      color squarecolor = get(i+(squareSize/2), j + (squareSize/2));
      if (squarecolor == color(255)) {
        squarecolor = color(0); 
        fill(squarecolor);
        ellipse (i, j, squareSize, squareSize);
      }
      else {
        squarecolor = color(255); 
        fill(squarecolor); 
        ellipse (i, j, squareSize, squareSize);
      }
    }
  }
}






