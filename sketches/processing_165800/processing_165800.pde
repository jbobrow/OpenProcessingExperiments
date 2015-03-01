
 float angle = 0.0;
 
 void setup (){
   size (800, 500);
   smooth ();
   noStroke ();
   
 }
 
 void draw (){
  fill (242, 147, 155, 12);
  rect (0, 0, width, height);
  translate (200, 50);
   angle = angle + .05;
   rotate (angle);
   fill (109, 113, 211, 65);
   triangle (400, 10, 200, 190, 600, 190);;
   translate (200, 50);
   rotate (angle);
   fill (55, 58, 137, 65);
   triangle (0, 10, 200, 190, 400, 10);
   translate (200, 50);
   rotate (angle);
   fill (189, 191, 240, 65);
   triangle (400, 10, 600, 190, 800, 10);
 }
 


