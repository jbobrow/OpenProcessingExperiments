
size(400,400);
background(16,50,90);
strokeWeight(10);
stroke(255,239,213);
strokeCap(SQUARE);
//fork line
int x;
x=20;
if (x>10) {
  line (80,350,80,150);
}
//spoon line
int y;
y=10;
if (y>5) {
  line (200,350,200,150);
}
noStroke();
//spoon top
fill(255,239,213);
ellipse(200,105,60,100);
fill(205,186,150);
ellipse(200,105,50,90);
fill(255,239,213);
ellipse(202,110,52,88);
//fork top
fill(255,239,213);
ellipse(80,120,60,70);
fill(205,186,150);
ellipse(77,120,50,60);
fill(255,239,213);
ellipse(73,120,46,60);
fill(16,50,90);
rect(50,70,60,50);
fill(255,239,213);
triangle(50,120,58,120,54,55);
triangle(110,120,102,120,106,55);
triangle(68,120,76,120,72,55);
triangle(92,120,84,120,88,55);
