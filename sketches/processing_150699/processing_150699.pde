
/*Alina Honhala
Ejercicio: Animar el movimiento de una particula a velocidad 
v sobre las 2 funciones osciladoras.*/

float x=40;
float y,y2,x2;
float pos_y;
float amp = 50; //Amplitud
int diam = 50;
int vel = 4;
float incr = 0.03;
float incr2 = 0.009; //Incremento distinto para que y2 no vaya tan deprisa
boolean iniciar = false;

void setup(){
  size(700,600);
  smooth();
}

void draw()
{
  
  pos_y = height/2;
  background(#FFFFFF);
  
  //Eje separador
  stroke(#610317);
  line(0,pos_y,width,pos_y);
  fill(#030861);
  text ("Pulsa 'espacio' para comenzar.", 20, 50);
  
  
  //FunciÃ³n 1
  pushMatrix();
  
  x+= vel*incr; 
  y=amp*sin(x)*exp(-0.002*x);  
  ellipse(x, (pos_y/2)+y, diam, diam);
  
  popMatrix();
  
  //FunciÃ³n 2
  pushMatrix();
  
  x2+= vel*incr2; 
  y2 = amp*sin(3*x2) + amp*sin(3.5*x2); 
  ellipse(x, (pos_y*1.5)+y2, diam, diam);
  
  popMatrix();
  
 
 
}

void keyPressed(){
   if(key == ' ')
      x=40;
      y=amp*sin(x)*exp(-0.002*x); 
      x2+= vel*incr2; 
      y2 = amp*sin(3*x2) + amp*sin(3.5*x2); 
      pos_y = height / 2;
      setup();

}
