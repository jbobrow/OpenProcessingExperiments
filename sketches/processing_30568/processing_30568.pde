
       
size (1000,550);
background (255);
smooth (); //anti aliasing
 
for (int i=2;i<2000;i=i+2){
   
  float tamanho = random (2,6);
  float tr = random (100,90);
noStroke();
  fill (200,tr);
ellipse (random (width), random (height), tamanho, tamanho);
}
filter (BLUR);
 
//---------------------------------------------------
 
float x01, y01; //point 1
float x02, y02; //point 2
 
float radius0;
radius0 = 200;
 
float radius02;
radius02 = 300;
 
x01 = width/6;
y01 = height/6;
 
for (int angle0=0; angle0<360; angle0=angle0+1)
{
   float rad0 = -radians (angle0);
x02 = radius02 * cos (rad0);
y02 = radius0 * sin (rad0);
 
float cor4 = random (40);
  stroke (5, cor4, cor4);
  strokeWeight (random (1,4));
  fill( random (100));
  float tamanho = random (20, 200);
  rectMode (CENTER);
rect (width/2+x02,height/2+y02, tamanho,tamanho);
 
 
}
//---------------------------------------------------
for (int angle0=0; angle0<360; angle0=angle0+1)
{
   float rad0 = -radians (angle0);
x02 = radius02 * cos (rad0);
y02 = radius0 * sin (rad0);
 
float cor4 = random (100);
  stroke (0, cor4, cor4);
  strokeWeight (random (4,7));
  fill( random (400));
  float tamanho = random (20, 100);
  rectMode (CENTER);
rect (width/2+x02,height/2+y02, tamanho,tamanho);
 
 
}
saveFrame ("quadrados.png");
                
