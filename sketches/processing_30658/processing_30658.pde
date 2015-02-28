
size (800,600);
background (255);
smooth ();

for (int i=0; i<40; i=i+1)
{
  
  float px = random (width/2-300, width/2+300);
  float py = random (height/2-250, height/2+250);
   
  for (int e=0; e<355; e=e+1)
  {   
     
stroke (2,random (90,150));
fill (255,10,30,random (10,50));
float arco = random (40, 200);
arc (px, py, arco, arco, radians (random (0)), radians (random (360)) );


 
}
}
 
 saveFrame ("2.png");
 

                
                
