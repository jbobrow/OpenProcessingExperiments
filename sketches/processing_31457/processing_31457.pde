
float a, spd;
boolean bGuide;
int mode;

//----------------------------------------------------------------------

void setup() {
  size(600, 500);
  smooth();
  textAlign(CENTER, CENTER);
  
  a = 0.0;
  spd = 0.01;
  bGuide = false;
  mode = 1;
}

//----------------------------------------------------------------------

void keyPressed() {
  if (key==' ') bGuide = !bGuide;
  if (int(key) > 48 && int(key) < 55) mode=int(key)-48;
}

//----------------------------------------------------------------------

void draw() {
  background(100, 110, 130);
  fill(180);
  text("These four rings are perfectly concentric and rotating at the same speed.", width/2, height-45);
  text("The 'wobble' is the effect of the illusion.", width/2, height-30);
  text("Press the space key to toggle the guidelines and use number keys (1-6) to change the mode.", width/2, height-15);  
  switch (mode) {
    case 1: text("Mode: 1 (CW Alternating)", 80, 15); break;
    case 2: text("Mode: 2 (CW Outward)", 80, 15); break;
    case 3: text("Mode: 3 (CW Inward)", 80, 15); break;
    case 4: text("Mode: 4 (CCW Alternating)", 80, 15); break;
    case 5: text("Mode: 5 (CCW Inward)", 80, 15); break;
    case 6: text("Mode: 6 (CCW Outward)", 80, 15); break;
  }
  noFill();
  
  translate(width/2, height/2-30);
  
  //draw the four rings...
  a = (a + (mode > 3 ? -spd : spd)) % TWO_PI;
  drawRing(100, (mode ==2 || mode == 5));
  drawRing(130, (mode !=3 && mode != 6));
  drawRing(160, (mode ==2 || mode == 5));
  drawRing(190, (mode !=3 && mode != 6));
}

//----------------------------------------------------------------------

void drawRing(int rad, boolean bShift) {
  float gap = PI/rad*10; //get a consistent gap between boxes...
  for (float ang = 0.0; ang<TWO_PI; ang+=gap) { //box count depends on gap size (which depends on radius)
    pushMatrix();
      rotate(a + ang);
      if (bGuide) { stroke(70, 100, 120); line(0,0, 0, rad); }
      translate(-5, rad); //squares are 10x10, the -5 is for centering
      drawBox(bShift);
    popMatrix();
  }
  if (bGuide) { stroke(70, 100, 120); ellipse(0,0, rad*2+10, rad*2+10); }
}

//----------------------------------------------------------------------

void drawBox(boolean bShift) {
  stroke(70, 80, 100); //darker lines
  line(0,10, 10,10); //bottom
  if (bShift) 
    line(0,0, 0,10); //left
  else 
    line(10,0, 10,10); //right
    
  stroke(130, 140, 160); //brighter lines
  line(0,0, 10,0); //top
  if (bShift) 
    line(10,0, 10,10); //right
  else 
    line(0,0, 0,10); //left
}



