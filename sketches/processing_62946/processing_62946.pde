
size(600, 600);
smooth();
background(0);

fill(255);


for (int i=10; i<=width; i+=10) 
{
  for (int j=20; j<width; j+=4) {
    beginShape();
    vertex(i,j);
    bezierVertex(20,40, 60,30, j-i,i);
    endShape();
  }
}


