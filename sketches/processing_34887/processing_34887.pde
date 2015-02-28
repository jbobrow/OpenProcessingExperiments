
size(300,300);
background(255);
smooth();

for (int y = 10; y < height; y = y + 10) {
  strokeWeight(.5);
  stroke(200);
  line(0,y,width,height);
}
for (int x = 10; x < height; x = x + 10) {
  strokeWeight(.5);
  stroke(200);
  line(x,0,width,height);
}
for (int x = 10; x < height; x = x + 10) {
  strokeWeight(.5);
  stroke(200);
  line(0,0,x,height);
}
for (int y = 10; y < height; y = y + 10) {
  strokeWeight(.5);
  stroke(200);
  line(0,0,width,y);
}

point(width/2,height/2);

colorMode(HSB,100);
fill(40,40,40,50);
noStroke();
quad(0,0,0,160,width,height,0,height);

noFill();
colorMode(HSB,255);
stroke(255,0,0);
arc(width,0,width,height,0,PI);

ellipseMode(CORNERS);
colorMode(HSB,100);
fill(40,40,40,50);
ellipse(width/2,0,width,height/2);
triangle(width/2,0,width,height/2,width,0);
rectMode(CORNERS);
rect(width/2,0,width,height/2);

