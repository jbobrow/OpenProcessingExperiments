

float center = 250;
int delayTime = 50;
int shapeNumb = 3;
int rectW = 20;
int rectH = 50;
float rad = 15;

boolean stage1 = true;
boolean stage2 = false;
boolean stage3 = false;
boolean stage4 = false;
boolean stage5 = false;
boolean stage6 = false;
boolean stage7 = false;

//boolean stillSaving = true;




void setup () {

  size (500, 500);  
  stroke (255);
  fill(240);
  smooth();
}




void draw () {
  background (0);

  if (stage1) {
    ring(rectW, rectH, rad, shapeNumb);
    shapeNumb++;
    delay(20);
    if (shapeNumb > 15) {
      stage2 = true;
      stage1 = false;
    }
  }

  if (stage2) {
    ring(rectW, rectH, rad, shapeNumb);
    rad += 2;
    if (rad > 140) {
      stage3 = true;
      stage2 = false;
    }
  }
  if (stage3) {
    ring(rectW, rectH, rad, shapeNumb);    
    shapeNumb--;
    if (shapeNumb < 6) {
      stage4 = true;
      stage3 = false;
    }
  }


  if (stage4) {
    ring(rectW, rectH, rad, shapeNumb);    
    rad -= 2;
    rectH += 2;    
    if (rectH > 100) {
      stage5 = true;
      stage4 = false;
    }
  }

  if (stage5) {
    ring(rectW, rectH, rad, shapeNumb);
    rad -= 2;
    rectW += 2;    
    if (rad < 15) {
      stage5 = false;
      stage6 = true;
    }
  }


  if (stage6) {
    ring(rectW, rectH, rad, shapeNumb);  
    rectH -= 2;    
    if (rectH <= 50) {
      stage6 = false;
      stage7 = true;
    }
  }

  if (stage7) {
    ring(rectW, rectH, rad, shapeNumb); 
    rectW -= 2;    
    if (rectW <= 20) {
      stage7 = false;
      stage1 = true;
      //stillSaving = false;
    }
  }

  delay(delayTime);
 // if (stillSaving) saveFrame();
}





void ring (int rectWidth, int rectHeight, float radius, int numberOfShapes) {


  float x, y;
  float degAdd = 360/numberOfShapes;
  float deg = 0;

  for  ( int i = 0 ; i < numberOfShapes ; i++) {

    float angle = radians(deg);
    x =  center + (cos(angle) * radius);
    y =  center + (sin(angle) * radius);
    pushMatrix();
    translate (x, y);

    rotate (radians(deg));
    rect (0, 0, rectWidth, rectHeight);
    deg += degAdd;

    popMatrix();
  }
}


