
size(300,300);
background(255,255,255);
stroke(230,230,230);
strokeWeight(2);
line(100,0,100,300);
line(200,0,200,300);
line(0,100,300,100);
line(0,200,300,200);
stroke(230,230,230);
strokeWeight(1);
line(50,0,50,300);
line(150,0,150,300);
line(250,0,250,300);
line(0,50,300,50);
line(0,150,300,150);
line(0,250,300,250);
noStroke();
fill(0,0,0,200);
rectMode(CENTER);
rect(175,175,50,50);
noFill();
stroke(0);
strokeWeight(1);
ellipseMode(CENTER);
ellipse(150,150,5,5);
ellipse(200,150,10,10);
ellipse(200,200,15,15);
ellipse(150,200,20,20);
arc(100,100,100,100,radians(270),radians(360));
colorMode(RGB, 100);
for (int i = 250; i < 300; i++) {
  for (int j = 0; j < 150; j++) {
    stroke(i, j, 0);
    point(i, j);
  }
}
stroke(0);
triangle(200,200,250,200,200,250);
strokeWeight(9);
quad(175,162.5,187.5,175,175,187.5,162.5,175);
strokeWeight(3);
point(175,25);
point(162.5,37.5);
point(150,50);

