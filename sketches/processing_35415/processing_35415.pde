
// h for horizontal line.
// v for verticle line.
// x for x position.
// y for y position.
// i for initial position.
// s for speed.
// d for diagonal.
int hx, hy, hxi, hxs;
int vx, vy, vyi, vys;
float dx, dy, ds;
boolean d;

void setup() {
  size(450, 450);
  stroke(0);
  strokeWeight(1);
  smooth();
  reset();
}

void reset() {
  hxi=hx=width;
  hy=int(random(height-1));
  vx=int(random(width-1));
  vyi=vy=height;
  hxs=-1;
  vys=-1;
  ds=-1;
  dx=dy=-1;
  d=false;
}  

void draw() {
  simulate();
  render();
}

void simulate() {
  hx=constrain(hx+hxs, 0, width);
  vy=constrain(vy+vys, 0, height);
  if (!d) { 
    if (hx<=vx && vy<=hy) {
      d=true;
      dx=vx;
      dy=hy;
    }
  } 
  else {
    if (dx>ds || dy>ds) {
      dx=dx+ds;
      dy=dy+ds;
    }
  }
}

void render() {
  background(255);
  line(hxi, hy, hx, hy);
  line(vx, vyi, vx, vy);
  if (d) {
    line(dx, dy, vx, hy);
  }
}

void mousePressed() { 
  reset();
}
                
