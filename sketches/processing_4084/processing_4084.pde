
/*______JARDIN MULTICOLOR______*/
/*___Proyecto final LC0 2009___*/
/*_______Patricia Vejar_______*/

/*Se usa el mouse como un pincel al que le siguen puntos de colores
*y con diferentes rangos de transparencia, al hacer click aparecen
*las flores que siguen la misma secuencia de colores, creando un
*colorido dibujo como un jardín multicolor en un lienzo que puede
*ser negro o blanco (el fondo blanco aparece al oprimir una tecla
*y vuelve a ser negro al cruzar los límites).
*El dibujo está marcado por límites, anunciados por cuatro puntos
*ubicados en las esquinas (círculos blancos en el lienzo negro y
*anillos negros en el lienzo blanco). Una vez que el cursor del
*mouse cruza estos límites lo antes dibujado desaparece, dejando
*así el espacio vacío para volver a empezar.*/

int c;

void setup(){
  size(800,500);
  colorMode(HSB,255); 
  c=0;
  smooth();
}

void draw(){ //se crea un dibujo a partir de puntos de colores que siguen al cursor del mouse
  c=(c+1)%256; //matices con que se dibujará
  noStroke();
  fill(c,255,250,random(10,50)); //colores y transparencias, estas últimas definidas por random entre los parámetros 50 y 100
  ellipse(random(mouseX-15, mouseX+15),random(mouseY-15,mouseY+15),10,10);
  if(mouseX>750 || mouseX<50 || mouseY<50 || mouseY>450){//parámetros en que se realiza el dibujo, marcado por los límites señalados más adelante
    background(0); //al traspasar con el cursor del mouse estos límites el fondo se vuelve negro, borrando lo dibujado para volver a empezar
  }
  limites();
}

void limites(){ //cuatro ellipses situados en las esquinas corresponde al límite del dibujo
  fill(255,100);
  ellipse(750,450,5,5);
  ellipse(750,50,5,5);
  ellipse(50,450,5,5);
  ellipse(50,50,5,5);
  if (keyPressed){ //al oprimir una tecla cualquiera, los límites pasan a ser anillos negros, esto debido a otro cambio que se explica al final
      stroke(0);
      strokeWeight(5);
      ellipse(750,450,5,5);
      ellipse(750,50,5,5);
      ellipse(50,450,5,5);
      ellipse(50,50,5,5);
  }
}

void mousePressed(){ //al hacer click aparece una flor señalada por el mouse
  strokeWeight(1);
  stroke(255);
  noFill();
  ellipse(mouseX,mouseY,30,30); //centro de la flor, conformado por un anillo blanco
  noFill();
  stroke(c,255,250,random(100,150)); //los pétalos formados por los cuatro ellipses siguientes siguen la secuencia de colores de los puntos, pero un rango menor de transparencia
  ellipse(mouseX+20,mouseY+20,40,40);
  ellipse(mouseX+20,mouseY-20,40,40);
  ellipse(mouseX-20,mouseY-20,40,40);
  ellipse(mouseX-20,mouseY+20,40,40);
}

void keyPressed(){ //al oprimir una tecla el fondo se vuelve blanco, creando así una nueva tela donde dibujar
  background(255); //permanecen los límites, y al traspasarlos el fondo vuelve a ser negro
}

