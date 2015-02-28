
/*Artes Multimediales|Informática Aplicada I | TP Nº10 | FERNANDO C. PÉREZ |
  Realizar un boceto animado que refleje la idea de orden.
*/ 

int x=0; //declaro las variables 
int numero=1;

void setup(){ //configuro el setup del boceto 
  size(400,400); //tamaño del documento
  background(#80BC00);//fondo
  fill(#214D0B);//relleno el fondo del rectangulo en un verde oscuro
  noStroke();//dejo sin contorno el rectangulo
  rect(0,280,400,100);//rectangulo
  smooth();//suaviza trazos
  noCursor();//oculta el cursor
}
void draw(){ 
stroke(#CCFC85); //color del contorno
  frameRate(30); //velocidad de frame x seg
  rect(x%500,22,22,22);//dibujos los cuadrados y le agrego la variable x al rectangulo para direccionarlo hacia la derecha
    rect(x%800,62,22,22);
      rect(x%1000,102,22,22);
        rect(x%1255,142,22,22);
          rect(x%2555,182,22,22);
            rect(x%3000,222,22,22);
            ellipse(x%600,10,5,5);//adornos con circulos
            ellipse(x%700,300,7,7);
             ellipse(x%410,350,2.5,2.5);
              ellipse(x%430,365,2,2);
  x=x+1;//actualiza el valor de la variable x
  print(x); //imprime el valor de la variable x
  
  if(x>100){//le agrego un if para darle una aceleración al cuadrado
    fill(#6EAA62);//se rellena el cuadrado con otro color
    numero=2;//sirve para actualizar el switch 
 frameRate(40);//acelera la velocidad de fotogramas x segundo.
 
  if(x>200){ //lo mismo que el anterior solo que en este caso si x es mayor a 200 
   fill(#1D5009);
    frameRate(90);
    numero=3;
  }
  
  if(x%12==1){
    /*altera la variable x ya que busca que numero q de como resto 0 y lo activa,
    realizando el efecto de parpadeo del cuadradro y que se genere una especie de codigo de barras
    */
   fill(#71B753);//rellena el cuadrado en un color
    frameRate(10);//acelera los fotogramas por segundo
    numero=numero+1;//actualiza la variable numero sirve para el switch
  }
}
//para guiarse de los pasos de la variable numero switch
/*
switch(numero){
case 1:
println("numero");
break;
case 2:
println("numero2");
break;
case 3:
println("numero3");
break;
}
*/
}
void mouseMoved() {//Funcion que nos permite al mover el mouse cambiar las variables de x
  x=x+1;
  }



