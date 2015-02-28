

int a = 1000;
PVector[] pos;
PVector[] vel;

int[] ttl;
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

  smooth();

  for ( int i = 0; i < a; i++) {
    point( pos[i].x + mouseX, pos[i].y + mouseY );
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

  stroke (random(0, 255), random(0, 255), random(0, 255), random(20, 100));
strokeWeight(random(0.5,6));
  if (a == 0) {
    a = 400;
  } 
  else {
    a = 0;
  }

  }
 
 


