
size(250,100);
background(255);
point(0,0);
noFill();
arc(50,55,35,40,PI, TWO_PI);
strokeWeight(6);
line(50,55,23,98);
strokeWeight(1);
fill(18,50,175);
triangle(225,25,180,80,125,50);
fill(235,240,15);
stroke(255,0,0);
quad(120,50,140,15,75,60,150,90);
noStroke();
fill(0,255,0);
rect(5,10,75,30);
fill(203,39,203);
ellipse(230,90,20,40);
colorMode(RGB, 100);
for (int i = 225; i<250; i++) {
  for (int j =0; j<25; j++){
    stroke(i,j,125);
    point (i,j);}}










