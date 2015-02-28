
/** Circuito RC
Daniel Posada
Antonio Chavez
**/
  
import controlP5.*;
ControlP5 controlP5;
   
/* --------------------Valores iniciales------------------------ */
  
public int v = 12;
public int t = 1;
public int r = 15;
public int c = 161;
public int vcc = 20;
   
  
public int te = -6;
public int re = 3;
public int ce = -12;
public int vcce = 1;

public boolean boton1=false;
public boolean boton2=false;
public boolean boton3=false;
public boolean boton4=false;
public boolean boton5=false;
public boolean boton6=false;
public boolean boton7=false;
  
PVector e1 = new PVector();
PVector e2 = new PVector();
  
void setup() {
 
  size(900,600 );
     
/* -------nuevo valor ControlP5----- */
  controlP5 = new ControlP5(this);
     
/* -----Controladores con su id----- */

  controlP5.addSlider("Voltaje [0/120]",0,120,v,85,110,10,100).setNumberOfTickMarks(121).setId(1);
  controlP5.addKnob("Tiempo [0/19]",0,19,t,170,5,50).setNumberOfTickMarks(20).setId(2);
  controlP5.addSlider("Recistencia [0/199]",0,199,r,125,255,100,10).setNumberOfTickMarks(200).setId(3);
  controlP5.addSlider("Capacitancia [0/199]",0,199,c,290,120,100,10).setNumberOfTickMarks(200).setId(4);
  controlP5.addSlider("Voltaje C [0/199]",0,199,vcc,290,208,100,10).setNumberOfTickMarks(200).setId(5);

//-------------Exponenciales-----------------//
  controlP5.addSlider("tE",-12,12,te,150,70,80,10).setNumberOfTickMarks(25).setId(6);
  controlP5.addSlider("rE",-12,12,re,125,269,100,10).setNumberOfTickMarks(25).setId(7);
  controlP5.addSlider("cE",-12,12,ce,290,132,100,10).setNumberOfTickMarks(25).setId(8);
  controlP5.addSlider("vcE",-12,12,vcce,290,220,100,10).setNumberOfTickMarks(25).setId(9);

//---------------Botones---------------//
  controlP5.addToggle("Voltaje del capacitor",boton1,520,50,100,20).setId(10);
  controlP5.addToggle(" Voltaje en la fuente",boton2,520,90,100,20).setId(11);
  controlP5.addToggle("                 carga",boton3,520,130,100,20).setId(12);
  controlP5.addToggle("             corriente",boton4,520,170,100,20).setId(13);
  controlP5.addToggle("      tiempo de carga",boton5,520,210,100,20).setId(14);
  controlP5.addToggle("           resistencia",boton6,520,250,100,20).setId(15);
  controlP5.addToggle("          capacitancia",boton7,520,290,100,20).setId(16);

}

    
void draw() {
background(0);

  
//---------------------Variables de la formula------------------------//
  float vf=v*pow(10,0);
  float tf=t*pow(10,te);
  float rf=r*pow(10,re);
  float cf=c*pow(10,ce);
  float vccf=vcc*pow(10,vcce);
    
//---------------------Formulas------------------------//
 float TAO=rf*cf;
 float voltajecapacitor =(vf*(1-exp(-tf/TAO))); //Formula UNO
 float voltaje = (vccf)/(1-exp(-tf/TAO)); //Formula DOS
 float carga = cf*vf*(1-exp(-tf/TAO)); //FormulaTRES
 float corriente = (vf/rf)*exp(-tf/TAO); //Formula CUATRO
 float tiempo = -TAO*(log(1-(vccf/vf))); //Formula CINCO
 float resistencia = -tf/(cf*(log(1-(vccf/vf)))); //Formula SEIS
 float capacitancia = -tf/(rf*(log(1-(vccf/vf)))); //Formula SIETE
  
    
//-----------variables interactivas de colores--------------------//
  float cb=sqrt(v*v)+130;
  float cr=r+56;
  float cc=c+56;
  float cc2=vcc/5;
    
//------------Intensidad------------//
 if(v>0){
 float time = (float)millis()/400;
  e2.x = 200 +(50*sin((vf/r)*time)) ;
  e2.y = 170 + (50 * cos((vf/r)*time));
  if(e1.y<300&e1.x<=51){
  e1.x=50;
  e1.y = 204 + (12*time);}
  else if(e1.y>=300&e1.x<165){e1.x =(12*time)-45;e1.y=300;}
  else if(e1.x>=165&e1.x<=231){e1.x =155+((time));e1.y=300+(15*sin(time/4));}
  else if(e1.x>=231&e1.x<350){e1.x =((12*time))-680;e1.y=300;}
  else if(e1.x>=350&e1.y>=200){e1.x =350;e1.y=(-12*time)+1320;}
 }

//------------Botones----------//
  fill(200,200,200);
  textSize(20);
   if(boton1==true){
   text(voltajecapacitor+" v",650,70);}
   if(boton2==true){
   text(voltaje+" v",650,110);}
   if(boton3==true){
   text(carga+" C",650,150);}
   if(boton4==true){
   text(corriente+" A",650,190);}
   if(boton5==true){
   text(tiempo+" s",650,230);}
   if(boton6==true){
   text(resistencia+" Omhs",650,270);}
   if(boton7==true){
   text(capacitancia+" F",650,310);}
   
    
//----------Diagrama----------// 
   strokeWeight(30);
   textSize(20);
   stroke(255);
   fill(200,250,255);
        
//-------Circuito-------//
  stroke(255, 255, 255);
  fill(255, 255, 255);
  strokeWeight(4);
//SUPERIR
  line(50,50,350,50);
//INFERIOR
  line(50,300,165,300);
  line(231,300,350,300);
//IZQUIERDA
  line(50,50,50,135);
  line(50,205,50,300);
//DERECHA
  line(350,50,350,150);
  line(350,200,350,300);
//BATERIA
  stroke(cb,0,0);
  line(40,165,59,165);
  line(24,138,74,138);
  line(24,185,74,185);
  line(40,204,59,204);
//CAPACITOR
  stroke(0,cc,vcc);
  line(330,200,370,200);
  line(330,151,370,151);
//RESISTENCIA
  stroke(0,0,cr);
  line(167,300,178,282);
  line(188,318,178,282);
  line(188,318,200,282);
  line(209,318,200,282);
  line(209,318,221,282);
  line(231,300,222,282);
    
//-------Intencidad--------//
  
  fill(200,200,200);
  textSize(30);
  text("i",200,180);
  text("Calcular",505,35);
    
  if(v>0){
  noStroke();
  fill(random(220,255),random(200,240), random(0,30),150);
  ellipse(e1.x, e1.y, 15, 15);
  ellipse(e2.x, e2.y, 15, 15); }
  
//-----------Comprobacion de valores---------//
/*
      textSize(9);
      text("Voltaje "+vf,10,500);
      text("Tiempo "+tf,10,510);
      text("Resistencia "+rf,10,520);
      text("Capacitancia "+cf,10,530);
      text("Voltaje en c "+vccf,10,540);
      text("TAO "+TAO,10,550);
*/
}
   
