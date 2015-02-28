
size(400,400);
background (0);
stroke (102, 255, 255);

noStroke();
//colorMode(HSB, 100);
for(int i=0; i<=400; i+=10) {
  for (int j=0; j<=100; j+=10) {
  
  float me= random(50);
  float you= random (100);
  fill(i, you, j);
  //rect (300,you, me, j);
  
  triangle(j,i, 0, i, 10, 0);
  triangle(i,i, j, i, 300, 0);
  //triangle(i,390, i, j, i, 300);
  triangle(300,j, 390, j, 300, 0);
  
}
}

fill(0);
triangle (0,400, 30, 400, 0,100);
