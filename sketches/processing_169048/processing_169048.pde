
int eSize=3;

size(400,400);
background(187,255,255);


for(int x=0; x<=400; x+=10){
   for(int y=0; y<=400; y+=10){
  stroke(102,255,204);
  line(0,0,x,200);
  
  stroke(0,255,204);
  line(200,0,x,200);

  stroke(102,255,153);
  line(400,0,x,200);
  
  stroke(0,255,153);
  line(0,400,x,200);
  
  stroke(0,102,255);
  line(200,400,x,200);
  
  stroke(0,255,153);
  line(400,400,x,200);
  
  
  
  stroke(204,255,153);
  line(0,0,200,y);
  
  stroke(0,255,153);
  line(0,200,200,y);
  
  stroke(255,204,204);
  line(0,400,200,y);
  
  stroke(102,255,102);
  line(400,0,200,y);
  
  stroke(102,255,255);
  line(400,200,200,y);
  
  stroke(255.255,153);
  line(400,400,200,y);
  
  
 
  
  }}






