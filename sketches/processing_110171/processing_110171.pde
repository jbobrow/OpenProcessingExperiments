
int N = 300;
int maxRadius = 200;

// determines the inital spiral configuration
int angleChange = 0.1;

void setup() {
 size(600, 600); 
 smooth();
 frameRate(4);
 strokeWeight(1);
 stroke(255);

 maxRadius = (height / 2) - 20;
} 
 
void draw() {
 background(0);
 
 // coordinates of the current point
 int x = (width / 2);
 int y = (height / 2);

 // coordinates of the previous point
 int lastX = x;
 int lastY = y;

 for (int i = 0; i < N; i += 1) {
  // calculate position of current point
  int theta = angleChange * i;
  int radius = maxRadius * sqrt(i / N);
  x = (width / 2) + radius * cos(theta);
  y = (height / 2) + radius * sin(theta);
        
  // draw a line from the last
  // point to the current point
  line(lastX, lastY, x, y);
        
  // update the previous point to be the current point
  lastX = x;
  lastY = y;
 }
 
 angleChange += 0.01;
}

void mousePressed() {
 stroke(random(255), random(255), random(255));
}
