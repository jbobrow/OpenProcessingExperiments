
size(400,400);
background(255);

fill(0);
stroke(4);


for (int i=0; i<40; i++) {
  pushMatrix();
  for (int j=0;j<40; j++) {
     float w=i/4;
    rect(0,0,i*4,10);
    rotate(radians(2));
    translate(0,15);
  }
  popMatrix();
  translate(30,0);
}
