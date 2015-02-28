
/*Assignment 5
 
 Drunk ant creates a random path on canvas
 If the ant goes off the canvas, it starts its path
 on the oppisite side with a random color path
 
 Arturo Alviar 
 1/13/14
 */


final int WIDTH = 600;
final int HEIGHT = 600;

int lastX, lastY, howFar;

void setup() {
  size(WIDTH, HEIGHT);
  background(0);
  smooth();
  stroke(255, 100);
  lastX = (int)random(0, WIDTH);
  lastY = (int)random(0, HEIGHT);
}

void draw() {
  int newX, newY, distance;
  howFar = (int)random(0, 8);
  distance = (int)random(10, 15);
  newX = lastX;
  newY = lastY;
  switch (howFar) {
  case 0:
    newY = lastY-distance;
    break;
  case 1:
    newY = lastY-distance;
    newX = lastX+distance;
    break;
  case 2:
    newX = lastX+distance;
    break;
  case 3:
    newY = lastY+distance;
    newX = lastX+distance;
    break;
  case 4:
    newY = lastY+distance;
    break;
  case 5:
    newY = lastY+distance;
    newX = lastX-distance;
    break;
  case 6:
    newX = lastX-distance;
    break;
  case 7:
    newY = lastY-distance;
    newX = lastX-distance;
    break;
  }
  strokeWeight(1);
  line(lastX, lastY, newX, newY);
  lastX = newX;
  lastY = newY;
  //making lastX and lastY spawn in a random location is more 
  //interesting 
  //if(lastX > width || lastY > height || lastX < 0 || lastY < 0){
  //lastX = (int)random(0, WIDTH);
  //lastY = (int)random(0, HEIGHT);
  //}

  if (lastX > width) {
    lastX = 0+ distance/2;
    stroke(random(0, 255), random(0, 255), random(0, 255), 100);
  }
  else if (lastX < 0) {
    lastX = width -distance/2;
    stroke(random(0, 255), random(0, 255), random(0, 255), 100);
  }
  else if (lastY > height) {
    lastY = 0 + distance/2;
    stroke(random(0, 255), random(0, 255), random(0, 255), 100);
  }
  else if (lastY < 0) {
    lastY = height - distance/2;
    stroke(random(0, 255), random(0, 255), random(0, 255), 100);
  }
}

void keyReleased() {
  switch(key) {
  case 's':
    saveFrame("aalviar_hw5a-####.png");
    break;
  }
} 



