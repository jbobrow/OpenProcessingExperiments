
//ten buttons, implement all paint types
boolean[] colors = new boolean[10];
PVector[] centers = new PVector[10];
float diam = 400/5;
float radi = diam/2; 

void setup() {
  size(400, 200);
  smooth();



  for (int i = 0; i< colors.length; i++) {
    if (i<5) {
      colors[i] = true;
    } 
    else {
      colors[i] = false;
    }
  }
  float yPos = height/4;
  for (int i = 0; i< centers.length; i++) {
    float xPos = ((i%5)+1)*diam-radi;
    if (i>4) {
      yPos = 3*height/4;
    }

    PVector pos = new PVector(xPos, yPos);
    centers[i] = pos;
  }
}


void draw() {
  background(255);
  drawButtons();
}

void drawButtons() {
  for (int i = 0; i< colors.length; i++) {

    if (colors[i]) {
      fill(0);
    } 
    else {
      fill(255);
    }
    ellipse(centers[i].x, centers[i].y, radi*2, radi*2);
    drawArrows(colors[i], centers[i], i);
  }
}

//⇈
//⇊
//↨
//↑
//↓
void drawArrows(boolean col, PVector pos, int i) {
  float x = pos.x;
  float y = pos.y;
  if (col) {
    fill(255);
  } 
  else { 
    fill(0);
  }
  switch(i%5) {
  case 0:

    text("↨", x, y);
    break;
  case 1:
    text("⇊", x, y);
    break;
  case 2:
    text("⇈", x, y);
    break;
  case 3:
    text("↓", x, y);
    break;
  case 4:
    text("↑", x, y);
    break;
  }
}

void mousePressed() {
  float x = mouseX;
  float y = mouseY;
  for (int i = 0; i < centers.length; i ++) {
    if (isInCircle(centers[i], radi, x, y)) {
      switch(i%5) {
      case 0:
        colors[i] = !colors[i];
        break;
      case 1:
        colors[i] = !colors[i];
        break;

      case 3:
        if (i>4) {
          colors[i] = true;
        }
        else {
          colors[i] = false;
        }
        break;
      case 4:

        break;
      }
    }
  }
}


void mouseReleased() {
  float x = mouseX;
  float y = mouseY;
  for (int i = 0; i < centers.length; i ++) {
    if (isInCircle(centers[i], radi, x, y)) {
      switch(i%5) {
      case 0:
        colors[i] = !colors[i];
        break;

      case 2:
        colors[i] = !colors[i];
        break;

      case 4:
        if (i>4) {
          colors[i] = true;
        }
        else {
          colors[i] = false;
        }
        break;
      }
    }
  }
}

boolean isInCircle(PVector cen, float radi, float mX, float mY) {
  float distance = dist(cen.x, cen.y, mX, mY);
  return (distance<= radi);
}
