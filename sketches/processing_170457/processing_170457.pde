
Ball ball[] = new Ball[3];

boolean allGrow = true; //to be able to turn off growth

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
  //make balls grow if mouse not pressed
  if (allGrow == true) { 
    for (int i=0;i<3;i++) {
      ball[i].grow(); 
    }
  }
    // we will compare two balls with 'twoIntersect()'
    for (int i=0; i<ball.length; i++) {
    for (int j=0; j<ball.length; j++) {
      if (i != j) { //!= is "does not equal" syntax 
        twoIntersect(i, j);
      }
    }
  }
    
      
//display balls
  for (int i=0;i<3;i++) {
    ball[i].display();
  }
}

//twoIntersect function
void twoIntersect(int num1, int num2) {
  if (ball[num1].intersect(ball[num2])) {
        color c = color(random(255), random(255), random(255));
        ball[num1].reset(c);
        ball[num2].reset(c); 
      }
  
  }


//turn off all growing with mouseclick 
void mousePressed() { 
  if (allGrow == true) {
    allGrow = false;
  }
  else {
    allGrow = true;
  }
}
class Ball {
  float r; // radius
  float x,y;
  color c;

  Ball() {
    reset(color(0,0,0));
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




