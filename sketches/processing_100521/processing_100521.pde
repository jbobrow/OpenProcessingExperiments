
//Posiciones X y Y del personaje ppal
int posX;
int posY;

//Hud (Información de vidas y puntos)
PImage hud;
//Puntaje
int puntaje;
//Vidas
int vidas;

//Pantalla a mostrar
int pantalla;

//Pantalla Inicial - Final - Ganador
PImage pantallaInicial;
PImage pantallaFinal;
PImage pantallaGanaste;

//Pantallas
PImage pantallaInstrucciones;
PImage pantallaPersonajes;
PImage pantallaEscenarios;


//Botones
PImage boton;
PImage botonMouseEncima;
PImage botonClicked;

//Ocultar botón inicial al oprimir clic (porque cambia de tamaño y se vería el mas grande detrás)
boolean mostrarBotonInicial;

//Escenarios
PImage escenarioAcertijo;
PImage escenarioLuthor;
PImage escenarioSuperman;

//Héroes
PImage flashBocaCerrada;
PImage flashBocaAbierta;

PImage supermanBocaCerrada;
PImage supermanBocaAbierta;

PImage batmanBocaCerrada;
PImage batmanBocaAbierta;

//Villanos
PImage cold;
PImage coldDebilitado;
PImage luthor;
PImage luthorDebilitado;
PImage joker;
PImage jokerDebilitado;

//Posición villanos
//Joker
int jokerXEscenarioUno;
int jokerYEscenarioUno;
int jokerXEscenarioDos;
int jokerYEscenarioDos;
int jokerXEscenarioTres;
int jokerYEscenarioTres;

//Luthor
int luthorXEscenarioUno;
int luthorYEscenarioUno;
int luthorXEscenarioDos;
int luthorYEscenarioDos;
int luthorXEscenarioTres;
int luthorYEscenarioTres;

//Cold
int coldXEscenarioUno;
int coldYEscenarioUno;
int coldXEscenarioDos;
int coldYEscenarioDos;
int coldXEscenarioTres;
int coldYEscenarioTres;

//Velocidad villanos
int velocidad;

//Selección de Personaje (Flash=1, Superman=2, Batman=3)
int seleccionPersonaje;

//Dirección a la que se mueven los personajes (-1 izquierda, 1 derecha)
int direccionPersonajes;

//Aparecer personajes en la pantalla de selección al pasar el mouse por encima
PImage flashSeleccion;
PImage supermanSeleccion;
PImage batmanSeleccion;

//Aparecer escenarios en la pantalla de selección al pasar el mouse por encima
PImage mansionLuthorSeleccion;
PImage escenarioSupermanSeleccion;
PImage escenarioAcertijoSeleccion;

//Ítems
PImage moneda;
PImage itemVida;
PImage itemCambio;
PImage itemJusticeUno;
PImage itemJusticeDos;

boolean mostrarItemCambio;
boolean mostrarItemVida;
boolean mostrarItemJusticeUno;
boolean mostrarItemJusticeDos;

//Ataque a enemigos (vuelve vulnerables a los villanos al pasarles por encima)
boolean debilitarEnemigos;

//Aparición de ítem aleatorio
int posXItemAleatorioUno;
int posYItemAleatorioUno;
int posXItemAleatorioDos;
int posYItemAleatorioDos;
int posicionItemAleatorioUno;
int posicionItemAleatorioDos;

//Tiempo que pasan los enemigos debilitados
int timer;

//Selección de Escenario (Mansión Luthor=1, Fortaleza Soledad=2, Acertijo=3)
int seleccionEscenario;

//Animación final
int animacionFinal;
int abrirCerrarBoca;

//Diseño de las matrices (recorrido. El 1 indica obstáculos y el 0 por donde puede pasar)
int [][] matrizEscenarioLuthor= {
  {
    1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1
  }
  , 
  {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  }
  , 
  {
    0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 0
  }
  , 
  {
    1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1
  }
  , 
  {
    1, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1
  }
  , 
  {
    1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1
  }
  , 
  {
    1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1
  }
  , 
  {
    1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1
  }
  , 
  {
    1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1
  }
  , 
  {
    1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1
  }
  , 
  {
    1, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1
  }
  , 
  {
    1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1
  }
  , 
  {
    0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 0
  }
  , 
  {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  }
  , 
  {
    1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1
  }
  ,
};

