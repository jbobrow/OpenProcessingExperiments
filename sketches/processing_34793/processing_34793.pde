
size(300,300);
background(28,38,200);
smooth();
quad(0,150, 20,150,300,300,200,300);
stroke(162,11,17);
rect(80,180,50,110);
strokeWeight(9);
noFill();
rect(120,220,60,70);
noStroke();
colorMode(RGB, 100);
for (int i = 0; i < 300; i++) {
  for (int j = 0; j < 150; j++) {
    stroke(i, j, 100);
    point(i, j);
  }
}
fill(59,170,5);
noStroke();
triangle(0,150,300,150,75,50);
strokeWeight(9);
line(0,150,300,150);
fill(15,30,150);
ellipse(140,30,60,30);
fill(255,15,15);
arc(140,30,20,20,0,TWO_PI);
stroke(9);
point(140,30);
strokeWeight(1);
fill(15,250,10);
ellipseMode(CENTER);
ellipse(240,120,60,60);
strokeWeight(6);
line(240,120,240,240);
strokeWeight(1);
ellipseMode(CORNER);
ellipse(240,120,60,60);
strokeWeight(6);
line(270,150,270,270);
strokeWeight(1);
rectMode(CENTER);
rect(30,180,25,50);
fill(10,200,100);
rectMode(CORNER);
rect(30,180,25,75);

