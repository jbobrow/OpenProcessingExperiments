




void horizontalGrain(int a, int b, int c, float d, float e, float f, float g) {
  pushMatrix();
  translate(5,5);
  stroke(0);
  fill(255);
  strokeWeight(.5);
  rect(a,b,90,90);
  for (int hSat = c; hSat < 90; hSat+=c) {
    for (float vSat = d; vSat < 90; vSat+=d) {
      stroke(e,f,g);
      strokeWeight(1);
      point(a+hSat,b+vSat);
    }
  }
  popMatrix();
}


