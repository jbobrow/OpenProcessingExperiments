
size(700, 700);
background( 250, 280, 170 );
rectMode(CENTER);

float angolo=0;
 
 
for (int y=0; y<=height; y+=40) 
{
 for (int x=0; x<=width; x+=10)
 {
 angolo += 0.20;
 resetMatrix();
 translate( x,y );
 rotate( angolo );


   
fill (random(100,180), random(120,20), random (180,100),100);
 

quad( 10,90, 30,40, 90,10, 70,60);

 }
} 



