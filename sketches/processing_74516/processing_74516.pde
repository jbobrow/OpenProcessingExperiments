
int d = 20;
int xPos = 20;
int yPos = 20;
int directionX = 2;
int directionY= -1;
int gameState = -1;

void setup() {
  size(500, 300);
  background(150, 220, 220, 200);
}

void draw() {
  stroke(0, 50);
  strokeWeight(3);
  line (450, 100, 450, 400);
  line (490, 100, 490, 400);
  noStroke();
  fill(150, 220, 220, 200);
  rect(0, 0, 500, 200);

  noStroke();
  fill(130, 200, 138, 200);
  rect(0, 200, 500, 100);

  fill(255, 50);
  ellipse(50, 50, 50, 25);
  ellipse(80, 60, 75, 25);
  ellipse(250, 70, 100, 30);

  noStroke();
  fill(255, 200);
  rect(440, 80, 60, 60);



  /*if (mouseY < 150){
   noStroke();
   noFill();
   }*/

  if (gameState == -1) {
    fill(220, 50, 60);
    ellipse(mouseX, mouseY, d, d);

    if (mousePressed) {
      gameState = 1;
      xPos = mouseX;
      yPos = mouseY;
    }
  }

  if (gameState == 1) {

    fill(220, 90, 70);
    ellipse(xPos, yPos, d, d);
    xPos = xPos + directionX;
    yPos = yPos + directionY;

    if (xPos > width || yPos < 0) {
      gameState = -1;
    }

    if (yPos < 75) {
      gameState = -1;
    }
  }

  fill(100);

  ellipse (mouseX - 20, height - 75, 10, 30);
  ellipse (mouseX, height - 65, 10, 30);
  ellipse (mouseX - 15, height - 20, 10, 30);
  ellipse (mouseX -5, height - 20, 10, 30);
  fill(50);
  rect (mouseX - 20, height - 70, 20, 35);
  ellipse (mouseX - 10, height -80, 15, 20);

  fill (0, 50);
  rect (460, 100, 20, 20);

  if (xPos > 460 && xPos <480 && yPos > 100 && yPos < 120 ) {
    noStroke();
    noFill ();
    rect (460, 100, 20, 20);
    background (255, 255, 0, 100);
  }
}
