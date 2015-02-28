
/*
SEMINARIO 3 - CONDICIONALES
Alejandra Martí Jover
Grupo 03
2n GEDI - Ingeniería en diseño industrial
Este ejercicio consiste en que el cupcake se va moviendo por
la ventana que representa que es un mantel de cuadros y revota 
en los límites de ésta. También dependiendo de la esquina en 
que se encuentre el ratón los cuadros del mantel cambiaran de 
color y cuando seaprete el ratón la bola de adorno pricipal 
variará su tamaño.
*/

/*Mediante la libreria de Minim añadimos los comandos necesarios
para poner un sonido al rebote de los cupcakes con los limites 
de la ventana*/
  var audioElement = document.createElement("audio");

/*Primero de todo especificamos las variables que utilizaremos
para definir el numero de cupcakes que queremos, los colores del
mantel y el tamaño del adorno principal*/
int color1, color2, color3;
int mz;
int numBoles = 2;
/*Creamos una matriz de posicionesX con el numero de cupcakes 
que queremos; también lo haremos para las posicionsY, las 
velocidades X e Y*/
float[] posicionsX = new float[numBoles];
float[] posicionsY = new float[numBoles];
float[] velocitatsX = new float[numBoles];
float[] velocitatsY = new float[numBoles];

/*Empezaremos indicando el tamaño de la ventana y la 
velocidad (diciendo los frames que queremos), también 
inicializaremos las posiciones y velocidades. Se definen
los valores constantes*/
void setup(){
  size(700,400);
  color1 = 20;
  color2 = 174;
  color3 = 209;
  mz = 25;//tamaño del adorno principal
  frameRate(30); //velocidad
  //inicializamos las posiciones y las velocidades:
  for(int i = 0; i<numBoles; i++){
    posicionsX[i] = int(random(0,width-100));
    posicionsY[i] = int(random(50,height-35));
    velocitatsX[i] = random(2,10);
    velocitatsY[i] = random(2,10);
  }
  noStroke();
}


