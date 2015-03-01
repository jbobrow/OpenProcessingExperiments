
Ball ball[] = new Ball[3];

boolean globalGrow = true;

void setup() {
  size(400, 400);
  smooth();

  // Initialize balls
  for (int i=0;i<3;i++) {
    ball[i] = new Ball(); 
  }
}

void draw() {
  background(255);

  if (globalGrow == true) { 
    for (int i=0;i<3;i++) {
      ball[i].sizeIt(); 
    }
    
    
    for (int p=0;p<3;p++) { 
      int n=p+1;  
      if (n>2) {n=0;} 

      if (ball[p].intersect(ball[n])) {
        color c = color(random(255), random(255), random(255));
        ball[p].resetMe(c); // call on p
        ball[n].resetMe(c); // call on n
      }
    }
  }

  for (int m=0;m<3;m++) {
    ball[m].display();
  }
}
void mousePressed() { //stop and restart balls for extra credit
  if (globalGrow == true) {
    globalGrow = false;
  }
  else {
    globalGrow = true;
  }
}


class Ball {
  float r; // the radius of each ball
  float x,y; // the position of each ball
  color c; //random color 

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
    float distance = dist(x,y,b.x,b.y); 

    if (distance < r + b.r) {
      return true; //use boolean here
    }
    else {
      return false;
    }
  }
}









