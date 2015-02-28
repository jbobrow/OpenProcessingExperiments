
size (800, 600);
background (255); 
smooth(); 

float x1, y1; 
float x2, y2; 


float radius =  200; 
float  degree = 90; 


stroke(0); 

for ( int i = 0 ; i < 360; i++){
  
  degree = degree -4;
  println("anglulo = " + degree%360); 
  

float rad = - radians(degree); 

x2 = radius * cos(rad); 
y2 = radius * sin (rad); 


stroke(0); 
line (width/9, height/2,width/4+x2, height/2+y2);

fill(0,0,0);
noStroke(); 
float larg = map (i, 100,360,30,200); 
ellipse (width/9+x2, height/2+y2, larg,larg);

}






stroke(0); 

for ( int i = 0 ; i < 360; i++){
  
  degree = degree -4;
  println("anglulo = " + degree%360); 
  

float rad = - radians(degree); 

x2 = radius * cos(rad); 
y2 = radius * sin (rad); 


stroke(0); 
line (width/1, height/2,width/4+x2, height/2+y2);

fill(0,0,0);
noStroke(); 
float larg = map (i, 100,360,30,200); 
ellipse (width/1+x2, height/2+y2, larg,larg);

}
