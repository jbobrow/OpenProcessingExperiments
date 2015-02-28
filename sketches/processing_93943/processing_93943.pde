
/* @pjs font="Cedarville-Cursive.ttf";*/

PImage Cake; 
PFont Cedar; 


void setup(){
  size (500,500); 

Cedar=loadFont ("Cedarville-Cursive.ttf");
Cake=loadImage ("CUPCAKE.jpg"); 

}
void draw(){

  image (Cake, 0, 0, height, width); 
  
  fill(#43BFAF);
  textFont (Cedar, 70);  
  text ("Happy Cake!", 25, 230);
  
  stroke(random (255), random (0), random (0)); 
  fill (random(255), random(0), random(0), random (100));
  ellipse (random(width), random(height), random (30, 80), random (30,80));
   fill (#43BFAF);
  ellipse (random(width), random(height), random (10, 50), random (10,50));
   fill (#F7AFD6);
   ellipse (random(width), random(height), random (10, 50), random (10,50));
fill (random(255), random(0), random(0), random (100));
  ellipse (random(width), random(height), random (30, 80), random (30,80));
   fill (#43BFAF);
  ellipse (random(width), random(height), random (10, 50), random (10,50));
   fill (#F7AFD6);
   ellipse (random(width), random(height), random (10, 50), random (10,50));

stroke(#43BFAF);
fill (random(255), random(0), random(0), random (100));
  ellipse (random(width), random(height), random (30, 80), random (30,80));
   fill (#43BFAF);
  ellipse (random(width), random(height), random (10, 50), random (10,50));
   fill (#F7AFD6);
   ellipse (random(width), random(height), random (10, 50), random (10,50));
fill (random(255), random(0), random(0), random (100));
  ellipse (random(width), random(height), random (30, 80), random (30,80));
   fill (#43BFAF);
  ellipse (random(width), random(height), random (10, 50), random (10,50));
   fill (#F7AFD6);
   ellipse (random(width), random(height), random (10, 50), random (10,50));
  
}


