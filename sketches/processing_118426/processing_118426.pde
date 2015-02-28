
    
int eSize = 3; 
 
size(510, 510);
colorMode(HSB, 360, 100, 100);
background(255);

for(int x = 0; x <= width; x ++ ){
 stroke(x,510 ,510-x ,127);
  line(0, 0, x, height);
   
 line(x,0, x, 510-x);
  line(x,510, 510-x,x);
 
 line(x,0, 510, x);
  line(x,510, 510,510-x);
 
 
  stroke(0, x, 168, 127);
  line(width, 0, x, height);
 } 
 
 


