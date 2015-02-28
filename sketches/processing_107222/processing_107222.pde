
//  space ... change each node's place
//  click or move ... rapid rotation
//  x, X, y, Y, z, Z ... slow rotation
float[] x, y, z, x2, y2, z2;
float thetaX = 0, thetaY = 0, thetaZ = 0, mx = 0, my = 0;
int N = 100;

void mouseClicked(){
  my += 8;
}

void keyPressed(){
  switch (key){
    case ' ': resetPath(x2, y2, z2); break;
    case 'x': thetaX += radians(1); break;
    case 'X': thetaX -= radians(1); break;
    case 'y': thetaY += radians(1); break;
    case 'Y': thetaY -= radians(1); break;
    case 'z': thetaZ += radians(1); break;
    case 'Z': thetaZ -= radians(1); break;
  }
}

void setup(){
  size(500, 500, P3D);
  x = new float[N];
  y = new float[N];
  z = new float[N];
  x2 = new float[N];
  y2 = new float[N];
  z2 = new float[N];
  resetPath(x2, y2, z2);
  for (int i = 0; i < N; i++) x[i] = y[i] = z[i] = 0;
}

void resetPath(float x[], float y[], float z[]){
  x[0] = y[0] = z[0] = 0;
  for (int i = 1; i < N; i++){
    x[i] = x[i-1] + random(-30, 30);
    y[i] = y[i-1] + random(-30, 30);
    z[i] = z[i-1] + random(-30, 30);
  }
}

void draw(){
  background(255, 255, 240);
  //lights();
  translate(width/2, height/2);
  if (abs(mouseX - pmouseX) > 10 && frameCount > 10){
    my = (mouseX - pmouseX) * 0.2;
  } else {
    if (my > 0) my -= 0.05;
    else if (my < 0) my += 0.05;
  }
  thetaY += radians(my);
  if (abs(mouseY - pmouseY) > 10 && frameCount > 10){
    mx = (pmouseY - mouseY) * 0.2;
  } else {
    if (mx > 0) mx -= 0.05;
    else if (mx < 0) mx += 0.05;
  }
  thetaX += radians(mx);
  rotateX(thetaX);
  rotateY(thetaY);
  rotateZ(thetaZ);

  stroke(255, 0, 0, 50);
  for (int j = -750; j < 750; j+= 100){
    pushMatrix();
    translate(0, 0, j);
    box(2);
    popMatrix();
  }
  for (int j = 0; j < 2; j++){
    drawPath(x, y, z);
    drawPath(y, z, x);
    drawPath(z, x, y);
    for (int i = 0; i < N; i++){
      x[i] *= -1;
      y[i] *= -1;
      z[i] *= -1;
    }
  }
  for (int i = 0; i < N; i++){
    x[i] += (x2[i] - x[i]) / 20 + random(-1, 1);
    y[i] += (y2[i] - y[i]) / 20 + random(-1, 1);
    z[i] += (z2[i] - z[i]) / 20 + random(-1, 1);
  }
}

void drawPath(float x[], float y[], float z[]){
  for (int i = 0; i < N; i++){
    pushMatrix();
    translate(x[i], y[i], z[i]);
    stroke(0, 50);
    fill(255, 255, 150, 50);
    box(4);
    if (i+1 < N){
      stroke(0, 150 + dist(0, 0, 0, x[i+1]-x[i], y[i+1]-y[i], z[i+1]-z[i]) % 100);
      line(0, 0, 0, x[i+1]-x[i], y[i+1]-y[i], z[i+1]-z[i]);
      translate((x[i+1]-x[i])/2, (y[i+1]-y[i])/2, (z[i+1]-z[i])/2);
      fill(220, 255, 200, 140);
      ellipse(0, 0, x[i+1]-x[i], y[i+1]-y[i]);
    }
    popMatrix();
  }
}

