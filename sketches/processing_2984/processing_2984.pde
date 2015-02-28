

//basado en " caracoles" de Carla R
int margen = 250; 
int esp =500; // espacio que hay entre los patrones
 
void setup(){
  size(500,500,P3D); 
    smooth();
      background(247,135,45); // se eligio un color determinado para poder dar el efecto de eclipse
}
 
void draw(){
//aquí empieza los códigos que repiten la figura y la hacen interactuar con el mouse.
  for (int y = margen; y < height; y += esp){
    for (int x = margen; x < width; x += esp){
      figura(x, y);
    
  }
}
 
  for (int y = margen; y < height; y += esp){
    for (int x = margen; x < width; x += esp){
    figura(x, y);
    }
  }
}
 void figura(int x, int y){
  float d = dist(mouseX , mouseY , x, y); 
  pushMatrix(); 
  translate(x  ,y );// distribuye la figura
   rotateZ(d * millis()*0.0001); // rotación  de la figura 
 scale(d * millis()*0.0000001); // hace que se vaya acecando, así da la impresión de que finaliza en negro.
 
  noStroke();
  fill(millis()*255); // al regresar siempre a blanco ..comienzan a salir en aproximadamente 2  minutos ,muchos colores siguiendo el praton generado por el girar de la figura
 
  beginShape();//los codigos ingresados crean una figura irregular para poder generar distintas figuras y dispocisiones en el recuadro.
vertex( 11, 200);
vertex( 51,44);
vertex(522, 4);
vertex( 3, 5);
vertex( 85, 44);
vertex(10, 11);
vertex( 53, 100);
vertex( 1, 4);
vertex( 66, 200);
  endShape(CLOSE);
 
 
  popMatrix();
}
 

