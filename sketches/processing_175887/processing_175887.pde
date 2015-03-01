
//variables globales
int diametros = 30, posX;
float posColor =  30, posX2;

 
void setup() {
 //cÃ³digo de inicializaciÃ³n
 size(300,300);      //ventana de 300x300 px
 ellipseMode(CENTER);//dibuja los circulos desde el centro
 smooth();           //grÃ¡ficos suavizados
 background(255);    //fondo de la ventana blanco
 frameRate(30);      //refresca la ventana 30 veces por segundo

 
}
 
void draw() {

 
 //refresca el fondo en cada ciclo
 background(mouseX,mouseY,0);
 //cÃ³digo que anima las figuras;
 fill(mouseX,255,mouseY);
 ellipse(mouseX,mouseY,diametros,diametros);
 fill(posX);

 rect(posX,height/2,diametros,diametros);
 
 fill(mouseX,mouseY,255);
 
  rect(posX,height/3,diametros,diametros);
 
  fill(posX);
  
  rect(posX,height/6,diametros,diametros);
   
   fill(posX2);
   
   rect(posX2,250,posColor,posColor);
   // El color RGB cambia la R y la G depende de para donde muevas el ratÃ³n.
      fill(mouseX,mouseY,255);
     
     rect(posX2,200,posColor,posColor);
     
 //si posX en mayor o igual que el ancho de la ventana...
 if (posX >= width  ) {
 posX = 0; posX2 = 0;  //resetear posX a 0
 }
 if (posX2 >= width  ) {posX2 = 0;}//resetear posX2 a 0
  
   
   
 else {  //si posX  y posX2 es cualquier otra cosa diferente...
 posX = posX +1; posX2 = posX2 +1; //sumarle 1 a posX y a posX2
 }
}



// Al clickar hacemos que vaya mÃ¡s deprisa.

  void mousePressed() {
frameRate(100);

}
 
 // Al soltar el click hacemos que vuelva a la velocidad normal.
 
void mouseReleased() {
frameRate(30);
}



