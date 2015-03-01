
private static final int WALK_LEFT = 1 ;
private static final int WALK_RIGHT = 2 ;
private static final int STAY = 3 ;
private static int walkingState; 
StickFigure stick ;
int armAngle;
int legAngle;
boolean flag ;

void setup () {
  size ( 1000 , 720);
  strokeWeight(6);
  fill(220);
  stick = new StickFigure();
  initializeStick () ;
}

void initializeStick () {
stick.head = new Head (mouseX,mouseY) ;
stick.nose = new Nose (mouseX , mouseY , WALK_RIGHT);
stick.lArm = new Arm (mouseX,mouseY, armAngle );
stick.rArm = new Arm (mouseX,mouseY,180-armAngle );
stick.body = new Body (mouseX,mouseY )  ;
stick.lLeg = new Leg (mouseX,mouseY,legAngle) ;
stick.rLeg = new Leg (mouseX,mouseY,180-legAngle);
}

void updateStick () {
stick.head.updatePosition(mouseX , mouseY);
stick.body.updatePosition(mouseX , mouseY);
stick.lArm.updatePosition (mouseX , mouseY , armAngle);
stick.rArm.updatePosition(mouseX , mouseY , 180-armAngle );
stick.lLeg.updatePosition (mouseX , mouseY , legAngle );
stick.rLeg.updatePosition (mouseX , mouseY , 180-legAngle );
stick.nose.updatePosition ( mouseX , mouseY,walkingState);
}


void draw () {
background(220);
updateStick();
stick.drawStick();

if ( pmouseX - mouseX > 0.5 ) {
  walkingState = WALK_LEFT;
}
else if ( pmouseX - mouseX > -0.5 ) {
  walkingState = STAY;
}
else {
  walkingState = WALK_RIGHT;
}

if ( abs(pmouseX - mouseX) > 0.5 ) {
  if ( flag ){
    armAngle = armAngle + ceil(abs(pmouseX - mouseX));
    legAngle = legAngle + ceil(abs(pmouseX - mouseX));
  }else {
    armAngle = armAngle - ceil(abs(pmouseX - mouseX));
    legAngle = legAngle - ceil(abs(pmouseX - mouseX));
  }

  if ( armAngle > 90 ) {
    flag = false;
  }
  if ( armAngle < 0 ) {
    flag = true;
  }
  
  println (armAngle);
}
else{
  armAngle = round(map( armAngle , 0 , 100 , 10, 90 ));
  legAngle = round(map( legAngle , 0 , 100 , 35 , 90));
}

}


void mousePressed () {

}
private class StickFigure {
  Head head ;
  Arm lArm ;
  Arm rArm;
  Leg lLeg;
  Leg rLeg;
  Body body;
  Nose nose;
  
  void drawStick () {
    head.drawBodyPart();
    body.drawBodyPart();
    lArm.drawBodyPart();
    rArm.drawBodyPart();
    lLeg.drawBodyPart();
    rLeg.drawBodyPart();
    nose.drawBodyPart();  
}
  
}

private abstract class BodyParts {
  Point mousePosition;
  int angle;
  float correctionX;
  float correctionY;
  
  abstract void drawBodyPart();

  void updatePosition(float X , float Y  ) {
    mousePosition.X = X ;
    mousePosition.Y = Y ;
  }
  
}

private class Head extends BodyParts {
  float r = 80;
  Head ( float X , float Y ) {
    mousePosition = new Point (X , Y );
    correctionX = 0;
    correctionY = 0;

}
  void drawBodyPart () {
    Point p = new Point (mousePosition.X + correctionX , mousePosition.Y + correctionY) ;
    ellipse ( p.X , p.Y  , r,r);
  }
}

private class Nose extends BodyParts {
  float size = 5 , hei = -3;
  int direction;
  Nose ( float X , float Y , int direction ) {
    mousePosition = new Point (X , Y);
    correctionX = 40;
    correctionY = 0 ;
    this.direction = direction;
  }
  
  void updatePosition (float X , float Y , int direction) {
    super.updatePosition (X,Y);
    this.direction = direction;
  }
  
  void drawBodyPart() {
    Point p;
    if ( direction == WALK_RIGHT) {
      p = new Point (mousePosition.X + correctionX , mousePosition.Y + correctionY);
      triangle (p.X , p.Y , p.X+size , p.Y , p.X , p.Y+hei);
    }else if (direction == WALK_LEFT) {
      p = new Point (mousePosition.X - correctionX , mousePosition.Y + correctionY);
      triangle (p.X , p.Y , p.X-size , p.Y , p.X , p.Y+hei);
    }else if ( direction == STAY ) {
      ellipse (mousePosition.X , mousePosition.Y+10 , 5,5);
    }

  }
}

private class Arm extends BodyParts {
  float size = 55;
  
  Arm ( float X , float Y , int angle ) {
    mousePosition = new Point (X , Y );
    this.angle = angle;
    correctionX = 0;
    correctionY = 70;
}

  void updatePosition (float X , float Y , int angle) {
    super.updatePosition (X,Y);
    this.angle = angle;
  }

  void drawBodyPart () {
    Point p = new Point (mousePosition.X + correctionX , mousePosition.Y + correctionY) ;
    float rad_angle = 2 * PI * angle / 360;
    line (p.X , p.Y , size*cos(rad_angle)+p.X , size*sin(rad_angle)+p.Y );
  }
}

private class Body extends BodyParts {

  Body ( float X , float Y ) {
    mousePosition = new Point (X , Y );
    correctionX = 0 ;
    correctionY = 40;
  }
  void drawBodyPart () {
    Point p = new Point (mousePosition.X + correctionX , mousePosition.Y + correctionY) ;
    line (p.X , p.Y , p.X , p.Y + 120);
  }
}


private class Leg extends BodyParts {
  float size = 60;
  Leg ( float X , float Y , int angle ) {
    mousePosition = new Point (X , Y );
    this.angle = angle;
    correctionX = 0;
    correctionY = 160;
  }

  void updatePosition (float X , float Y , int angle) {
    super.updatePosition (X,Y);
    this.angle = angle;
  }



  void drawBodyPart () {
    Point p = new Point (mousePosition.X + correctionX , mousePosition.Y + correctionY) ;
    float rad_angle = 2 * PI * angle / 360;
    line (p.X , p.Y , size*cos(rad_angle)+p.X , size*sin(rad_angle)+p.Y );
  }

}




private class Point {
  float X ,  Y ;
  Point (float X , float Y){
    this.X = X;
    this.Y = Y;
  }
}


