

ArrayList movimientos;
ArrayList movimientosHechosPlayer1;
cubesKit boxes;
int frameRateValue;
int score=0;//guarda las jugadas.
String texto=""; //lo que va mostrando.

// grab a reference to the applet. This is used to register the events
PApplet app = this;

void setup() 
{
  size(640, 360);
  rectMode(RADIUS); 

  movimientos=new ArrayList();
  movimientosHechosPlayer1=new ArrayList();
  boxes = new cubesKit( 0, 0, 75);
  frameRateValue=30;
  frameRate(frameRateValue);
}

void draw() 
{ 
  background(0);
  stroke(1);  
  int boxPressedNumber=0;

  // Game Algorithm...
  translate(width/2.0, height/2.0);
  boxPressedNumber=boxes.whichBoxIsPressed(); //Guarda el cubo que fue apretado.
  if (boxPressedNumber > 0) {
    movimientosHechosPlayer1.add((int) boxPressedNumber);//Agrego el cubo como movimiento hecho al array del jugador.
  } else {
    int diferenciaMovimientos=( movimientos.size()-movimientosHechosPlayer1.size());
    //Si no hay jugadas generadas, o tienen la misma cantidad de jugadas hechas y el Jugador no pifió, genero. La compu va solo se adelanta 1 jugada al player ;
    if (comparaMovimientosCpuVsHumano (movimientos, movimientosHechosPlayer1)) { 
      if ( diferenciaMovimientos < 1) { 
         texto="Tu turno";
         movimientos.add(movimientoRandom());
         boxes.muestraMovimientosCompu(movimientos);            
         //println("Movimientos Player: "+movimientosHechosPlayer1+" Tot. "+movimientosHechosPlayer1.size()+" Movimientos Random: "+movimientos+" Tot"+movimientos.size());        
         score();
         movimientosHechosPlayer1=new ArrayList();
       }    
    } else {
        score=0;
        texto="Uh, perdiste. Volvé a intentarlo";
        textSize(12);
        fill(255);
        movimientos=new ArrayList();          
        movimientosHechosPlayer1=new ArrayList();
    }
  }
    textSize(28);
    fill(255);
    text(texto,-(width/2),-height/2+25);
    text("Score: "+score, -(width/2),height/2);
  // Game Algorithm End.
}

void score() {
 if(movimientosHechosPlayer1.size()>0) //contabilizo score, sino no.
  score++; 
}

boolean comparaMovimientosCpuVsHumano (ArrayList movimientos, ArrayList movimientosHechosPlayer1) {
  boolean sonIguales=true;
if ( movimientos.size() >= movimientosHechosPlayer1.size() ) { //algo anda mal, no debería nunca adelantarse segun el algoritmo el player al CPU. #IMPORTANTE
  for (int i=0;i<movimientosHechosPlayer1.size();i++) {
    if (movimientos.get(i) != movimientosHechosPlayer1.get(i))
      sonIguales=false;
  }
}
  return sonIguales;
}


int movimientoRandom()
{
  return int(random(1, 5));
}


/* Es cada una de las cajitas. */
//Se dibuja y detecta comportamiento sobre ella misma. (incluye logica para esto) y captura de envento mouse.

public class cube { //es un rectangulo pero tiene alma de grandeza.
  private float boxSize=0;
 
  float xOffset=0.0;
  float yOffset=0.0;
  
  float by;//posicion inicial del cubo en y
  float bx; //posicion inicial del cubo en x
  color bc;//Color Original Del cubo.
  color bcNow;//color que cambia según el estado.
  
  int strokeWeight=0; //strokeWeight se setea antes del draw.  
  
  boolean isComputer=false;//global para saber si el cubo esta siendo tocado por la compu en este instanste.
  
  //Mouse Global Stuff
  boolean overBox = false;
  boolean doOnce = false;
  boolean mouse=false;

  cube (float x, float y, int d, color c) {
    bx=x;
    by=y;
    boxSize=d;
    bc=c;
    
    app.registerMethod("mouseEvent",this);
 //   app.registerMouseEvent(this);

  }

  boolean isButtonClickedandCursorOverTheBox () {
    // Test if the cursor is over the box 
    stroke(0);
    float x= mouseX-(width/2); //
    float y=mouseY-(height/2);
    if (bx > (x-boxSize) && bx < (x+boxSize) && by > (y-boxSize) && by < (y+boxSize)) {
      overBox = true;        
     //  strokeWeight=5; no encontré por que queda 'presionado' en el android.
      if (isMousePressed()) {
        bcNow=color(red(bc),green(bc),blue(bc),110);//color.
        strokeWeight=10;
        return true;
      }  
    } else {
      strokeWeight=0;
      overBox = false;
      bcNow=bc;
    }
    return false;
  }

    void showCube(boolean isCPU) { 
      isComputer=isCPU;
      if (isComputer) {
        strokeWeight=0;
        bcNow=color(255,255,255,220);//color.
      }
    }
    

