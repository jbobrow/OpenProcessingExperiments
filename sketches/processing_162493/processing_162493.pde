
size(500,500); 

background(20, 10, 100);

noStroke();
smooth();
int radius = 6;
fill(40,40,240);
for (int deg = 0; deg < 30; deg +=20) {
  float angle = radians(deg);
  float x = 250 + (cos(angle) * radius);
  float y = 300 + (sin(radius) * radius);
  ellipse(x, y, 100, 100);
}

stroke(242, 200, 40);
strokeWeight(9);
smooth();
int radius5 = 6;
fill(40,40,240);
for (int deg = 0; deg < 30; deg +=20) {
  float angle = radians(deg);
  float x = 100 + (cos(angle) * radius5);
  float y = 300 + (sin(radius) * radius5);
  ellipse(x, y, 100, 100);
}

stroke(242, 200, 40);
strokeWeight(9);
smooth();
int radius6 = 6;
fill(40,40,240);
for (int deg = 0; deg < 30; deg +=20) {
  float angle = radians(deg);
  float x = 400 + (cos(angle) * radius6);
  float y = 300 + (sin(radius) * radius6);
  ellipse(x, y, 100, 100);
}


stroke(255, 80, 30);
strokeWeight(6);

arc(100, 400, 100, 100, HALF_PI, PI);
arc(50, 500, 80, 80, TWO_PI-HALF_PI, TWO_PI);
arc(100, 400, 100, 100, HALF_PI, PI);
arc(50, 500, 80, 80, TWO_PI-HALF_PI, TWO_PI);

stroke(10, 30, 200);
strokeWeight(6);
fill(255, 80, 30);
arc(100, 100, 100, 100, HALF_PI, PI);

arc(200, 100, 100, 100, HALF_PI, PI);


arc(350, 100, 80, 80, TWO_PI-HALF_PI, TWO_PI);
arc(300, 100, 80, 80, TWO_PI-HALF_PI, TWO_PI);





