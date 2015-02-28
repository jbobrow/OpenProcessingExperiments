
int radio; //define variable radio para modificacion
float r=1; //Define variable de color R
float g=1; // Define variable de color G
float b=1; //Define variable de color B


void setup(){

  background(229,230,216);
  size (1200,800); //define tamaÃ±o de la ventana del programa
  smooth(4);
  
}



void draw(){
  
  if (mousePressed){
    
    r=random(13,33); //Define valor random para color R
    b=random(35,230); //Define valor random para color G
    g=random(49,216); //Define valor random para color B
    
    radio=50;  //si se presiona el mouse, aumenta el radio a 50
  }
  
  if(radio<0){
    radio=0;
  }
  
  radio=radio-1;
  
  println (radio); //Imprime variable radio en terminal
  
  ellipse (mouseX, mouseY, radio, radio); //ubica circulo en mouse
  fill(r,g,b); //Llena circulo de color random definido en rango
  noStroke(); //Elimina perimetro de circulo (negro)
  
}
