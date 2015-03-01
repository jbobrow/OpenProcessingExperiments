
Ball ball[] = new Ball[5];

boolean globalGrow = true;

void setup() {
  size(400, 400);
  smooth();

  
  for (int i=0;i<5;i++) {
    ball[i] = new Ball(); 
  }
}

void draw() {
  background(255);
  
  for (int x=0; x<5; x++) {
    for (int y=0; y<5; y++) {
      if (ball[x].intersect(ball[y])) {
        if (x != y) {
          color c = color(random(255), random(20), random(20));
          ball[x].resetMe(c);
          ball[y].resetMe(c);
        }
      }
    }
  }
   


  if (globalGrow == true) { 
    for (int i=0;i<5;i++) {
      ball[i].sizeIt(); 
    }
    
    
    for (int f=0;f<5;f++) { 
      int g=f+1; 
      if (g>2) {g=0;} 

      if (ball[f].intersect(ball[g])) {
        color c = color(random(255), random(255), random(255));
        ball[f].resetMe(c); 
        ball[g].resetMe(c); 
      }
    }
  }

  for (int h=0;h<5;h++) {
    ball[h].display();
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
      return true;
    } 
    else {
      return false;
    }
  }
}
