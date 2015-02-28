
size(480,500);
background(245);

for (int i=0; i<500; i=i+10)
{ 
  for(int j=0; j<500; j=j+10){
    stroke(171,222,161,4);
    triangle(j,j,i,j,j,j);

  }

  for(int y=0; y<500; y=y+13){
    noStroke();
    fill(106,179,188,60);
    triangle(y/2, y-5, y+ 35, y+55, y*1.5, y-5);
  }
 
 
  for(int y=0; y<500; y=y+13){
    noStroke();
    fill(160,237,184,50);
    triangle(y/2, y-35, y+ 35, y+55, y*1.5, y-35);
  }
  
  for(int y=0; y<500; y=y+13){
    noStroke();
    fill(160,229,237,20);
    triangle(y/2, y-55, y+ 35, y+55, y*1.5, y-55);
  }
 
  
}



