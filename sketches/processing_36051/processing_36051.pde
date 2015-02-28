
int picker = 0;
int[] r1 = {0, 255, 255};
int[] g1 = {0, 0, 255};
int[] b1 = {200, 0, 255};
  
boolean click =false;
int a = 1000;
PVector[] pos;
PVector[] vel;

int[] ttl;

float pmx = 0;
float pmy = 0;

float r = 0;
float g = 0;
float b = 0;
float ca = 0;
void setup() {
  background(0);
  size(700, 400);
  frameRate(30);


  pos = new PVector[a];
  vel = new PVector[a];
  ttl = new int[a];
  for ( int i = 0; i < a; i++) {
    pos[i] = new PVector(0, 0);
    if (i < a/1000) {
      vel[i] = new PVector(random(-2, 2), random(-5, -5));
      ttl[i] = int(random(10, 50));
    } 
    else {
      vel[i] = new PVector(random(0, 400), random(0, 400));
      ttl[i] = int(random(0, 50));
    }
  }
}

void draw() {
  fill(0, 10);
  noStroke();
  rect(0, 0, width, height);
  stroke(r, g, b, ca);
  smooth();
  if(click == true)
  {
    for ( int i = 0; i < a; i++) {
      point( pos[i].x + mouseX, pos[i].y + mouseY );
    }
    pmx = mouseX;
    pmy = mouseY;
    a = 400;
  } else {
    if(a > 1) {
      a = int(a*0.99);
    }
    for ( int i = 0; i < a; i++) {
      point( pos[i].x + pmx, pos[i].y + pmy );
    }
    pmy = pmy * 1.05;
  }

  for ( int i = 0; i < a; i++) {
    pos[i].add( vel[i] );
    ttl[i]--;
    if (ttl[i] < 0) {
      vel[i] = new PVector(random(-5, 5), random(-5, 5));
      pos[i] = new PVector(random(-5, 10), random(-5, 10));
      ttl[i] = int(random(0, 50));
    }
  }
}


void mousePressed() {
stroke (r = random(0, 255), g = random(0, 255), b = random(0, 255), ca = random(20, 100));
  strokeWeight(random(0.5,6));

  click= true;

/*
  if (a == 0) {
    a = 400;
  } 
  else {
    a = 0;
  }
  */
}

void mouseReleased() {
  { 
    click= false;
  }
}

