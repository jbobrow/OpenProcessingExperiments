

int cx,cy,dx=0, dy=0;
int i = 4;

void setup() {
  size(600, 600);
  colorMode(HSB);
  background(0);
  cx = width/2;
  cy = height/2;
}

void draw() {

  fill(0, 20);
  noStroke();
  rect(0, 0, width, height);

  stroke(80+dx%80,200,200);
    
  line(cx-dx, cy+dy, cx+dx, cy+dy);
  line(cx-dx, cy-dy, cx+dx, cy-dy);

  stroke(20+dx%80,200,200);
  
  line(cx-dx, cy-dy, cx-dx, cy+dy);
  line(cx+dx, cy-dy, cx+dx, cy+dy);

/*
  pushMatrix();
  stroke(80+dx%50,200,200);
  translate(cx,cy);
  rotate(radians(dx));
  
  line(-dx, +dy, +dx, +dy);
  line(-dx, -dy, +dx, -dy);

  line(-dx, -dy, -dx, +dy);
  line(+dx, -dy, +dx, +dy);
  popMatrix();
*/

  dx += i;
  dy += i;
  if ( cx-dx <= 0 && cy+dy >= height) {
    dx = 0;
    dy = 0;
  }
}


