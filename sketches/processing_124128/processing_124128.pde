
float orbitfactor;
float snowfypos = 200;

void setup() {
  size(400, 400);
}

void draw() {
  fill(0);
  rect(-200, -200, 800, 800);
  translate(width/2, height/2);
  mainobject();
  orbitals1();
  snowfall();
  translate(width/2, height/4);
  mainobject();
}
void mainobject() {
  for(int i = 0; i < 20; i++){
  rotate(PI/3);
  fill(205, 173, 0);
  ellipse(0, 0, 25, 25);
  stroke(255);
  line(25, 0, 75, 0);
  line(25, 0, 25, 75);
  line(50, 0, 25, -50);
  line(25, 0, 50, -25);
  }
}

void orbitals1() {
  fill(139, 117, 0);
  rotate(PI/3 + orbitfactor);
  orbitfactor += 0.01;
  ellipse(100, 0, 5, 5);
  ellipse(-100, 0, 5, 5);
  stroke(238, 201, 0);
  line(100, 0, -100, 0);
  stroke(139, 35, 35);
  noFill();
  bezier(100, 0, 0, 25, 0, -25, -100, 0);
}

void snowfall() {
  fill(255);
  ellipse(random(-200, 200), snowfypos, 5, 5);
  snowfypos -= 1;
}
