
//Alina Honhala
/*Implementar una rutina que simule el movimiento de una
partÃ­cula a lo largo de la espiral 2D de la figura. La funciÃ³n
recibirÃ¡ el diferencial de tiempo transcurrido desde la llamada
anterior y debe moverse a una velocidad w en vueltas/seg.
ParÃ¡metros: inicio(1, 0), fin(0, 0)*/

float dt = 0.08; //diferencial de tiempo
float radio = 300;
float x;
boolean iniciar = false;

void setup(){
  size(670,600);
  smooth();
  background(0);
}

void draw(){
  fill(0,0,255);
  text ("Pulsa 'espacio' para comenzar.", 20, 20);
  //translate(radio*cos(x), radio*sin(x));
  ellipse((width/2)+radio*cos(x), (height/2)+radio*sin(x), 30, 30);
    
  if(radio <= 0)
     dt = 0;
  else{
    radio --;
    x += dt;  
  }
 
}

void keyPressed(){
   if(key == ' '){
      dt = 0.08; 
      radio = 300;
      x = 0;
      setup();
   }

}

