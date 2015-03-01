
int eSize=50;

size(400,400);
colorMode(RGB);
background(0);
noStroke();



for(int y=0; y<=400; y+=50){
 for(int x=0; x<=400; x+=50){
   ellipse(x, y, eSize, eSize);
  
   fill(x, y, y);
   ellipse(x, y, eSize, eSize);
  
 }
}

for(int y = 0; y <= 400; y += 1) { 
  
  stroke(0, 0, 0); 
  
  line(y, 400, 0, y); 
  line(y, 0, 400, y); 
 
  
  
} 


