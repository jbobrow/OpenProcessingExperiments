
/** IttenDemo © 07/22/2013 by Peter Bosshard Schneider<br />
*   A Demonstration of a IttenColourCircle class which creates the 12 part colour circle of Johannes Itten.*/

IttenColourCircle[] icc;
int num_circles = 1; // 4 if you want 4 of them
float s;



void setup() {
  //size(displayWidth, displayHeight);
  size(500, 500);
  background(0);
  //s = height/2; // in case you want 4 of them
  icc = new IttenColourCircle[num_circles];
  icc[0] = new IttenColourCircle(new PVector(width/2, height/2), height); // comment this line if you want 4 of them
  //  uncomment the following lines if you want 4 of them
  //  icc[0] = new IttenColourCircle(new PVector(width/2-s/2, height/2-s/2), s);
  //  icc[1] = new IttenColourCircle(new PVector(width/2+s/2, height/2-s/2), s);
  //  icc[2] = new IttenColourCircle(new PVector(width/2-s/2, height/2+s/2), s);
  //  icc[3] = new IttenColourCircle(new PVector(width/2+s/2, height/2+s/2), s);
}

void draw() {
  background(0);
  for (int i=0;i<num_circles;i++) {
    icc[i].display();
  }
}

class IttenColourCircle {
  PVector location = new PVector(50, 50);
  float side = 100;
  color[] clrs;
  float seg_ang = TWO_PI/12.0;
  float start_ang = 0;
  float r_ang = TWO_PI/24;
  float o_ang = 5*r_ang;
  float y_ang = 9*r_ang;
  float g_ang = 13*r_ang;
  float b_ang = 17*r_ang;
  float v_ang = 21*r_ang;

  IttenColourCircle(PVector origin, float diameter) {
    location = origin;
    side = diameter;
    clrs = new color[12];
    clrs[0] = color(255, 0, 63); // red
    clrs[1] = color(255, 63, 0); // red-orange
    clrs[2] = color(255, 127, 0); // orange
    clrs[3] = color(255, 190, 0); // yellow-orange
    clrs[4] = color(255, 255, 63); // yellow
    clrs[5] = color(190, 255, 0); // yellow-green
    clrs[6] = color(0, 255, 63); // green
    clrs[7] = color(0, 190, 190); // green-blue
    clrs[8] = color(0, 63, 255); // blue
    clrs[9] = color(63, 0, 255); // blue-violett
    clrs[10] = color(127, 0, 127); // violett
    clrs[11] = color(190, 0, 127); // red-violett
  }

  void display() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(y_ang);
    noStroke();
    smooth();
    // tertiary colours
    for (int i=0;i<12;i++) {
      fill(clrs[i]);
      arc(0, 0, side, side, start_ang+i*seg_ang, seg_ang+start_ang+i*seg_ang);  // PIE parameter doesn't work in PJS
    }

    fill(0);
    ellipse(0, 0, side*0.6, side*0.6);

    // secondary colours
    fill(clrs[2]);
    triangle(cos(r_ang)*side*0.3, sin(r_ang)*side*0.3, cos(o_ang)*side*0.3, sin(o_ang)*side*0.3, cos(y_ang)*side*0.3, sin(y_ang)*side*0.3);
    fill(clrs[6]);
    triangle(cos(y_ang)*side*0.3, sin(y_ang)*side*0.3, cos(g_ang)*side*0.3, sin(g_ang)*side*0.3, cos(b_ang)*side*0.3, sin(b_ang)*side*0.3);
    fill(clrs[10]);
    triangle(cos(b_ang)*side*0.3, sin(b_ang)*side*0.3, cos(v_ang)*side*0.3, sin(v_ang)*side*0.3, cos(r_ang)*side*0.3, sin(r_ang)*side*0.3);
    // primary colours
    fill(clrs[0]);
    quad(0, 0, cos(v_ang)*side*0.15, sin(v_ang)*side*0.15, cos(r_ang)*side*0.3, sin(r_ang)*side*0.3, cos(o_ang)*side*0.15, sin(o_ang)*side*0.15);
    fill(clrs[4]);
    quad(0, 0, cos(o_ang)*side*0.15, sin(o_ang)*side*0.15, cos(y_ang)*side*0.3, sin(y_ang)*side*0.3, cos(g_ang)*side*0.15, sin(g_ang)*side*0.15);
    fill(clrs[8]);
    quad(0, 0, cos(g_ang)*side*0.15, sin(g_ang)*side*0.15, cos(b_ang)*side*0.3, sin(b_ang)*side*0.3, cos(v_ang)*side*0.15, sin(v_ang)*side*0.15);
    popMatrix();
  }
}



