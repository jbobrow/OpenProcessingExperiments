

/////////////////////////////
//                         //
//    Bouncing Bubbles     //
//                         //
/////////////////////////////

// (c) Martin Schneider 2013


ArrayList<Bubble> bubbles = new ArrayList();
float x1, y1, r;

int[] palette = { #ff6666, #6666ff, #66ff66, #ffff66 };

boolean tracing = true;
boolean attract = true;
boolean gravity = true;
boolean colors = true;
boolean dark = true;

int cellsize = 6;
int cellwall = 6;

float repell = .5;
int maxiter = 22;
int fps = 1;


void setup() {
  size(400, 400);
  background(dark ? 0: 255);
  smooth();
}


void draw() {
  
  // background with tracing
  noStroke();
  fill(dark ? 0 : 255, tracing ? 63 : 255);
  rect(0, 0, width, height);
    
  if(attract) {
    for(Bubble b: bubbles) b.attract();
  }
  
  for(Bubble b: bubbles) {
    //b.limit();
    if(gravity) b.gravity();
    b.move();
  }
  
  // resolve collisions
  boolean c = true;
  for(int cc=0; cc<maxiter & c; cc++) {
    c = false;
    for(Bubble b : bubbles) c |= b.collide();
  } 

  // draw bubbles
  for(Bubble b : bubbles ) b.draw();
  
  interact();
  
}


///////////////////////// interaction /////////////////////////

void interact() {
  if(mousePressed) {
    int c = floor(random(colors ? palette.length : 0));
    bubbles.add(new Bubble(mouseX, mouseY, cellsize, c));
  }
}


void keyPressed() {
  switch(key) {
    case 'r': bubbles = new ArrayList(); break;
    case 'b': dark = !dark; break;
    case 'a': attract = !attract; break;
    case 'g': gravity = !gravity; break;
    case 't': tracing = !tracing; break;
    case 'c': colors = !colors; for(Bubble b: bubbles) b.c = colors ? floor(random(4)) : 0; break; 
    case ' ': repell *= -1; break;
  }
}


///////////////////////// drawing ///////////////////////// 

void bubble(float x, float y, float r, color c) {
  fill(c); strokeWeight(cellwall); stroke(c, 128); ellipse(x, y, 2*r-cellwall, 2*r-cellwall);
}