void controlEvent(ControlEvent theEvent) {
/* Eventos activados por los controladores se reenvían automáticamente a
      el método ControlEvent, marcando el ID de un controlador se puede distinguir
      cuál de los controladores ha sido cambiado. */
        
  switch(theEvent.controller().id()) {
    case(1):
    /* Controlador con  id 1 */
    v = (int)(theEvent.controller().value());
    break;
    case(2):
    t = (int)(theEvent.controller().value());
    break;
   case(3):
    r = (int)(theEvent.controller().value());
    break;
   case(4):
    c = (int)(theEvent.controller().value());
    break;
   case(5):
    vcc = (int)(theEvent.controller().value());
    break;
     case(6):
    te = (int)(theEvent.controller().value());
    break;
    case(7):
    re = (int)(theEvent.controller().value());
    break;
   case(8):
    ce = (int)(theEvent.controller().value());
    break;
   case(9):
    vcce = (int)(theEvent.controller().value());
    break;
  case(10): 
    boton1=!boton1;                         
   break;
  case(11): 
   boton2=!boton2;
  break; 
  case(12): 
    boton3=!boton3;                     
   break;
  case(13): 
   boton4=!boton4;
   break;
  case(14): 
  boton5=!boton5;                       
   break;
  case(15): 
   boton6=!boton6; 
   break;
  case(16): 
    boton7=!boton7;                         
   break;
     
  }
 }

