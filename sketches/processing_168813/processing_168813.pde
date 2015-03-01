
int i = 0;

 
size(400, 400);
background(255);
noStroke();
fill(0);
 
smooth();
for(int x=0; x<=400; x+=10) {    
  for(int y=0; y<=400; y+=10){
 stroke(400-y,200+x,400-x,250); 

 line(+x,+y,400,400); 
 line(x,y,0,0); 



}}
 
for(int z=0; z<=1500; z+=80)
{  
  smooth(); 
   noFill(); 
   stroke(255,255,255,150); 
   strokeWeight(5); 
     ellipse(400,200,0+z,0+z);
  ellipse(200,400,0+z,0+z);
ellipse(0,200,0+z,0+z); 
 ellipse(200,0,0+z,0+z);
 }
 




