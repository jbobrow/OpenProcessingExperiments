
size(300, 300);
background(164,187,232);
arc(50, 55, 60, 60, PI/2, PI);
ellipse(77, 100, 50, 70);
line(150,150,100,100);
point(30, 20);
noFill();
quad(120, 31, 86, 20, 69, 63, 150, 76);
rect(220, 220, 55, 55);
triangle(100,100,150,150,200,100);
smooth();
strokeWeight(1);
line(20,150,80,150);
strokeWeight(6);
ellipse(20,150,30,50);
strokeWeight(10);
line(20,200, 80, 200);
fill(150);
strokeWeight(1);
rect(20,250,30,30);
strokeWeight(1);
rect(200, 10, 55, 55);
noFill();
rect(230, 20, 55, 55);
noStroke();
colorMode(RGB, 200);
for (int i = 140; i < 200; i++) {
  for (int j = 160; j < 200; j++) {
    stroke(i, j, 100);
    point(i, j);
  }
}
fill(253,252,255);
noStroke();
rect(30, 20, 30,30);
stroke(204, 102, 0);
rect(80, 220, 55, 55);
stroke(0);
ellipseMode(CENTER);
ellipse(250, 150, 40, 40);
ellipseMode(CORNER);
fill(170);
ellipse(250, 150, 40, 40);
rectMode(CENTER);
rect(250, 95, 30, 30);
rectMode(CORNER);
fill(250,0,0);
rect(250, 95, 30, 30);
noStroke();
fill(250,250,0);
noSmooth();
ellipse(120, 5, 36, 36);
smooth();
ellipse(160, 5, 36, 36);

