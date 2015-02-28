
float x = 100;
float y = 100;
flotar angle1 = 0,0;
flotar segLength = 50;

void setup () {
  tamaño (640, 360);
  strokeWeight (20,0);
  accidente cerebrovascular (255, 100);
}

anular draw () {
  fondo (0);
  
  flotar dx = mouseX - x;
  flotar dy = mouseY - y;
  angle1 = atan2 (dy, dx);  
  x = mouseX - (cos (ángulo 1) * segLength);
  y = mouseY - (sin (angle1) * segLength);
 
  segmento (x, y, angle1); 
  elipse (x, y, 20, 20);
}

segmento vacío (float x, float y, float a) {
  pushMatrix ();
  traducir (x, y);
  girar (a);
  línea de (0, 0, segLength, 0);
  popMatrix ();
}
