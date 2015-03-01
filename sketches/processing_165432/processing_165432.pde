
float sLength = 45;
float gap = 10; 
float sx, sy; 
float mx, my; 
float inc, angle1, angle2, angle3, angle4; 
float angleStart, angleGoal; 
int angleCounter; 
int FORTH = 1;
int BACK = -1; 
int direction;  

void setup() {
  size(400, 400);
  background(255);
  strokeWeight(4);
  smooth();

  mx = width/4; 
  my = height/4; 

  sx = gap; 
  sy = height/2-gap;

  angleStart = -PI/2; 
  angleGoal = 0; 

  inc = 0.02;
  angle1 = 0; 
  angle2 = angleStart;
  angle3 = angleStart; 
  angle4 = angleStart;
  angleCounter = 2;
  direction = FORTH;
}
void draw() { 
  background(255);
  stroke(0);

  for (float a = 0; a < TWO_PI; a += PI/2) {
    pushMatrix(); 
    translate(width/2, height/2); 
    rotate(a); 

    float angle = 0; 
    for (int i = 0; i < 4; i++) {
      switch (i) {
      case 0: 
        stroke(#2AB242); 
        break; 
      case 1: 
        stroke(#FFB132); 
        break; 
      case 2: 
        stroke(#FF4A29); 
        break; 
      case 3:
        stroke(#2049B2); 
        break;
      }
      //for (float angle = 0; angle < TWO_PI; angle += PI/2) {        
      pushMatrix(); 
      translate(mx, my); 
      rotate(angle); 
      drawLinien(sx, sy, sLength);
      popMatrix();
      angle += PI/2;
    }

    popMatrix();
  }

  switch(angleCounter) {
  case 1:
    break;
  case 2: 
    if (angle2 < angleGoal) {
      angle2 += inc;
      if (angle2 >= angleGoal) {
        angleCounter = setAngleCounter(angleCounter, direction); 
        angle2 = angleGoal;
      }
    }
    break;
  case 3: 
    if (angle3 < angleGoal) {
      angle3 += inc;
      if (angle3 >= angleGoal) {
        angleCounter = setAngleCounter(angleCounter, direction); 
        angle3 = angleGoal;
      }
    }
    break;
  case 4: 
    if (angle4 < angleGoal) {
      angle4 += inc;
      if (angle4 >= angleGoal) {
        angle4 = angleGoal;               
        angleCounter = setAngleCounter(angleCounter, direction);
      }
    }
    break;

  case 5: 
    if (direction == BACK) {
      angleStart = -PI/2;
      angleGoal = 0; 
      angle1 = 0; 
      angle2 = angleStart;
      angle3 = angleStart; 
      angle4 = angleStart;
      angleCounter = 2;
      direction = FORTH; 
      sx = gap;
    } else {
      angleStart = 0;
      angleGoal = PI/2;
      angle1 = -PI; 
      angle2 = angleStart;
      angle3 = angleStart; 
      angle4 = angleStart;
      angleCounter = 4;
      sx = width/2 - gap; 
      direction = BACK;
    }    
    break;
  }
}

void drawLinien(float _sx, float _sy, float _length) {
  pushMatrix(); 
  //stroke(100); 
  translate(_sx-mx, _sy-my);
  rotate(angle1);
  line(0, 0, _length, 0);  

  translate(_length, 0);  
  rotate(angle2);
  line(0, 0, _length, 0);

  translate(_length, 0); 
  rotate(angle3);
  line(0, 0, _length, 0); 

  translate(_length, 0);
  rotate(angle4);  
  line(0, 0, _length, 0);
  
  popMatrix();
}

int setAngleCounter(int _angleCounter, int _dir) {
  int ac = _angleCounter; 

  if (direction == FORTH) {
    if (ac == 2) {
      return 3;
    }
    if (ac == 3) {
      return 4;
    } 
    if (ac == 4) {
      return 5;
    }
  }
  if (direction == BACK) {
    if (ac == 2) {
      return 5;
    }
    if (ac == 3) {
      return 2;
    } 
    if (ac == 4) {
      return 3;
    }
  }

  return 5;
}



