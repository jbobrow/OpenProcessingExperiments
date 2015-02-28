
int i = 200; // x or y
int j = 200; // x or y
int size = 80; // ball size
int speed = 3; // speed x
int speed2 = 10; // speed y

void setup() {
  size(500, 500); // set only one time
  fill(255);
}

void draw() {
  background(255); //before moving circle, should put then circle moves one by one.
  fill(random(255), random(255), random(255));
  stroke(0, 200, 200);
  strokeWeight(10);
  ellipse(i, j, size, size); // (200, 200, 80, 80)
  i = i+speed; // move to right side
  j = j+speed2; // move to go down side

  if (i>width - size/2) { // i greater than width , size/2 -> hit the side right line
    speed = speed * (-1); // 3 = 3 * (-1) ->-3 (move to left side)
  }

  if (j>height - size/2) { // move down but size/2 means hit the right bottom line
    speed2 = speed2 * (-1); // 10 = 10 * (-1)
  }

  if (i < size/2) { // hit the left side -3(3*(-1)) = 3 * (-1)
    speed = speed * (-1);
  }

  if (j < size/2) { // hit the upper side -1 = -1 * (-1) 
    speed2 = speed2 * (-1);
  }
}
