
float rSize; 
float rx, ry; 
float tx; 
float angleR;
float angleStep; 
boolean gridOn = false; 

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
  if (gridOn) {
    drawGrid();
  } 
  noStroke(); 
  fill(0);   

  int counter = 0; 
  float xStart = 0; 

  for (float my = rSize; my <= height+rSize; my += rSize) {
    xStart = (counter%2 == 0) ? tx : tx-rSize;  
    xStart = tx-rSize; 

    for (float mx = xStart; mx <= width+rSize; mx += 2*rSize) {
      pushMatrix();
      if (counter%2 == 0) { 
        translate(mx, my);
        rotate(radians(constrain(angleR, 0, 90)));
      } else {
        translate(mx-rSize, my);
        rotate(radians(90-constrain(angleR, 0, 90)));
      }

      rect(rx, ry, rSize, rSize);    
      popMatrix();
    }
    counter++;
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

void drawGrid() {  
  stroke(200); 
  for (float y = 0; y < height; y += rSize) {
    line(0, y, width, y);
  }
  for (float x = 0; x < width; x += rSize) {
    line(x, 0, x, height);
  }
}

void keyReleased(){
  if(key == 'g' || key == 'G'){
    gridOn = (gridOn) ? false : true; 
  }
}


