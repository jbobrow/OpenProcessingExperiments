
void setup() {
  size(500, 500);     // acá defino el tamaño
  background(100, 200, 0);    // fondo blanco
  smooth();
  mouseX=width/2;
  mouseY=height/2;
  frameRate=30;

}

void draw() {
  stroke(255, 10);      // un negro transparente
  strokeWeight(1);
  /*  nota: para hacer un comentario de más de una línea
  de largo, se puede hacer de esta forma */
             
  line(width/2, height/2, mouseX, mouseY); // línea desde el centro al mouse
  line(width/1, height/1, mouseX, mouseY); 
  line(width/2, height/1, mouseX, mouseY); 
  line(width/1, height/2, mouseX, mouseY); 
  line(width/2, height/3, mouseX, mouseY); 
  line(width/3, height/1, mouseX, mouseY); 
  line(width/2, height/1, mouseX, mouseY); 
  
 
  
}

void mousePressed() {
  background(100, 200, 0);
  
}   
