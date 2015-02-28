
/* Processing Practica 7: El temps */
/*Utilitzem un contador de temps amb l'utilitat "millis"
per implementar un minijoc de beure. Instruccions en pantalla*/
/*Sergi Garcia Calero*/
/*@pjs preload=a.png*/

float m;
float cerv;
boolean puc;
PImage a;
int bonus;
int consciencia;
float poder;
boolean disparador;
void setup(){
  disparador=false;
  size(800,600);
  background(255);
  m=millis();
  cerv = 0;
  puc=true;
  a=loadImage("a.png");
  bonus=0;
  //Modificar aquests valors si vols poder beure mes whisky
  //sense morir, o bé beure mes cervesa per glop.
  consciencia = 5;
  poder = 5;
}

void draw(){
  fill(255,0,0);
  image(a, 0, 0);
      
  //Wibbly wobbly timey wimey stuff
  m=millis()-bonus;
  arc(50, 50, 80, 80, 1.5*PI,1.5*PI+4*m/9600);
  text(30-2*m/1000, 100, 50);
  fill(255,255,0);
  //La cervesa
  rect(300, 100+100*(cerv%1), 50, 100-(100*(cerv%1))+10);
  noFill();
  //Instruccions
    textSize(20);
    text("Pulsa Spacebar per beure cervesa" , 400, 50);
    text("Pulsa W per prendre whisky, que aumenta", 400, 75);
    text("el temps restant en 10s", 400, 100);
    text("Prendre whisky redueix el que beus per", 400, 125);
    text("pulsacio i pots arribar a morir. Bona sort.", 400, 150);
      textSize(50);
  fill(123,213,111);
  text("CERVESES BEGUDES=" + (int)cerv, 10, 550);
    
    //Possibles Finals del Joc
    if (consciencia<=0){
      background(0);
      textSize(100);
      text("Has mort.", 120, 300); 
    }
    if (30-2*m/1000 < 0){
      background(0);
      textSize(40);
      text("Has begut:" + (int) cerv + " cerveses", 120, 300); 
      bonus=-99999;
      poder=0;
    }
    
  if (!disparador){
    background(0);
    text("PULSA ESPAI PER JUGAR",50,300);
  }
}

void keyPressed(){
  if (key==' ' && puc){
    cerv+=0.2*(poder/10);
    puc=false;
    if (!disparador){
      disparador=true;
      bonus=millis();
    }
  }
  if (key=='w' && puc){
    consciencia-=1;
    poder-=1;
    bonus += 5000;
    puc = false;
  }
  
}

//Per evitar que la gent faci trampes i mantingui apretat l'espai
void keyReleased(){
  puc=true;
}


