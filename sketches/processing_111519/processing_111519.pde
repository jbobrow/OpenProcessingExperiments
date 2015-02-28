
/* TALLER 3: JUEGO ESTILO PAC-MAN
 JUAN SEBASTIÁN PRIETO C.
 12112046 */

// VARIABLES

// PANTALLAS

int pantalla; // Variables para cambiar pantallas
int perder, ganar; 

// PUNTAJE, VIDAS

int puntaje; // Variable de puntos
int vida; // Variable de vidas

// PODERES
int velocidad; 
boolean poder; // Booleano para determinar si se presenta o no el poder
int contador; // duracion poder
boolean randomelement; // Booleano para determinar si existe o no el elemento random
int counter2; // contador para elemento random
boolean randomelement2; // Booleano para determinar si hay o no elemento aleatorio
int counter3; // contador para el elemento random 2


// TEXTO
PFont txtPuntaje; // fuente que se utilizará 




// -----------------------------------


// POSICION PERSONAJE
int poscookX, poscookY; // Posición personaje en pixeles
int pxm; // Posiciónpersonaje en matrizx
int pym; // Posiciónpersonaje en matrizy

//  POSICIÓN ENEMIGOS
// == DIZZY==
int posdizzyX, posdizzyY; // Dizzy posición pixeles
int pdxm;
int pdym; // posición DIZZY MATRIZ X y Y

// == SPIKE == 

int posspikeX, posspikeY; // Spike 
int psxm;
int psym; // en matriz Spike X y Y

// == SNAKE == 

int possnakeX, possnakeY;
int psnxm;
int psnym; // en matriz X y Y

// ---------------------------------------


// IMAGENES

// Cookie monster

PImage cookieder, cookieizq; // Imágenes determinadas por la dirección de nuestro personaje

// Booleans cookie

boolean cookieR=true, cookieL; // Booleanos para determinar dirección de nuestro personaje




// MALOS

// DIZZY

PImage dizzyR, dizzyL;

// SPIKE 

PImage spikeR, spikeL;

// SNAKE

PImage snakeR, snakeL;
boolean snakeder, snakeizq;

// ITEMS 

// Imágenes de los diferentes objetos que se utilizarán en el juego
PImage cookie;
PImage milk;
PImage powercookie;
PImage rayo;
PImage triplecookie;
PImage cooklife;

// PANTALLAS

// imágenes de cada pantalla/interfaz

PImage inicio, instrucciones, instrucciones2, juego, perdistea, perdisteb, ganastea, ganasteb;



// MATRIZ 

// MAPA

// Esta matriz servirá para colocar los diferentes elementos del juego:
// 1= Obstaculo, 2= Galleta, 3= Powercookie, 4= vida, 5= Elemento aleatorio

int [][] matrizmapa = {
  {
    1, 2, 2, 2, 2, 1, 2, 3, 2, 1, 2, 2, 2, 2, 1
  }
  , // Fila 1
  {
    2, 2, 1, 2, 2, 2, 2, 1, 2, 2, 2, 2, 1, 2, 2
  }
  , // Fila 2
  {
    2, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 2
  }
  , // Fila 3
  {
    2, 2, 1, 2, 2, 2, 2, 1, 2, 2, 2, 2, 1, 2, 2
  }
  , // fila 4
  {
    1, 2, 2, 3, 1, 0, 2, 2, 2, 0, 1, 3, 2, 2, 1
  }
  , // fila 5
  {
    0, 2, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 2, 6
  }
  , // fila 6
  {
    1, 2, 2, 2, 2, 2, 1, 4, 1, 2, 2, 2, 2, 2, 1
  }
  , // fila 7
  {
    2, 2, 1, 5, 1, 2, 2, 2, 2, 2, 1, 0, 1, 2, 0
  }
  , // fila 8
};

// Este es el mapa en el cual se reseteará todo, es igual al mapa original

