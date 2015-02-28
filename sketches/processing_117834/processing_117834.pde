
float tmpX = 0.0, tmpY = 0.0, tmpZ = 0.0;
float tmpXm = 0.0 , tmpYm = 0.0, tmpZm = 0.0;
int moveX = width / 2, moveY = height / 2, moveZ = -800;
int unit = 10;
int concentration = 600;
int valueX = 0, valueY = 0, valueZ = 0;
int angle;

void setup() 
{
  size(500, 500, P3D);
  background(0); 
  noStroke();
  fill(204);
  sphereDetail(30);
  frameRate(60);
  angle = 0;
}

void draw() 
{
  ambientLight(90, 70, 40);
  directionalLight(51, 102, 126, 0, -1, 0);
  spotLight(80, 60, 50, 360, 160, 600, 0, -1, -1, PI/2, 600); 

  angle += 1;
  if(angle > 360) angle = 0;

//  fade();
  pushMatrix();
  translate( width / 2, height / 2, -1000);

  float dirY = (mouseY / float(height) - 0.5) * 2;
  float dirX = (mouseX / float(width) - 0.5) * 2;
  directionalLight(110, 80, 120, -dirX, -dirY, -1);

rotation();
ranPos();
ranColor();
  translate(sin(tmpX)*10, cos(tmpY)*10, moveZ);
  sphere(30);

rotation();
ranPos();
ranColor();
  translate(sin(tmpXm)*150, cos(tmpYm)*200, moveZ);
  sphere(20);

popMatrix();

ranPos();
ranColor();
  translate(sin(tmpX)*300, cos(tmpY)*300, moveZ);
  sphere(40);

rotation();
ranPos();
ranColor();
  translate(sin(tmpXm)*350, cos(tmpYm)*350, moveZ);
  sphere(50);

}

void fade(){
   fill(0, 5);
   noStroke();
   rectMode(CORNER);
   rect(0, 0, width, height);
}

void ranPos(){
  tmpX = tmpX + random(0.00,0.01);
  tmpY = tmpY + random(0.00,0.01);
  tmpXm = tmpXm - random(0.00,0.01);
  tmpYm = tmpYm - random(0.00,0.01);
}

void ranColor(){
  fill(random(100,255),random(100,255),random(100,255),random(0,255));
}

void rotation(){
  rotateX(radians(angle));
  rotateY(radians(-angle));
  rotateZ(radians(angle*2));
}

void keyPressed(){
  if (key == CODED) {    
    if (keyCode == UP) { moveY = moveY - unit; } else 
    if (keyCode == DOWN) { moveY = moveY + unit; } else
    if (keyCode == LEFT) { moveX = moveX - unit; } else 
    if (keyCode == RIGHT) { moveX = moveX + unit; } else
    if (keyCode == SHIFT) { moveZ = moveZ - unit; } else 
    if (keyCode == CONTROL) { moveZ = moveZ + unit; }
  } else {
    if (key == 'z' || key == 'Z') { unit = unit - 10; } else
    if (key == 'x' || key == 'X') { unit = unit + 10; }
  }

}

void mouseWheel(MouseEvent event) {
  float e = event.getAmount();
  moveZ = moveZ + int(e) * unit;
  println(e);
}

void mousePressed(){
if( mouseButton == LEFT ) {
  background(0); 
} else if( mouseButton == CENTER ) {
  moveX = width / 2; moveY = height / 2; moveZ = 0;
} else if( mouseButton == RIGHT ) {
  background(255); 
  }
}

void mouseDragged() 
{
  valueX = valueX + 5;
  valueY = valueY + 5;
  if (valueX > width) { valueX = 0; }
  if (valueY > height) { valueY= 0; }
}


