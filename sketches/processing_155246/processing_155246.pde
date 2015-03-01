
color hintergrund = color (10, 7, 41);
color linienfarbe = color (99, 58, 81);
color linienfarbe2 = color (179, 170, 182);
color linienfarbe3 = color (68, 45, 69);
color linienfarbe4 = color (75, 36, 68);

void setup() {
  size(600, 600);
}

void draw() {
  background(hintergrund);

  stroke (linienfarbe);
  noFill ();
  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount / 200.0);
  polygon(0, 0, 250, 6); 
  popMatrix();

  stroke (linienfarbe2);
  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount / 50.0);
  polygon(0, 0, 250, 6); 
  popMatrix();

  stroke (linienfarbe3);
  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount / -200.0);
  polygon(0, 0, 250, 6); 
  popMatrix();
  
  stroke (linienfarbe4);
  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount / 150.0);
  polygon(0, 0, 250, 6); 
  popMatrix();
}

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

/*
void keyPressed ()
{
  
  if (key == ' ') {seed = (int)random(0,1000);
  }
}
*/