int [][] matrizmapareset = {
  {
    1, 2, 2, 2, 2, 1, 2, 3, 2, 1, 2, 2, 2, 2, 1
  }
  , // Fila 1
  {
    2, 2, 1, 2, 2, 2, 2, 1, 2, 2, 2, 2, 1, 2, 2
  }
  , // Fila 2
  {
    2, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 2
  }
  , // Fila 3
  {
    2, 0, 1, 2, 2, 2, 2, 1, 2, 2, 2, 2, 1, 0, 2
  }
  , // fila 4
  {
    1, 0, 2, 3, 1, 0, 2, 2, 2, 0, 1, 3, 2, 0, 1
  }
  , // fila 5
  {
    0, 2, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 2, 0
  }
  , // fila 6
  {
    1, 2, 2, 2, 2, 2, 1, 4, 1, 2, 2, 2, 2, 2, 1
  }
  , // fila 7
  {
    0, 2, 1, 0, 1, 2, 2, 2, 2, 2, 1, 0, 1, 2, 0
  }
  , // fila 8
};



// MATRIZ ENEMIGOS

// Esta matriz se utilizará para darle el movimiento a Spike

int [][] matrizenemigos = {
  {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  }
  , // Fila 1
  {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  }
  , // Fila 2
  {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  }
  , // Fila 3
  {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  }
  , // fila 4
  {
    0, 0, 0, 0, 0, 0, 12, 11, 10, 9, 8, 0, 0, 0, 0
  }
  , // fila 5
  {
    0, 0, 0, 0, 0, 0, 13, 0, 0, 0, 7, 0, 0, 0, 0
  }
  , // fila 6
  {
    0, 0, 0, 0, 0, 0, 14, 0, 0, 0, 6, 0, 0, 0, 0
  }
  , // fila 7
  {
    0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 0, 0, 0, 0
  }
  , // fila 8
};



void setup() {

  size(1200, 600);

  // Variable pantalla

  pantalla=0;

  // VIDAS, ITEMS

  vida=2;
  puntaje=0;
  contador= 60; // el contador es 60 para darnos 60 unidades de tiempo
  poder =false; // el poder es falso en principio hasta que se coja la powercookie
  randomelement=false; // el elemento aleatorio es falso en principio, para que aparezca despues de cierto tiempo
  counter2=0;
  randomelement2=false;
  counter3=0;
  // POSICIÓN

  poscookX = 0; // POSICIÓN PERSONAJE
  poscookY = 0;
  pxm= 0; // posición personaje dentro de la matriz
  pym= 0;

  // FUENTE TEXTO

  // Aquí cargo la fuente que será utilizada

  txtPuntaje = loadFont ("cookiefont.vlw");
  textFont (txtPuntaje, 48);




  // POSICION ENEMIGOS

  velocidad = 1;

  // Dizzy
  posdizzyX = 0; // posición dizzy en pixeles
  posdizzyY = 434;
  pdxm = 0; // posición dizzy dentro de la matriz
  pdym = 7;

  // Spike
  posspikeX =434; // posición spike en pixeles
  posspikeY =434;
  psxm = 8; // posicion spike dentro de la matriz
  psym = 7;

  // Snake

  possnakeX=806;
  possnakeY=63;

  // booleano que determinará la imagen de dirección inicial del cookie monster
  cookieL= false; 

  // IMAGENES

  // pantallas

  inicio = loadImage("inicio.jpg");
  instrucciones = loadImage ("instrucciones.jpg");
  instrucciones2 = loadImage ("instrucciones2.jpg");
  juego = loadImage ("juego.png");
  perdistea = loadImage ("perdistea.jpg");
  perdisteb = loadImage ("perdisteb.jpg");
  ganastea = loadImage ("ganastea.jpg");
  ganasteb = loadImage ("ganasteb.jpg");

  // OBJETOS

  cooklife = loadImage ("cooklife.png");
  triplecookie = loadImage ("triplecookie.png");

  cookie = loadImage ("cookie.png");
  milk = loadImage ("leche.png");
  powercookie = loadImage ("powercookie.png");
  rayo = loadImage ("rayo.png");

  // PERSONAJES

  cookieder = loadImage ("cookieder.png");
  cookieizq =loadImage ("cookieizq.png");

  // ENEMIGOS

  dizzyR = loadImage ("dizzyder.png");
  dizzyL = loadImage ("dizzyizq.png");

  spikeR = loadImage ("spikeder.png");
  spikeL = loadImage ("spikeizq.png");

  snakeR = loadImage ("snakeder.png");
  snakeL = loadImage ("snakeizq.png");
}