int [][] matrizEscenarioSuperman= {
  {
    1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 0, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1
  }
  , 
  {
    0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0
  }
  , 
  {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0
  }
  , 
  {
    1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1
  }
  , 
  {
    1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1
  }
  , 
  {
    1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1
  }
  , 
  {
    0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0
  }
  , 
  {
    1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1
  }
  , 
  {
    1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1
  }
  , 
  {
    1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1
  }
  , 
  {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0
  }
  , 
  {
    0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0
  }
  , 
  {
    1, 1, 1, 0, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1
  }
  ,
};

int [][] matrizEscenarioAcertijo= {
  {
    1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1
  }
  , 
  {
    1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1
  }
  , 
  {
    1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1
  }
  , 
  {
    1, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1
  }
  , 
  {
    1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1
  }
  , 
  {
    0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 0
  }
  , 
  {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  }
  , 
  {
    1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1
  }
  , 
  {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  }
  , 
  {
    0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 0
  }
  , 
  {
    1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1
  }
  , 
  {
    1, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1
  }
  , 
  {
    1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1
  }
  , 
  {
    1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1
  }
  , 
  {
    1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1
  }
  ,
};

int [][] matrizMonedas;

void inicializarMatrizMonedas () { //Método para que pueda ser reiniciada al cambiar de escenario
  matrizMonedas = new int[][] {
    { 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0
    }
    , 
    {
      0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0
    }
    , 
    {
      0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0
    }
    , 
    {
      0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0
    }
    , 
    {
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    }
    , 
    {
      0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0
    }
    , 
    {
      0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0
    }
    , 
    {
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    }
    , 
    {
      0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0
    }
    , 
    {
      0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0
    }
    , 
    {
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    }
    , 
    {
      0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0
    }
    , 
    {
      0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0
    }
    , 
    {
      0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0
    }
    , 
    {
      0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0
    }
    ,
  };
}

void setup() {
  size(800, 600);
  posX=380;
  posY=300;

  //Pantalla inicial
  pantalla=0;

  //Hud (mostrar vidas y puntos)
  hud = loadImage("hud.png");
  vidas=3;

  //Pantalla Inicial - Final - Ganador
  pantallaInicial = loadImage("pantallaInicial.jpg");
  pantallaFinal = loadImage("pantallaFinal.jpg");
  pantallaGanaste = loadImage("pantallaGanaste.jpg");

  //Pantallas
  pantallaInstrucciones = loadImage("pantallaInstrucciones.jpg");
  pantallaPersonajes = loadImage("pantallaPersonajes.jpg");
  pantallaEscenarios = loadImage("pantallaEscenarios.jpg");

  //Botones
  boton = loadImage("boton.png");
  botonMouseEncima = loadImage("botonMouseEncima.png");
  botonClicked = loadImage("botonClicked.png");

  //Ocultar botón inicial al oprimir clic (porque cambia de tamaño y se vería el mas grande detrás)
  mostrarBotonInicial = true;


  //Escenarios
  escenarioAcertijo = loadImage("escenarioAcertijo.jpg");
  escenarioLuthor = loadImage("escenarioLuthor.jpg");
  escenarioSuperman = loadImage("escenarioSuperman.jpg");

  //Selección Personajes
  flashSeleccion = loadImage("flashSeleccion.png");
  supermanSeleccion = loadImage("supermanSeleccion.png");
  batmanSeleccion = loadImage("batmanSeleccion.png");

  //Selección Escenarios
  mansionLuthorSeleccion = loadImage("mansionLuthorSeleccion.png");
  escenarioSupermanSeleccion = loadImage("escenarioSupermanSeleccion.png");
  escenarioAcertijoSeleccion = loadImage("escenarioAcertijoSeleccion.png");

  //Héroes
  flashBocaCerrada = loadImage("flashBocaCerrada.png");
  flashBocaAbierta = loadImage("flashBocaAbierta.png");

  supermanBocaCerrada = loadImage("supermanBocaCerrada.png");
  supermanBocaAbierta = loadImage("supermanBocaAbierta.png");

  batmanBocaCerrada = loadImage("batmanBocaCerrada.png");
  batmanBocaAbierta = loadImage("batmanBocaAbierta.png");

  //Villanos
  cold = loadImage("cold.png");
  coldDebilitado= loadImage("coldDebilitado.png");
  joker = loadImage("joker.png");
  jokerDebilitado= loadImage("jokerDebilitado.png");
  luthor = loadImage("luthor.png");
  luthorDebilitado= loadImage("luthorDebilitado.png");
  
  //Posición villanos
//Joker
jokerXEscenarioUno=160;
jokerYEscenarioUno=40;
jokerXEscenarioDos=320;
jokerYEscenarioDos=0;
jokerXEscenarioTres=240;
jokerYEscenarioTres=80;

//Luthor
luthorXEscenarioUno=240;
luthorYEscenarioUno=80;
luthorXEscenarioDos=320;
luthorYEscenarioDos=240;
luthorXEscenarioTres=280;
luthorYEscenarioTres=440;

//Cold
 coldXEscenarioUno=240;
coldYEscenarioUno=200;
coldXEscenarioDos=440;
 coldYEscenarioDos=320;
 coldXEscenarioTres=520;
coldYEscenarioTres=480;

//Velocidad villanos
velocidad=2;

//Ataque a enemigos (vuelve vulnerables a los villanos al pasarles por encima)
debilitarEnemigos=false;

  //Ítems   
  inicializarMatrizMonedas (); //Para que pueda ser reiniciada al cambiar de escenario
  moneda = loadImage("moneda.png");
  itemVida = loadImage("itemVida.png");
  itemCambio = loadImage("itemCambio.png");
  itemJusticeUno = loadImage("itemJusticeUno.png");
  itemJusticeDos = loadImage("itemJusticeDos.png");
  
 mostrarItemCambio=true;
 mostrarItemVida=true;
mostrarItemJusticeUno=true;
mostrarItemJusticeDos=true;
  
  //Ítems aleatorios
  posXItemAleatorioUno=40;
  posYItemAleatorioUno=120;

  posXItemAleatorioDos=160;
  posYItemAleatorioDos=40;
  
posicionItemAleatorioUno = (int) random(1, 5);
posicionItemAleatorioDos = (int) random(1, 5);

//Dirección de desplazamiento personajes
direccionPersonajes=1; 
}


