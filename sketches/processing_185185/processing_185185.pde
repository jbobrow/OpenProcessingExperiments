
int num =40;
float incr = 2.0, decr = 0.10, v=-5.0;
PVector[] loc = new PVector[num];
PVector[] vel = new PVector[num];
float[] sz = new float[num];
 
void setup() {
  size(800, 800);
  background(255);
  frameRate(10);
 
  initStuff();
}
 
void draw() {
  if (frameCount%150==0) {
    fill(10, 30);
    noStroke(1);
    rect(0, 0, width, height);
  }
 
  for (int i=0; i<loc.length; i++) {
    loc[i].add(vel[i]);
    if (loc[i].x > width-sz[i]/2 || loc[i].x<sz[i]/2) {
      vel[i].x = -vel[i].x;
    }
    if (loc[i].y > height-sz[i]/2 || loc[i].y<sz[i]/2) {
      vel[i].y = -vel[i].y;
    }
  }
  drawLine();
 
}
 
void drawLine() {
  for (int i=0; i<loc.length; i++) {
    stroke(10,30);
    for (int j=0; j<loc.length; j++) {
      float distance=dist(loc[i].x, loc[i].y, loc[j].x, loc[j].y);
      float proximity=(sz[i]+sz[j])/2;
      if (distance<proximity) {
        if (i != j) line(loc[i].x, loc[i].y, loc[j].x, loc[j].y);
      }
    }
  }
}
 
void keyPressed() {
  if (key=='s') save(random(232232)+".jpg");
  if (key=='-') {
    for (int i=0; i<num; i++) {
      vel[i].x *= decr;
      vel[i].y *= decr;
    }
  }
    if (key=='+') {
    for (int i=0; i<num; i++) {
      vel[i].x *= incr;
      vel[i].y *= incr;
    }
  }
}
 
void mouseReleased() {
  initStuff();
}
 
void initStuff() {
    background(255);
    for (int i=0; i<num; i++) {
    sz[i] = random(width/10, width/10);
    float x = random(sz[i], width-sz[i]);
    float y = random(sz[i], height-sz[i]);
    loc[i] = new PVector(x, y);
    vel[i] = new PVector(random(-v, v), random(-v, v));
  }
}



