
/** Circuito RC
Daniel Posada
Antonio Chavez
**/
  
import controlP5.*;
ControlP5 controlP5;
   
/* --------------------Valores iniciales------------------------ */
Worm[] worms;
int numWorms = 100;
PVector pulse;
boolean pulsed;
 
public int v = 12;
public int r = 15;
public int c = 161;
     
public int re = 3;
public int ce = -12;

  
PVector e1 = new PVector();
PVector e2 = new PVector();
  
void setup() {
 
  size(900,600 );
  smooth();
  noStroke();
  worms = new Worm[numWorms];
  for (int i=0; i<numWorms; i++) {
    worms[i] = new Worm(random(0,900),random(500,750),random(0,2*PI));
  }
  pulsed = false;   
/* -------nuevo valor ControlP5----- */
  controlP5 = new ControlP5(this);
     
/* -----Controladores con su id----- */
  controlP5.addSlider("Voltaje",0,120,v,100,120,10,100).setNumberOfTickMarks(121).setId(1);
  controlP5.addSlider("Recistencia",0,199,r,125,325,100,10).setNumberOfTickMarks(200).setId(2);
  controlP5.addSlider("Capacitancia",0,199,c,300,90,100,10).setNumberOfTickMarks(200).setId(3);

//-------------Exponenciales-----------------//
  controlP5.addSlider("rE",-12,12,re,125,339,100,10).setNumberOfTickMarks(25).setId(4);
  controlP5.addSlider("cE",-12,12,ce,300,103,100,10).setNumberOfTickMarks(25).setId(5);


}

    
void draw() {
//background(0);

  
//---------------------Variables de la formula------------------------//
  float vf=v*pow(10,0);
  float rf=r*pow(10,re);
  float cf=c*pow(10,ce);

//---------------------Formulas------------------------//
 float TAO=rf*cf;
// float voltajecapacitor =(vf*(1-exp(-tiempo/TAO))); 
    
//-----------variables interactivas de colores--------------------//
  float cb=sqrt(v*v)+130;
  float cr=r+56;
  float cc=c+56;

    
//------------Intensidad------------//
 if(v>0){
 float time = (float)millis()/400;
  e2.x = 220 +(50*sin((vf/r)*time)) ;
  e2.y = 170 + (50 * cos((vf/r)*time));
 if(time==10){ stop(); }
 }


   
    
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
  noFill();
ellipse(119,49,10,10);
ellipse(172,49,10,10);
ellipse(148,80,10,10);
line(50,50,112,50);
line(177,50,350,50);
line(148,88,148,299);
fill(255, 255, 255);
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
  fill(148, 134, 43);
  rect(9,120,86,107);
  fill(51, 50, 44);
  rect(9,120,86,73);
  rect(40,228,20,10);
  stroke(207, 0, 0);
  line(60,210,40,210);
  line(51,220,51,200);
  stroke(255, 255, 255);
//CAPACITOR
  
  stroke(255, 255, 255);
  fill(0, 0, 0);
  rect(306,120,86,109);
  fill(255, 13, 13);
  noStroke();
  fill(random(220,240), random(230,250), 12);
  rect(306,228,86,-7);
  stroke(255, 255, 255);
  strokeWeight(4);
//RESISTENCIA
  stroke(10,255,cr/2);
  line(167,300,178,282);
  line(188,318,178,282);
  line(188,318,200,282);
  line(209,318,200,282);
  line(209,318,221,282);
  line(231,300,222,282);
    
//-------Intencidad--------//
  
  fill(255,255,200);
  textSize(30);
  text("i",220,180);
  text("Tiempo: ",500,180);
  textSize(20);
//---------ayuda--------//  
  text("Ve como se carga el capacitor en tiempo real",140,450);
  text("Ayuda?",10,580);
  if(mouseX>10&mouseX<70&mouseY>560&mouseY<580){
    textSize(15);
   text("°Puedes variar los valores del circuito manualmente con los sliders",100,575);
   text("°El segundo slider es el exponencial. Ejemplo: Resistencia=10, RE=-12 --> 10 Pico Ohms ",100,590); 
   
}
if(mouseX>110&mouseX<125&mouseY>40&mouseY<55){
if(mousePressed){pause();
    line(166,50,124,50);
    
float tiempo = (float)millis()/1000;
 noStroke();
  fill(random(220,240), random(230,250), 12);
  rect(306,228,86,-10*tiempo);
 textSize(30);
text(tiempo,650,180);
}}
if(mouseX>135&mouseX<150&mouseY>70&mouseY<85){
if(mousePressed){
line(169,53,153,74);
float tiempo = (float)millis()/1000;
 textSize(30);
text(tiempo,650,180);
}}
  if(v>0){
  noStroke();
  fill(random(220,255),random(200,240), random(0,30),150);

  ellipse(e2.x, e2.y, 15, 15); }

 //-------Animacion-------//

    fill (20,40);
    noStroke ();
    rect (0, 0, width, height);
  for (int i=0; i<numWorms; i++) {
   fill(map(noise(0.01*worms[i].loc.x,0.01*worms[i].loc.y),0,1,0,255),map(noise(0.01*worms[i].loc.x,0.01*worms[i].loc.y),0,1,0,255),255);

    ellipse(worms[i].loc.x,worms[i].loc.y,3,3);
    if (pulsed) {
      worms[i].move(pulse);
    }
    else
      worms[i].move();
  }
  pulsed = false;
}
 
class Worm {
  PVector dir;
  PVector loc;
  float angle;
  float speed=4;
  float agility = 0.2;
  
  public Worm(float x, float y, float angle) {
    this.angle = angle;
    loc = new PVector(x,y);
    dir = new PVector(cos(angle),sin(angle));
    dir.normalize();
    dir.mult(speed);
  }
 
  void move() {
    angle += random(-agility,agility);
    updateDir();
  }
  void updateDir() {
    dir = new PVector(cos(angle),sin(angle));
    dir.normalize();
    dir.mult(speed);
    if (loc.x+dir.x<0 || loc.x+dir.x>width) {
      angle = PI-angle;
      //move();
    }
    else if (loc.y+dir.y<350 || loc.y+dir.y>height) {
      angle = 2*PI-angle;
      //move();
    }
    else
      loc.add(dir); 
  }
 void move(PVector pulse) {
    if (PVector.dist(pulse,loc)<100) {
      PVector d = new PVector(loc.x,loc.y);
      d.sub(pulse);
      angle = atan(d.y/d.x);
    }
   updateDir();   
 }

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
    r = (int)(theEvent.controller().value());
    break;
   case(3):
    c = (int)(theEvent.controller().value());
    break;
   case(4):
    re = (int)(theEvent.controller().value());
    break;
   case(5):
    ce = (int)(theEvent.controller().value());

   
  }
 }