void draw() {
  smooth();
  background(0);
  imageMode(CORNER);

  switch (pantalla) {

  case 0:
    image(pantallaInicial, 0, 0);


    if (mostrarBotonInicial) {
      image(boton, 295, 400);
    }

    if (mouseX>295 && mouseX<502 && mouseY>400 && mouseY<467) {
      if (mostrarBotonInicial) {
        image(botonMouseEncima, 295, 400);
      }
    }

    if (mouseX>295 && mouseX<502 && mouseY>400 && mouseY<467 && mousePressed) {
      image(botonClicked, 295, 400);
      mostrarBotonInicial=false;
    }
    else {
      mostrarBotonInicial=true;
    }

    break;

  case 1:
    image(pantallaInstrucciones, 0, 0);
    break;

  case 2:
    image(pantallaPersonajes, 0, 0);

    if (mouseX>70 && mouseX<272 && mouseY>245 && mouseY<445) {
      image(flashSeleccion, 0, 0);
    }

    if (mouseX>335 && mouseX<504 && mouseY>245 && mouseY<445) {
      image(supermanSeleccion, 0, 0);
    }

    if (mouseX>559 && mouseX<742 && mouseY>197 && mouseY<445) {
      image(batmanSeleccion, 0, 0);
    }

    break;


  case 3:
    image(pantallaEscenarios, 0, 0);

    if (mouseX>87 && mouseX<276 && mouseY>266 && mouseY<408) {
      image(mansionLuthorSeleccion, 0, 0);
    }

    if (mouseX>321 && mouseX<510 && mouseY>266 && mouseY<408) {
      image(escenarioSupermanSeleccion, 0, 0);
    }

    if (mouseX>561 && mouseX<754 && mouseY>266 && mouseY<408) {
      image(escenarioAcertijoSeleccion, 0, 0);
    }

    break;


  case 4: 
    if (seleccionEscenario==1) { //EscenarioLuthor
      image(escenarioLuthor, 0, 0);
      for ( int f=0; f<15; f++) {
        for ( int c=0;c<20;c++) {

          switch(matrizEscenarioLuthor[f][c]) {
          case 0:

            break;

          case 1:
            fill(0);

            if (dist ((c*40)+20, (f*40)+20, posX, posY)<20 && (key=='d' || key=='D')) {
              posX-=40;
            }

            if (dist ((c*40)+20, (f*40)+20, posX, posY)<20 && (key=='a' || key=='A')) {
              posX+=40;
            }

            if (dist ((c*40)+20, (f*40)+20, posX, posY)<20 && (key=='w' || key=='W')) {
              posY+=40;
            }

            if (dist ((c*40)+20, (f*40)+20, posX, posY)<20 && (key=='s' || key=='S')) {
              posY-=40;
            }

            break;
          }
        }
      }
    }

    if (seleccionEscenario==2) { //Escenario Superman
      image(escenarioSuperman, 0, 0);
      for ( int f=0; f<15; f++) {
        for ( int c=0;c<20;c++) {

          switch(matrizEscenarioSuperman[f][c]) {
          case 0:

            break;

          case 1:
            fill(0);

            if (dist ((c*40)+20, (f*40)+20, posX, posY)<20 && (key=='d' || key=='D')) {
              posX-=40;
            }

            if (dist ((c*40)+20, (f*40)+20, posX, posY)<20 && (key=='a' || key=='A')) {
              posX+=40;
            }

            if (dist ((c*40)+20, (f*40)+20, posX, posY)<20 && (key=='w' || key=='W')) {
              posY+=40;
            }

            if (dist ((c*40)+20, (f*40)+20, posX, posY)<20 && (key=='s' || key=='S')) {
              posY-=40;
            }

            break;
          }
        }
      }
    }

    if (seleccionEscenario==3) { //Escenario Acertijo
      image(escenarioAcertijo, 0, 0);

      for ( int f=0; f<15; f++) {
        for ( int c=0;c<20;c++) {

          switch(matrizEscenarioAcertijo[f][c]) {
          case 0:

            break;

          case 1:
            fill(0);

            if (dist ((c*40)+20, (f*40)+20, posX, posY)<20 && (key=='d' || key=='D')) {
              posX-=40;
            }

            if (dist ((c*40)+20, (f*40)+20, posX, posY)<20 && (key=='a' || key=='A')) {
              posX+=40;
            }

            if (dist ((c*40)+20, (f*40)+20, posX, posY)<20 && (key=='w' || key=='W')) {
              posY+=40;
            }

            if (dist ((c*40)+20, (f*40)+20, posX, posY)<20 && (key=='s' || key=='S')) {
              posY-=40;
            }

            break;
          }
        }
      }
    }

    ///////Posiciones del ítem aleatorio 1
    if (posicionItemAleatorioUno==1) {
      posXItemAleatorioUno=40;
      posYItemAleatorioUno=120;
    }

    if (posicionItemAleatorioUno==2) {
      posXItemAleatorioUno=720;
      posYItemAleatorioUno=120;
    }

    if (posicionItemAleatorioUno==3) {
      posXItemAleatorioUno=40;
      posYItemAleatorioUno=440;
    }

    if (posicionItemAleatorioUno==4) {
      posXItemAleatorioUno=720;
      posYItemAleatorioUno=440;
    }

    ////////Posiciones del ítem aleatorio 2
    if (posicionItemAleatorioDos==1) {
      posXItemAleatorioDos=160;
      posYItemAleatorioDos=40;
    }

    if (posicionItemAleatorioDos==2) {
      posXItemAleatorioDos=160;
      posYItemAleatorioDos=520;
    }

    if (posicionItemAleatorioDos==3) {
      posXItemAleatorioDos=600;
      posYItemAleatorioDos=40;
    }

    if (posicionItemAleatorioDos==4) {
      posXItemAleatorioDos=600;
      posYItemAleatorioDos=520;
    }

    //Mostrar/ocultar ítems aleatorios


    if (mostrarItemJusticeUno==true) {
      if (dist (posXItemAleatorioUno+20, posYItemAleatorioUno+20, posX, posY)<20) {
        mostrarItemJusticeUno=false;               
        debilitarEnemigos=true;
      }
      image(itemJusticeUno, posXItemAleatorioUno, posYItemAleatorioUno);
    }


    if (mostrarItemJusticeDos==true) {
      if (dist (posXItemAleatorioDos+20, posYItemAleatorioDos+20, posX, posY)<20) {
        mostrarItemJusticeDos=false;
        debilitarEnemigos=true;
      }      
      image(itemJusticeDos, posXItemAleatorioDos, posYItemAleatorioDos);
    }

    //Monedas
    for ( int f=0; f<15; f++) {
      for ( int c=0;c<20;c++) {

        switch(matrizMonedas[f][c]) {
        case 0:

          break;

        case 1:
          image(moneda, 0+c*40, 0+f*40);

          if (dist ((c*40)+20, (f*40)+20, posX, posY)<20) {
            matrizMonedas[f][c]=0;
            puntaje++;
          }
          break;
        }
      }
    }

    //Ítem cambio de escenario (aparece al recoger todas las monedas)
    if (puntaje>=60 && mostrarItemCambio==true) {
      if (dist (400+20, 280+20, posX, posY)<20) {
        mostrarItemCambio=false;
        seleccionEscenario+=1;
        if (seleccionEscenario==4) { //Si la selección es 4 pasa a ser 1, pues el escenario 4 no existe
          seleccionEscenario=1;
        }
        inicializarMatrizMonedas();
      }      
      image(itemCambio, 400, 280);
    }

    //Ítem vida (aparece al recoger 30 monedas)
    if (puntaje>=30 && mostrarItemVida==true) {
      if (dist (360+20, 280+20, posX, posY)<20) {
        mostrarItemVida=false;
        vidas+=1;
      }
      image(itemVida, 360, 280);
    }
    else {
    }

    /////Recorrido villanos
    /////////////Joker
    if (seleccionEscenario==1) { //En el escenario 1
      if (debilitarEnemigos==false) {
        image(joker, jokerXEscenarioUno, jokerYEscenarioUno);
      }
      else {
        image(jokerDebilitado, jokerXEscenarioUno, jokerYEscenarioUno);
      }      

      if (jokerXEscenarioUno<=520 && jokerYEscenarioUno==40) {
        jokerXEscenarioUno+=1*velocidad*4;
      }
      if (jokerXEscenarioUno==520 && jokerYEscenarioUno<=240) {
        jokerYEscenarioUno+=1*velocidad*4;
      }
      if (jokerYEscenarioUno==240 && jokerXEscenarioUno>=480) {
        jokerXEscenarioUno+=1*-velocidad*4;
      }
      if (jokerYEscenarioUno>=200 && jokerXEscenarioUno==480) {
        jokerYEscenarioUno+=1*-velocidad*4;
      }
      if (jokerYEscenarioUno==200 && jokerXEscenarioUno>=240 && jokerXEscenarioUno<=480) {
        jokerXEscenarioUno+=1*-velocidad*4;
      }
      if (jokerYEscenarioUno<=240 && jokerYEscenarioUno>=200 && jokerXEscenarioUno==240) {
        jokerYEscenarioUno+=1*velocidad*4;
      }
      if (jokerYEscenarioUno==240 && jokerXEscenarioUno>=160) {
        jokerXEscenarioUno+=1*-velocidad*4;
      }
      if (jokerXEscenarioUno==160 && jokerYEscenarioUno>=40) {
        jokerYEscenarioUno+=1*-velocidad*4;
      }
    }

    if (seleccionEscenario==2) { //En el escenario 2
      if (debilitarEnemigos==false) {
        image(joker, jokerXEscenarioDos, jokerYEscenarioDos);
      }
      else {
        image(jokerDebilitado, jokerXEscenarioDos, jokerYEscenarioDos);
      }
      if (jokerXEscenarioDos<=440 && jokerYEscenarioDos==0) {
        jokerXEscenarioDos+=1*velocidad*4;
      }
      if (jokerXEscenarioDos==440 && jokerYEscenarioDos<=80) {
        jokerYEscenarioDos+=1*velocidad*4;
      }
      if (jokerYEscenarioDos==80 && jokerXEscenarioDos<=440) {
        jokerXEscenarioDos+=1*-velocidad*4;
      }             
      if (jokerXEscenarioDos==320 && jokerYEscenarioDos<=80) {
        jokerYEscenarioDos+=1*-velocidad*4;
      }
    }

    if (seleccionEscenario==3) { //En el escenario 3
      if (debilitarEnemigos==false) {
        image(joker, jokerXEscenarioTres, jokerYEscenarioTres);
      }
      else {
        image(jokerDebilitado, jokerXEscenarioTres, jokerYEscenarioTres);
      }
      if (jokerXEscenarioTres<=520 && jokerYEscenarioTres==80) {
        jokerXEscenarioTres+=1*velocidad*4;
      }
      if (jokerXEscenarioTres==520 && jokerYEscenarioTres<=200) {
        jokerYEscenarioTres+=1*velocidad*4;
      }
      if (jokerYEscenarioTres==200 && jokerXEscenarioTres>=240) {
        jokerXEscenarioTres+=1*-velocidad*4;
      }             
      if (jokerXEscenarioTres==240 && jokerYEscenarioTres<=200) {
        jokerYEscenarioTres+=1*-velocidad*4;
      }
    }

    //Timer para determinar la duración del debilitamiento de los enemigos
    if (timer<=200 && debilitarEnemigos==true) {
      timer+=1;
    }
    else {
      debilitarEnemigos=false;
      timer=0;
    }

    /////////////Luthor
    if (seleccionEscenario==1) { //En el escenario 1
      if (debilitarEnemigos==false) {
        image(luthor, luthorXEscenarioUno, luthorYEscenarioUno);
      }
      else {
        image(luthorDebilitado, luthorXEscenarioUno, luthorYEscenarioUno);
      }
      if (luthorXEscenarioUno<=520 && luthorYEscenarioUno==80) {
        luthorXEscenarioUno+=1*velocidad*4;
      }
      if (luthorXEscenarioUno==520 && luthorYEscenarioUno>=80) {
        luthorYEscenarioUno+=1*velocidad*4;
      }
      if (luthorYEscenarioUno==480 && luthorXEscenarioUno<=520) {
        luthorXEscenarioUno+=1*-velocidad*4;
      }             
      if (luthorXEscenarioUno==240 && luthorYEscenarioUno<=480) {
        luthorYEscenarioUno+=1*-velocidad*4;
      }
    }

    if (seleccionEscenario==2) { //En el escenario 2
      if (debilitarEnemigos==false) {
        image(luthor, luthorXEscenarioDos, luthorYEscenarioDos);
      }
      else {
        image(luthorDebilitado, luthorXEscenarioDos, luthorYEscenarioDos);
      }
      if (luthorXEscenarioDos==320 && luthorYEscenarioDos<=560) {
        luthorYEscenarioDos+=1*velocidad*4;
      }
      if (luthorXEscenarioDos<=440 && luthorYEscenarioDos==560) {
        luthorXEscenarioDos+=1*velocidad*4;
      }
      if (luthorYEscenarioDos>=240 && luthorXEscenarioDos==440) {
        luthorYEscenarioDos+=1*-velocidad*4;
      }             
      if (luthorXEscenarioDos<=440 && luthorYEscenarioDos==240) {
        luthorXEscenarioDos+=1*-velocidad*4;
      }
    }

    if (seleccionEscenario==3) { //En el escenario 3
      if (debilitarEnemigos==false) {
        image(luthor, luthorXEscenarioTres, luthorYEscenarioTres);
      }
      else {
        image(luthorDebilitado, luthorXEscenarioTres, luthorYEscenarioTres);
      }
      if (luthorXEscenarioTres>=280 && luthorYEscenarioTres==440) {
        luthorXEscenarioTres+=1*velocidad*4;
      }
      if (luthorXEscenarioTres==480 && luthorYEscenarioTres<=560) {
        luthorYEscenarioTres+=1*velocidad*4;
      }
      if (luthorYEscenarioTres==560 && luthorXEscenarioTres>=280) {
        luthorXEscenarioTres+=1*-velocidad*4;
      }             
      if (luthorXEscenarioTres==280 && luthorYEscenarioTres>=440) {
        luthorYEscenarioTres+=1*-velocidad*4;
      }
    }

    ///////////////Cold
    if (seleccionEscenario==1) { //En el escenario 1
      if (debilitarEnemigos==false) {
        image(cold, coldXEscenarioUno, coldYEscenarioUno);
      }
      else {
        image(coldDebilitado, coldXEscenarioUno, coldYEscenarioUno);
      }
      if (coldXEscenarioUno<=520 && coldYEscenarioUno==200) {
        coldXEscenarioUno+=1*velocidad*4;
      }
      if (coldXEscenarioUno==520 && coldYEscenarioUno>=200) {
        coldYEscenarioUno+=1*velocidad*4;
      }
      if (coldYEscenarioUno==360 && coldXEscenarioUno<=520) {
        coldXEscenarioUno+=1*-velocidad*4;
      }             
      if (coldXEscenarioUno==240 && coldYEscenarioUno<=360) {
        coldYEscenarioUno+=1*-velocidad*4;
      }
    }

    if (seleccionEscenario==2) { //En el escenario 2
      if (debilitarEnemigos==false) {
        image(cold, coldXEscenarioDos, coldYEscenarioDos);
      }
      else {
        image(coldDebilitado, coldXEscenarioDos, coldYEscenarioDos);
      }
      if (coldXEscenarioDos==440 && coldYEscenarioDos<=320) {
        coldYEscenarioDos+=1*-velocidad*4;
      }
      if (coldXEscenarioDos<=440 && coldYEscenarioDos==0) {
        coldXEscenarioDos+=1*-velocidad*4;
      }
      if (coldYEscenarioDos<=320 && coldXEscenarioDos==320) {
        coldYEscenarioDos+=1*velocidad*4;
      }             
      if (coldXEscenarioDos>=320 && coldYEscenarioDos==320) {
        coldXEscenarioDos+=1*velocidad*4;
      }
    }

    if (seleccionEscenario==3) { //En el escenario 3
      if (debilitarEnemigos==false) {
        image(cold, coldXEscenarioTres, coldYEscenarioTres);
      }
      else {
        image(coldDebilitado, coldXEscenarioTres, coldYEscenarioTres);
      }
      if (coldXEscenarioTres==520 && coldYEscenarioTres>=360) {
        coldYEscenarioTres+=1*-velocidad*4;
      }
      if (coldXEscenarioTres>=240 && coldYEscenarioTres==360) {
        coldXEscenarioTres+=1*-velocidad*4;
      }
      if (coldYEscenarioTres<=480 && coldXEscenarioTres==240) {
        coldYEscenarioTres+=1*velocidad*4;
      }             
      if (coldXEscenarioTres>=240 && coldYEscenarioTres==480) {
        coldXEscenarioTres+=1*velocidad*4;
      }
    }

    //Personaje a mostrar
    if (seleccionPersonaje==1) {
      pushMatrix();
      imageMode(CENTER);
      scale(1.0*direccionPersonajes, 1.0);

      //Si presiona alguna tecla, el personaje abre la boca
      if (keyPressed) {
        image(flashBocaAbierta, posX*direccionPersonajes, posY);
      }
      else { //De lo contrario la mantiene cerrada
        image(flashBocaCerrada, posX*direccionPersonajes, posY);
      }
      popMatrix();
    }

    if (seleccionPersonaje==2) {
      pushMatrix();
      imageMode(CENTER);
      scale(1.0*direccionPersonajes, 1.0);
      //Si presiona alguna tecla, el personaje abre la boca
      if (keyPressed) {
        image(supermanBocaAbierta, posX*direccionPersonajes, posY);
      }
      else { //De lo contrario la mantiene cerrada
        image(supermanBocaCerrada, posX*direccionPersonajes, posY);
      }
      popMatrix();
    }

    if (seleccionPersonaje==3) {
      pushMatrix();
      imageMode(CENTER);
      scale(1.0*direccionPersonajes, 1.0);
      //Si presiona alguna tecla, el personaje abre la boca
      if (keyPressed) {
        image(batmanBocaAbierta, posX*direccionPersonajes, posY);
      }
      else { //De lo contrario la mantiene cerrada
        image(batmanBocaCerrada, posX*direccionPersonajes, posY);
      }

      popMatrix();
    }

    ///Detectar colisión con enemigos 
    //Escenario 1
    if (seleccionEscenario==1) {

      if (dist (jokerXEscenarioUno+20, jokerYEscenarioUno+20, posX, posY)<1) {
        if (debilitarEnemigos==false) {
          vidas-=1;
        }
      }

      if (dist (luthorXEscenarioUno+20, luthorYEscenarioUno+20, posX, posY)<1) {
        if (debilitarEnemigos==false) {
          vidas-=1;
        }
      }

      if (dist (coldXEscenarioUno+20, coldYEscenarioUno+20, posX, posY)<1) {
        if (debilitarEnemigos==false) {
          vidas-=1;
        }
      }
    }


    //Escenario 2    
    if (seleccionEscenario==2) {
      if (dist (jokerXEscenarioDos+20, jokerYEscenarioDos+20, posX, posY)<1) {
        if (debilitarEnemigos==false) {
          vidas-=1;
        }
      }

      if (dist (luthorXEscenarioDos+20, luthorYEscenarioDos+20, posX, posY)<1) {
        if (debilitarEnemigos==false) {
          vidas-=1;
        }
      }
      if (dist (coldXEscenarioDos+20, coldYEscenarioDos+20, posX, posY)<1) {
        if (debilitarEnemigos==false) {
          vidas-=1;
        }
      }
    }

    //Escenario 3
    if (seleccionEscenario==3) {
      if (dist (jokerXEscenarioTres+20, jokerYEscenarioTres+20, posX, posY)<1) {
        if (debilitarEnemigos==false) {
          vidas-=1;
        }
      }

      if (dist (luthorXEscenarioTres+20, luthorYEscenarioTres+20, posX, posY)<1) {
        if (debilitarEnemigos==false) {
          vidas-=1;
        }
      }

      if (dist (coldXEscenarioTres+20, coldYEscenarioTres+20, posX, posY)<1) {
        if (debilitarEnemigos==false) {
          vidas-=1;
        }
      }
    }

    if (vidas==0) {
      pantalla=5;
    }

    if (puntaje==120) {
      pantalla=6;
    }


    //Hud (Información de vida y puntos)
    imageMode(CORNER);
    image(hud, 0, 0);
    textSize(20);
    fill(255, 255, 255);
    text (puntaje, 750, 65);
    text (vidas, 75, 65);

    break;

  case 5: 
    image(pantallaFinal, 0, 0);
    textSize(40);
    text (puntaje, 425, 355); 
    break;

  case 6:
  int variable;
    image(pantallaGanaste, 0, 0);
    textSize(26);
    text (vidas, 417, 430);
    animacionFinal+=2;
    image(joker,-40+animacionFinal,120);
    image(batmanBocaAbierta,-200+animacionFinal*1.15,120);
    
    if (animacionFinal==900){
      animacionFinal=-40;
    }
    break;
  }
}

