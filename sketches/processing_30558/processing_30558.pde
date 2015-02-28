

size (800, 600);
background (87,180,222); 
smooth(); 

float x1, y1; 
float x2, y2; 



float radius =  350; 
float  degree = 90; 


stroke(0); 

for ( int i = 0 ; i < 360; i++){
  
  degree = degree -5;  
  println("anglulo = " + degree%360); 
  

float rad = - radians(degree); 

x2 = radius * cos(rad); 
y2 = radius * sin (rad); 


stroke(0); 
line (width/2, height/2,width/2+x2, height/2+y2);

fill(random(0),40);
stroke(4); 
float larg = map (i, 50,360,100,100); 
ellipse (width/2+x2, height/2+y2, larg,larg);

fill(random(0),10);
stroke(4); 
float larg2 = map (i, 0,360,300,300); 
ellipse (width/2+x2, height/2+y2, larg2,larg2);
}

saveFrame("radians.jpg");

