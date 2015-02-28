
Logica app;

void setup () {
  size(1200, 700); //Tamaño del lienzo
  app = new Logica ();
  noCursor(); //No muestra el cursor del mouse
}

void draw() {
  background(0);
  app.ejecutar();
}

void mouseMoved() {
  app.mouseMover();
}

void mouseClicked() {
  app.clic();
  if (mouseX>980 && mouseX<1138 && mouseY>610 && mouseY<660) { //Área de sensibilidad del botón de reinicio    
    app.reiniciar();
  }
}

public abstract class Bacteria { //Clase abstracta Bacteria, padre de BacteriaBenigna y BacteriaMaligna
  //Posición de las bacterias
  private float posX;
  private float posY;
  private int tamano; //Tamaño de las bacterias
  private int contador;

  public Bacteria(float pX, float pY, int tam) { //Posiciones en X y Y y tamaño de las bacterias
    posX=pX;
    posY=pY;
    tamano=tam;
  }

  public abstract void pintar(); //Método abstracto pintar

  public void mover() { //Movimiento de las bacterias de forma aleatoria
    if (mousePressed) { //Cuando el mouse está presionado el movimiento es más rápido
      posX+=random(-5, 4);
      posY+=random(-5, 4);
    }
    else { //Cuando no está presionado tiene una velocidad menor
      posX+=random(-1, 1.5);
      posY+=random(-1, 1.5);

      if (mouseX==pmouseX && mouseY==pmouseY) { //Detecta la inactividad del mouse
        contador++; //Aumenta un contador
      }
      else { //Si se está moviendo el mouse el contador se resetea a 0
        contador=0;
      }
    }

    if (posX>=1220) { //Si la bacteria sale del lienzo aparece nuevamente al principio del mismo
      posX=-20;
    }

    if (posY>=720) { //Si la bacteria sale del lienzo aparece nuevamente al principio del mismo
      posY=-20;
    }

    if (contador>=100) { //Cuando el contador llega a 100 aumenta la velocidad del movimiento de las bacterias y su color cambia aleatoriamente
      posX+=random(-5, 4);
      posY+=random(-5, 4);
      tint(random(0, 255), random(0, 255), random(0, 255));
    }
  }

  public float getPosX() {
    return posX;
  }

  public float getPosY() {
    return posY;
  }

  public int getTamano() {
    return tamano;
  }

  public void setTamano(int tam) {
    tamano=tam;
  }
}

public class BacteriaBenigna extends Bacteria { //Clase hija de Bacteria

  private PImage bacteriaBenigna; //Imagen

  public BacteriaBenigna(int pX, int pY, int tam) {
    super(pX, pY, tam); //Hereda posiciones en X y Y y tamaño de la clase padre Bacteria
    bacteriaBenigna= loadImage("bacteriaBenigna.png"); //Carga de imagen
  }


  public void pintar() { //Pinta las bacterias en una posición aleatoria
    imageMode(CENTER);
    if (getTamano()>=10) { //Si el tamaño de la bacteria es mayor a 10 se muestra, de lo contrario desaparece
      image(bacteriaBenigna, getPosX(), getPosY(), getTamano(), getTamano());
    }
  }

  public void mover() { //Mueve las bacterias de forma aleatoria, llamando el método pintar de la clase padre Bacteria
    super.mover();
  }
}

public class BacteriaMaligna extends Bacteria { //Clase hija de Bacteria

  private PImage bacteriaMaligna; //Imagen

  public BacteriaMaligna(int pX, int pY, int tam) {
    super(pX, pY, tam); //Hereda posiciones en X y Y y tamaño de la clase padre Bacteria
    bacteriaMaligna= loadImage("bacteriaMaligna.png"); //Carga de imagen
  }


  public void pintar() { //Pinta las bacterias en una posición aleatoria
    imageMode(CENTER);
    if (getTamano()>=10) { //Si el tamaño de la bacteria es mayor a 10 se muestra, de lo contrario desaparece
      image(bacteriaMaligna, getPosX(), getPosY(), getTamano(), getTamano());
    }
  }

  public void mover() { //Mueve las bacterias de forma aleatoria, llamando el método pintar de la clase padre Bacteria
    super.mover();
  }
}

public class Boton { //Clase Botón (reiniciar)
  //Posición del botón reiniciar
  private int posX;
  private int posY;
  //Imágenes
  private PImage boton; //Normal
  private PImage botonSobre; //Mouse encima del botón

