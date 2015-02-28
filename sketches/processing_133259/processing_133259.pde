
size(480,480);
translate(width/2,height/2);
for (int j=0; j<100; j++){

  pushMatrix();

for (int i=0; i<100; i++){
    float myAngle = random (-15,20);
    rotate(radians(myAngle));
    
    float ellipseSize = map(i,0,100,5,20);
    fill(125,125,125,125);
    rect(0,0,ellipseSize,ellipseSize);
    translate(0,5);
}
  popMatrix();
}


