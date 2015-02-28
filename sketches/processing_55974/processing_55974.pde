
float t = 0;
int s = 1;
void setup() {
  size(600, 600);
  smooth();
  background(0);
}

void draw() {

  //  fill(0, 10);
  //  rect(0, 0, width, height);

  if ( frameCount %10 == 0) {
    s += 2;
  }
  if ( s >= 8) {
    s = 1;
  } 

  //  int ny = (mouseY%20)+5;
  translate(width/2, height/2);

  int ny = 200;
  int dy = height/ny;

  //  int nx = (mouseX%20)+5;
  int nx = 200;
  int dx = width/nx;

  rotate(radians(t));

  if (radians(t) <= 3*(PI/2)) {
    
    for ( int i = 0; i < height/2; i += dy) { 
      stroke(s*i%255,0,0, 200); 
      //    line(0, i, width, i);
      line(0, i, width/20, i);
      line(0, -i, -width/20, -i);
      //    point(0,i);
      //    point(width,i);
    }

    for ( int i = 0; i < width/2; i += dx) { 
      stroke(s*i%255,0,0, 200); 
      //    line(i, 0, i, height);
      line(i, 0, i, height/20);
      line(-i, 0, -i, -height/20);

      //    point(i,0);
      //    point(0,i);
      //    point(height,i);
    }
   t += 1;
  }
}


