
background(150,0,20);
size(300,300);
noStroke();
colorMode(RGB, 100, 0, 100);
for (int i = 0; i < 100; i++) {
  for (int j = 0; j < 100; j++) {
    stroke(i, j, 0);
    point(i, j);
  }
}
arc(0, 0, 200, 200, 0, PI/2);
ellipse(150, 150, 100, 100);
line(0, 100, 150, 100);
strokeWeight(10);
point(150, 150);
strokeWeight(1);
quad(300, 0, 200, 0, 150, 100, 300, 100);
fill(10);
noStroke();
rect(200, 150, 100, 150);
stroke(0);
noFill();
triangle(0, 300, 200, 300, 0, 100);



