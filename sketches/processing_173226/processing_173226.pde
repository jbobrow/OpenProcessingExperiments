
float xSpeed = 4;
float ySpeed = 8;
float xPos;
float yPos;
int ballSize = 30;


void setup() {
  size (600, 600);
  background (0);
  xPos = width/2;
  yPos = height/2;
}

void draw() {
  if (mousePressed == true) {
    xSpeed += random(0, 3);
    ySpeed += random(0, 3);
  } 
  xPos = xPos + xSpeed ;
  yPos = yPos + ySpeed;
  noStroke();
  fill (random(100, 200), random(100, 200), random(100, 200), random(50, 200)); 
  ellipse(xPos, yPos, ballSize, ballSize);

  coLogic();
  refresh();
}

void coLogic() {
  //x logic
  if (xPos >= (width - ballSize/2)) {
    xSpeed *= -1;
    xPos = (width - 1) - ballSize/2;
  }

  if (xPos <= ballSize/2) {
    xSpeed *= -1;
    xPos = 1 + ballSize/2;
  }
  //y logic
  if (yPos >= (width - ballSize/2)) {
    ySpeed *= -1;
    yPos = (width - 1) - ballSize/2;
  }

  if (yPos <= ballSize/2) {
    ySpeed *= -1;
    yPos = 1 + ballSize/2;
  }
}

void refresh() {
  if (keyPressed) {
    if (key == 'c' || key == 'C') {
      background(0);
    }
  }
}



