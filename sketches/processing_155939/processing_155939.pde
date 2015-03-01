
float circleX = 0;
int circleY = 0;
int circleWidth = 400;
int circleHeight = 400;
int change = 1;

void setup() {
  size(800, 800);
  frameRate(30);
}

void draw() {

  background(255); //one pig shows

  //monster
  fill(57, 133, 198);
  //ellipse(mouseX/2, mouseY/2, 400, 400);
  //ellipse(mouseX, mouseY, 400, 400);
  ellipse(circleX, circleY, circleWidth, circleHeight);

  fill(250);
  //ellipse(mouseX/5, mouseY/5, 240, 240);
  //ellipse(mouseX, mouseY, 240, 240);
  ellipse(circleX, circleY, circleWidth - 160, circleHeight - 160);

  fill(0);
  //ellipse(mouseX, mouseY, 120, 120);
  ellipse(circleX, circleY, circleWidth - 280, circleHeight - 280);

  strokeWeight(10);
  //line(mouseX-50, mouseY+150, mouseX+50, mouseY+150);
  line(circleX - 50, circleY + 150, circleX + 50, circleY + 150);
  //monster end

  //change size and position
  circleX += change * 3.1;
  circleY += change + 2;
  circleWidth += change*2;
  circleHeight -= change*3;
}



