
//Logan Bryant
//A program that demonstrates different variables
//CSE 174H

//Defines Global Constants and Variables
int ellipseX = int(103);
int ellipseY = int(176);
final int SWITCH_X=560;
final int SWITCH_Y=345;

void setup() {
  size(600, 400);
}

//Draws the maze and all components
void draw() {
  background(0);
  drawMaze();
  drawStart();
  drawEnd();
  drawEllipse();
  youWin();
}

//Draws maze
void drawMaze() {
  stroke(255);
  strokeWeight(10);
  line(0, 0, 0, 400);
  line(0, 0, 600, 0);
  line(600, 0, 600, 400);
  line(0, 400, 600, 400);
  line(200, 0, 200, 200);
  line(200, 200, 75, 200);
  line(75, 200, 75, 150);
  line(75, 150, 125, 150);
  line(125, 150, 125, 75);
  line(300, 350, 300, 75);
  line(300, 75, 250, 75);
  line(250, 75, 250, 300);
  line(250, 300, 75, 300);
  line(75, 300, 75, 350);
  line(75, 350, 250, 350);
  line(0, 250, 200, 250);
  line(600, 200, 400, 200);
  line(400, 200, 400, 100);
  line(400, 100, 500, 100);
  line(500, 100, 500, 150);
  line(600, 40, 300, 40);
  line(350, 100, 350, 400);
  line(600, 300, 500, 300);
  line(500, 300, 500, 350);
  line(75, 0, 75, 100);
  line(500, 350, 400, 350);
  line(600, 250, 400, 250);
  line(350, 300, 450, 300);
}

//Draws start block
void drawStart() {
  fill(0, 255, 0);
  noStroke();
  rectMode(CORNER);
  rect(90, 163, 25, 25);
}

//draws end block
void drawEnd() {
  fill(0, 255, 0);
  rectMode(CENTER);
  rect(SWITCH_X, SWITCH_Y, 25, 25);
}

//draws ellipse
void drawEllipse() {
  fill (0, 0, 255);
  ellipse(ellipseX, ellipseY, 25, 25);
}

//makes ellipse move
void keyPressed() {
  if (keyCode == RIGHT) {
    ellipseX=ellipseX+4;
  }
  else if (keyCode == LEFT) {
    ellipseX=ellipseX-4;
  }
  else if (keyCode == DOWN) {
    ellipseY = ellipseY + 4;
  }
  else if (keyCode == UP) {
    ellipseY=ellipseY-4;
  }
}
//calculates distance from ellipse to ending block
float distanceFromEnd() {
  return dist(ellipseX, ellipseY, SWITCH_X, SWITCH_Y);
}

//says that the sensor was triggered if the ellipse is
//within 20 pixels of the ending block
boolean sensorWasTriggered() {
  return distanceFromEnd() < 20;
}

//winning screen
void youWin() {
  if (sensorWasTriggered()== true) {
    rectMode(CORNER);
    fill(0, 255, 75);
    rect(0, 0, 600, 400);
    fill(0);
    text("Congratulations, you've completed the maze!", 100, 200);
  }
}
