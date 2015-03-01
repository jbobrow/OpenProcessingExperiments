
size (600,600) ;
background (0) ;
noStroke () ;
float angolo=0 ;
for (int y=0; y<=height; y+=10)
{
 for (int x=0; x<=width; x+=50)
 {
 angolo += 0.35;
 resetMatrix();
 translate( x,y );
 rotate( angolo );
 
 fill (random(0,100), random(100,255), random (0,255),50);
   
  ellipse( 50,50, 70,40);
  
 }
}
