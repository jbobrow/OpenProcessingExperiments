
float curX, curY;

void setup() {
  size(600, 600);

  // 3 big red points,
  // forming a triangle
  stroke(255,0,0);
  strokeWeight(10);
  point(width/2, 0);
  point(0,height);
  point(width, height);

  // A big yellow "seed point"
  stroke(255, 255, 0);
  curX = random(width);
  curY = random(height);  
  point(curX, curY);

  // The rest of the points will be small
  // and green
  stroke(0, 0, 255);
  strokeWeight(5);
}



// Move halfway from the current point to
// a randomly selected red point.
void draw() {

  int pick = (int)random(3);

  // pick is now a random integer...either 0, 1, or 2
  if (pick == 0) {
    curX = (curX + width/2) / 2;
    curY = curY / 2;
  }
  else if (pick == 1) {
    curX = (curX + width) / 2;
    curY = (curY + height) / 2;
  }
  else {
    curX = curX / 2;
    curY =  (curY + height) / 2;
  }

  point(curX, curY);
}
