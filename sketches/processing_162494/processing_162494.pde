
size(500,500); 

background(20, 10, 100);

noStroke();
smooth();
fill(0,50,200);
float radius2 = 1.0;
for (int deg = 0; deg < 360*6; deg += 11) {
  float angle = radians(deg);
  float x = 290 + (cos(angle) * radius2);
  float y = 100 + (sin(angle) * radius2);
  ellipse(x, y, 6, 6);
  radius2 = radius2 + 0.34;
}

noStroke();
smooth();
fill(255, 0, 0);
float radius3 = 1.0;
for (int deg = 0; deg < 360*6; deg += 11) {
  float angle = radians(deg);
  float x = 370 + (cos(angle) * radius3);
  float y = 100 + (sin(angle) * radius3);
  ellipse(x, y, 6, 6);
  radius3 = radius3 + 0.34;
}

noStroke();
smooth();
fill(242, 204, 47);
float radius4 = 1.0;
for (int deg = 0; deg < 360*6; deg += 11) {
  float angle = radians(deg);
  float x = 350 + (cos(angle) * radius4);
  float y = 150 + (sin(angle) * radius4);
  ellipse(x, y, 6, 6);
  radius4 = radius4 + 0.34;
}