  public Boton() {   
    // Posición del botón (es 0,0 porque la imagen tiene el tamaño del lienzo)
    posX=0; 
    posY=0;
    //Carga de imágenes
    boton= loadImage("boton.png");
    botonSobre= loadImage("botonSobre.png");
  }

  public void pintar() { //Pinta el botón
    if (mouseX>980 && mouseX<1138 && mouseY>610 && mouseY<660) { //Muestra una imagen o la otra dependiendo de donde se encuentre el mouse
      tint(255, 255, 255); //Tinte para que los demás tintes en las otras clases no afecten el color del botón
      imageMode(CORNER);
      image(botonSobre, 0, 0);
    }
    else {
      imageMode(CORNER);
      tint(255, 255, 255); //Tinte para que los demás tintes en las otras clases no afecten el color del botón
      image(boton, 0, 0);
    }
  }
}

public class Logica {
  private Puntero miPuntero;
  private Pantalla miPantalla;
  private Boton miBoton;
  private Bacteria bacteriasBenignas[]; //Arreglo de bacterias benignas
  private Bacteria bacteriasMalignas[]; //Arreglo de bacterias benignas
  private int tBacteriasBenignas; //Variable tamaño, para poder colocar tBacteriasBenignas-=10 en el setTamano, porque no me acepta que le coloque "bacteriasBenignas[i].getTamano()+=1" dentro de él.
  private int tBacteriasMalignas; //Variable tamaño, para poder colocar tBacteriasMalignas-=10 en el setTamano, porque no me acepta que le coloque "bacteriasMalignas[i].getTamano()+=1" dentro de él.
  private int tPuntero; //Variable tamaño, para poder cambiar el tamaño del puntero en el setTamano, porque no me acepta que le coloque "miPuntero.getTamano()+=1" dentro de él.

  public Logica () { //Constructor
    reiniciar(); //Llama al método reiniciar, que contiene la inicialización de los elementos
    miBoton = new Boton(); //Crea el botón de reinicio 
    miPantalla = new Pantalla((int) random(50, 255), (int) random(0, 255), (int) random(0, 255), 0); //Crea la pantalla con colores aleatorios cada vez
  }

  public void ejecutar() { //Método de ejecución

    switch(miPantalla.getPantalla()) { //Switch para determinar las acciones que se hacen dependiendo de cada pantalla
    case 0: //Pantalla inicial con instrucciones y el cursor visible
      miPantalla.pintar();
      miPuntero.pintar();
      break;
    case 1: //Pantalla de la aplicación
      miPantalla.pintar();

      for (int i = 0; i<60; i++) { //Repetitiva para pintar, mover las bacterias y determinar las acciones que suceden con cada una
        bacteriasBenignas[i].pintar();
        bacteriasMalignas[i].pintar();
        bacteriasBenignas[i].mover();
        bacteriasMalignas[i].mover();

        //Contacto entre el cursor y las bacterias benignas: disminuyen el tamaño de las mismas hasta desaparecer y aumentan el tamaño del cursor
        if (dist(mouseX, mouseY, bacteriasBenignas[i].getPosX(), bacteriasBenignas[i].getPosY()) < (bacteriasBenignas[i].getTamano())/2) {
          tBacteriasBenignas=bacteriasBenignas[i].getTamano();
          tPuntero=miPuntero.getTamano();
          bacteriasBenignas[i].setTamano(tBacteriasBenignas-=10);
          miPuntero.setTamano(tPuntero+=1);
        }

        //Contacto entre el cursor y las bacterias malignas: disminuyen el tamaño de las mismas hasta desaparecer y disminuyen el tamaño del cursor
        if (dist(mouseX, mouseY, bacteriasMalignas[i].getPosX(), bacteriasMalignas[i].getPosY()) < (bacteriasMalignas[i].getTamano())/2) {
          tBacteriasMalignas=bacteriasMalignas[i].getTamano();
          tPuntero=miPuntero.getTamano();
          bacteriasMalignas[i].setTamano(tBacteriasMalignas-=10);
          miPuntero.setTamano(tPuntero-=1);
        }
      }

      if (miPuntero.getTamano()==10) { //Si el puntero llega a un tamaño muy pequeño se reinicia la aplicación automáticamente
        reiniciar();
      }

      miBoton.pintar(); //Pinta el botón
      miPuntero.pintar(); //Y el puntero
      break;
    }
  }      

