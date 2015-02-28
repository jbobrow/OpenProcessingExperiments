
size (800, 600);
background (0);
smooth();

float x1, y1;
float x2, y2;

float radius = 275;
float degree = 350;


stroke(0);

for ( int i = 0 ; i < 500; i++){

degree = degree -1;
println("anglulo = " + degree%360);


float rad = - radians(degree);
x2 = radius * cos(rad);
y2 = radius * sin (rad);


  
stroke(10);
line (width/8, height/3,width/2+x2, 600/2+y2);

fill(0,255,0,50);
noStroke();
float larg = map (i, 10,100,10,50);
ellipse (width/2+x2, height/2+y2, larg,larg);


fill(255,0,0,50);
noStroke();
ellipse (width/2+x2, height/2+y2, larg,larg);

}
                
