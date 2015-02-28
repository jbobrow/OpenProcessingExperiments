
// the cmposition is based on invisible 50x50 square where each square 
// is filled by a quadrant. each quadrant takes different co-ordinates on the 500x500 grid, concentric arcs and color
// to generate a dynamic pattern everytime the mouse is clicked.

void setup() {
  size(500, 500);
  colorMode(RGB, width);
  background(0, 0, 0);
  noFill();
}
void draw() {
}

void mousePressed() {
  background(46, 46, 46);
  for ( int x =0; x < width; x+=50) { // this takes care of the x cordinate and it's repetition in a row
    for (int y =0; y<height; y+=50) { //the y axis modulation
      for (int radius = 50; radius >=10; radius-=25) { // different radius of the arc is controlled by the parameters
        smooth();
        noStroke();
        fill(x+10, random(y), radius+20);

        if (x % 50==0) {//to reduce the repition in a single row and make it a controlled random element
          if (y % 10==0) {
            if (random(10)>7) {
              // all four arcs work with different direction amalgmating together to form a composition
              arc (x, y, radius, radius, radians (90), radians(180));
              arc (x+50, y+50, radius, radius, radians(180), radians(270));
              arc (x+100, y, radius, radius, radians (270), radians(360));
              arc (x+150, y+100, radius, radius, radians(0), radians(90));
            }
          }
        }
      }
    }
  }
}