// ------------------------------------------- END SETUP ---------------------------------------------------


// ------ DRAW--------

void draw() {

  // CAMBIAR PANTALLAS

  switch (pantalla) {

    // inicio
  case 0:
    image (inicio, 0, 0);

    break;
    // instrucciones
  case 1:
    image (instrucciones, 0, 0);
    // Area sensible para iluminar el botón para JUGAR
    if (mouseX>884 && mouseX<1110 && mouseY>481 && mouseY<528) {
      image(instrucciones2, 0, 0);
    }

    break;


    // ========= PANTALLA JUEGO =============
    // En este caso se cargaran todos los métodos para los distintos elementos: 
    // pintarmapa()= pintará los diferentes elementos del mapa

  case 2:
    // println ("JUGAR!"); 
    background(#FAF16C);
    image (juego, 0, 0);
    pintarmapa();
    evaluarCasos();
    pintarspike();
    if (frameCount%12*velocidad==0) {
      moverSpike();
    }

    pintarsnake();
    moverSnake();
    pintarcookie();
    pintardizzy();
    if (frameCount%17 == 0 ) {  
      moverDizzy();
    }

    // PODER inmune
    // Condicional si se coge un poder, lo tendremos por un tiempo definido.
    // Cada 15 Frames el contador disminuirá 1 hasta que dejemos de tener el poder.

    if (poder == true) {
      if (frameCount%15==0) {//Me ayudó Jhoan Rámirez
        contador--;
        pushMatrix();
        textFont (txtPuntaje, 36);
        fill (#D4145A);
        text ("Inmune", 952, 59);
        popMatrix();
      }
    }

    if (contador == 0) {
      poder=false;
      contador=60; // contador se devuelve para las otras galletas azules
    }

    // Contador para elemento aleatorio: TRIPLE COOKIES
    // el contador sumará 1 cada vez que pasen 60 Frames.

    if (frameCount%60==0) {
      counter2++;
    }
    // Contador para el elemento aleatorio: Rayo.
    // mismo método que el contador anterior.

    if (frameCount%60==0) {
      counter3++;
    }





    // Casos para perder una vida:
    // Condicionales en caso de que nos encontremos con alguno de los enemigos
    // y no tengamos el poder de inmunidad, perderemos una vida y volveremos al punto inicial.

    // muerte por Dizzy
    if ((dist(poscookX, poscookY, posdizzyX, posdizzyY)<62)&& poder==false) {
      vida--;
      poscookX=0;
      poscookY=0;
      pxm=0;
      pym=0;
    }

    // muerte por Spike

    if ((dist(poscookX, poscookY, posspikeX, posspikeY)<62)&& poder==false) {
      vida--;
      poscookX=0;
      poscookY=0;
      pxm=0;
      pym=0;
    }

    // muerte por Snake

    if ((dist(poscookX, poscookY, possnakeX, possnakeY)<62)&& poder==false) {
      vida--;
      poscookX=0;
      poscookY=0;
      pxm=0;
      pym=0;
    }




    // Imagen de cuantas vidas tengo: Depende de la variable vida.

    for (int i= 0; i<vida; i++) {
      image (cooklife, 24+(i*75), 520, 60, 60);
    }

    // Texto de cuantos puntos tengo 

    pushMatrix();
    textFont(txtPuntaje, 48);
    fill (#0070bb);
    text ("Puntos:"+puntaje, 540, 570);
    popMatrix();

    // PERDER O GANAR
    // Condiciones para saber en que momento pasar a los otros casos:
    // Si perdemos las vidas, perderemos. Si comemos todas las galletas, ganaremos.

    // perder

    if (vida==0) {
      pantalla=3;
    }

    // ganar

    if (puntaje>=640) {
      pantalla=4;
    }








    break;

    // ========== FIN PANTALLA JUEGO ============
    // perdiste
  case 3:
    image (perdistea, 0, 0);
    if (mouseX>520 && mouseX<677 && mouseY>512 && mouseY<543) {
      image (perdisteb, 0, 0);
    }
    pushMatrix(); // MUESTRA EL PUNTAJE OBTENIDO
    textFont(txtPuntaje, 48);
    fill (255);
    text ("Puntos:"+puntaje, 400, 214);
    popMatrix();



    break;
    // ganaste
  case 4:
    image (ganastea, 0, 0);
    if (mouseX>520 && mouseX<674 && mouseY>483 && mouseY<513) {
      image (ganasteb, 0, 0);
      pushMatrix(); // MUESTRA EL PUNTAJE OBTENIDO
      textFont(txtPuntaje, 48);
      fill(255);
      text ("Puntos:"+puntaje, 400, 214);
      popMatrix();
      break;
    }
  }
}


// ----------------------- END DRAW ---------------------


// --------------- AREAS SENSIBLES PARA CAMBIAR PANTALLAS --------------

// --------------------- METODO MOUSE PRESSED ----------------------------

void mousePressed() {
  // indicador de pantalla
  println ("pantalla = " + pantalla);

  switch (pantalla) {
    // de inicio a instrucciones
  case 0:
    if (mouseX>410 && mouseX<770) {
      if (mouseY>470 && mouseY<520) {
        pantalla=1;
      }
    }
    break;

    // de instrucciones a juego
  case 1:
    if (mouseX>884 && mouseX<1110 && mouseY>481 && mouseY<528) {
      pantalla=2;
    }

    break;

  case 2:
    break;

  case 3: // perdiste
    if (mouseX>520 && mouseX<677 && mouseY>512 && mouseY<543) {
      reset();
    }

    break;

  case 4: // ganaste
    if (mouseX>520 && mouseX<674 && mouseY>483 && mouseY<513) {
      reset();

      break;
    }
  }
}

// -------------------- END MOUSEPRESSED -------------------


// ================ PINTAR PERSONAJES (COOKIE MONSTER, ENEMIGOS) ========================

// ------ POSICIÓN COOKIE MONSTER - INICIAL --------
// Pinta a Cookie Monster dependiendo de la dirección a la que vaya con el booleano.
void pintarcookie() {

  if (cookieR == true) {
    image (cookieder, poscookX, poscookY); 
    cookieL=false;
  }

  if (cookieL == true) {
    image (cookieizq, poscookX, poscookY);
    cookieR=false;
  }
}

// ------- POSICIÓN SPIKE INICIAL ---------

void pintarspike() {

  image (spikeL, posspikeX, posspikeY);
}

// ------- Mover spike ----

// Ayudado por monitor: Gerson Mena
// Mueve a Spike siguiendo un orden predefinido por la matriz "matrizenemigos"
// Mueve 62 pixeles que es igual a un cuadrado de la matriz.

void moverSpike() {
  println(matrizenemigos[psym][psxm]+"Matriz");
  if (matrizenemigos[psym][psxm]<matrizenemigos[psym][psxm+1]) {
    posspikeX+=62;
    psxm++;
  }
  if (matrizenemigos[psym][psxm]<matrizenemigos[psym][psxm-1]) {
    posspikeX-=62;
    psxm--;
  }
  if (matrizenemigos[psym][psxm]==12 || matrizenemigos[psym][psxm]==13) {
    posspikeY+=62;
    psym++;
  }
  if (matrizenemigos[psym][psxm]<matrizenemigos[psym-1][psxm]) {
    posspikeY-=62;
    psym--;
  }
  if (matrizenemigos[psym][psxm]==14) {
    posspikeY+=62;
    psym++;
  }
}




// --------- POSICIÓN DIZZY INICIAL ---------

void pintardizzy() {

  image (dizzyR, posdizzyX, posdizzyY);
}

// ------- MOVER A DIZZY --------- 
// Movimiento aleatorio (basado en tutoría)

// Mueve a Dizzy en dirección aleatoria avanzando o retrocediendo 1 cuadro o 62 pixeles.

void moverDizzy() {
  int dir = (int) random (0, 4);
  switch (dir) {
  case 0:
    //  derecha
    if ( pdxm < 14 &&  matrizmapa[pdym][pdxm+1] !=1 ) {
      pdxm+=1;
      posdizzyX+=62;
    }
    break;

  case 1:
    // arriba
    if ( pdym>0 && pdym<8 && matrizmapa[pdym-1][pdxm] !=1 ) {
      pdym-=1;
      posdizzyY-=62;
    }
    break;
  case 2:
    // izquierda  
    if (pdxm>0 && pdxm<15 && matrizmapa[pdym][pdxm-1] !=1) {
      pdxm-=1;
      posdizzyX-=62;
    }
    break;
  case 3:
    //abajo 
    if ( pdym<7 && pdym>=0 && matrizmapa[pdym+1][pdxm]!=1) {
      pdym+=1;
      posdizzyY+=62;
    }
    break;
  }
}





// --------- POSICIÓN SNAKE ---------

//possnakeX, possnakeY; posiciones px
//psnxm, int psnym; posiciones matriz

void pintarsnake() {
  image (snakeL, possnakeX, possnakeY);
}


// ------ Mover Snake -----

void moverSnake() {
  if (possnakeX<806) {
    possnakeX-=62;
  }
  if (possnakeX==0) {
    possnakeX=806;
  }
}




// ========== FIN PINTAR PERSONAJES ==========



// ----------------- PINTAR MAPA -----------------

void pintarmapa() {

  for (int fila=0; fila<8 ; fila++) {
    for (int col=0; col<15; col++) {



      switch (matrizmapa [fila] [col]) {

      case 0: // NADA
        //noStroke();
        //fill(255);
        //rect (col*62, fila*62, 50, 50);   

        break;

      case 1:

        break;

      case 2: // galleta
        image (cookie, 0+col*62, 0+fila*62);

        break;

      case 3: // power cookie
        image (powercookie, 0+col*62, 0+fila*62);
        break;

      case 4: // MILK

        image (milk, 0+col*62, 0+fila*62);

        break;

      case 5: // triplecookie random element

        if (counter2>=9 && counter2<=16) {
          randomelement=true;
        }
        else {
          randomelement= false;
        }

        if (randomelement==true) {
          image(triplecookie, 0+col*62, 0+fila*62);
        }
        break;

      case 6: // Rayo random element
        if (counter3>=4 && counter3<=11) {
          randomelement2=true;
        }
        else {
          randomelement2=false;
        }
        if (randomelement2==true) {
          image(rayo, 0+col*62, 0+fila*62);
        }
      }
    }

    // println(pym+" "+pxm);
    // println(matrizmapa[pym][pxm]);
    // println ("este es el puntaje"+puntaje);
  }
}


  // =============== FIN PINTAR MAPA ====================



  // ------------ MOVER COOKIE -------------------


  // ---------- KEY PRESSED ------------

  // Con el metodo keypressed moveremos al personaje principal
  // Las entradas a este método son las teclas arriba abajo izquierda derecha en nuestro teclado
  // Cada condicional define la dirección de nuestro personaje y el avance/retroceso
  // Este método controla la posición de nuestro personaje en pixeles y en la matriz.
  // Además se evaluarán los casos de la matriz, para de esta forma sumar puntos, vidas etc.

  void keyPressed() {

    // 1= OBSTACULO, 0=NADA, 2=GALLETA, 3=POWERCOOKIE, 4= LECHE, 



    if (key==CODED ) 

    {

      if (keyCode ==RIGHT) {
        if (pxm+1<15 && matrizmapa[pym][pxm+1] !=1 )  {

          pxm+=1; // AVANZA UNA POSICION EN LA MATRIZ
          poscookX+=62; // AVANZA 62px

          //ACA SE CAMBIA LA GALLETA POR ESPACIO VACIO
          if (matrizmapa[pym][pxm] == 2) {
            matrizmapa[pym][pxm]=0;
            puntaje+=10;
          }
          //ACA SE CAMBIA LA GALLETA AZUL POR ESPACIO VACIO
          if (matrizmapa[pym][pxm] ==3) {
            matrizmapa[pym][pxm]=0;
            poder= true;
          }
          if (matrizmapa[pym][pxm] ==4) {
            matrizmapa[pym][pxm]=0;
            vida+=1;
          }
          if (matrizmapa[pym][pxm] ==5 && randomelement==true) {
            matrizmapa[pym][pxm]=0;
            puntaje*=3;
          }
          if (matrizmapa[pym][pxm] ==6 && randomelement2==true) {
            matrizmapa[pym][pxm]=0;
            velocidad*=2;
          }
        }
        cookieR=true;
        cookieL=false;
      }

      if (keyCode == LEFT) {
        if (pxm-1>=0 && matrizmapa[pym][pxm-1] !=1) {

          pxm-=1; // RETROCEDE 1 CASILLA EN LA MATRIZ
          poscookX-=62; // RETROCEDE 62px 

          // ACA SE CAMBIA LA GALLETA POR ESPACIO VACIO
          if (matrizmapa[pym][pxm]==2) {
            matrizmapa[pym][pxm]=0;
            puntaje+=10;
          }
          //ACA SE CAMBIA LA GALLETA AZUL POR ESPACIO VACIO
          if (matrizmapa[pym][pxm] ==3) {
            matrizmapa[pym][pxm]=0;
            poder=true;
          }
          if (matrizmapa[pym][pxm] ==4) {
            matrizmapa[pym][pxm]=0;
            vida+=1;
          }
          if (matrizmapa[pym][pxm] ==5 && randomelement==true) {
            matrizmapa[pym][pxm]=0;
            puntaje*=3;
          }
          if (matrizmapa[pym][pxm] ==6 && randomelement2==true) {
            matrizmapa[pym][pxm]=0;
            velocidad*=2;
          }
          cookieR=false;
          cookieL=true;
        }
      }


      if (keyCode == DOWN) {
        if (pym+1<8 && matrizmapa[pym+1][pxm] !=1) {

          poscookY+=62;
          pym+=1;

          if (matrizmapa[pym][pxm] ==2) {
            matrizmapa[pym][pxm]=0;
            puntaje+=10;
          }
          //ACA SE CAMBIA LA GALLETA AZUL POR ESPACIO VACIO
          if (matrizmapa[pym][pxm] ==3) {
            matrizmapa[pym][pxm]=0;
            poder=true;
          }
          if (matrizmapa[pym][pxm] ==4) {
            matrizmapa[pym][pxm]=0;
            vida+=1;
          }
          if (matrizmapa[pym][pxm] ==5 && randomelement==true) {
            matrizmapa[pym][pxm]=0;
            puntaje*=3;
          }
          if (matrizmapa[pym][pxm] ==6 && randomelement2==true) {
            matrizmapa[pym][pxm]=0;
            velocidad*=2;
          }
        }
      }

      if (keyCode == UP) {
        if (pym-1>=0 && matrizmapa[pym-1][pxm] !=1) {

          poscookY-=62;
          pym-=1;


          if (matrizmapa[pym][pxm] ==2) {
            matrizmapa[pym][pxm]=0;
            puntaje+=10;
          }
          if (matrizmapa[pym][pxm] ==3) {
            matrizmapa[pym][pxm]=0;
            poder=true;
          }
          if (matrizmapa[pym][pxm] ==4) {
            matrizmapa[pym][pxm]=0;
            vida+=1;
          }
          if (matrizmapa[pym][pxm] ==5 && randomelement==true) {
            matrizmapa[pym][pxm]=0;
            puntaje*=3;
          }
          if (matrizmapa[pym][pxm] ==6 && randomelement2==true) {
            matrizmapa[pym][pxm]=0;
            velocidad*=2;
          }
        }
      }
    }
  }   




  // ------------- FIN KEYPRESSED

  // ------------- METODO EVALUAR CASOS: PUNTAJE ETC -----------------

  void evaluarCasos() {
    if (matrizmapa [pym] [pxm] == 2) {
      puntaje+=10;
      println ("puntos: "+puntaje);
    }
  }




  // ----------- METODO RESETEAR

  // En este método las variables volverán a su estado inicial 

  void reset () {

    pantalla=0;
    puntaje=0;
    vida=2;

    // POSICIÓN

    poscookX = 0; // POSICIÓN PERSONAJE
    poscookY = 0;
    pxm= 0;
    pym= 0;



    // POSICION ENEMIGOS

    velocidad = 1;

    // Dizzy
    posdizzyX = 0;
    posdizzyY = 434;
    pdxm = 0;
    pdym = 7;

    // Spike
    posspikeX =434;
    posspikeY =434;
    psxm = 8;
    psym = 7;



    // boolean
    cookieL= false;

    pintarmapa();
  }




  // ========== CODE END ================



