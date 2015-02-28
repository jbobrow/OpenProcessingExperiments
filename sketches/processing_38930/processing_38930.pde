
/*
VertexArt
 Overlay pattern uses inverse color values & 50% transparancy
 'n' for next
 's' to save as png
 '+/-' to inc/dec number of curved section
 
 */

color buff1 = #f3e1b7;
int curves = 8;

void setup() {
  size(1200, 800);
  colorMode(RGB, 255);
  smooth();
  noLoop();
}
void draw() {
  float randgrn = random(50, 255);
  float randblu = random(50, 255);
  float randred = random(50, 255);
  beginShape();
  for (int i = 0; i<5; i++) {
    background(buff1);
    fill(randred, randgrn, randblu, 255);
    vertex(random(width*0.05, width*0.95), random(height*0.05, height*0.95));
    vertex(random(width*0.05, width*0.95), random(height*0.05, height*0.95));
    for (int j = 0; j < curves; j++) {
      curveVertex(random(width*0.05, width*0.95), random(height*0.05, height*0.95));
    }
  }
  endShape();

  //overlay pattern uses inverse color values & 50% transparancy
  beginShape();
  for (int i = 0; i<10; i++) {
    fill(255-randred, 255-randgrn, 255-randblu, 125); 
    vertex(random(width*0.05, width*0.95), random(height*0.05, height*0.95));
  }
  endShape();
}

void keyPressed() {
  switch (key) {
  case 's': 
    saveFrame("RA_I-####.png"); 
    break;
  case 'n': 
    redraw(); 
    break;
  case '+': 
    curves++;
    redraw();
    break;
  case '-': 
    if (curves>1) curves--;
    redraw();
    break;
  }
}


