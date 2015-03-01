
Ball ball[] = new Ball[5];

boolean grow = true;

void setup() {
  size(400, 400);
  smooth();

  for (int i=0;i<5;i++) {
    ball[i] = new Ball(); 
  }
}

void draw() {
  background(255); 

  if (grow == true) {
    for (int i=0;i<5;i++) {
      ball[i].ballSize();
    }
    
   
    for (int u=0;u<5;u++) { 
      int i=u+1; 
      if (i>2) {i=0;} 

      if (ball[u].intersect(ball[i])) {
        color c = color(random(255), random(255), random(255));
        ball[u].resetMe(c); 
        ball[i].resetMe(c); 
      }
    }
  }

  for (int o=0;o<5;o++) {
    ball[o].display();
  }
}
void mousePressed() {
  if (grow == true) //Is it growing? If it is, then...
  {
    grow = false; //This makes it pause. Click again to resume the growth.
  }
  else {
    grow = true;
  }
}

class Ball {
  float r;
  float x,y;
  color c;

  Ball() {
    resetMe(color(0,0,0));
  }

  void ballSize() {
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
      return true;
    } 
    else {
      return false;
    }
  }
}



