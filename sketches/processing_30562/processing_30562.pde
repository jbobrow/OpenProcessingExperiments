

                
           size (900,700);
background (255);
smooth ();
 
float x1, y1;
float x2, y2;
 
float radius;
 
x1 = width/4;
y1 = height/3;
 
for (float angle=0; angle<600; angle=angle+0.9)
{
  radius = angle;
  float rad = -radians (angle); // variavel que converte angulos em radianos, 90 graus é um radiano
x2 = radius * cos (rad);
y2 = radius * sin (rad);
 
  stroke (2);
  strokeWeight (5);
line (x1,y1,width/2+x2,height/2+y2);
 
float s = map (angle, random (255),100, random(angle),angle);
 
noStroke ();
strokeWeight (2);
stroke(255,1250);
fill (s,150,190,140);
ellipse (width/2+x2,height/2+y2, radius,radius);
 
} 
 
float x02, y02;
float x04, y04;
 
float radius0;
for (float angle0=0; angle0<400; angle0=angle0+0.5)
{
  radius0 = angle0;
  float rad = -radians (angle0);
x02 = radius0 * cos (rad);
y02 = radius0 * sin (rad);
 
  float S0 = map (radius0, random (255),90, random(angle0),angle0);
  stroke (100,90);
  strokeWeight (1);
   
  float tamanho = random (200,100);
 
line (x02,y02,width/2+x02,height/2+y02);
 
noFill();
noStroke();
strokeWeight(3);
 stroke (90,60);
ellipse (width/2+x02,height/2+y02, tamanho, tamanho);
 
 
}
 
 
saveFrame ("espiral.png");     
