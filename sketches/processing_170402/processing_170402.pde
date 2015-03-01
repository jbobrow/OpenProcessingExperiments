
Ball[] ball = new Ball[int(random(5,25))];
boolean globalGrow = true;
int k =255;
void setup() {
  size(400, 400);
  smooth();

  // Initialize balls
  for (int i=0;i<ball.length;i++) {
    ball[i] = new Ball(); 
  }
}

void draw() {
  background(k);

  if (globalGrow == true) {
    for (int i=0;i<ball.length;i++) {
      ball[i].sizeIt();
      ball[i].display();
 
    
    for (int j = 0; j < ball.length; j++) {
      if (ball[i].intersect(ball[j])) {
        if (i != j) {
          color c = color(random(100,255), random(100,255), random(100,255));
          ball[i].reset(c);
          ball[j].reset(c);
          k-=1;
          if (k<1){
            k=255;}
        }
      }
    }
    }
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
class Ball {
  float r; 
  float x,y;
  color c;

  Ball() {
    reset(color(random(255),random(255),random(255)));
  }
  void sizeIt() {
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
    float distance = dist(x,y,b.x,b.y); 

    if (distance < r + b.r) {
      return true;
    } 
    else {
      return false;
    }
  }
}




