
size(600, 600);
smooth();
background(0);

fill(255);

noStroke();
for (int i=10; i<=width; i+=10) 
{
  for (int j=8; j<width; j+=20) {
    fill(j, i, j);
    beginShape();
    vertex(j-i,i);
    bezierVertex(20,40, 60,30, j-i,i);
    endShape();
  }
}


