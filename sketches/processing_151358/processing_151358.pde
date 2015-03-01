
int num = 30;
float incr = 1.3, decr = 0.8, v=2.0;
PVector[] loc = new PVector[num]; 
PVector[] vel = new PVector[num];
float[] sz = new float[num];

void setup() {
  size(800, 600);
  background(0);
  frameRate(10);

  initStuff();
}

void draw() {
  if (frameCount%150==0) {
    fill(255, 5);
    noStroke();
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
  drawElement();

}

void drawElement() {
  for (int i=0; i<loc.length; i++) {
    stroke(0,20);
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
  if (key=='s') save(random(23232)+".jpg");
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
    sz[i] = random(width/10, width/5);
    float x = random(sz[i], width-sz[i]);
    float y = random(sz[i], height-sz[i]);
    loc[i] = new PVector(x, y);
    vel[i] = new PVector(random(-v, v), random(-v, v));
  }
}
