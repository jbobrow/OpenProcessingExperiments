
int shape = 0;
float y=0, delta = 30;
void setup() {
  size(570, 570);
  background(255);
  strokeWeight(2);
}

void draw() {
  for (int y=0; y<height+delta; y+=delta) {
    stroke(random(0, 255), random(0, 255), random(0, 255));
    for (int x=0; x<width+delta; x+=delta) {

      switch(shape) {

      case 0:
        if (x%(2*delta)==0) ellipse(x, y, delta, delta);
        else ellipse(x, y+delta, delta, delta);
        break;
      case 1:
        if (x%(2*delta)==0) rect(x, y, delta, delta);
        else rect(x, y+delta, delta, delta);
        break;
      case 2:
        if (x%(2*delta)==0) triangle(x, y, x+(delta/2), y+delta, x+delta, y);
        else triangle(x, y+delta, x+(delta/2), y, x+delta, y+delta);
        break;
      case 3:
        if (x%(2*delta)==0) ellipse(x, y, 10, 10);
        else ellipse(x, y+10, 10, 10);
        break;
      }
    }
  }
}

void mousePressed() {
    if (shape == 3)
      shape = 0; 
    else
      shape++;
  }

