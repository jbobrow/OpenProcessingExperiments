
smooth();
size(300,300);
background(150,150,255);
colorMode(RGB, 180);
for (int i = 41; i < 260; i++) {
  for (int j = 41; j < 260; j++) {
    stroke(i, j, 260);
    point(i, j);
  }
}
line(150,0,150,300);
line(0,150,300,150);
line(0,0,300,300);
line(300,0,0,300);
noFill();
arc(300,0,600,600, PI/2, PI);
arc(0,300,600,600, TWO_PI-PI/2, TWO_PI);
arc(0,0, 600,600, 0, PI/2);
arc(300,300,600,600, PI, TWO_PI-PI/2);
fill(100,100,255);
noStroke();
ellipse(150,150,220,50);
ellipse(150,150,50,220);
noFill();
stroke(255,255,255);
quad(150,0,0,150,150,300,300,150);
rectMode(CENTER);
rect(150,150,220,220);
triangle(40,40,40,260,0,150);
triangle(40,40,260,40,150,0);
triangle(260,40,300,150,260,260);
triangle(260,260,150,300,40,260);
strokeWeight(10);
point(0,0);
point(300,300);
point(300,0);
point(0,300);
point(150,150);
point(150,0);
point(300,150);
point(0,150);
point(150,300);
point(150,40);
point(150,260);
point(260,150);
point(40,150);


