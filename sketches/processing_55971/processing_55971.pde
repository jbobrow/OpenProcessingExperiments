

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

  fill(0, 5);
  noStroke();
  rect(0, 0, width, height);


  stroke(80+dx%80,200,200);
    
  line(cx-dx+dy, cy+dy+dx, cx+dx, cy+dy);
  line(cx-dx, cy-dy, cx+dx-dy, cy-dy-dx);
  
  stroke(150+dx%80,200,200);
  
  line(cx-dx, cy+dy, cx+dx-dy, cy+dy+dx);
  line(cx-dx+dy, cy-dy-dx, cx+dx, cy-dy);


  stroke(120+dx%80,200,200);
/*  
  line(cx-dx, cy-dy, cx-dx-dy, cy+dy-dx);
  line(cx-dx-dy, cy-dy+dx, cx-dx, cy+dy);

  line(cx+dx, cy-dy, cx+dx+dy, cy+dy-dx);
  line(cx+dx+dy, cy-dy+dx, cx+dx, cy+dy);
*/
  line(cx-dx, cy-dy, cx-dx, cy+dy);
  line(cx+dx, cy-dy, cx+dx, cy+dy);

  dx += i;
  dy += i;
  if ( cx-dx <= 0 && cy+dy >= height) {
    dx = 0;
    dy = 0;
  }
}


