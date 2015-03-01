
int i = 0;
int eSize = 5;
 
size(400, 400);
background(255);
noStroke();
fill(0);
 
smooth();
for(int x=0; x<=400; x+=10) {    
  for(int y=0; y<=400; y+=10){
     if(x <= 200  || Y <= 200 ){ 
      
      stroke(400-y,200+x,400-x,250);}
     else{
        stroke(255);}
 //stroke(400-y,200+x,400-x,250); 

 line(+x,+y,400,400); 
 line(x,y,0,0); 
 
 
 




}}
 
for(int z=0; z<=1500; z+=80){  
    if(z ==  80 || z == 240 || z == 400 || z == 560){ 
      
      stroke(0,150);}
     else{
        stroke(255,150);}
      
    
  smooth(); 
   noFill(); 
   //stroke(255,255,255,150); 
   strokeWeight(5); 
     ellipse(400,200,0+z,0+z);
  ellipse(200,400,0+z,0+z);
ellipse(0,200,0+z,0+z); 
 ellipse(200,0,0+z,0+z);
 
      } 
      
   
     
for(int y =0; y <= height; y += 20){
  for (int x = 0; x <= width; x += 20){
    
    if(x > 80 && x < 320 && y > 80 && y < 320){
      fill(0,255,0,200);
    } else{
     fill(0,0,255,250);
    }
    
    ellipse(x,y,eSize,eSize);
    println(x);
  }}


