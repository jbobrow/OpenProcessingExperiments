

Ball[] aBall= new Ball[20];
boolean globalGrow = true;

void setup() {
  size(800, 800);
  smooth();

  // Initialize balls

  for (int i = 0; i < aBall.length; i ++ ) {
    aBall[i] = new Ball();
  }
}

void draw() {
  background(255);



  for (int j=0; j<aBall.length; j++) {
    if (globalGrow == true) {
      aBall[j].grow();
    }
    aBall[j].display();
  }
  for (int x=0; x<20; x++) {
    for (int y=0; y<20; y++) {
    if (aBall[x].intersect (aBall[y])) {
      if (x!=y) {
        color c = color(random(255), random(255), random(255));
        aBall[x].reset(c);
        aBall[y].reset(c);
      }
    }
  }
}
}
void mousePressed() {
  if (globalGrow == true) {
    globalGrow = false;
  } else {
    globalGrow = true;
  }
}
class Ball {
float r; // radius
float x,y;
color c;

Ball() {
reset(color(random(255),random(255),random(255)));
}

void grow() {
r+=1;
}
void reset(color tempC){
r = 0;
x = random(width);
y = random(height);
c = tempC;
}

void display() {
noStroke();
fill(c);
ellipse(x,y,r*2,r*2);
}

boolean intersect(Ball b) {
// Objects can be passed into functions as arguments too!
float distance = dist(x,y,b.x,b.y); // Calculate distance

// Compare distance to sum of radii
if (distance < r + b.r) {
return true;
}
else {
return false;
}
}
}



