
///////////////////////////
//                       //
//   -~=Manoylov AC=~-   //
//                       //
///////////////////////////
//
// Don't use without permission
//
// Based on:
// #502 Stack of spheres
// http://geometrydaily.tumblr.com/post/57702430526/502-stack-of-spheres-another-piece-inspired-by
//
// Controls:
// LeftMouseClick   - remove one line 
// RightMouseClick  - add one line 
//
// Keys:
// Q  = circle diametr -5 
// W  = circle diametr +5
// A  = space between circles -10
// S  = space between circles +10
// M  = on/off multiply   (don't work in browser)
//
/////////////////////////////////////////////////

int sz = 700;
int bottomLine = 5;
float diam = 100;
float stepX = diam + diam/20;
float stepY = sqrt ( stepX*stepX - ((stepX/2) * (stepX/2)));
float corrStepY = ((int)stepY/2 + (int)(stepX-stepY))+1.5;
//float startposX = sz/2 - (i-1)*stepY/2;
float startposY = sz/2 - ((bottomLine-2)*(stepY/2 + (stepX-stepY)) ) ;
boolean multMode = false;


void setup() {
  size(sz, sz, P2D);
  smooth(8);
  setMath();
  noLoop();
  noStroke();
}

void draw() {
  background(235);
  StackOfSpheres();
  if(multMode){
  blendMode(NORMAL);
  }
  paper();
}

void paper() {
  noStroke();
  for (int i = 0; i<width-1; i+=2) {
    for (int j = 0; j<height-1; j+=2) {
      fill(random(235-40, 235+30), 25);
      rect(i, j, 2, 2);
    }
  }

  for (int i = 0; i<30; i++) {
    fill(random(130, 215), random(50, 100));
    rect(random(0, width-2), random(0, height-2), random(1, 3), random(1, 3));
  }
}

void mousePressed() {
  if (mouseButton == RIGHT) {
    bottomLine--;
  }
  if (mouseButton == LEFT) {
    bottomLine++;
  }
  bottomLine = constrain(bottomLine, 1, 7);

  //saveFrame("img-###.png");
  redraw();
}

void keyPressed() {
  if (key == 'q') {
    diam-=5;
  }
  if (key == 'w') {
    diam+=5;
  }
  if (key == 'a') {
    stepX-=10;
  }
  if (key == 's') {
    stepX+=10;
  }
  if (key == 'm') {
    multMode = !multMode;
  }

  diam = constrain(diam, 10, 150);
  stepX = constrain(stepX, 10, 150);
  setMath();

  redraw();
}

void setMath() {
  stepY = sqrt ( stepX*stepX - ((stepX/2) * (stepX/2)));
  startposY = sz/2 - ((bottomLine-2)*(stepY/2 + (stepX-stepY)) ) ;
  corrStepY = (stepY/2 + (stepX-stepY))+1.5;
}

void StackOfSpheres() {

  if (multMode) {
    fill(#2E4847);
    blendMode(MULTIPLY);
  } else {
    fill(#074844, 150);
  }
  
  for (float k=bottomLine; k>0; k--) {
    float kz = (sz/2 - ((k-2) * corrStepY)) ;
    for (float i= 0, y = kz ; i<k; i++, y+=stepY) {
      for (float j= 0, x = sz/2 - i*(stepX/2); j<=i; j++, x+=stepX) {
        ellipse(x, y, diam, diam);
      }
    }
  }
}

