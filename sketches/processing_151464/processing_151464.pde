
size(600, 600);
background( 120, 350, 240 );
rectMode(CENTER);
 
float angolo=0;
  
  
for (int y=0; y<=height; y+=20)
{
 for (int x=0; x<=width; x+=40)
 {
 angolo += 0.25;
 resetMatrix();
 translate( x,y );
 rotate( angolo );
 
 
    
fill (random(320,240), random(130,100), random (180,280),100);
  
 
triangle( 3,6, 90,10, 70,60);
 
 }
}

