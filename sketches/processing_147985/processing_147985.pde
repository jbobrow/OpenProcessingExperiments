
size (600, 600);
background (255);
rectMode (CENTER);

float angolo=0;
  
for (int y=0; y<=height; y+=40)
{
 for (int x=0; x<=width; x+=10)
 {
 angolo += 0.20;
 resetMatrix();
 translate( x,y );
 rotate( angolo );
 
 
    
fill (random(100,180), random(20,120), random (100,180),100);
  
ellipse (0, 0, 20,20);
 }
}

  
for (int y=0; y<=height; y+=10)
{
 for (int x=0; x<=width; x+=40)
 {
 angolo += 0.20;
 resetMatrix();
 translate( x,y );
 rotate( angolo );
 
 
fill (random(100,180), random(20,120), random (100,180),100);
  
ellipse (0, 0, 20,20);
 }
}