void draw(){
  /*Creamos el mantel de fondo, lo ponemos antes del dibujo 
  del cupcake para que no se quede todo el rato dibujado en
  la ventana. Esto lo haremos a través de un bucle, utilizando
  "for" pondremos el punto inicial, donde queremos que acabe y
  la distancia a la que tendrá que estar el siguiente cuadrado.
  */
  background(255);
  for(int x=5; x<width; x+=30) 
{
   for(int i=5; i<height; i+=30){
    noStroke();
    fill(color1,color2,color3);
    rect(x,i,20,20);
}  
}
/*Antes de dibujar el cupcake, tendremos que actualizar las
posiciones que queremos que estos tengan y también poner sus
límites*/
    //actualizamos las posiciones de los cupcakes.
  for(int i = 0; i<numBoles; i++){
    posicionsX[i] += velocitatsX[i];
    posicionsY[i] += velocitatsY[i];
    
  /*Seguimos poniendo los límites de los cupcakes, en este caso
    queremos que estos sean los límites de la ventana*/    
   /*La primera variable sirve para que el cupcake cambie la 
    dirección en el sentido de las X, en cuanto llega a los limites 
    que hemos determinado*/
  if((posicionsX[i]<0)||(posicionsX[i]>width-100)){
    velocitatsX[i] = -velocitatsX[i];
    /*Hacemos que con este mismo condicional, es decir, los mismos 
    límites, empiece el sonido desde el segundo 0*/
   audioElement.setAttribute ("src","wow.mp3");
   audioElement.play();
  }
  
/*El segundo condicional sirve para que el cupcake cambie la 
dirección en el sentido de las Y*/
  if((posicionsY[i]<50)||(posicionsY[i]>height-35)){
    velocitatsY[i] = -velocitatsY[i];
   audioElement.setAttribute ("src","wow.mp3");
   audioElement.play();
  }
  
  /*Ponemos el cupcake que cogemos del seminario anterior como 
  base para trabajar este ejercicio, tenedremos que cambiar las
  variables de la posición a los que hemos definido anteriormente,
  en este caso "posicionsX" y "posicionsY"*/
  
  //Perfil de la base del cupcake. Lo he hecho a traves de vértices. 
  fill(196,250,103);
  noStroke();
   beginShape();
  vertex(posicionsX[i],posicionsY[i]);
  vertex(posicionsX[i]+25,posicionsY[i]+45);
  vertex(posicionsX[i]+75,posicionsY[i]+45);
  vertex(posicionsX[i]+100,posicionsY[i]);
  vertex(posicionsX[i],posicionsY[i]);
  endShape();
//color y forma de la magdalena del cupcake.Elipse.
  fill(155,90,11);
  ellipse(posicionsX[i]+50,posicionsY[i],100,25);
//color y superficie del cupcake.Círculos.
  fill(253,255,173);
  ellipse(posicionsX[i]+10,posicionsY[i]-10,30,30);
  ellipse(posicionsX[i]+25,posicionsY[i]-20,30,30);
  ellipse(posicionsX[i]+25,posicionsY[i]-15,30,30);
  ellipse(posicionsX[i]+40,posicionsY[i]-30,30,30);
  ellipse(posicionsX[i]+90,posicionsY[i]-10,30,30);
  ellipse(posicionsX[i]+75,posicionsY[i]-20,30,30);
  ellipse(posicionsX[i]+60,posicionsY[i]-30,30,30);
  ellipse(posicionsX[i]+50,posicionsY[i]-40,30,30);
  ellipse(posicionsX[i]+50,posicionsY[i]-20,30,30);
  ellipse(posicionsX[i]+40,posicionsY[i]-10,30,30);
  ellipse(posicionsX[i]+60,posicionsY[i]-10,30,30);
//diferentes adornos del cupcake. Círculos.
  fill(252,25,113);
  ellipse(posicionsX[i]+40,posicionsY[i]-40,mz,mz);
  fill(255);
  ellipse(posicionsX[i]+38,posicionsY[i]-42,8,8);
//bolitas de color verde
  fill(28,252,25);
  ellipse(posicionsX[i]+5,posicionsY[i]-10,5,5);
  ellipse(posicionsX[i]+25,posicionsY[i]-15,5,5);
  ellipse(posicionsX[i]+75,posicionsY[i]-20,5,5);
  ellipse(posicionsX[i]+55,posicionsY[i]-50,5,5);
//bolitas de color azul
  fill(0,250,255);
  ellipse(posicionsX[i]+15,posicionsY[i]-20,5,5);
  ellipse(posicionsX[i]+65,posicionsY[i]-40,5,5);
  ellipse(posicionsX[i]+100,posicionsY[i]-5,5,5);
  ellipse(posicionsX[i]+55,posicionsY[i]-8,7,5);
//bolitas de color rosa
  fill(255,3,230);
  ellipse(posicionsX[i]+85,posicionsY[i]-15,5,5);
  ellipse(posicionsX[i]+50,posicionsY[i]-20,5,5);
  ellipse(posicionsX[i]+17,posicionsY[i],5,5);
//bolitas de color rojo
  fill(255,0,0);
  ellipse(posicionsX[i]+80,posicionsY[i]+3,5,5);
  ellipse(posicionsX[i]+40,posicionsY[i]-8,5,5);
  ellipse(posicionsX[i]+70,posicionsY[i]-30,5,5);
  ellipse(posicionsX[i]+20,posicionsY[i]-32,5,5);
 
  
/*Ahora que ya hemos dibujado el cupcake pasamos a poner que
el color del mantel cambie dependiendo de la posición del 
ratón en la ventana; cambiará en las esquinas*/
  //4º Cuadrante -- Verde
  if((mouseX>height/2)&&(mouseY>width/2)){
    color1 = 215;
    color2 = 219;
    color3 = 20;
  }
  //1r Cuandrante -- Rosa
  if((mouseX<height/2)&&(mouseY<width/2)){
    color1 =250;
    color2 =73;
    color3 =97; 
  }
  //2º Cadrante -- Azul
  if((mouseX>height/2)&&(mouseY<width/2)){
    color1 = 71;
    color2 = 160;
    color3 = 252;
  }
  //3r Cuadrante -- Naranja
  if((mouseX<height/2)&&(mouseY>width/2)){
    color1 =245;
    color2 =151;
    color3 =49;
  }
  
}
}
  
/*Una vez hemos definido también los diferentes colores, haremos
que la bola principal de adorno se haga más grande cuando 
apretamos el mouse y cuando llega a un máximo vuelva al tamaño
inicial*/

  void mousePressed(){

     if (mz<60){
     mz=mz+2;
      }
    if (mz>=60){ 
      mz=25;
      }
  }




