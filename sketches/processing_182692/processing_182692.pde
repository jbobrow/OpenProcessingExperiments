
size(400,400);
background(250);

for(int i=800; i>=0; i=i-20)
    for(int j=200; j<600; j=j+20){
        float x=random(100);
        float y=random(255);
        float z=random(255);
      fill(x,y,z,10);
      rect(i,z,10,j)
      rect(j,0,i,i);

  
  }
