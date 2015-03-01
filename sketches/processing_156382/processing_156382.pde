
engranajeMaster master;
engranajeSlave slave;
engranajeLineal lineal;
vinculoLineal vincLineal;

//posicion y dimensiones del engranaje master
float posicionX = 300;

float radio1 = 80;

float posicionY = radio1 + 100;
float vinculo1 = radio1-radio1/10;

//coordenadas del centro del punto de vínculo (master y slave)
float xmaster, ymaster, xslave, yslave;
float maxSlave = 0;

//separacion entre master y slave
int separacion = -40;


float radio2 = 80;
float vinculo2 = radio2-radio2/10;
float anguloInicial1 = PI/2;
float anguloInicial2 = 0.0;
float velocidadInicial = 0.05;


void setup(){
  ellipseMode(RADIUS);
  rectMode(CENTER);
  size(600,600);
  master  = new engranajeMaster(posicionX,posicionY,radio1,vinculo1, anguloInicial1, velocidadInicial);
  anguloInicial2 = (PI/2)+atan(radio1*sin((PI/2)-(anguloInicial1))/(radio1*(1-cos((PI/2)-anguloInicial1))+separacion+radio2));
  slave = new engranajeSlave(master.xpos, master.ypos+separacion+radio1+radio2, radio2, vinculo2, (PI/2)+anguloInicial2, 0.0);
  lineal = new engranajeLineal(master.xpos, master.ypos+separacion+radio1+2*radio2+radio2/4/2, radio2*4, radio2/4 );
  vincLineal = new vinculoLineal(slave.xpos, slave.ypos, 100, 20, 40);
}


void draw(){
  
background(204);

master.actualizar();

slave.actualizar(master.angle);
slave.dibujar();

master.dibujar();

//line(xslave,yslave,xmaster,ymaster);

lineal.actualizar(posicionX+cos(slave.angle)*radio2);
lineal.dibujar();

vincLineal.actualizar(slave.angle);
vincLineal.dibujar();


}

class engranaje{
  float xpos, ypos, radio, vinculo, indice, velocidad, sentido, speed, angle;
 
 engranaje (float x, float y, float r, float vinc, float ang, float vel){
   xpos = x;
   ypos = y;
   radio = r;
   vinculo = vinc;
   angle = ang; //en radianes
   speed = vel;
 } 
}

class engranajeMaster extends engranaje{

  engranajeMaster(float x, float y, float r, float vinc, float ang, float vel){
    super(x,y,r,vinc,ang,vel);
  }
  
  void actualizar(){
 angle += speed;
 }
 
 void dibujar(){
 stroke(255, 0, 0);
 //dibujar el engranaje
 ellipse (xpos, ypos, radio, radio);
 //dibujar centro
 ellipse (xpos, ypos, radio/10, radio/10);
 //dibijar punto de vinculo
 stroke(0, 0, 255);
 xmaster=xpos+vinculo*cos(angle);
 ymaster=ypos+vinculo*sin(angle);
 ellipse (xmaster, ymaster, radio/10, radio/10);
 
 rotate(angle, xpos, ypos, 0);
 //popMatrix();
 
 
 }

}


class engranajeSlave extends engranaje{
  
  //engranaje (float x, float y, float r, float vinc, float ang, float vel){
  
  engranajeSlave(float x, float y, float r, float vinc, float ang, float vel){
  super(x,y,r,vinc,ang,vel);
  }
  
  void actualizar(float anguloMaster){
  angle = (PI/2)+atan(radio1*sin((PI/2)-anguloMaster)/(radio1*(1-cos((PI/2)-anguloMaster))+separacion+radio2));
  }
  
  void dibujar(){
 stroke(255, 0, 0);
 //dibujar el engranaje
 ellipse (xpos, ypos, radio, radio);
 //dibujar el centro
 ellipse (xpos, ypos, radio/10, radio/10);
 //dibijar punto de vinculo
 stroke(0, 0, 255);
 
 xslave = xpos+vinculo*cos(angle);
 yslave = ypos+vinculo*sin(angle);
 
 ellipse (xslave, yslave, radio/10, radio/10);
 //ellipse (xpos+vinculo*cos(angle), ypos+vinculo*sin(angle), radio/10, radio/10);
 rotate(angle, xpos, ypos, 0);
 //popMatrix();
 }
  
}



class engranajeLineal{
 float centro, ancho, largo, posicion;
 
 engranajeLineal (float p,float c, float l, float a ){
    centro = c;
    ancho = a;
    largo = l;
    posicion = p;
 }

void actualizar(float pos){
 posicion = pos;
}

void dibujar(){
rect(posicion,centro, largo, ancho);
} 
 
}



class vinculoLineal {
  
  float xpos, ypos, alt, anch, angulo;
  
  vinculoLineal(float x, float y, float alto, float ancho, float ang){
    xpos = x;
    ypos = y;
    alt = alto;
    anch = ancho;
    angulo = ang;
  }
  
  void actualizar(float anguloSlave){
  angulo = anguloSlave;
  }
  
  void dibujar(){
   stroke(255, 0, 0);
   //dibujar el engranaje
   rectMode(CENTER);
    xpos = xpos+40*cos(angulo);
 ypos = ypos+40*sin(angulo);
   rect(xpos, ypos, alt, anch);
   rotate(angulo);
   
   //dibujar el centro
   
 }
  
}


