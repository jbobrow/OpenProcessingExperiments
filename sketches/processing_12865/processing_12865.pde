
/*

 Proyecto Individual 4 - Papel Tapiz
 Daniel Alejandro Bolívar
 07211011
 
 Análisis:
 
 Salidas:  Una composición basada basada en módulos, que forman una gran imagen semejante a un papel tapiz, 
 o el decorado de una alfombra persa. 
 Entradas: El usuario, por medio de las herramientas que tiene a su alcance (mouse y teclado), puede interactuar
 con la pieza de la siguiente manera: la posición del mouse controla levemente la velocidad de rotación
 de los pequeños círculos. El botón izquierdo del mouse, cambia el color del módulo, y el botón derecho
 cambia la apariencia de este. La teclas "arriba, abajo, derecha e izquierda", llevan la composición
 a uno de sus 4 estados homogeneos (donde cada módulo es igual), y cualquier otra tecla lleva cada módulo
 a cambiar por su inverso directo, en terminos de color.
 Proceso: *Variables Globales:
 Imagenes: modulo1, modulo2, circulo que rota 1, circulo que rota 2, modulo1V(de diferencia 
 en aspecto), modulo2V, circulo que rota 1 V, circulo que rota 2 V. 
 Float:    rotación, velocidad de la rotación.
 Matriz de 6x7.
 *Metodo Setup:
 - Defino el FrameRate como 30.  
 - Defino el fondo como negro. 
 - Inicializo las diferentes variables de imagen, como su imagen correspondiente
 - Defino el tamaño del lienzo en 600x700.
 - Inicializo cada casilla de la matriz en 0, por medio de una estructura repetitiva for.       
 *Metodo Draw: 
 - Limpio el lienzo. 
 - Dentro de una estructura repetitiva for (esta estructura se repite a lo largo del código, 
 por lo que de ahora en adelante la voy a mencionar solo como "el for"), donde defino e 
 inicializo una variable entera, que va a determinar el valor de la primera casilla de la matriz, 
 en 0, con condición de que dicha variable sea menor a la longitud de la matriz, y con aumento de 1 unidad. 
 Dentro de esa estructura, habrá otra estructura con el mismo esquema, pero para el valor de la segunda casilla
 de la matriz. 
 - Como acciones dentro del for: si el valor de la casilla de la matriz es 0, dibujo una imágen correspondiente
 al primer módulo. Además, usando push y pop matrix traslado mi punto de anclaje al centro de cada casilla
 y defino mi "imageMode" como CENTER (solo para generar la rotación, para la proxima acción la vuelvo a cambiar a 
 CORNER y así sucesivamente, genero una rotación basada en las variables "rotacion"  y "velocidad", y dibujo la imagen
 que rota correspondiente al primer módulo.
 Esta acción la repito cambiando los valores de la matriz a 1, 2 o 3, y asignandole a cada valor, una de las imagenes
 posibles (modulo 2, modulo 1V, modulo 2V) y a su vez su parte "rotatoria" correspondiente de la misma forma. Al finalizar
 cada una de estas acciones, le sumo 0.01 al valor de la rotación.
 
 *Metodo mouseMoved: Defino la velocidad como la distancia del centro del lienzo a la posición del mouse, dividida por 100. 
 
 *Metodo mousePressed: Usando "el for", defino las siguientes acciones:
 - Si la posición del mouse esta en algunas de las casillas imaginarias de la matriz, que estan
 definidas por cada módulo
 Si el botón del mouse que oprimo es el izquierdo, entonces:
 Si el valor de esa casilla era 0, lo vuelvo 1, si era 1 lo vuelvo 0, si era 2, lo vuelvo 3
 y si era 3 lo vuelvo 2. 
 Si en cambio, el botón del mouse que oprimo es el derecho, entonces:
 Si el valor de la casilla era 0, lo vuelvo 2, si era 2, lo vuelvo 0, si era 1, lo vuelvo 3
 si era 3, lo vuelvo 1. 
 
 *Metodo keyPressed:  Usando "el for", defino las siguientes acciones:
 - Si presiono cualquier tecla (excepto arriba, abajo, izquierda o derecha), entonces:
 si el valor de una casilla (aplicado a todas las casillas) era 0, entonces se vuelve 1, si era
 1, se vuelve 0, si era 2, se vuelve 3 y si era 3, se vuelve 2. 
 - Si presiono la tecla arriba:
 Todas las casillas obtienen el valor de 0. 
 - Si presiono la tecla abajo:
 Todas las casillas obtienen el valor de 1. 
 - Si presiono la tecla izquierda:
 Todas las casillas obtienen el valor de 2. 
 - Si presiono la tecla derecha:
 Todas las casillas obtienen el valor de 3. 
 
 */

// Variables Globales                                 
PImage moduloUno,moduloUnoV,moduloDos,moduloDosV,rotaUno,rotaUnoV,rotaDos,rotaDosV;
float rotacion,velocidad;
int[][] matriz=new int[7][7];

