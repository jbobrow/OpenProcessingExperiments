
size(500, 500);

translate(width/2, height/2);
for (int j=0;j<250; j++) {
  pushMatrix();
  for (int i=0;i<250;i++) {
    float myAngle=random(-90, 90);
    rotate(radians(myAngle));
    float rectSize=map (i, 0, 200, 2, 30);
    rect(0, 0, rectSize, rectSize);
    translate(0, 10);
  }
  popMatrix();
}

