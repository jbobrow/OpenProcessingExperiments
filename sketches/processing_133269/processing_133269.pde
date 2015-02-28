
size(500,600);
background( 90,229,242);

translate(width/2, height/2);

for (int j=0; j<100; j=j+1) {
  pushMatrix();
  stroke (3);
  color (3,5,8);
  for(int i=0; i<100;i=i+1) {
  float myAngle=random (-10,10);

  rotate(radians(myAngle));

  float ellipseSize = map(i, 0, 50, 5, 20);
  ellipse (0,0, ellipseSize,ellipseSize);
  translate(0,5);
  }

popMatrix();

  }
  



