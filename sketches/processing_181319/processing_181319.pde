

//*****FUNCION QUE DEFINE DIBUJO DE OJO*****
void dibujarDios() {

 // Triangulo exterior
   fill(11,255,0);
   triangle(0,-90,-75,50,75,50);
 
 // Triangulo interior
   fill(mouseX,0,200);
   triangle(0,-83,-70,47,70,47);
 
 // Ojo
   fill(255);
   ellipse(0,0,85,40);
 
 // Iris
   fill(30,240,mouseX-50);
   ellipse(0,0,39,39);
 
 // Iris interior
   noStroke();
   fill(255,mouseX,30);
   ellipse(0,0,23,23);
 
 //modificar pupila
 pushMatrix();
    float escalado = 2.0 - 1.5*mouseY/255.0;
    scale(escalado,escalado);
 
   // Pupila
     fill(0);
     ellipse(0,0,15,15);

   // Brillo pupila
     fill(255,255,255);
     noStroke();
     ellipse(3,-2,5,5);
 popMatrix();
 
}

//*****VARIABLES*****
  color turquesa = color(75,247,231);
  color blanco = color(255);
  float x = 20;
  float medida = 40;
  float velocidad = 3;
//*******************

///////////////////////////////
void setup(){
  size(255,255);
   background(blanco);
}

///////////////////////////////
void draw(){
  //background(255,mouseX,0);
  //background(random(255),random(155),random(0));
 
 float escalado = 2.0*mouseY/255.0;
 if (escalado <=0.5){
  escalado = 0.5; 
 }
  
  pushMatrix();
  translate(mouseX-20,mouseY-20);
  scale(escalado,escalado);
  dibujarDios();
  popMatrix();
  
  //redondas de color random que llenan fondo
  fill(random(255),random(255),random(255),99);
  noStroke();
  ellipse(random(0,255),random(0,255),random(20,50),random(20,50));
  
}
