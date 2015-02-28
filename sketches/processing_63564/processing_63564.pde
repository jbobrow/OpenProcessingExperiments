
float x1, y1, x2, y2;
int leng = 20;
int count = 0;

void setup() {  
  size(640, 480);
  background(0);
  frameRate(7);
}


void draw() {  
  int iL = 200;
  
  strokeWeight(2);
  stroke(random(255-15), 50);

  x1 = width/2;
  y1 = height/2;
  for (int i = 0; i < iL; i++) {    
    x2 = x1 + random(leng * (-1), leng);
    y2 = y1 + random(leng * (-1), leng);
    line(x1, y1, x2, y2);
    
    if (x2 <= width && x2 >= 0 ) {
      x1 = x2;
    }
    if (y2 <= height && y2 >= 0 ) {
      y1 = y2;
    }
    else {
      x1 = y1 = random(width);
    }    
  }
  count += 1;
  if (count > 100) {
    reset();
    count = 0;
  }
}


void reset( ) {
  noStroke();
  fill(0, 50);
  ellipseMode(CENTER);
  int L = 10;
  for (int i = 0; i < L; i++) {
    ellipse( width/2, height/2, width - i*width/L, height - i*height/L);
  }
}
