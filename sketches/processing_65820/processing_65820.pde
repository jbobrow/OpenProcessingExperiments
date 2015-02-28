
  class House {
  float x;
  float y;
  float scalar;
  float bodyHeight;
  float bodyMovement = random(1, 3);
  float eyebrowColor;
  float eyebrow = 60;
  float eyebrowMovement = random(1, 2);
  float smile = 30;
  float smileMovement = random(1, 5);
  float speed = random(1, 8);

House(float x_in, float y_in, float scalar_in, float bodyHeight_in, float eyebrowColor_in) {
  x = x_in;
  y = y_in;
  scalar = scalar_in;
  bodyHeight = bodyHeight_in;
  eyebrowColor = eyebrowColor_in;
}

void move() {
  x += random(-speed, speed);
  x = constrain(x, 100, 580);
  y += random(-speed, speed);
  y = constrain(y, 90, 400);
}

void display() {
   pushMatrix();
    translate(x, y);
    scale (scalar);
    noStroke();
    fill(0);
    triangle(50, 120, 210, 120, 130, 15); //head
    fill(eyebrowColor);
    rect(95, eyebrow, 25, 8); //left eyebrow
    rect(140, eyebrow, 25, 8); //right eyebrow
    fill(255);
    ellipse(108, 78, 12, 12); //left eye
    ellipse(152, 78, 12, 12); //right eye
    arc(130, 90, smile, 40, 0, PI); // smile
    fill(0);
    rect(90, 124, 80, bodyHeight+50); //body
    fill(255);
    quad(100, 134, 126, 134, 126, 160, 100, 160); //left window  
    quad(160, 134, 134, 134, 134, 160, 160, 160); //right window
    stroke(0);
    strokeWeight(5);
    line(95, 147, 165, 146);
    line(113, 129, 113, 160);
    line(147, 129, 147, 160);
    noStroke();
    fill(0);
    quad(75, 134, 85, 139, 50, 185, 40, 180); //left arm
    quad(185, 134, 175, 139, 210, 185, 220, 180); //right arm
    quad(110, 234, 125, 234, 125, 274, 110, 274); //left leg
    quad(150, 234, 135, 234, 134, 274, 150, 274); //right leg
  popMatrix();
   
}

void moveEyebrow() {
  eyebrow += eyebrowMovement;
  if(eyebrow < 4 || eyebrow > 60) {
    eyebrowMovement = - eyebrowMovement;
  }
}

void moveSmile() {
  smile += smileMovement;
  if (smile < 5 || smile > 30) {
    smileMovement = - smileMovement;
  }
}

void moveBody() {
  bodyHeight += bodyMovement;
  if (bodyHeight < 3 || bodyHeight > 86) {
    bodyMovement = - bodyMovement;
  }
}

}

