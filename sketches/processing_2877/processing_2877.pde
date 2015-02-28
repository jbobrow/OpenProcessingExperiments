
// Basado en "Helix" por Herbert Spencer.

int margen = 10; 
int esp = 30; // espacio que hay entre los patrones

void setup(){
  size(450,300,P3D); 
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
   rotateZ(d * millis()*0.00001); // rotación  de la figura 
 scale(d * millis()*0.0000001); // acercamiento de la figura.

  noStroke();
  fill(millis()*#1497A7); // millis permite que el color se vaya cambiando

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



