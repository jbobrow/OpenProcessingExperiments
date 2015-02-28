
void setup(){
  size(300,300);
  smooth();
  noFill();
  strokeWeight(2); //Marca el contorno
 
  
}
//Globales
 float incremento1=0.0; // para que gire el arco rojo
 float incremento2=0.0; // para que gire el arco azul

// Con + gira a la derecha y con - gira a la izq

void draw(){
 // background(200);
 
  //rojo
//  stroke(255,0,0);
  fill(255,0,0);
  arc(150,150,80,80,0,PI/4+incremento1);
  incremento1+=0.01;
  //azul
 // stroke(0,0,255);
  fill(0,0,255);
  arc(220,220,60,60,0,PI/4+incremento2);
  incremento2+=0.01; 
  
  //verde
 // stroke(0,255,0);
  fill(0,255,0);
  arc(90,220,60,60,0,PI/4+incremento2);
  incremento2+=0.01; 
  
}

