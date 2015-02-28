
float margen, sp;

void setup(){
  noCursor();
  margen = (float)mouseX;
  sp = 25;
  size(500,500);
  smooth();
  background(0);
}
 
void draw(){
  background(10);
  
  for(float x = margen; x <= width; x += sp ){
    for(float y = margen; y <= height; y += sp){
      float d;
      d = sqrt(((float)mouseX - x)*((float)mouseX - x) + ((float)mouseY - y)*((float)mouseY - y));
      rotate((float)mouseX/40000);
      fill(#FF0000,(float)mouseX); //rojo
      stroke(#B100B4,(float)mouseY); //morado
      ellipse (x,y, d/10, d/10);

      rotate(30);
      fill(#FFAA00,(float)mouseY); //naranja
      stroke(#EAEA00,(float)mouseX); //amarillo
      ellipse (x,y, d/10, d/10);

      rotate(45);
      fill(#B100B4,(float)mouseX); //morado
      stroke(#FF0000,(float)mouseY); //rojo
      ellipse (x,y, d/10, d/10);
      
      rotate(10);
      fill(#EAEA00,(float)mouseY); //amarillo
      stroke(#FFAA00,(float)mouseX); //naranja
      ellipse (x,y, d/10, d/10);

    }
  }
}




