
size(300,300);
background(186,191,240);
colorMode(RGB, 150);
for (int i = 0; i < 100; i++) {
  for (int j = 0; j < 250; j++) {
    stroke(i, j, 0);
    point(i, j);
  }
}
stroke(0);
strokeWeight(3);
line(0,0,150,300);
noStroke();
fill(200,0,0,50);
ellipse(35,45,60,60);
noFill();
stroke(0);
rect(150,150,149,149);
fill(52,185,160);
triangle(250,50,250,80,150,70);
arc(150,150,200,200, 0, PI/2);
line(0,250,150,250);
line(250,0,250,150);
strokeWeight(7);
point(150,150);
noFill();
strokeWeight(1);
quad(50,200,150,150,300,200,0,0);

