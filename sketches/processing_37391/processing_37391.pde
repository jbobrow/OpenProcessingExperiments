
// the whole concept of the composition is to give an effect of trailing circles
size (300, 300);
colorMode(RGB);
background(0, 0, 0);

for (int x=20; x<270; x+=9) {
  // trails for the ellipse with varying inter-spacing between the points.
  stroke(x+30, 10, 100, 98);
  strokeWeight(3);
  point(x, height/2);
  point(x, height/3);
  point(random(x), height/4);
  point(random(x+30), height/2.5);
  point(random(x), height/1.7);
  point(random(x), height/5);
  point(x+10, height/.5);
  point(random(x), height/3);
  point(random(x), height/1.4);

  //random ellipses complementing the points
  fill(50, x, 40);
  strokeWeight(2.3);
  ellipse(random(x), x, 5, 5);
  ellipse(x+10, random(x), 12, 12);
  ellipse(x+10, random(x+50), 8, 8);
}


