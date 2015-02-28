
class BoxRobot {
  float x;
  float y;
  float scalar;
  float fillColor;
  float bodyHeight = 150;
  float legsPosition = 150;
  float headMovement = 0;
  float bodyMovement = random(0, 20);
  float legsMovement = random(PI/8);
  float armsMovement = random(PI/12);
  float speed = random(1, 2);
  int xDirection = 1;
  int yDirection = 1;

  BoxRobot(float x_in, float y_in, float scalar_in, float fillColor_in, float speed_in) {
    x = x_in;
    y = y_in;
    scalar = scalar_in;
    fillColor = fillColor_in; 
    speed = speed_in;
    if( random(0,1) > 0.5 )
      xDirection = 1;
    else
      xDirection = -1;
  }


  void move() {
    x += speed * xDirection;
    y += speed * yDirection;
    if (( x > width - 90*scalar ) || ( x < 90*scalar))
      xDirection *= -1;
    if (( y > height - 250*scalar ) || (y < 60*scalar))
      yDirection *= -1;
  }

 

  void display() {
    pushMatrix();
      // head
      translate(x, y);
      rotate(headMovement);
      scale(scalar); 
      strokeWeight(1);
      fill(fillColor, 155, 106);
      rect(-90, -60, 180, 100);
      fill(0);
      ellipse(-35, -15, 18, 18);
      ellipse(35, -15, 18, 18);
      triangle(0, 5, 15, 20, -15, 20);

      // body
      fill(fillColor, 155, 106);
      rect(-50, 40, 100, bodyHeight);
      
      // arms
      pushMatrix();
        translate(-50, 40);
        rotate(armsMovement);
        rect(-15, 0, 30, 120);
      popMatrix();
      pushMatrix();
        translate(50, 40);
        rotate(-armsMovement);
        rect(-15, 0, 30, 120);
      popMatrix();
      legsPosition = 40 + bodyHeight;
      // legs
      pushMatrix();
        translate(0, legsPosition);
        rotate(legsMovement);
        rect(-40, 0, 40, 50);
      popMatrix();
      pushMatrix();
        translate(0, legsPosition);
        rotate(-legsMovement);
        rect(0, 0, 40, 50);
      popMatrix();
    popMatrix();
  }

   
  void moveHead() {
    if ( xDirection == 1 )
      headMovement = random(PI/12);
    else
      headMovement = random(-PI/12);
  }
  void moveBody() {
    bodyHeight += bodyMovement;
    if(bodyHeight < 130 || bodyHeight > 150) {
       bodyMovement = - bodyMovement;
    }
  }
  void moveArms() {
    armsMovement = random(PI/12);
  }
  void moveLegs() {
    legsMovement = random(PI/12);
  }
}


