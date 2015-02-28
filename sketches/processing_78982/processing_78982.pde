
int j;
size(800,600);
colorMode(HSB,360,100,100);
j=0;
//stroke(100,100,100);
//line(0,400,800,400);
for (int i=0; i<800; i+=3) {
  j++;
  noStroke();
  fill(j,100,100);
  rect(i,0,3,600);
}


