
int angle = 0;

void setup() { // 
  size (550,700);
  background (104,157,78);
}

void draw() { //
 
    if (mousePressed == true) {
    angle += 5000;
    float val = cos(radians(angle)) * 90.0;
    for (int a = 0; a < 360; a += 20) {
      float xoff = cos(radians(a)) * val;
      float yoff = sin(radians(a)) * val;
      noFill();
      ellipse(mouseX + xoff, mouseY + yoff, val, val);
    }
  }
 
  stroke(139,147,128,200);
  arc(50, 55, 50, 50, 0, HALF_PI);
  fill(46,206,219);
  arc(50, 55, 60, 60, HALF_PI, PI);
  arc(50, 55, 70, 70, PI, PI+QUARTER_PI);
  arc(50, 55, 80, 80, PI+QUARTER_PI, TWO_PI);
  if (mousePressed == true) {
    angle += 5000;
    float val = cos(radians(angle)) * 90.0;
    for (int a = 0; a < 360; a += 20) {
      float xoff = cos(radians(a)) * val;
      float yoff = sin(radians(a)) * val;
      fill(mouseX,mouseY,110);
      ellipse(mouseX + xoff, mouseY + yoff, val, val);
    }
  }
 
  stroke(138,144,130,200);
  arc(100, 110, 100, 100, 0, HALF_PI);
        fill(227,178,0,200);
  arc(100, 110, 120, 120, HALF_PI, PI);
  fill(168,229,116,100);
  arc(100, 110, 140, 140, PI, PI+QUARTER_PI);
  arc(100, 110, 160, 160, PI+QUARTER_PI, TWO_PI);
  
  
  if (mousePressed == true) {
    angle += 5000;
    float val = cos(radians(angle)) * 90.0;
    for (int a = 0; a < 360; a += 20) {
      float xoff = cos(radians(a)) * val;
      float yoff = sin(radians(a)) * val;
      noFill();
      ellipse(mouseX + xoff, mouseY + yoff, val, val);
    }
  }
  stroke(109,124,90,200);
  arc(200, 220, 200, 200, 0, HALF_PI);
  fill(149,209,67);
  arc(200, 220, 120, 120, HALF_PI, PI);
  arc(200, 220, 280, 280, PI, PI+QUARTER_PI);
  fill(46,206,219,100);
  arc(200, 220, 320, 320, PI+QUARTER_PI, TWO_PI);
 
    stroke(82,90,70,200);
    arc(400, 440, 400, 400, 0, HALF_PI);
    fill(227,178,0);
  arc(400, 440, 240, 240, HALF_PI, PI);
      fill(227,178,0,200);
  arc(400, 440, 560, 560, PI, PI+QUARTER_PI);
        fill(226,229,63,100);
          arc(400, 440, 640, 640, PI+QUARTER_PI, TWO_PI);

 }


