
size (800, 600);
background (0);
smooth();


float x2, y2; 
float x3, y3;
float x4, y4;

float radius =  200;
float  degree = 10;
float raio = 100;
float raio2 = 50;

stroke(0);

for ( int i = 0 ; i < 360; i++){
 
  degree = degree -1;
  println("anglulo = " + degree%360);
 

float rad = - radians(degree); 
x2 = radius * cos(rad);
y2 = radius * sin (rad);
x3 = raio * cos(rad);
y3 = raio * sin (rad);
x4 = raio2 * cos(rad);
y4 = raio2 * sin (rad);

stroke(255,0,0,100);
strokeWeight(5);

point (400+x2, 300+y2);
stroke(255,100);
point (100+x2, 100+y2);
point (700+x2, 500+y2);
stroke(0,255,0,20);
point (400+x3, 300+y3);
stroke(0,0,255,20);
point (400+x4, 300+y4);

stroke(255,10);
strokeWeight(1);
line (800, 600,
random(width/2+x2), random (height/2+y2));

}

            
