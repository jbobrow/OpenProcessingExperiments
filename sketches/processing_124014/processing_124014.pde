
size(400, 400);
background(0, 50, 100);

for (int i=0;i<6;i++) {
  stroke(255);
  strokeWeight(6);
  line (0, 0, 100, 0);
  line(50, 0, 75, 50);
  line(50, 0, 75, -50);
  point(80, 25);
  point(80, -25);
  rotate(PI/3);
}

translate(width, height);
for (int i=0;i<6;i++) {
  stroke(255);
  strokeWeight(6);
  line (0, 0, 100, 0);
  line(50, 0, 75, 50);
  line(50, 0, 75, -50);
  point(80, 25);
  point(80, -25);
  rotate(PI/3);
}

translate(width/-2, height/-2);
for (int i=0;i<6;i++) {
  stroke(255);
  strokeWeight(6);
  line (0, 0, 100, 0);
  line(50, 0, 75, 50);
  line(50, 0, 75, -50);
  point(80, 25);
  point(80, -25);
  rotate(PI/3);
}

translate(width/2, height/-2);
for (int i=0;i<6;i++) {
  stroke(255);
  strokeWeight(6);
  line (0, 0, 100, 0);
  line(50, 0, 75, 50);
  line(50, 0, 75, -50);
  point(80, 25);
  point(80, -25);
  rotate(PI/3);
}

translate(-width, height);
for (int i=0;i<6;i++) {
  stroke(255);
  strokeWeight(6);
  line (0, 0, 100, 0);
  line(50, 0, 75, 50);
  line(50, 0, 75, -50);
  point(80, 25);
  point(80, -25);
  rotate(PI/3);
}

translate(0,-height);
for (int j=0;j<4000;j++) {
  stroke(255, random(55, 255));
  strokeWeight(4);
  point(random(-400, 400), 
  random(-400, 400));
}

