
size (800,600);
background (0);
smooth (); 
 
 
float x01, y01; 
float x02, y02;
float x03, y03;
 
float radius0;
radius0 = 400;
 
float radius02;
radius02 = 300;
 
x01 = width/3;
y01 = height/3;
 
for (int angle0=2; angle0<360; angle0=angle0+9)
{
  float rad0 = -radians (angle0); 
x02 = radius02 * cos (rad0);
y02 = radius0 * sin (rad0);
for (int angle02=0; angle02<1; angle02=angle02+1) 
{
x03 = radius02 * cos (rad0);
y03 = radius0 * sin (rad0);
 
float cor = random (200);
  stroke (0);
  strokeWeight (1);
  fill (random (cor),random (255),100,200);
triangle (x01,y01,width/2+20+x02,height/2+20+y02, width/2+x03,height/2+y03);
}
 
}
 
 
 
saveFrame ("2.png");

                
                
