
size (800, 700);
background (252,255,103);
smooth ();  

for (int i=0; i<20; i=i+1)
{
 float px = random (width);
 float py = random (height);
    
 float linha = random (5,9);
 float arco2 = random (2, 150);
    
 float cor2 = random (5);
 float cor3 =random (5);
 float raio1 = random (0, 180);
 float raio2 = random (180, 360);
 float tamanho = random (20,50);
    
 stroke (2);
 fill (14,222,0,50);
 arc (400, 300, arco2, arco2, radians (raio1), radians (raio2) );

 noFill ();
  fill(16,118,1);
 ellipse (px,py, tamanho, tamanho);
   
 noFill ();
 stroke (1);
 strokeWeight (random (0.3,1));
 line (400,300, px,py);
     }
  
for (int i=0; i<60; i=i+1)
{
   
  float linha = random (0.5,4);
    
     float px = random (width);
  float py = random (height);
    
  float cor2 = random (255);
 stroke (9,142,0);
  line (px, py, 400, 300);
    
  for (int e=0; e<115; e=e+1)
  {
 noStroke ();
 fill (455,85,0);
  
 float arco = random (20, 20);
  
 arc (px, py, arco, arco, radians (random (0)), radians (random (300)) );
  
}
}
  
saveFrame ("1,png");
