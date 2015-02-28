
float angle = 0.0; 
float scalar = 70;
float speed = 0.01;
float adjust = 0;
int degree = 20;

float cor1 = 0;
float cor2 = 0;
float cor3 = 0;


color bcol = #F8E88D;
color scol = #3BAA91;
void setup() {
  size(500, 500); // Set the screen Size
  smooth(); // Render Smoothly
  noStroke();
}

void draw() {
  background(bcol); // set the background color
  float s =  sin(angle) * scalar; 
  float c =  cos(angle) * scalar; 
  angle += speed; 

  for (int i = 0; i < 360; i += degree) {
    shape(250, scol, i, s, c);
  }
}
void shape(int pos, int col, int r, float s, float c) {

  fill(col);  
  pushMatrix(); 
  translate(pos, pos); 
  rotate(radians(r)); 

  beginShape();
  vertex((cor1+50)+s, -(c));
  vertex((cor2+0)+s, -(cor2+50-c)); 
  vertex(-(80+c+cor3), -(cor3+c));
  endShape(CLOSE); 

  popMatrix();
}

void mousePressed() {
  speed =  0.06;
}
void keyPressed() {
  if (key == 'a') {
    cor1 += 1;
  }
  if (key == 'A') {
    cor1 -= 1;
  }

  if (key == 's') {

    cor2 += 1;
  }
  if (key == 'S') {
    cor2 -= 1;
  }
  if (key == 'd') {

    cor3 += 1;
  }
  if (key == 'D') {
    cor3 -= 1;
  }

  if (key == '1') {
    degree = 10;
  }
  if (key == '2') {
    degree = 30;
  } 
  if (key == '3') {
    degree = 60;
  }
  if (key == 'r') {
    float angle = 0.0; 
    scalar = 70;
    speed = 0.02;
    adjust = 0;
    degree = 20;

    cor1 = 0;
    cor2 = 0;
    cor3 = 0;
  }

  if (key == 'i') {
    speed = 0.00;
  }
  if (key == 'o') {
    speed = 0.01;
  }
 if (key == 'p') {
    saveFrame("frames/SaveExample-####.tif");
  }


}
