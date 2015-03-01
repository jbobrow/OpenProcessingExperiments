
size(500,500);
background(240,230,200);
noStroke();
int radius = 38;
for (int deg = 0; deg < 360; deg += 12) {
  float angle = radians(deg);
  float x = 250 + (cos(angle) * radius);
  float y = 250 + (sin(angle) * radius);
  fill(30,77,69,200);
  ellipse(x,y,16,16);
}
radius = 150;
for (int deg = 0; deg < 360; deg += 12) {
  float angle = radians(deg);
  float x = 250 + (cos(angle) * radius);
  float y = 250 + (sin(angle) * radius);
  fill(60,77,109,100);
  ellipse(x,y,60,60);
}
radius = 126;
for (int deg = 0; deg < 360; deg += 12) {
  float angle = radians(deg);
  float x = 250 + (cos(angle) * radius);
  float y = 250 + (sin(angle) * radius);
  strokeWeight(1.5);
  stroke(130,150,200,120);
  fill(130,150,200,20);
  ellipse(x,y,90,90);
}
radius = 50;
for (int deg = 0; deg < 360; deg += 12) {
  float angle = radians(deg);
  float x = 250 + (cos(angle) * radius);
  float y = 250 + (sin(angle) * radius);
  strokeWeight(.5);
  stroke(130,120,200,120);
  fill(130,250,200,4);
  ellipse(x,y,190,190);
}
radius = 150;
for (int deg = 0; deg < 360; deg += 12) {
  float angle = radians(deg);
  float x = 250 + (cos(angle) * radius);
  float y = 250 + (sin(angle) * radius);
  stroke(60,77,0,100);
  fill(130,77,109,10);
  ellipse(x,y,80,80);
}
radius = 15;
for (int deg = 0; deg < 360; deg += 12) {
  float angle = radians(deg);
  float x = 250 + (cos(angle) * radius);
  float y = 250 + (sin(angle) * radius);
  noStroke();
  fill(60,77,109,100);
  ellipse(x,y,6,6);
}
radius = 35;
for (int deg = 0; deg < 360; deg += 12) {
  float angle = radians(deg);
  float x = 250 + (cos(angle) * radius);
  float y = 250 + (sin(angle) * radius);
  noStroke();
  fill(60,77,109,100);
  ellipse(x,y,6,6);
}


