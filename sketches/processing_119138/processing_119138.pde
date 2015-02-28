
// by fre3men ([url=http://www.heroquest.es]www.heroquest.es[/url])
// Clase que actúa como temporizador
// CC BY-NC-SA

// Variables Globales
Timer timer;
int trigger;
int seconds = 0;

// Setup del programa
void setup(){
  size(200,200); // Tamaño de la pantalla
  frameRate(60); // Refresco de pantalla
  //smooth(); // anti-aliasing!!! cuidado que puede relentizar la aplicación
  //imageMode(CENTER); // Forzosamente en setup (en java va bien repetirlo... pero en canvas peta si no está aquí)
  
  timer = new Timer(1000); // Creamos un temporizador de 1 segundo (1000 milisegundos)
  //timer = new Timer(1,1); // Igual que arriba en modo segundos
}

// Main
void draw(){
  background(100,100,100);
  trigger = timer.run();
  if (trigger == 1){
    seconds += 1;
  }
  text(seconds,100,100);
}


// Clase Temporizador
class Timer{
  int startClock, stopClock;
  int timeClock; // Tiempo actual
  int modeClock = 1; // Por defecto estará en milisegundos
  
  // Constructor
  Timer(int stopClock){
    this.startClock = millis(); // Inicializamos el temporizador
    this.stopClock = stopClock; // Tiempo límite del temporizador
  }
  Timer(int stopClock, int modeClock){ // Sobre carga de funciones (segunda función constructora)
    this.startClock = millis(); 
    this.stopClock = stopClock; 
    this.setup(modeClock); // Cambiamos el modo del tiempo pasado (en milis o segundos)
  }
  
  int run(){
    this.timeClock = millis();
    int triggerClock = 0;
    if (this.timeClock - this.startClock >= this.stopClock * this.modeClock){
     triggerClock = 1;
     this.startClock = millis(); // Volvemos a actualizar el temporizador
    }
    return triggerClock;
  }
  
  void setup(int modeClock){
    //0 -> millis ; 1 -> seconds
    switch(modeClock){
      case 0:
        this.modeClock = 1; // El múltiplo será de 1
        break;
      case 1:
        this.modeClock = 1000; // El mútliplo será de 1000 para pasar a segundos.
        break;
    }
  }
  
}
