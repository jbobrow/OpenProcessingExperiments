
// Basado en "Helix" por Herbert Spencer.


int margen = 10; 
int esp = 30; // espacio que hay entre los patrones

void setup(){
  size(450,300,P3D); 
  frameRate (120); // Más rápido!
    smooth();
      background(255); 
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
   rotateZ(d * millis()*0.001); // rotación  de la figuras
 scale(d * millis()*0.0000001); // acercamiento de las figuras hasta que estas cubren la pantalla.
// Nueva Version (18/08/09): cambios en los numeros de la rotación, de tal manera que este desfasada con respecto a la escala. Resultado: formas irregulares y orgánicas.
  noStroke();
  fill(millis()*255); // el color de la figura llega al blanco cada "millis". La repetición del ciclo hace que se oscurezca.

  beginShape();//figura
vertex( 11, 45);
vertex( 51, 77);
vertex( 89, 49);
vertex( 100, 52);
vertex( 85, 36);
vertex( 68, 52);
vertex( 53, 17);
vertex( 52, 47);
vertex( 11, 43);
  endShape(CLOSE);


  popMatrix();
}



