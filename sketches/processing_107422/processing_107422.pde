
float x = 1;
float y = 1;
 
 
 
void setup () {
  tamaño (640, 360);
 
  accidente cerebrovascular (255,220,60);
  strokeWeight (25);
}
 
anular dibujar () {
  fondo (255,204,0);
   
  x = mouseX ;
  y = mouseY ;
  
  
  elipse (x, y, 50, 50);
  }
