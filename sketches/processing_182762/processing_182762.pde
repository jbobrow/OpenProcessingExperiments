
/* @pjs preload="Bananas.png"; */
PImage Bananas= loadImage("Bananas.png");
size(700, 700);
background( random(255),random(255),random(255));
rectMode(CENTER);
 
float angolo=0;
  
  
for (int y=0; y<=height; y+=50)
{
 for (int x=0; x<=width; x+=50)
 {
 angolo += 0.09;
 resetMatrix();
 translate( 350,y );
 rotate( angolo );
 
 
    
fill ((255), random(230,255), random (224));
  
 

image(Bananas,random(700),random(700));
 ellipse( 90,10, 70,60);
 }
}


