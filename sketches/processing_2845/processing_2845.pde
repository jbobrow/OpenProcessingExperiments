
float margen, sp;

void setup(){
  noCursor();
  margen = 20;
  sp = 25;
  size(500, 500);
  smooth();
  background(0);
}
 
void draw(){
  background(10);
  
  for(float x = margen; x <= width-margen; x += sp ){
    for(float y = margen; y <= height-margen; y += sp){
      float d;
      d = sqrt((mouseX - x)*(mouseX - x) + (mouseY - y)*(mouseY - y));
      rotate(mouseX/40);
      fill(#FF0000,mouseX); //rojo
      stroke(#B100B4,mouseY); //morado
      ellipse (x,y, d/10, d/10);

      rotate(30);
      fill(#FFAA00,mouseY); //naranja
      stroke(#EAEA00,mouseX); //amarillo
      ellipse (x,y, d/10, d/10);

      rotate(45);
      fill(#B100B4,mouseX); //morado
      stroke(#FF0000,mouseY); //rojo
      ellipse (x,y, d/10, d/10);
      
      rotate(10);
      fill(#EAEA00,mouseY); //amarillo
      stroke(#FFAA00,mouseX); //naranja
      ellipse (x,y, d/10, d/10);

    }
  }
}




