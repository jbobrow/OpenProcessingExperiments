
/* @pjs preload="luz_abduccion.png,ovejamini.png,gameover.jpg,farm1.png"; */

    NumOvejas muchas;

    GameOver lose;
    Contador crono;
    Ovni alf;
    Contador num;
    Dolly_r[] dolly_r = new Dolly_r[10];
    Dolly_l[] dolly_l = new Dolly_l[10];
    
    

    PImage om;
    PImage go;
    PImage cs;
    int click;
    float sale_ove;
    float run;
    float run_dolly;
    boolean strat_dolly = true;
    boolean fall;
    int cambia;
void setup(){
  size(1000,700);
 muchas = new NumOvejas();
 lose = new GameOver();
 crono = new Contador();
  alf = new Ovni();
  cs = loadImage("farm1.png");
  for (int i = 0; i < dolly_r.length;i++){
    dolly_r[i] = new Dolly_r(-150, 540, random (1,4));
    dolly_l[i] = new Dolly_l(width + 50, 540, random (1,9));
  }
  }

void draw(){
  rect(400,400,400,400);
 
  run_dolly = random(0,500);
  
  switch(cambia){
    case 0:
    image(cs, 0, 0,1000,700);
  if(run_dolly <= 5 && run_dolly >= 4 || strat_dolly == true) run += 1; strat_dolly = false;
  
  for(int i = 0; i < dolly_r.length && i < run; i++){
   
   dolly_r[i].dibuixa();
   dolly_l[i].dibuixa();
   if(dolly_r[i].yPos > 445){
       dolly_r[i].moure(alf.xPos);
       }
   if(dolly_l[i].yPos > 445){
       dolly_l[i].moure(alf.xPos);
       }
   
 
 if(keyPressed){
   if(key == ' ') fall = true;
   if(key == ' ' && dolly_l[i].xPos <= alf.xPos - 25 && dolly_l[i].xPos >= alf.xPos -125){
     dolly_l[i].eleva();
     
 }
    if(key == ' ' && dolly_r[i].xPos <= alf.xPos - 25 && dolly_r[i].xPos >= alf.xPos -125){
   dolly_r[i].eleva();
   
 }
 }
if(fall == false && dolly_r[i].yPos < 540){
  dolly_r[i].caida();
}
if(fall == false && dolly_l[i].yPos < 540){
  dolly_l[i].caida();
      
}
muchas.recuento(dolly_r[i].num_r, dolly_l[i].num_l);

  }
    crono.relog();
    alf.ovalo();
    alf.luces();
    
    
    break;
    
    case 1:
    lose.pantalla();
    lose.intenta();
    break;
 }
}


void keyReleased(){
  fall = false;
}

class Dolly_l {

  float xPos;
  float yPos;
  float xSpeed;
  PImage dolly2;
  float num_l;
  Dolly_l(){
    
    xPos = width/2;
    yPos = height/2;
    xSpeed = 1;
    dolly2 = loadImage("oveja2.png");
  }
  Dolly_l(float xl, float yl, float vell){
    num_l = 0;
    xPos = xl;
    yPos = yl;
    xSpeed = vell;
    dolly2 = loadImage("oveja2.png");
  }
  void dibuixa(){

    
    image(dolly2, xPos, yPos);
    
    
  }
  void moure(float xOvni){
    
    xPos -=3;

  }

  
  void eleva(){
  yPos = yPos - 5;
  if(yPos < 100) num_l +=1;
  }
    float d(){
    return(num_l);
    }
    float a(){
   return(yPos);
  }
    void caida(){
      if(yPos < 540)yPos = yPos + (yPos - xSpeed)/20;
    
    }
}
class Dolly_r {
  
  float xPos;
  float yPos;
  float xSpeed;
  PImage dolly1;
  float num_r;
  Dolly_r(){
    
    xPos = 0;
    yPos = height/2;
    xSpeed = 1;
    dolly1 = loadImage("oveja1.png");
  }
  Dolly_r(float xr, float yr, float velr){
    num_r = 0;
    xPos = xr;
    yPos = yr;
    xSpeed = velr;
    dolly1 = loadImage("oveja1.png");
  }
  void dibuixa(){

    
    image(dolly1, xPos, yPos);
    
    
  }
  void moure(float xOvni){
    xPos +=3;

  }

  float b(){
    return(xPos);
  }
    void eleva(){
  yPos = yPos - 5;
  if(yPos < 100) num_r +=1;
  }
     float c(){
    return(num_r);
    }
  void caida(){
    if(yPos < 540)yPos = yPos + (yPos - xSpeed)/20;
    }
    

  }
class GameOver{
  int game_over;
  
  GameOver(){
  game_over = 0;
  go = loadImage("gameover.jpg");
  }
  void pantalla(){
    image(go, 0, 0, 1000, 700);
  }
  
  void intenta(){
  if(mousePressed){
    cambia = 0;
  }

  }
}
class NumOvejas{
  int cuantas;
  int xPos;
  float num;
  NumOvejas(){
  cuantas = 0;
  om = loadImage("ovejamini.png");
  }
  
