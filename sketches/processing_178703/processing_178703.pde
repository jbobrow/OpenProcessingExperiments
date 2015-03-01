
/*
  * Red Snake
  *
  * Program to create a red snake moving through the screen
  *
  * Step 4:
  * - chage the level or red with the time
  *
  * (c) 2013 D. Cuartielles, Arduino Verkstad, Sweden
  */
   
   int rojo = 255;
   
   void setup() {
   size(400, 400);
   }
   
   void draw() {
   rojo = rojo - 1; // Make the red a little darker
   if (rojo < 0) rojo = 255; // Once it reaches black, make it light red again
  
  noStroke(); 
  fill(rojo,0,0);                                   
   ellipse(mouseX, mouseY, 30, 30);
   }
