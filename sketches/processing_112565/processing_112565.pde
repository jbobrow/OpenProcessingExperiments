
background(255);
size(500, 500);
smooth();

int distance = 45;
 
for (int i = 1; i<=9; i++) {
  strokeWeight(6);
  stroke(150,170,170);
 
  for ( int j=1; j<=9; j++) {
fill(10,10,10,255-(j*25));

    rect(width,height,20*i,20*i);
    rect(distance*i,distance*j,5*i,5*j);
    fill(10,20,10,255-(j*25));
    rect(distance*i,distance*j,10*i,10*j);
    rect(distance*j,distance*i,i*10,j*10);
    ellipse(distance*j,distance*i,i*10,j*10);
  }
}
