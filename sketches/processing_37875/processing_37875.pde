
size(400, 400);
background(0);
translate(width/2, height/2);//divides sketch into quadrants

for (int i=0; i <=360; i+=15) {
  rotate(radians(i));//creates a radial composition
  fill(i, i+100, i);
  rect(250, 0, 10, 10);//sets growing from the center of the screen
  rect(225, 0, 10, 10);
  rect(200, 0, 10, 10);
  rect(175, 0, 10, 10);
  rect(150, 0, 10, 10);
  rect(125, 0, 10, 10);
  rect(100, 0, 10, 10);
  rect(75, 0, 10, 10);
  rect(50, 0, 10, 10);
  rect(25, 0, 10, 10);
  rect(12.5, 0, 10, 10);
}