  public void mouseMover() { //Es lo que sucede si muevo el mouse en las dos pantallas
    switch(miPantalla.getPantalla()) {
    case 0: //Enfatiza el puntero (lo vuelve un poco mas visible) a modo de feedback al usuario
      miPuntero.pintar();
      break;

    case 1: //Enfatiza el puntero (lo vuelve un poco mas visible) a modo de feedback al usuario
      miPuntero.pintar();
      break;
    }
  }

  public void clic() { //Método para realizar acciones al presionar clic
    switch(miPantalla.getPantalla()) { // Si se presiona clic en la pantalla inicial se pasa a la de la aplicación.
    case 0:
      miPantalla.setPantalla(1);
      break;

    case 1:
      break;
    }
  }

  public void reiniciar() { //Método para reiniciar los parámetros de los elementos de la aplicación. Es llamado al presionar el botón y cuando el cursor tiene un tamaño mínimo.
    bacteriasBenignas = new BacteriaBenigna[60];
    bacteriasMalignas = new BacteriaMaligna[60];    
    miPuntero = new Puntero ();    
    miPantalla = new Pantalla((int) random(50, 255), (int) random(0, 255), (int) random(0, 255), 1); //Al presionar el botón reiniciar, se asignan colores aleatorios y aparece en la pantalla 1.

    for (int i=0; i<60; i++) {
      bacteriasBenignas[i]= new BacteriaBenigna((int) random(0, width), (int) random(0, height), (int) random(10, 60));
      bacteriasMalignas[i]= new BacteriaMaligna((int) random(0, width), (int) random(0, height), (int) random(20, 80));
    }
  }
}

public class Pantalla {
  //Variables para cambiar los colores de fondo
  private float r;
  private float g;
  private float b;

  //Imágenes a utilizar
  private PImage pantallaInstrucciones;
  private PImage fondo;

  //Contador para cambiar los colores cada cierto tiempo
  private int contador;

  //Pantallas de la aplicación (0.Instrucciones, 1.Ejecución)
  private int pantalla;

  public Pantalla(int red, int green, int blue, int p) {
    //Valores aleatorios entre los siguientes valores   
    r = red;
    g = green;
    b = blue;
    pantalla=p;
    //Carga de imágenes
    fondo = loadImage("fondo.jpg");
    pantallaInstrucciones = loadImage("pantallaInstrucciones.jpg");
  }

  public void pintar() { //Método para pintar las pantallas

    switch(pantalla) {
    case 0:
      imageMode(CORNER);
      image(pantallaInstrucciones, 0, 0);
      break;

    case 1:
      imageMode(CORNER);
      tint(r, g, b);


      if (mousePressed) { //Cambia el color de fondo aleatoriamente al presionar clic
        tint(random(0, 255), random(0, 255), random(0, 255));
      }
      else { //Si no se presiona clic se activa un contador que va cambiando los colores de la aplicación
        contador+=1;
        if (contador<1000) { //Si el contador es menor a 1000 el nivel del color rojo aumenta llegando a 255
          if (r<255) {
            r+=0.3;
          }

          if (b<255) { //También lo hace el color azul
            b+=0.3;
          }
        }

        if (contador>1000 && contador<2000) { //Si el contador es mayor a 1000 y menor a 2000 el nivel del color rojo disminuye llegando a 0
          if (r>0) {
            r-=0.3;
          }

          if (g<255) { //El color verde aumenta hasta llegar a 255
            g+=0.3;
          }
        }

        if (contador>2000) {//Si el contador es mayor a 2000, dicho contador se reinicia a 0
          contador=0;
        }
      }
      image(fondo, 0, 0);
    }
  }

  public int getPantalla() {
    return pantalla;
  }

  public void setPantalla(int pantTemp) {
    pantalla=pantTemp;
  }
}

public class Puntero {
  //Posiciones del puntero
  private int posX;
  private int posY;
  //Tamaño del puntero
  private int tamano;
  //Imagen
  private PImage puntero;

  public Puntero() {   
    posX=0;
    posY=0;
    //Carga de imagen
    puntero= loadImage("puntero.png");
    tamano=40; //Tamaño inicializa en 40
  }

  public void pintar() {
    //La posición de la imagen del puntero depende de la posición del mouse
    posX=mouseX;
    posY=mouseY;
    imageMode(CENTER);
    tint(255, 255, 255); //Tinte para no variar su color con los demás tintes utilizados
    image(puntero, posX, posY, tamano, tamano);
  }

  public int getTamano() {
    return tamano;
  }

  public void setTamano(int tamCursorTemp) {
    tamano=tamCursorTemp;
  }
}



