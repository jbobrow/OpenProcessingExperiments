
class Robot {
  float x;
  float y;
  float scalar;
  float bulb;
  float bulbC;
  float eyeSize;
  float r, g, b;
  float bulbSize = 50;
  float bulbMovement = random(.5, 5);
  float triSize = 30;
  float triMovement = random(.2, 1);
  float speed = 4; //random(.1, 4);
  float yspeed = 2.2;
  int ydirection = 1;
  float yB;
  
  
  Robot(float x_in, float y_in, float scalar_in, float bulb_in, float bulbC_in, float eyeSize_in, float r_in, float g_in, float b_in) {
    x = x_in;
    y = y_in;
    scalar = scalar_in;
    bulb = bulb_in;
    bulbC = bulbC_in;
    eyeSize = eyeSize_in;
    r = r_in;
    g = g_in;
    b = b_in;
  }
  
  void move() {
    //x += random(-speed, speed);
    //x = constrain(x, 0, width);
    //y += random(-speed, speed);
    //y = constrain(y, 0, height);
    y += yspeed *ydirection;
    if ((y > 350) || (y < 60)) {
    ydirection *= -1;
    }
  }
  
  void display() {
    pushMatrix();
      translate(x, y);
      scale(scalar);
      noStroke();
      //head
      fill(180);
      rect(40, -50, 20, 50); //neck
      rect(45, -130, 10, 50); //a
      fill(bulbC);
      strokeWeight(4);
      stroke(150);
      ellipse(50, -130, bulbSize, bulbSize); //a
      fill(220);
      rect(-50, -100, 200, 80); //
      fill(0);
      noStroke();
      ellipse(-40, -60, eyeSize, eyeSize); //eyes
      ellipse(140, -60, eyeSize, eyeSize);
      arc(50, -50, 30, 35, 0, PI); //mouth
      //body
      fill(150);
      ellipse(50, yB, 80, 80); //circular
      strokeWeight(4);
      stroke(150);
      fill(r, g, b);
      rect(0, 0, 100, 150); //main
      strokeWeight(1);
      fill(244);
      triangle(50, triSize, 70, 70, 30, 70);
    popMatrix();
  }
  
  void moveAnt() {
    bulbSize += bulbMovement;
    if (bulbSize < 5 || bulbSize > 50) {
      bulbMovement = - bulbMovement;
    }
  }
  
  void moveTri() {
    triSize += triMovement;
    if (triSize < 30 || triSize > 60) {
      triMovement = - triMovement;
    }
  }
  
  void moveButt() {
    yB += random(-speed, speed);
    yB = constrain(y, 130, 145);
  } 
}


