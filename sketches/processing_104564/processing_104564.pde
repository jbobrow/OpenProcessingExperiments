
float x = 100;
float y = 100;
float angle1 = 0.0;
float segLength = 50;

void setup() {
  size(400,400);
  strokeWeight(20.0);
  stroke(255, 100);
}

void draw() {
  background(0);
  
  float dx = mouseX - x;
  float dy = mouseY - y;
  angle1 = atan2(dy, dx);  
  x = mouseX - (cos(angle1) * segLength);
  y = mouseY - (sin(angle1) * segLength);
 
  segment(x, y, angle1); 
  ellipse(x, y, 20, 20);
}

void segment(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
background(#CE901B);
stroke(0);
strokeWeight(5);
line(40,40,40,80);
line(40,40,120,40);
line(80,80,120,80);
line(80,80,80,120);
line(40,120,120,120);
line(40,120,40,160);
line(0,160,80,160);
line(120,0,120,40);
line(80,160,80,240);
line(80,240,120,240);
line(40,200,40,280);
line(40,280,80,280);
line(80,280,80,320);
line(120,280,160,280);
line(120,280,120,320);
line(40,320,40,400);
line(80,360,80,400);
line(80,360,160,360);
line(160,320,160,360);
line(120,160,160,160);
line(160,120,160,160);
line(160,40,160,80);
line(160,80,200,80);
line(200,80,200,120);
line(200,120,240,120);
line(120,200,200,200);
line(200,160,200,240);
line(160,200,160,140);
line(200,280,200,360);
line(200,360,240,360);
line(240,200,240,400);
line(240,200,320,200);
line(320,200,320,160);
line(280,240,280,360);
line(280,320,320,320);
line(320,280,360,280);
line(360,240,360,280);
line(320,280,320,400);
line(200,40,360,40);
line(280,40,280,160);
line(360,0,360,80);
line(320,80,320,120);
line(320,120,400,120);
line(360,120,360,160);
}
