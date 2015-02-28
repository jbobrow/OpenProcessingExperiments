
size(250, 250);
background(0);
smooth();
stroke(#edd22b,15);
noFill();
strokeWeight(0.4);
for(int i=1; i<=250; i+=2) {
bezier(250, 0, random (i,i), random (i,i), random (i,i), random (i,i), 0, 250);
 
 
 for(int j=250;j>=0; j-=10)
{
  stroke(#edd22b,15);
  strokeWeight(0.02);
  bezier(0,0, random (i,i), random (j,j), random (i,i), random (j,j), 250, 250);
}
}

