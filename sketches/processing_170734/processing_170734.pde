
float rSize; 
float rx, ry; 
float tx; 
float angleR;
float angleStep; 
boolean strokeOn = true; 

void setup() {
  size(400, 400); 
  background(255); 
  smooth(); 

  rSize = 50;
  angleR = 0; 
  rx = -rSize; 
  ry = -rSize;     
  tx = 0;    
  angleStep = 0.5;
}

void draw() {
  background(255); 
  if (strokeOn) {
    stroke(210);
  } else {
    noStroke();
  }

  int counter = 0; 
  int countStart = 0;  
  for (float my = rSize; my <= height+rSize; my += rSize) {

    counter = (countStart%2 == 0) ? 0 : 1;  

    for (float mx = tx-rSize; mx <= width+rSize; mx += rSize) {      
      pushMatrix();
      if (counter%2 == 0) { 
        fill(0); 
        translate(mx, my);
        rotate(radians(constrain(angleR, 0, 90)));
      } else {
        fill(255); 
        translate(mx-rSize, my);
        rotate(radians(90-constrain(angleR, 0, 90)));
      }      
      rect(rx, ry, rSize, rSize);    
      popMatrix();
      counter++;
    }

    countStart++;
  }

  angleR += angleStep; 
  if (angleR > 95) {    
    angleR = 0;
    if (tx >= rSize) { 
      tx = 0;
    } else { 
      tx += rSize;
    }
  }
}

void keyReleased(){
  if(key == 'g' || key == 'G'){
    strokeOn = (strokeOn) ? false : true; 
  }
}


