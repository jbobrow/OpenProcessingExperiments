

             size (800,600);
background (0);
smooth (); //anti aliasing
  
float x31, y31; //point 1
float x32, y32; //point 2
 
x31 = width/2-350;
y31 = height/2-100;
 
float radius31;
radius31 = 400;
 
for (int angle31=0; angle31<180; angle31=angle31+3) //ultimo numero +1 pode ser substituido controla os intervalos
{
   
  float rad = -radians (angle31); // variavel que converte angulos em radianos, 90 graus é um radiano
x32 = radius31 * cos (rad);
y32 = radius31 * sin (rad);
 
float cor2 = random (0,150);
  stroke (cor2,0,0);
  strokeWeight (2);
  rectMode(CENTER);
line (x31,y31,width/2+x32-50,height/2+100+y32);
 
}
//--------------------------------------------------------------------------------------------
 
float x21, y21; //point 1
float x22, y22; //point 2
 
x21 = width/2-350;
y21 = height/2-100;
 
float radius21;
radius21 = 400;
 
for (int angle21=180; angle21<360; angle21=angle21+3) //ultimo numero +1 pode ser substituido controla os intervalos
{
   
  float rad = -radians (angle21); // variavel que converte angulos em radianos, 90 graus é um radiano
x22 = radius21 * cos (rad);
y22 = radius21 * sin (rad);
 
float cor2 = random (40,255);
  stroke (cor2,0,0);
  strokeWeight (2);
  rectMode(CENTER);
line (x21,y21,width/2+x22-50,height/2+100+y22);
 
}
//---------------------------------------------------------------------------------------------------
float x11, y11; //point 1
float x12, y12; //point 2
 
 
//iniciar variaveis
// inicialize the first point
x11 = width/2-350;
y11 = height/2-100;
 
float radius11;
radius11 = 180;
 
for (int angle11=180; angle11<360; angle11=angle11+1) //ultimo numero +1 pode ser substituido controla os intervalos
{
float rad = -radians (angle11); // variavel que converte angulos em radianos, 90 graus é um radiano
x12 = radius11 * cos (rad);
y12 = radius11 * sin (rad);
 
float cor = random (0,200);
  stroke (cor,cor,100);
  strokeWeight (1);
  rectMode(CENTER);
line (x11,y11,width/2+x12,height/2+100+y12);
}
 
//------------------------------------------------------------------------------------------------
float x1, y1; 
float x2, y2; 


float radius =  400; 
float  degree = 100; 


stroke(0); 

for ( int i = 0 ; i < 360; i++){
  
  degree = degree -1; 
  println("anglulo = " + degree%360); 
  
 
float rad = - radians(degree); 
x2 = radius * cos(rad); 
y2 = radius * sin (rad); 


stroke(0); 
line (width/2, height/2,width/2+x2, height/2+y2);

fill(255,0,0);
noStroke(); 
float larg = map (i, 0,360,0,50); 
ellipse (width/2+x2, height/2+y2, larg,larg);

}

saveFrame ("raioslix.png");
 

