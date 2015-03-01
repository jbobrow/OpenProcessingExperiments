
int num = 40, fc;
PVector[] loc = new PVector[num];
PVector[] vel = new PVector[num];
float[] sz = new float[num];
 
void setup() {
  size(800, 800);
  background(0);
 
  initStuff();
}
 
void draw() {
  if (frameCount%150==0) {
    fill(0, 6);
    noStroke();
    rect(0, 0, width, height);
  }
 
  for (int i=0; i<loc.length; i++) {
    loc[i].add(vel[i]);
    //ellipse(loc[i].x, loc[i].y, sz[i], sz[i]);
    if (loc[i].x > width-sz[i]/2 || loc[i].x<sz[i]/2) {
      vel[i].x = -vel[i].x;
    }
    if (loc[i].y > height-sz[i]/2 || loc[i].y<sz[i]/2) {
      vel[i].y = -vel[i].y;
    }
  }
  drawElement();
  fc++;
  if (fc%2500==0) initStuff();
}
 
void drawElement() {
  for (int i=0; i<loc.length; i++) {
    color s=i%2==0? #ffffff : #F772FA;
    stroke(s, 8);
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
}
 
void mouseReleased() {
  initStuff();
}
 
void initStuff() {
  fc = 0;
  background(0);
  for (int i=0; i<num; i++) {
    sz[i] = random(width/5, width/20);
    float x = random(sz[i], width-sz[i]);
    float y = random(sz[i], height-sz[i]);
    loc[i] = new PVector(x, y);
    vel[i] = new PVector(random(1, -1), random(1, -1));
  }
}



