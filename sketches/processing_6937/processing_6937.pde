


size(500,500);
background(255);
strokeWeight(6);
smooth();
noFill();
float nAmplitude = 5;
int nPeriode = width/2;

for (int j = 0; j <=255; j++) {
  stroke(j);
  beginShape();
  vertex(0,height/2);
  for (int i = -nPeriode/2; i <= width; i += nPeriode) {
    curveVertex(i + nPeriode/2 , height/2 + nAmplitude);
    nAmplitude += ((255-j)*0.04*5 + i/15);
    curveVertex(i+nPeriode , height/2 - nAmplitude);
  }
  nAmplitude = 0;
  endShape();
}



