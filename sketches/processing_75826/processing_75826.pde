
//Julie Jung
//Introduction to Digital Media Fall 2012
//Section B
//9.7.12

float randomDiameter;
int growingDiameter = 100;
int redIncrement = 220;
int blueIncrement = 0;
boolean redGrowing = true;
boolean boolGrowing = false;
int tempX;
int tempY;
int radius = 50;
int stepX = 50;
int stepY = int(50*sqrt(3));

void setup() {

  size(1200, 600);
  background(0);
}

void draw() {
  fill(0,80);
  rect(0, 0, width, height);
  if (boolGrowing==false) {
    radius = 50;

    stroke(redIncrement,0,blueIncrement);
    fill(redIncrement, 0, blueIncrement);
    ellipse(mouseX,mouseY,radius,radius);
    ellipse(mouseX+stepX, mouseY+stepY, radius*2, radius*2);
    ellipse(mouseX-stepX, mouseY+stepY, radius*2, radius*2);
    ellipse(mouseX-stepX*2, mouseY, radius*2, radius*2);
    ellipse(mouseX+stepX*2, mouseY, radius*2, radius*2);
    ellipse(mouseX-stepX, mouseY-stepY, radius*2, radius*2);
    ellipse(mouseX+stepX, mouseY-stepY, radius*2, radius*2);

    tempX = mouseX;
    tempY = mouseY;
  }
  else {
    if (redIncrement == 220 | redIncrement == 0) {
      redGrowing = !redGrowing;
    }
    if (redGrowing == true) {
      redIncrement++;
      blueIncrement--;
    }
    else {
      redIncrement--;
      blueIncrement++;
    }
    fill(redIncrement, 0, blueIncrement);
    ellipse(tempX,tempY,radius,radius);
    ellipse(tempX+stepX, tempY+stepY, radius*2, radius*2);
    ellipse(tempX-stepX, tempY+stepY, radius*2, radius*2);
    ellipse(tempX-stepX*2, tempY, radius*2, radius*2);
    ellipse(tempX+stepX*2, tempY, radius*2, radius*2);
    ellipse(tempX-stepX, tempY-stepY, radius*2, radius*2);
    ellipse(tempX+stepX, tempY-stepY, radius*2, radius*2);
    if (tempY < (600-radius-stepY)) {
      tempY = tempY + 10;
    }
    else {
      radius = radius + 5;
      tempY = (600-radius-stepY);
    }
  }
}

void mouseClicked() {
  if (boolGrowing==false) {
    boolGrowing=true;
  }
  else {
    boolGrowing=false;
  }
}
