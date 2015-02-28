
size (500, 500);
background (0); 
smooth(); 


noStroke ();



fill (0, 0, 0);
rect (50, 50, 400, 400);

fill (205, 0, 0);
rect (75, 75, 350,350);

fill (0, 0, 0);
rect (100, 100, 300, 300);

fill (205, 0, 0);
rect (125, 125, 250, 250);

fill (0, 0, 0);
rect (150, 150, 200, 200);

fill (205, 0, 0);
rect (175, 175, 150, 150);

fill (0, 0, 0);
rect (200, 200, 100, 100);

fill (205, 0, 0);
rect (225, 225, 50, 50);

/////////////////////

float x1, y1; 
float x2, y2; 


float radius =  200; 
float  degree = 80; 


stroke(0); 

for ( int i = 0 ; i < 390; i++){
  
  degree = degree -1;
  println("anglulo = " + degree%360); 
  

float rad = - radians(degree);
 
x2 = radius * cos(rad); 
y2 = radius * sin (rad); 

stroke(0); 
line (width/2, height/2,width/2+x2, height/2+y2);

fill(205,0,0);
noStroke(); 
float larg = map (i, 0,160,0,50); 
ellipse (width/2+x2, height/2+y2, larg,larg);

}

saveFrame ("1.png");

