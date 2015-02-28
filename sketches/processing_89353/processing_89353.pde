
boolean tooMuchOver = false;
boolean justRightOver = false;
boolean tooLittleOver = false;
boolean success = false;

float textX = 350;
float textY = 350;
 
float redDegree = 255;
float fontDegree = 255;
 
float angle = 0;
 
void setup() {
  size (700, 700);
  PFont font;
  font = loadFont ("SegoeScript-48.vlw");
  textFont(font, 32);
  ellipseMode(CENTER);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
}
 
void draw() {
  update(mouseX, mouseY);
  if (success != true) {
    if (tooMuchOver || tooLittleOver) {
      redDegree = redDegree + 1;
      fontDegree = fontDegree + 1;
 
      
      float distance = dist(mouseX, mouseY, 350, 350);
      if( distance < 100 ) {
        PVector toCenter = new PVector( 350 - mouseX, 350 - mouseY );
        toCenter.normalize();
        textX = 350 + ( map(distance, 100, 0, 0, 50 ) * toCenter.x );
        textY = 350 + ( map(distance, 100, 0, 0, 50 ) * toCenter.y );
        
       }
       
    }
    else if (justRightOver) {
      if ((abs(pmouseX - mouseX)) > 0 || (abs(pmouseY - mouseY)) > 0) {
        redDegree = redDegree - 1;
        fontDegree = fontDegree - 1;
      }
      else {
        redDegree = redDegree + 0.1;
        fontDegree = fontDegree + 0.1;
      }
    }
    if (redDegree < 0) {
      success = true;
    }
    if (redDegree > 255) {
      redDegree = 255;
    }
    if (fontDegree < 1) {
      fontDegree = 1;
    }
    if (fontDegree > 255) {
      fontDegree = 255;
    }
    color mood = color(255, redDegree, redDegree);
    color skill = color(0, fontDegree);
 
    background(mood);
    fill (skill);
    text("Foreplay", textX, textY);
  }
  if (success != false) {
 
    fill (200, 50, 50);
    rect (350, 350, 700, 700);
    noStroke();
    for (float i = -25; i < width; i += 50) {
      for (float j = 0; j < height; j += 50) {
        float d = .35 * (sin(angle) * 5) + 5;
        fill(255, 170, 170);
        beginShape();
        vertex((50 + i), (15+ j) - d);
        bezierVertex((50 + i) + d, (-5 + j) - d, (90 + i) + d, (5 + j) - d, (50 + i), (40 + j) + d);
        vertex(50 + i, (15 + j) - d);
        bezierVertex((50 + i) - d, (-5 + j) - d, (10 + i) - d, (5 + j) - d, (50 + i), (40 + j) + d);
        endShape();
 
 
        angle += 0.0004;
      }
    }
  }
}
 
void update(int x, int y) {
  if (tooMuchOver(350, 350, 300)) {
    tooMuchOver = true;
    justRightOver = false;
    tooLittleOver = false;
  }
  else if (tooMuchOver(350, 350, 400)) {
    tooMuchOver = false;
    justRightOver = true;
    tooLittleOver = false;
  }
  else {
    tooMuchOver = false;
    justRightOver = false;
    tooLittleOver = true;
  }
}
 
boolean tooMuchOver (int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2) {
    return true;
  }
  else {
    return false;
  }
}

