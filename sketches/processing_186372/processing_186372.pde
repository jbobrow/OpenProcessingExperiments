
String texto = "No puedo leer bien";
 
void setup () {
  size(600, 600);
  colorMode(HSB);
  textMode (SHAPE);
  textSize ( 10);
  
   
}
   
   
void draw() {
  
  float velocidad = dist (mouseX, mouseY, pmouseX, pmouseY);
  //println (velocidad);
  if (velocidad > 110.20) {
    background (60);
  }
  else {
    background (0);
  }
  
   float anchotexto= textWidth (texto);
  
  text (texto,(width /2) - (anchotexto/2),height/2);
 fill (0);
  
}
