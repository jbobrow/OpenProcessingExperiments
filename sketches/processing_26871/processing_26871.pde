
import processing.pdf.*;

  


int tamanio ;


void setup() 
{

 //fondo 
  fill(236,236,233);
  rect(0,0,800,500);
  frameRate(5); // Run slow...
  size(800 ,500);
  smooth();
 //tamaño de las redonadas
 tamanio = width/90;

}

void draw()


{
    
 dibujarLinea();

}

void keyPressed() {
  switch(key) {
  case '+': 
    tamanio++;
    break;
  case '-': 
    tamanio--;
    break;
    
// Para generar PDF
    case 's': 
    println("BEGIN RECORD");
   beginRecord(PDF, "Lines.pdf"); 
    break;
  case 'q': 
   println("endRecord");
     endRecord();
    break;

  }
}
void mouseDragged() {
  println("ddddm:"+tamanio);
  dibujarPelotas();
}
void dibujarLinea(){
//grueso de linea
  strokeWeight(1); 
//color linea
   stroke(liniasmulticolor());
// --> los numeros cambian la posicion de las lineas 
  line(mouseX,mouseY,mouseX-random(-100),mouseY-random(-500));


  }
void dibujarPelotas(){
  noStroke();
  fill(devuelveColor());
  float tam = random(tamanio);
  ellipse(mouseX,mouseY, tam,tam);

}
color devuelveColor(){
  float rojo = 133;
  float verde = random(400,255);
  //  float verde = random(129);
  float azul =100;
  return color(rojo,verde,azul);
  }
  
 
// para cambiar color de las lineas 
  
color liniasmulticolor(){
  float rojo =random (144);
  float verde = random(143);
  //  float verde = random(129);
  float azul = (134);
  return color(rojo,verde,azul);
  }
  
  

// para cambiar color de fondo, aunque no lo he utilizado //
  
//color fondocolor(){
//  float rojo =random (204);
//  float verde = random(40);
//  float azul = (204);
//  return color(rojo,verde,azul);

  
 
// ---> Como variar el grueso de la linea??? 
// strokeWeight= random (gruesomax);
// int gruesomax ;



  
 






