
//Pedro Veneziano, March 12th, Creative Computing B, Benjamin Bacon

size(700,700);
smooth();
stroke(200);
background(240);
noFill();

for(int gridx = 100; gridx <= 500; gridx += 100) {
  for (int gridy = 100; gridy <= 500; gridy += 100) {
    rect(gridx, gridy, 100, 100);
  }
}

strokeWeight(11);
strokeCap(SQUARE);
stroke(50);

//lineA
for(int Ax = 110; Ax <= 600; Ax += 100) {
  int Ay = 110;
  line(Ax, Ay, Ax + 80, Ay + 80);
  line(Ax + 80, Ay, Ax, Ay + 80);
}

//lineB
for(int Bx = 110; Bx <= 600; Bx += 100) {
  int By = 210;
  line(Bx + 80, By, Bx, By + 80);
}

//lineC
for(int Cx = 100; Cx < 600; Cx += 100) {
  int Cy = 300;
  line(Cx + 50, Cy + 10, Cx + 50, Cy + 90);
  line(Cx + 30, Cy + 40, Cx + 30, Cy + 60);
  line(Cx + 70, Cy + 40, Cx + 70, Cy + 60);
}

//lineD
for(int Dx = 100; Dx < 600; Dx += 100) {
  int Dy = 400;
  beginShape();
  vertex(Dx + 50, Dy + 30);
  vertex(Dx + 30, Dy + 30);
  vertex(Dx + 30, Dy + 50);
  endShape();
  beginShape();
  vertex(Dx + 50, Dy + 70);
  vertex(Dx + 70, Dy + 70);
  vertex(Dx + 70, Dy + 50);
  endShape();
}

//lineE
for(int Ex = 100; Ex < 600; Ex += 100) {
  int Ey = 500;
  arc(Ex + 50, Ey + 90, 80, 80, radians(180), radians(360));
}

//rowF
for(int Fy = 150; Fy < 600; Fy += 100) {
  int Fx = 150;
  ellipse(Fx, Fy, 80, 80);
}

//rowG
for(int Gy = 120; Gy < 600; Gy += 100) {
  int Gx = 220;
  rect(Gx, Gy, 60, 60);
}

//rowH
for(int Hy = 150; Hy < 600; Hy += 100) {
  int Hx = 350;
  ellipse(Hx, Hy, 40, 40);
  ellipse(Hx, Hy, 70, 70);
}

//rowI
for(int Iy = 100; Iy < 600; Iy += 100) {
  int Ix = 400;
  strokeCap(PROJECT);
  beginShape();
  vertex(Ix + 50, Iy + 20);
  vertex(Ix + 80, Iy + 50);
  vertex(Ix + 50, Iy + 80);
  vertex(Ix + 20, Iy + 50);
  endShape(CLOSE);
}

//rowJ
for(int Jy = 115; Jy < 600; Jy += 100) {
  int Jx = 530;
  rect(Jx, Jy, 40, 70);
}


