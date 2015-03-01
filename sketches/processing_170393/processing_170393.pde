
class Ball {
  float r; // radius
  float x,y;
  color c;

  Ball() {
    resetMe(color(0,0,0));
  }

  void sizeIt() {
    r+=1;
  }
  void resetMe(color tempC){
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


Ball ball[] = new Ball[3];

boolean globalGrow = true;

void setup() {
  size(400, 400);
  smooth();

  // Initialize balls
  for (int i=0;i<3;i++) {
    ball[i] = new Ball(); // instantiate 3 and save in 3 index array
  }
}

void draw() {
  background(255);

  if (globalGrow == true) { // below mousePressed can toggle this on and off
    for (int i=0;i<3;i++) {
      ball[i].sizeIt(); // call sizeIt for all 3
    }
    
    // we will compare two balls with 'intersect()'
    for (int j=0;j<3;j++) { // j will be the index for one of them
      int k=j+1;  // k is the other index.  one greater than j
      if (k>2) {k=0;} // unless j goes over

      if (ball[j].intersect(ball[k])) {
        color c = color(random(255), random(255), random(255));
        ball[j].resetMe(c); // call on j
        ball[k].resetMe(c); // call on k
      }
    }
  }

  for (int m=0;m<3;m++) {
    ball[m].display();
  }
}
void mousePressed() {
  if (globalGrow == true) {
    globalGrow = false;
  }
  else {
    globalGrow = true;
  }
}



