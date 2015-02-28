
size(800, 800);
background(255);
noiseSeed(232);
noFill();
smooth();
strokeWeight(1); 
float x=noise(0)*20;

for (int i=-30; i<=height+60; i+=5) {
  beginShape();
  for (int m=-30; m<=width+60; m+=5) {
  stroke(255,200,i);
    curveVertex(m, i+10*random(-1,1));
  }
  endShape();
}




