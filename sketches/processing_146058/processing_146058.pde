

size(500, 500);
background(0);
smooth();
stroke(#edd22b,15);
noFill();
strokeWeight(0.4);

for(int i=1; i<=500; i+=2) {
bezier(500, 0, random (i,i), random (i,i), random (i,i), random (i,i), 0, 500);
  
 for(int j=500;j>=0; j-=10)
{
  stroke(#edd22b,15);
  strokeWeight(0.1);
  bezier(0,0, random (i,i), random (j,j), random (i,i), random (j,j), 500, 500);
 }
}



