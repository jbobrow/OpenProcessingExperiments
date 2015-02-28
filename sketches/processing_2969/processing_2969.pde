
void setup(){
  size(screen.width,screen.height);
  fill(235);
  background(255);
  noStroke();
  smooth();
}

void draw (){
str(true);
  float x= random (width);
  float y= random (height);
stroke(mouseX);   //si detengo el mouse el fondo queda en azul al contrario aparecen lineas blancas
  strokeWeight(3);
  float t= noise(10,212);
  float alfa= random(212,237);
stroke(mouseY); //al mover mouse aparecen lineas negras
  strokeWeight(1);  
  float z = random (width);  
  float r = random (height);  
  fill(8,9,70,20);  
  triangle(mouseX,z*2,r, mouseY,z,r*2);  
  ellipse(x, y,  screen.width, second());

rotate(10);    //figura rota a medida que aparece
 rect (x, y, millis()%20, millis()%30);  
lineas(mouseX,mouseY);
str (false); 
}

void lineas(float x,float y ) {
 fill(185);
 stroke(12);
 pushMatrix();
  {
    translate(x,y);
 line(20,x,50,y); 
   popMatrix();
}}
//al mover el mouse y luego detenerlo una masa azul cubre la superficie, hasta volver
//a moverlo

