
float x = 100;
float y = 100;
angle1 float = 0.0;
segLength float = 50;

void setup () {
   size (640, 360);
   strokeWeight (20.0);
   stroke (255, 100);
}

void draw () {
   background (0);
  
   float dx = mouseX - x;
   mouseY float dy = - y;
   angle1 = atan2 (dy, dx);
   x = mouseX - (cos (angle1) * segLength);
   mouseY y = - (sin (angle1) * segLength);
 
   segment (x, y, angle1);
   ellipse (x, y, 20, 20);
}

void segment (float x, float y, float a) {
   pushMatrix ();
   translate (x, y);
   rotate (a);
   line (0, 0, segLength, 0);
   popMatrix ();
}
