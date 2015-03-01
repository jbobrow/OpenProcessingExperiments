
size(500,500);
background(0);
noStroke();
float radius = 1.0;
for (int deg = 0; deg < 360*20; deg += 11) {
  float angle = radians(deg);
  float x = 250 + (cos(angle) * radius);
  float y = 250 + (sin(angle) * radius);
  fill(220,0,60,165);
  ellipse(x,y,60,60);
  radius = radius + 0.54;
}

for (int deg = 0; deg < 360*10; deg += 11) {
  float angle = radians(deg);
  float x = 250 + (cos(angle) * radius);
  float y = 250 + (sin(angle) * radius);
  fill(100,160,10,45);
  ellipse(x,y,60,60);
  radius = radius - 1;
}

for (int deg = 0; deg < 360*10; deg += 11) {
  float angle = radians(deg);
  float x = 250 + (cos(angle) * radius);
  float y = 250 + (sin(angle) * radius);
  fill(0,10,100,35);
  ellipse(x,y,60,60);
  radius = radius + .89;
}

for (int deg = 0; deg < 360*10; deg += 11) {
  float angle = radians(deg);
  float x = 250 + (cos(angle) * radius);
  float y = 250 + (sin(angle) * radius);
  fill(60,110,110,19);
  ellipse(x,y,60,60);
  radius = radius - 1;
}


