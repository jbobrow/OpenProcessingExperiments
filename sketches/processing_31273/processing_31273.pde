
import processing.video.*;
import rwmidi.*;

MidiOutput salidaMidi;
PImage prueba;
Capture video_;
//Movie video;
color trackedColor [];
int closestX [];
int closestY [];
int colorSelect=0; //------- Desplazamiento por el arreglo y color
float worldRecord [];

// Variables que controlan las salidas -------------------------------------------------------------
int MIDI_controlX [];
int MIDI_controlY [];

void setup() {
  //prueba = loadImage("ColorPat_.png");
  //size(prueba.width, prueba.height);
  size(640, 480);
  video_ = new Capture(this, width, height, 30);
  //Lectura de video----------------------------------------
  /*video = new Movie(this, "VIDEO_.mov");
   video.read();
   video.loop();
   size(video.width, video.height, P2D);
   frameRate(25);*/

  // Iniciación del tamaño del arreglo de color y posiciones----------------------------------------
  trackedColor= new color [5];
  closestX = new int [5];
  closestY = new int [5];
  worldRecord = new float [5];
  MIDI_controlX = new int [5];
  MIDI_controlY = new int [5];

  // Colores Iniciales----------------------------------------
  for (int a=0; a < trackedColor.length ; a++) {
    int clr=0;
    trackedColor[a]=color(clr, 0, 0);
    clr=clr+50;
  }

  //Comprobación de inicio!!--------------------------------------------------------------------------------
  /*for (int a=0; a < closestX.length; a++) {
   println(closestX [a]);
   println(closestY [a]);
   }*/

  smooth();

  // Impresión de los dispositivos------------------------------------------------------------------------
  println(RWMidi.getOutputDevices()); // <--- Imprime todos los dispositivos disponibles
  salidaMidi = RWMidi.getOutputDevices()[2].createOutput(); // Numero [x] del dispositivo que usaré
  // y el mismo que elegimos en Ableton
}

void draw() {
  // Colocar las posiciones y distancia general al lugar inicial----------------------------------------
  for (int a=0; a < trackedColor.length; a++) {
    closestX [a]=0;
    closestY [a]=0;
    worldRecord [a]=500;
  }

  /*if (video.available()) {
   video.read();*/
  //image(prueba, 0, 0);
  image(video_, 0, 0);
  video_.loadPixels();

  // Lectura de Pixeles--------------------------------------------------------------------------------
  for (int x=0; x<video_.width; x++) {
    for (int y=0; y<video_.height; y++) {
      int loc = x + y*video_.width;

      // Aquí ya obtengo los colores para su cálculo--------------------------------------------
      color currentColor = video_.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);

      // Aquí comienza la variación de los colores de acuerdo al ARREGLO----------------------------------------
      for (int a=0; a < trackedColor.length; a++) {
        float r2 = red(trackedColor [a]);
        float g2 = green(trackedColor [a]);
        float b2 = blue(trackedColor [a]);

        float d = dist(r1, g1, b1, r2, g2, b2);

        // Comparativa para encontrar el valor más cercano al color y sacar sus coordenadas----------------------------------------
        // ** ¿Se trata de distancias X,Y o de color?
        if (d < worldRecord [a]) {
          worldRecord [a]= d;
          closestX [a] = x;
          closestY [a] = y;
        }
      }
    }
    //}
  }

  // Comparativa para DIBUJAR en la posición 
  // si el valor es lo suficientemente cercano ----------------------------------------
  for (int a=0; a < worldRecord.length; a++) {
    if (worldRecord [a] < 10) {
      fill(trackedColor [a]);
      strokeWeight(4.0);
      stroke(0);
      ellipse(closestX [a], closestY [a], 16, 16);
    }
  }

  // Variables que controlan la salida -------------------------------------------------------------------------

  for (int a=0; a < MIDI_controlX.length; a++) {
    MIDI_controlX[a] = int(map(closestX [a], 0, width, 0, 127));
    if (MIDI_controlX[a] > 127) {
      MIDI_controlX[a] = 127;
    } 
    else if (MIDI_controlX[a] < 0) {
      MIDI_controlX[a] = 0;
    }
  }

  for (int a=0; a < MIDI_controlY.length; a++) {
    MIDI_controlY[a] = int(map(closestY [a], 0, width, 0, 127));
    if (MIDI_controlY[a] > 127) {
      MIDI_controlY[a] = 127;
    } 
    else if (MIDI_controlY[a] < 0) {
      MIDI_controlY[a] = 0;
    }
  }

  // Controlador(es) de Salida(s)--------------------------------------------------------------------------------
  salidaMidi.sendController(0, 1, MIDI_controlX [0] );
  salidaMidi.sendController(0, 2, MIDI_controlY [0] ); 
  salidaMidi.sendController(0, 3, MIDI_controlX [1] ); 
  salidaMidi.sendController(0, 4, MIDI_controlX [1] ); 
  salidaMidi.sendController(0, 5, MIDI_controlX [2] ); 
  salidaMidi.sendController(0, 6, MIDI_controlX [2] ); 
  salidaMidi.sendController(0, 7, MIDI_controlX [3] ); 
  salidaMidi.sendController(0, 8, MIDI_controlX [3] ); 
  salidaMidi.sendController(0, 9, MIDI_controlX [4] ); 
  salidaMidi.sendController(0, 10, MIDI_controlX [4] ); 

  //La "MIDI_controlX [0] " es la variable que controla una parte del Ableton
  //salidaMidi.sendController(int channel, int cc, int value)
  // cc: controller change number(each controller must have its own number), value: there can only be values 0 - 127
}

// Obtención de colores a Trackear ------------------------------------------------------------------------
void mouseClicked() {
  int loc = mouseX + mouseY*video_.width;
  trackedColor [colorSelect] = video_.pixels[loc];
  colorSelect++;
  if (colorSelect>4) {
    colorSelect=0;
  }

  //Comprobación!!--------------------------------------------------------------------------------
  /*for (int a=0; a < closestX.length; a++) {
   println(closestX [a]);
   println(closestY [a]);
   }*/
}