void setup() {
  frameRate(30); 
  background(0);
  moduloUno=loadImage("modulo1.png");
  moduloUnoV=loadImage("modulo1v.png");
  moduloDos=loadImage("modulo2.png");
  moduloDosV=loadImage("modulo2v.png");
  rotaUno=loadImage("rota1.png");
  rotaUnoV=loadImage("rota1v.png");
  rotaDos=loadImage("rota2.png");
  rotaDosV=loadImage("rota2v.png");
  size(600,700);
  smooth();
  for(int posX=0;posX<matriz.length;posX++) {
    for(int posY=0;posY<matriz.length;posY++) {
      matriz[posX][posY]=0;
    }
  }
}

void draw() {

  background(0);


  //Definición de la apariencia del lienzo

  for(int posX=0;posX<matriz.length;posX++) {
    for(int posY=0;posY<matriz.length;posY++) {

      if(matriz [posX][posY]==0) {
        imageMode(CORNER);
        image(moduloUno,100*posX,100*posY);
        pushMatrix();

        translate(100*posX+rotaUno.width/2,100*posY+rotaUno.width/2);

        rotate(rotacion+(velocidad+1));
        imageMode(CENTER);
        image(rotaUno,0,0);
        rotacion+=0.01;
        popMatrix();
      }
      else {
        if(matriz [posX][posY]==1) {
          imageMode(CORNER);
          image(moduloDos,100*posX,100*posY);
          pushMatrix();

          translate(100*posX+rotaDos.width/2,100*posY+rotaDos.width/2);
          rotate(rotacion+(velocidad+1));
          imageMode(CENTER);
          image(rotaDos,0,0);
          rotacion+=0.01;
          popMatrix();
        }
        else {
          if(matriz [posX][posY]==2) {
            imageMode(CORNER);
            image(moduloUnoV,100*posX,100*posY);
            pushMatrix();

            translate(100*posX+rotaDos.width/2,100*posY+rotaDos.width/2);
            rotate(rotacion+(velocidad+1));
            imageMode(CENTER);
            image(rotaUnoV,0,0);
            rotacion+=0.01;
            popMatrix();
          }
          else {
            if(matriz [posX][posY]==3) {
              imageMode(CORNER);
              image(moduloDosV,100*posX,100*posY);
              pushMatrix();

              translate(100*posX+rotaDos.width/2,100*posY+rotaDos.width/2);
              rotate(rotacion+(velocidad+1));
              imageMode(CENTER);
              image(rotaDosV,0,0);
              rotacion+=0.01;
              popMatrix();
            }
          }
        }
      }
    }
  }
}

//Definicion de la variable velocidad, que define la rotación. 

void mouseMoved() {
  velocidad=dist(width/2,height/2,mouseX,mouseY)/100;
}

//Definición de las zonas sensibles del mouse, y las condiciones

void mousePressed() {

  for ( int posX=0;posX<matriz.length;posX++) {
    for (int posY=0;posY<matriz.length;posY++) {

      if( mouseX>posX*100 && mouseX<(posX+1)*100) {
        if( mouseY>posY*100 && mouseY<(posY+1)*100) {
          if(mouseButton==LEFT) {
            if(matriz[posX][posY]==0) {
              matriz[posX][posY]=1;
            }
            else {
              if(matriz[posX][posY]==1) {
                matriz[posX][posY]=0;
              }
              else {
                if(matriz[posX][posY]==2) {
                  matriz[posX][posY]=3;
                }
                else {
                  if(matriz[posX][posY]==3) {
                    matriz[posX][posY]=2;
                  }
                }
              }
            }
          }
          if(mouseButton==RIGHT) {
            if(matriz[posX][posY]==0) {
              matriz[posX][posY]=2;
            }
            else {
              if(matriz[posX][posY]==2) {
                matriz[posX][posY]=0;
              }
              else {
                if(matriz[posX][posY]==1) {
                  matriz[posX][posY]=3;
                }
                else {
                  if(matriz[posX][posY]==3) {
                    matriz[posX][posY]=1;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}





//Definición de interactividad con el teclado

void keyPressed() {
  for(int posX=0;posX<matriz.length;posX++) {
    for(int posY=0;posY<matriz.length;posY++) {
      if(matriz[posX][posY]==0) {
        matriz[posX][posY]=1;
      }
      else {
        if(matriz[posX][posY]==1) {
          matriz[posX][posY]=0;
        }
        else {
          if(matriz[posX][posY]==2) {
            matriz[posX][posY]=3;
          }
          else {
            if(matriz[posX][posY]==3) {
              matriz[posX][posY]=2;
            }
          }
        }
      }

      if(key==CODED) {
        if(keyCode==UP) {


          matriz[posX][posY]=0;
        }
        if(keyCode==DOWN) {

          matriz[posX][posY]=1;
        }
        if(keyCode==LEFT) {
          matriz[posX][posY]=2;
        }
        if(keyCode==RIGHT) {
          matriz[posX][posY]=3;
        }
      }
    }
  }
}