  void recuento(float d_r, float d_l ){
    num = (d_r * 30) + (d_l * 30);
    for(int i = 0; num < i; i = i + 30){
      image(om, i, 40, 40, 40 );
    }
  
  }
  
}

class Ovni{
  //variables ovalo
  float xOv;
  float yOv;
  color cOv;
  //variables luces rotativas
  float c0;
  float c1;
  float c2;
  float c3;
  float c4;
  float c5;
  float c6;
  float c7;
  //posicion de la x
  float xPos;
  float vel;
  //Luz
  PImage luz;
  Ovni(){
      //variables ovalo
  xOv = width/2;
  yOv = height;
  cOv = color(#19FC22);
  //variables luces rotativas
  c0 = 0;
  c1 = 12;
  c2 = 25;
  c3 = 37.5;
  c4 = 50;
  c5 = 62;
  c6 = 75;
  c7 = 87.5;
  //posicion de la x
  xPos = 500;
  vel = 0;
  //Luz
  luz= loadImage("luz_abduccion.png");
  }
  
 void ovalo(){
    //PLATILLO
    stroke(0);
    strokeWeight(5);
    fill(#676767);
    ellipse(xPos, 40, 575,100);
     
      }
      
      
   void luces(){
     /*Aquí le estoy pasando un rango de del 0 al 100 al map para que me devuelva el equivalente a la dicisión de dos PI 
     y luego lo multiplique por el valor del la primera posición de map quedando asi: n*(primerValor/segundoValor)*/
      float s0 = map(c0, 0, 100, 0, TWO_PI) - HALF_PI; c0 = c0 + 0.5;
      float s1 = map(c1, 0, 100, 0, TWO_PI) - HALF_PI; c1 = c1 + 0.5;
      float s2 = map(c2, 0, 100, 0, TWO_PI) - HALF_PI; c2 = c2 + 0.5;
      float s3 = map(c3, 0, 100, 0, TWO_PI) - HALF_PI; c3 = c3 + 0.5;
      float s4 = map(c4, 0, 100, 0, TWO_PI) - HALF_PI; c4 = c4 + 0.5;
      float s5 = map(c5, 0, 100, 0, TWO_PI) - HALF_PI; c5 = c5 + 0.5;
      float s6 = map(c6, 0, 100, 0, TWO_PI) - HALF_PI; c6 = c6 + 0.5;
      float s7 = map(c7, 0, 100, 0, TWO_PI) - HALF_PI; c7 = c7 + 0.5;

      
      strokeWeight(5);
      stroke(#FFB41F);
      /*El valor de c se incrementa hasta cien. (Una vuelta entera) Cuando ya a dado la vuelta entera entoces el valor deve
      volver a situarse a 0 para comenzar a incrementar de nuevo*/
      if(c0 > 100) c0 = 0;
      if(c1 > 100) c1 = 0;
      if(c2 > 100) c2 = 0;
      if(c3 > 100) c3 = 0;
      if(c4 > 100) c4 = 0;
      if(c5 > 100) c5 = 0;
      if(c6 > 100) c6 = 0;
      if(c7 > 100) c7 = 0;
      
      fill(#39F21D);
      ellipse(cos(s0) * 220 + xPos, sin(s0) * 35 + 40, 40, 18);
      ellipse(cos(s1) * 220 + xPos, sin(s1) * 35 + 40, 40, 18);
      ellipse(cos(s2) * 220 + xPos, sin(s2) * 35 + 40, 40, 18);
      ellipse(cos(s3) * 220 + xPos, sin(s3) * 35 + 40, 40, 18);
      ellipse(cos(s4) * 220 + xPos, sin(s4) * 35 + 40, 40, 18);
      ellipse(cos(s5) * 220 + xPos, sin(s5) * 35 + 40, 40, 18);
      ellipse(cos(s6) * 220 + xPos, sin(s6) * 35 + 40, 40, 18);
      ellipse(cos(s7) * 220 + xPos, sin(s7) * 35 + 40, 40, 18);
        if(keyPressed){
           if(key == 'f' || key == 'F')xPos = xPos - 3.5;
           if(key == 'h' || key == 'H')xPos = xPos + 3.5;
           if(key == ' '){
             fill(#FAFF00);
             noStroke();
             //HAZ DE LUZ DESCENDENTE
             rectMode(CORNER);
             /*rect(xPos - 75, 40,150,550);
             ellipse(xPos, 40, 150, 30);
             ellipse(xPos, 590, 150, 30);*/
             image(luz, xPos - 315 , 25);
           }
         }}
       float xPos(){
         return(xPos);
       }
  
     }
class Contador{
  int tiempo;
  float sumar;
  float cantidad;
  int atras;
  
  Contador(){
    tiempo = 0;
    atras = 30000 + tiempo;
    cantidad = 0;
  }
  
  void relog(){
    
  tiempo = (int)(atras - millis())/1000;
  
  if(tiempo < 8 && (tiempo%2 == 0)){
    fill(#FA0000, 90); 
    textSize(25);
    text(tiempo, 30,30);
    fill(#FA0000);
    textSize(15);
      }
   if(tiempo < 0) cambia = 1;
   
    text(tiempo, 36,26);
  }
  int t(){
    return(int)(tiempo);
  }

}