    boolean isMousePressed() {
      boolean locked=false;
      if (overBox && mouse && doOnce) {  //Solo voy a contabilizar un click, y no si esta apretado.
        locked = true;
        doOnce=false; //Ya pasó el primer click.
      }
      xOffset = mouseX-bx; 
      yOffset = mouseY-by; 
      return locked;
    }
    
    void draw() {
      if (isComputer){ 
        fill(bcNow);
      }else { //es el user o no hay movimiento.
       fill(bcNow);
       strokeWeight(strokeWeight);
      }
       //dibujo
       rect(bx, by, boxSize, boxSize,7);  
       //reseteo
       bcNow=bc;  
       strokeWeight=0; 
    }



// called on all bots when a mouse event occurs
void mouseEvent(MouseEvent event) {
    // get the x and y pos of the event
    int x = event.getX();
    int y = event.getY();
    
    switch (event.getAction()) {
    case MouseEvent.PRESS:
         if (doOnce == false) {
             mouse=true;
             doOnce=true;
         }  
          break;
    case MouseEvent.RELEASE:
        doOnce=false;
        mouse=false;
       //  locked = false; 
      break;
    case MouseEvent.CLICK:
      // do something...
      break;
    case MouseEvent.DRAG:
 /*          if(locked) {
            bx = mouseX-xOffset; 
            by = mouseY-yOffset; 
           }
      break;
*/    case MouseEvent.MOVE:
      // do something...
      break;
    }
  }
}
/* es un array list que se encarga de mostrar cada cajita, 
   sigue las jugadas de la cpu, captura evento draw.
*/

//
public class cubesKit {
     float x;
     float y;
     int boxSize; 
     ArrayList cubes;
     
     int frameStartCount=0; //la uso como contador mientras muestro jugadas de la cpu.
     int speed=30; //Cantidad de frames que espero mostrando el movimiento de la cpu, deberia pasar al constructor.
   
     ArrayList jugadaActual; //Array de Jugadas.
     boolean isComputerPlaying=false; // flag para mostrar jugadas compu
     int pos=0;//posicion 
     
     
     
  cubesKit (float puntoX, float puntoY, int bSize) {
   //import processing.opengl.*;
   boxSize=bSize; 
   x=puntoX;
   y=puntoY;
   cubes=new ArrayList();
   
   app.registerMethod("draw",this); //registro al PAPPLET Parent para que tome estas funciones ( creo que PApplet aca hace de 'observer'
   
   //SETEO LOS CUADRADOS de SIMON
   cubes.add(new cube(x-boxSize, y-boxSize, boxSize,color(255,243,0)));
   cubes.add(new cube(x+boxSize, y-boxSize, boxSize,color(0,255,0)));
   cubes.add(new cube(x-boxSize, y+boxSize, boxSize,color(255,0,0)));  
   cubes.add(new cube(x+boxSize, y+boxSize, boxSize,color(0,0,255)));  

  }
  
  void draw () {
   try {   
    //En cada ciclo imprimo Todos los cubos.
    for (int i=0;i<cubes.size();i++){
      cube cube= (cube) cubes.get(i);
      cube.showCube(false); 
      cube.draw();
    }
   //Luego aprovecho el propio ciclo de Draw para mostrar la jugada de la cpu.
    if (isComputerPlaying){      
      if ((frameStartCount+speed)>=frameCount){ // Todavia no paso el ciclo de mostrar movida.    
          int computerMovement=(Integer) jugadaActual.get(pos);         
          computerMovement-=1;
          cube cube= (cube) cubes.get(computerMovement);   
          cube.showCube(true);
          cube.draw();
             
         // println("mostrando jugada compu: "+jugadaActual.size()+"posicion"+pos+" frameStartCount+speed "+(frameStartCount+speed)+" frameCount"+frameCount);
      }else { //Termino de mostrar la jugada.               
             pos++;
          //   println("jugadaCompu "+jugadaActual.size()+" llega a sumar pos?"+pos);
             frameStartCount=frameCount;//vuelvo contador de frames para que cuente desde el actual.
             if(pos >= jugadaActual.size()){
              pos=0;
              isComputerPlaying=false;
              frameStartCount=0;
          //    println("Fin!! jugadaCompu "+jugadaActual.size()+" pos?"+pos); 
             }          
       }
    
    } 
   } catch (Exception e) {
               e.printStackTrace();
               println("aca esta la macana");
         }
  }
 
 
 int whichBoxIsPressed () {
   int cubeNumber=0; 
    for (int i=0;i<cubes.size();i++){
     cube cube= (cube) cubes.get(i);   
     if(cube.isButtonClickedandCursorOverTheBox())
        cubeNumber=i+1;
    }
    return cubeNumber;
  }
     //Muestra las jugadas de la compu.
  void muestraMovimientosCompu (ArrayList jugadas) {
    jugadaActual=jugadas;
    frameStartCount=frameCount;   
    isComputerPlaying=true;
    pos=0;
  }
}



