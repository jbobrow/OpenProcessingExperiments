
size(400, 400);
background(255);
fill(240);

for (int i=0; i<40; i++) {
  pushMatrix();
  for (int j=0; j<40; j++) {
    float w = i / 0.4;
    //float w = (70 - j) * 0.2 + 7;
    rect(0, 0, w, w);
    rotate(radians(3));
    translate(0, 15);
  }
  popMatrix();
  translate(15, 0);
}
