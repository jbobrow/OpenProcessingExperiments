
void setup() {
  size (500, 500);
  smooth();
  background (200);
  strokeWeight (1);
}


void draw() {
  //space
  for (int i=0; i<50000; i++) {
    float rx = random (0, 500);        
    float ry = random(0, 500); 

    float rGray = random(0, 55); 
    fill(rGray); 
    noStroke ();
    ellipse (rx, ry, 20, 20) ;
  }

  if (mousePressed == true) {
    for (int i=0; i<50000; i++) {
      float rx = random (0, 500);        
      float ry = random(0, 500); 

      float rGray = random(200, 255); 
      fill(rGray); 
      noStroke ();
      rect (rx, ry, 20, 20) ;
    }
  }

  //color splash
  for (int i = 0; i <50; i++) {
    float rx = random (0, width - 50);
    float ry = random (0, height -50);
    float col = random (0, 100);

    noStroke ();
    fill (rx, col, ry, col);
    triangle (rx+350, ry+350, 250, 250, col, col);
  }

  //dots
  for (int i=0; i<200; i++) {
    float rx = random (10, 490);        
    float ry = random(10, 490); 

    float dotcol = random(0, 255); 
    fill(dotcol, rx, ry); 
    noStroke ();
    ellipse (rx, ry, 5, 5) ;
  }

  //circles
  for (int i = 0; i <50; i++) {
    float ra = random (0, width);
    float rb = random (0, height);
    float col = random (0, 55);
    float opacity = random (150, 255);

    stroke (col+200, opacity);
    strokeWeight(1);
    noFill();
    ellipse (250, 250, ra, rb);
  }

  //crown
  for (int i = 0; i <300; i++) {
    float rx = random (0, width - 100);
    float ry = random (0, height -100);
    float col = random (200, 255);

    noStroke ();
    fill (col, col, 0, col);
    triangle (rx, ry, 250, 250, col, col);
  }

  //face
  float facewidth = random (100, 150);
  float faceheight = random (120, 200);

  fill(253, 255, 202, 180);
  ellipse (250, 250, facewidth+40, faceheight+40);

  fill(255);
  noStroke();
  ellipse (250, 250, facewidth, faceheight);

  stroke(0);
  strokeWeight(4);
  float eyewidth = random(16, 25);
  float eyeball = random (2, 15);

  fill(255);
  ellipse (225, 250, eyewidth+5, eyewidth);
  ellipse (275, 250, eyewidth+5, eyewidth);
  fill (0);
  stroke (8, 228, 255);
  strokeWeight(2);
  ellipse (225, 250, eyeball, eyeball);
  ellipse (275, 250, eyeball, eyeball);

  //mouth
  stroke (255, 0, 0);
  strokeWeight (2);
  ellipse(250, 300, eyewidth*3, eyeball);

  //planets
  for (int i=1; i<9; i++) {
    float rx = random (0, 500);
    float ry = random (0, 500);

    noStroke();
    fill(rx, ry, rx-ry);
    ellipse(rx, ry, 50, 50);
  }
}
                
