
int modulo;
float ballRad = 10;

int[] pts;
PVector[] currs, goals;
void setup() {
  size(800, 800);

  smooth();
  reset(11);
}
void reset(int m) {
  modulo = m;
  colorMode(HSB, modulo);
  background(0);

  pts = new int[modulo];
  currs = new PVector[modulo];
  goals = new PVector[modulo];
  for (int i=0; i<pts.length; i++) {
    pts[i] = i;
    currs[i] = numToPoint(pts[i], i);
    goals[i] = numToPoint(nextNum(pts[i], i), i);
    fill(i, 100, 100);
    stroke(modulo);
    ellipse(currs[i].x, currs[i].y, ballRad, ballRad);
  }
  drawPoints();
}
int track = 0;
void draw() {
  //  fill(0, .3);
  //  rect(0, 0, width, height);
  //  drawPoints();

  for (int i=0; i<pts.length; i++) {
    if (currs[i].dist(goals[i])==0) {
      pts[i] = nextNum(pts[i], i);
      currs[i] = numToPoint(pts[i], i);
      goals[i] = numToPoint(nextNum(pts[i], i), i);
      fill(i, 100, 100);
      stroke(modulo);
      ellipse(currs[i].x, currs[i].y, ballRad, ballRad);
    }
    currs[i] = nextPoint(currs[i], goals[i], .8);

    fill(i, 100, 100);
    stroke(0);
    ellipse(currs[i].x, currs[i].y, .4*ballRad, .4*ballRad);
  }
}

void drawPoints() {
  for (int i=0; i<modulo; i++) {
    noFill();
    for (int j=0; j<modulo; j++) {
      PVector loc = numToPoint(i, j);
      stroke(modulo);
      ellipse(loc.x, loc.y, ballRad, ballRad);
    }
  }
}




int nextNum(int old, int base) {
  return (old*base)%modulo;
}

PVector numToPoint(int num, int base) {
  /*
  //Easy circle:
   float RLarge = width/1.5;
   float RSmall = PI*RLarge/(modulo+4);//+4 for spacing
   
   float x = width/2 + .5*RLarge*cos(base*TAU/modulo - PI/2) + .5*RSmall*cos(num*TAU/modulo - PI/2);
   float y = height/2 + .5*RLarge*sin(base*TAU/modulo - PI/2) + .5*RSmall*sin(num*TAU/modulo - PI/2);
   return new PVector(x, y);
   */

  //Grid:
  int rcs = ceil(sqrt(modulo));
  float rad = width/(1.5*rcs);
  float circx = ballRad + .5*rad + (base%rcs)*(1.5*rad);
  float circy = ballRad + .5*rad + floor((base)/rcs)*(1.5*rad);
  fill(0, .9);
  noStroke();
  ellipse(circx, circy, rad-.2*ballRad, rad-.2*ballRad);
  float x = circx + (.5*rad)*cos(num*2*PI/modulo - PI/2);
  float y = circy + (.5*rad)*sin(num*2*PI/modulo - PI/2);
  return new PVector(x, y);
}

PVector nextPoint(PVector start, PVector end, float r) {
  //Straight Line
  float t = ballRad;
  PVector next = new PVector(end.x, end.y);
  while (start.dist (next)>.5*t) {
    next.x = lerp(start.x, next.x, r);
    next.y = lerp(start.y, next.y, r);
  }
  return next;
}

int grabNewBase(){
  //take the mousex, mouseY and convert to base, given modulo.
  int rcs = ceil(sqrt(modulo));
  float wdh = width/rcs;
  
  int rn = floor(mouseX/wdh);
  int cn = floor(mouseY/wdh);
  
  int b = cn*rcs + rn;
  return b;
}

void keyPressed(){
   if(key == CODED){
    if(keyCode == UP)
      reset(modulo+1);
    else if(keyCode == DOWN)
      reset(max(2,modulo-1));
   }
}


