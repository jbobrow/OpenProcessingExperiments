
size(500,500);
background(0);
noStroke();
 
colorMode(RGB,255);
for(int j=0; j<500; j+=5){
  for (int i=0; i<500; i+=5){
  
    stroke(i,j,0);
    point(i,j);

  }
  
}

