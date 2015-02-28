

int eSize = 3;

size(510,510);
background(225);
smooth();

for(int x = 115; x <= width; x ++){
    stroke(225,25,25,27);
    line(0, 0, x, height);
    
    stroke(255, x, 0, 127);
    line(width, 0, x, height);
    
for(int i=0; i<510; i+=5)    
  ellipse(102, i, eSize, eSize);
  
  for(int i=0; i<510; i+=5)    
  ellipse(204, i, eSize, eSize);
  
  for(int i=0; i<510; i+=5)    
  ellipse(306, i, eSize, eSize);
  
  for(int i=0; i<510; i+=5)    
  ellipse(408, i, eSize, eSize);
  

}




