
//int numCircle = 50;
//
//float[] circX = new float[numCircle];
//float[] circY = new float[numCircle];
//
//float[] velX = new float[numCircle];
//float[] velY = new float[numCircle];
//
//float gravity = 0.6;
//
//float cR[] = new float[numCircle];
//float cG[] = new float[numCircle];
//
//void setup() {
//  size(500, 500);
//  smooth();
//  noStroke();
//  
//  for (int i = 0; i < numCircle; i++) {
//    circX [i] = random(width);
//    circY [i] = random(height);
//    velX [i] = random(10);
//    velY [i] = random(10);
//  }
//}
//
//void draw() {
//  background(255, 192, 203);
//  
//  for (int i = 0; i < numCircle; i++) {
//    
////    fill(150);
//    
//    circX [i] += velX [i];
//    circY [i] += velY [i];
//    
//    velY[i] += gravity;
//    
//    if (circX[i] < 0 || circX[i] > width) {
//      velX[i] *= -1;
//    }
//    if (circY[i] < 0 || circY[i] > height) {
//      cR[i] = random(50, 255);
//      cG[i] = random(100, 255);
//      velY[i] *= -0.75;
//      velX[i] *= 0.75;
//    }
//    if (circY[i] > height) {
//      circY[i] = height - 10;
//    }
//    
//    fill(cR[i], cG[i], 255, 150);
//    ellipse(circX [i], circY [i], i + 10, i + 10);
//    
//  }
//}


int leftCounter = 0;
int rightCounter = 0;

int clicks[] = new int[2];
int circX;
int circY = 10;


void setup() {
  clicks[0] = leftCounter;
  clicks[1] = rightCounter;

  size(500, 500);
  background(#ededed);
  noStroke();
  fill(255, 0, 0);
  rect(0, 0, width/2, height);

  fill(0, 255, 0);
  rect(width/2, 0, width/2, height);

  textAlign(LEFT);
  fill(255);
  text("No", 50, height/2);

  textAlign(RIGHT);
  fill(0);
  text("Yes", 450, height/2);

  fill(255);
  stroke(0);
  strokeWeight(1);
  rectMode(CENTER);
  rect(width/2 - 25, 4*height/5, 50, 50);
  rect(width/2 + 25, 4*height/5, 50, 50);
}


void draw() {
  fill(255);
  stroke(0);
  strokeWeight(1);
  rectMode(CENTER);
  rect(width/2 - 25, 4*height/5, 50, 50);
  rect(width/2 + 25, 4*height/5, 50, 50);

  textAlign(CENTER);

  fill(255, 0, 0);
  text(leftCounter, width/2 - 25, 4*height/5);
  fill(0, 255, 0);
  text(rightCounter, width/2 + 25, 4*height/5);
}

void addMarkers() {
  smooth();
  fill(255);
  noStroke();

  if (circX > 100) {
    circX = 20;
    circY += 20;
  }
  else { 
    circX += 20;
  }
  ellipse(circX, circY, 10, 10);
}


void mouseReleased() {
  if (mouseX > width/2) {
    rightCounter++;
  }
  if (mouseX < width/2) {
    leftCounter++;
  }
  addMarkers();
}


