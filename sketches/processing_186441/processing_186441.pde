
//EJERCICIO FINAL RELOJ
  
  //variables
int hours;
int minutes;
int seconds;
int sz = 20;
float angulo = 0;
float radio = 20;
PVector p= new PVector(0,0);

  
void setup() {
  size(1000, 500);
  background(57,26,0);
  rotate(radians(90));
  smooth();
  fill(2);
  frameRate(60); 

}
void draw() {
  
  hours = hour();
  minutes = minute();
  seconds = second();
 
 //condicional
if (hours > 12) {
 hours -= 12;
 }  
  
 background(27,0,65);
  translate(500,250); //posiciÃ³n central del reloj
  stroke(237,202,2);
 fill(237,202,2);
  for (int i = 50; i<100; i+= 300) {
    
    //Movimiento sinusoidal que hace el sol (cÃ­rculo central amarillo)
    float valorSen = sin(angulo);
 float valorCos = cos(angulo);
 
 //TamaÃ±o
 valorSen +=1;
 valorCos +=1;
 angulo += 0.01;
 ellipse(0,0,valorSen*25,valorCos*25);
  }

/////////////////////////////////////////
/////////////////////////////////////////
   
 //FUNCIONES HORARIAS
  lineahora();
  esferaminuto();
  esferasegundo();
  
}
  
 //HORA
void lineahora() {
  strokeWeight(20);
  stroke(242,242,230);
  noFill();
  pushMatrix(); //guarda el sistema de coordenadas
  rotate(radians(30 * hours));
  
  //anilla de jupiter - horas
  ellipse(0, 0, 350, 350);
  strokeWeight(10);
  
  //anilla exterior
stroke(53,88,93);
  ellipse(0,0,500,500);
  noStroke();
  fill(11,103,0);
  
  //esfera que marca la hora
  ellipse(0,-175,70,70); 
  fill(172,214,166);
  ellipse(0,-175,20,160);
  popMatrix(); //restaura el sistema de coordenadas

//movimiento circular en bucle de Neptuno exterior
p.x = 0 + (radio*12.5*sin(angulo/20));
p.y = 0 + (radio*12.5*cos(angulo/20));
angulo +=00.1;

//dibujamos Neptuno (cÃ­rculo exterior que orbita alrededor del sistema solar)
noStroke();
fill(113,187,196);
ellipse(p.x,p.y,sz+6,sz+6);
}
 

 //MINUTO
void esferaminuto() {
   strokeWeight(10);
  stroke(0,15,144);
  noFill();
  pushMatrix();
  rotate(radians(6 * minutes));
ellipse(0, 0, 250, 250); //cÃ­rculo minutero
  fill(255,0,0);
  noStroke();
 ellipse(0,-125,30,30); //esfera que marcan los minutos
  noFill();
  popMatrix();
}
 
 //SEGUNDO
void esferasegundo() {
  strokeWeight(5);
  stroke(89,88,93);
  noFill();
  rotate(radians(6 * seconds));
  
  //Ã³rbita de la Tierra
  ellipse(0, 0, 180, 180); 
fill(0,0,255);
noStroke();

//Dibujamos la Tierra (cÃ­rculo azul) que se mueve en segundos
ellipse(22,-45,20,20);

//Movimiento circular de la luna (circulo interior alrededor del cÃ­rculo azul)
p.x = 22 + (radio*sin(angulo));
p.y = -45 + (radio*cos(angulo));
angulo +=.01;

//dibujamos la luna
noStroke();
fill(255,255,234);
ellipse(p.x,p.y,sz/2,sz/2);


}

