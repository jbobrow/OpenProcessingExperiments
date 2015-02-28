
size(600, 600);
smooth();
background(0);
stroke(255);

noStroke();
fill(255);

for (int i=5; i<=width; i+=10) 
{
  for (int j=6; j<width; j+=20) {
    beginShape();
    vertex(i,j-i);
    bezierVertex(40,20, 60-(i*j),30, i,j-i);
    endShape();
  }
}