void keyPressed() {
  switch (pantalla) {
  case 0:
    break;

  case 1:
    break;

  case 2:
    break;

  case 3:
    break;

  case 4:

    if (key=='d' || key=='D') {
      direccionPersonajes=1;
      posX+=40;
      if (posX>=800) {
        posX=20;
      }
    }

    if (key=='a' || key=='A') {
      direccionPersonajes=-1;
      posX-=40;
      if (posX<=0) {
        posX=780;
      }
    }

    if (key=='w' || key=='W') {
      direccionPersonajes=-1;
      posY-=40;
      if (posY<=0) {
        posY+=40;
      }
    }

    if (key=='s' || key=='S') {
      direccionPersonajes=1;
      posY+=40;
      if (posY>=600) {
        posY-=40;
      }
    }
    break;
  }
}

void mouseReleased() {
  switch (pantalla) { 
  case 0:
    if (mouseX>295 && mouseX<502 && mouseY>400 && mouseY<467) {
      pantalla=1;
    }
    else {
      pantalla=0;
    }
    break;

  case 1:
    pantalla=2;
    break;

  case 2:
    if (mouseX>70 && mouseX<272 && mouseY>245 && mouseY<445) {
      seleccionPersonaje=1;
      pantalla=3;
    }

    if (mouseX>335 && mouseX<504 && mouseY>245 && mouseY<445) {
      seleccionPersonaje=2;
      pantalla=3;
    }

    if (mouseX>559 && mouseX<742 && mouseY>197 && mouseY<445) {
      seleccionPersonaje=3;
      pantalla=3;
    }
    break;

  case 3:
    if (mouseX>87 && mouseX<276 && mouseY>266 && mouseY<408) {
      seleccionEscenario=1;
      pantalla=4;
    }

    if (mouseX>321 && mouseX<510 && mouseY>266 && mouseY<408) {
      seleccionEscenario=2;
      pantalla=4;
    }

    if (mouseX>561 && mouseX<754 && mouseY>266 && mouseY<408) {
      seleccionEscenario=3;
      pantalla=4;
    }
    break;
  }
}


