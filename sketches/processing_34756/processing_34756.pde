
size(300,300);
background(255, 204, 0);
arc(50, 55, 50, 50, 0, PI/2);
noFill();
arc(40, 45, 50, 50, 0, PI/2);
noFill();
arc(50, 55, 70, 70, PI, TWO_PI-PI/2);
ellipse(200,200,100,100);
line(85, 20, 85, 87);
stroke(255);
line(85, 87, 20, 87);
point(30,35);
noStroke();
colorMode(RGB, 75);
for (int i = 75; i < 125; i++) {
  for (int j = 75; j < 125; j++) {
    stroke(i, j, 0);
    point(i, j);}}
quad(10, 15, 50, 25, 50, 55, 20, 55);
fill(255,255,100);
rect(100, 100, 100, 100);
noFill();
triangle(50, 200, 70, 250, 80, 200);
strokeWeight(3);   // Thicker
line(20, 275, 275, 20);

