
//MOVING THE BALL

// It goes with the reapeat ball

int x= 0;
int b= 50;

void setup() {
  size(600, 600);
  background(170, 220, 150); 
  smooth();
  frameRate(5);
  noStroke();
  fill(100, 100, 100, 100);
  rect(80, 0, 190, 600);
  
}

// repaeat the ball

void draw() {
  fill(250, 250, 250);
  noStroke();
  ellipse(50, 200, 40, 40);
  
  fill(250, 250, 250, b= x+10);
  noStroke();
  ellipse(x= x+50, 200, 40, 40);
  
}





