
float x = 298; 
float y = 298; 
float xn = 298; 
float yn = 298; 
float xc; 
float yc; 
float Sx; 
float Sy; 
 
void setup(){ 
size(400,400); 
background(255); 
smooth(); 
Sx = random(width); 
Sy = random(height); 
 
} 
void draw(){ 
    xc = random(-100,300); 
  yc = random(-100,300); 
  if (dist(x+xc,y+yc,Sx,Sy)<100) 
  {stroke(255,0,0);  } 
  else 
  {stroke(0);  } 
   
  xn=x+xc; 
  yn=y+yc; 
   
  if(xn<0){xn=abs(xn);} 
  if(yn<0){yn=abs(yn);} 
   
  if(xn>width){xn=width-abs(width-xn);} 
  if(yn>height){yn=height-abs(height-yn);} 
   
  line(x,y,xn,yn); 
  x=xn; 
  y=yn; 
      if (mousePressed==true) 
 { 
   noLoop(); 
    
   } 
   
} 



