
size(500,500);
background(0);
smooth();
noStroke();
 
for(int x = 1; x<10; x++){
  for(int y = 1; y<10; y++){
    
fill(0, 255, 255, 300-(y*30));

ellipse(x*50, y*50, x*4.3, x*4.3);

}}

