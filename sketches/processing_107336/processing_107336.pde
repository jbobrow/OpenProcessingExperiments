
/* @pjs preload="Minecraft-green-grass.png"; */
//Ying Yang by Neha Rao ITEC3450 (crediting help courtesy to the WTF forum.)
//Initial concept - Beziers, Second concept - Arcs & Ellipses
 
size(640,360); // initial dimensions [the size I decided to make my work.]

PImage img = loadImage("Minecraft-green-grass.png");
image(img, 0,0); //imported and introduced my background (copyright to Mojang inc cause it's Minecraft...) set to the right dimensions.

 ellipse(320, 180, 300, 300); //base of the main shape
 
  stroke(255,172,82); //Just an additional yellow stroke to make the object look more dimensional.
  fill(255,230,82); //karmic border
  ellipse(320, 180, 330, 330); //border *Double ellipse*
 
  
  // mini top arc with no fill and arguments for placing the arc.
  noFill();
  arc(320, 105, 150, 150, (PI)/2, 3*(PI)/2);
   
  // mini bottom arc with fill of black to match, and arguments for placing the bottom arc with calculations using PI to place it dead center.
  fill(0);
  arc(320, 255, 150, 150, -HALF_PI, HALF_PI);
   
  // lower large arc which matches the same color of the shape.
 fill(136,81,152);
  arc(320, 180, 300, 300, -HALF_PI, HALF_PI);
   
  // top large arc which matches the same color of the shape.
  fill(0);
  arc(320, 180, 300, 300, (PI)/2, 3*(PI)/2);
   
  // bottom black ellipse with no stroke.
  noStroke();
  ellipse(320, 255, 150, 150);
   
  // top purple ellipse with no stroke.
  noStroke();
  fill(136,81,152);
  ellipse(320, 105, 150, 150);
   
  // upper mini black ellipse for the yang (good in evil) filled with white.
  fill(0);
  ellipse(320, 105, 50, 50);
   
  // lower mini purple circle for the ying (evil in good) filled with purple.
  fill(136,81,152);
  ellipse(320, 255, 50, 50);
  
  
   




