
//Assignment 3c: Draw a dense pattern by embedding two â��for structuresâ��. (3pts)




size(400,400);
background(250);
for (int i=800; i>=0; i=i+20)
  for (int r=100; r<400; r=r+15) {
    float x=random(100);
    float y=random(255);
    float z=random(255);
  
pushMatrix();
    fill(x,y,z,10);
    rect(0,z,i,i);
    rect(0,0,i,i);
popMatrix();
  
}

