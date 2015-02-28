
size(250, 250);
background(0);
smooth();

fill(107, 12, 34, 50);
stroke(255, 2);
for(int c=0; c<=height; c+=50) {
  ellipse(0+c, 0, 200, 200);
  ellipse(0+c, 50, 200, 200);
  ellipse(0+c, 100, 200, 200);
  ellipse(0+c, 150, 200, 200);
  ellipse(0+c, 200, 200, 200);
  ellipse(0+c, 250, 200, 200);
}

noFill();
stroke(217, 4, 43, 35);
strokeWeight(25);
for(int c=0; c<=height; c+=50) {
  ellipse(10+c, 0, 200, 200);
  ellipse(10+c, 50, 200, 200);
  ellipse(10+c, 100, 200, 200);
  ellipse(10+c, 150, 200, 200);
  ellipse(10+c, 200, 200, 200);
  ellipse(10+c, 250, 200, 200);
}

fill(244, 203, 137);
stroke(217, 4, 43, 110);
strokeWeight(100);
ellipse(125, 125, 100, 100);
strokeWeight(100);
ellipse(125, 125, 50, 50);


