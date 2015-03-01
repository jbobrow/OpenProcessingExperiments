


void dibujarFondo(){
   beginShape();
color rojo = color(255,3,70);
color fucsia = color(237,3,255);
color amarillo = color(255,243,3);
beginShape();
fill(fucsia);
vertex(0,0);
vertex(width,0);
fill(rojo);
vertex(width,height);
fill(amarillo);
vertex(0,height);
endShape();
}

void dibujarDios() {

 // Triangulo exterior
 /*stroke(0);*/
 fill(11,255,0);
 triangle(0,-90,-75,50,75,50);
 
 // Triangulo interior
 /*stroke(0);*/
 fill(3,255,190);
 triangle(0,-83,-70,47,70,47);
 
 // Ojo
 /*stroke(0);*/
 fill(255);
 ellipse(0,0,85,40);
 
 // Iris
 /*stroke(0);*/
 fill(206,48,191);
 ellipse(0,0,39,39);
 
 // Iris interior
 noStroke();
 fill(255,3,226);
 ellipse(0,0,23,23);
 
 // Pupila
 fill(0);
 ellipse(0,0,15,15);

 // Brillo pupila
 fill(255,255,255);
 noStroke();
 ellipse(3,-2,5,5);
}


void dibujarGranDios() {

 // Triangulo exterior
 /*stroke(0);*/
 fill(255,243,3);
 triangle(0,-90,-75,50,75,50);
 
 // Triangulo interior
 /*stroke(0);*/
 fill(3,255,173);
 triangle(0,-83,-70,47,70,47);
 
 // Ojo
 /*stroke(0);*/
 fill(255);
 ellipse(0,0,85,40);
 
 // Iris
 /*stroke(0);*/
 fill(255,3,70);
 ellipse(0,0,39,39);
 
 // Iris interior
 noStroke();
 fill(255,36,153);
 ellipse(0,0,23,23);
 
 // Pupila
 fill(0);
 ellipse(0,0,15,15);

 // Brillo pupila
 fill(255,255,255);
 noStroke();
 ellipse(3,-2,5,5);
}



void setup() {
 // Canvas size
 size(640,603,P2D);
}



void draw() {
 
  dibujarFondo();
  
 // Fila 1: 1
 resetMatrix();
 translate(80, 100);
 dibujarDios();
 
 // Fila 1: 1b
 resetMatrix();
 translate(160,59);
 scale(1,-1);
 dibujarDios();
 
 // Fila 1: 2
 resetMatrix();
 translate(240, 100);
 dibujarDios();
 
 // Fila 1: 2b
 resetMatrix();
 translate(320,59);
 scale(1,-1);
 dibujarDios();
 
 // Fila 1: 3
 resetMatrix();
 translate(400,100);
 dibujarDios();
 
 // Fila 1: 3b
 resetMatrix();
 translate(480,59);
 scale(1,-1);
 dibujarDios();
 
 // Fila 1: 4
 resetMatrix();
 translate(560,100);
 dibujarDios();
 
 // Fila 2: 1
 resetMatrix();
 translate(80, 210-5);
 scale(1,-1);
 dibujarDios();
 
 // Fila 2: 1b
 resetMatrix();
 translate(160,250-5);
 dibujarDios();
 
 // Fila 2: 2
 resetMatrix();
 translate(240, 210-5);
 scale(1,-1);
 dibujarDios();
 
 // Fila 2: 3
 resetMatrix();
 translate(400,210-5);
 scale(1,-1);
 dibujarDios();
 
 // Fila 2: 3b
 resetMatrix();
 translate(480,250-5);
 dibujarDios();
 
 
 // Fila 2: 4
 resetMatrix();
 translate(560,210-5);
 scale(1,-1);
 dibujarDios();
 
 // Fila 3: 1
 resetMatrix();
 translate(160,360-10);
 scale(1,-1);
 dibujarDios();
 
 // Fila 3: 2
 resetMatrix();
 translate(480,360-10);
 scale(1,-1);
 dibujarDios();
 
 //EL PURO DIOS QUE TE JUZGA
 resetMatrix();
 translate(320,440);
 scale(3.07);
 dibujarGranDios();
 
}
