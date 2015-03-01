
float[] x, y;      // current drawing position
float[] dx, dy;    // change in position at each frame
float rad;       // radius for the moving hand
float[] bx, by;
float[] ang, ang_inc;
float[] tDist;
int num = 50;
float max = 0.5;
float min = 0.1;
void setup() {
  size(700 , 800);
  x = new float[num];
  y = new float[num];
  dx = new float[num];
  dy = new float[num];
  ang = new float[num];
  ang_inc = new float[num];
  bx = new float[num];
  by = new float[num];
  tDist = new float[num];
  // initialise
  for (int i=0; i<num; i++) {
    x[i] = width/2;
    y[i] = height/2;
    dx[i] = random(-0.9, 0.9);
    dy[i] = random(-0.9, 0.9);
    ang[i] = random(360);
    ang_inc[i] = random(-0.1, 0.1);
    bx[i] = 0;
    by[i] = 0;
    tDist[i] = random(10, 100);
  }
  background(0);
}
void draw() {
  // blend the old frames into the background
  if (frameCount%100 == 0) {
    fill(0, 5);
    rect(0, 0, width, height);
  }
  for (int i=0; i < num; i++) {
    x[i] += dx[i];
    y[i] += dy[i];
    ang[i] += ang_inc[i];
    //When the shape hits the edge of the window, it reverses its direction and changes velocity
    if (x[i] > width-100 || x[i] < 100) {
      dx[i] = dx[i] > 0 ? -random(min, max) : random(min, max);
    }
    if (y[i] > height-100 || y[i] < 100) {
      dy[i] = dy[i] > 0 ? -random(min, max) : random(min, max);
    }
    bx[i] = x[i] + 100 * sin(radians(ang[i]));
    
    by[i] = y[i] + 100 * cos(radians(ang[i]));
    
  //  println(bx[i], by[i]);
    fill(180);
  }
  for (int i = 0; i < num; i++) {
    for (int j = 0; j < i; j++) {
      float dist1 = dist(x[i], y[i], x[j], y[j]);
      if (dist1 < tDist[i]) {
        stroke(0, 10);
        beginShape(LINES);
        vertex(x[i], y[i]);
        stroke(255, 0,0,10);
        vertex(bx[j], by[j]);
        endShape();
      }
      float b_dist = dist(bx[i], by[i], bx[j], by[j]);
      
      if(b_dist < tDist[i]) {
        beginShape(LINES);
        vertex(bx[i], by[i]);
        stroke(255, 15);
        vertex(bx[j], by[j]);
        endShape();
      }
      
      
    }
  }
  
}

