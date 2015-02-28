

// Hacemos un thread (hilo) PORque
// porque si hacemos el scketche "loop", llamamos
// continuamente a la funcion "draw", y se ralentiza todo
// que da asco y mala gana... por lo menos en un pentium 4 
// con una pobre tarjeta gráfica.


// No hemos probado con Framerate(), bajándolo a decimales (por ejemplo
// Framerate(0.3), pero ahora ya está hecho el mal.  Y de todos modos
// esto va muy bien para gestionar el tiempo del juego.

public class Hilo extends Thread implements Runnable{
     
    int tick_inicial=millis();  // millis() recoge los milisegundos desde que se
    int tick_actual;            // inició el programa
    int intervalo=3000;
  
    int tiempo_inicial;
    int tiempo_actual;
    int intervalo_tiempo=90000;//100000;  //300 seg x 1000 cada seg -> 5 min 300.000

    int maximo_tiempo;
    int tiempo_restante=90000;//100000;
    
    Boolean partida_iniciada=false;
    Boolean fin_de_partida=false;
    
  
   // public    
  
   public void run(){
  
   
     while(true){
      
      int tick_actual=millis();
      
      if(tick_actual>tick_inicial+intervalo){
        tick_inicial=tick_actual;
        redraw();
      }
      
      if(partida_iniciada){
        
        tiempo_actual=tick_actual;
        tiempo_restante=maximo_tiempo-tiempo_actual;
        if (tiempo_actual>maximo_tiempo){
          fin_de_partida=true;        
          redraw();       // redibujamos cada 3000 milisegundos (3 seg); 
        }
  
      }           
      
     }
     
    }
   
};

