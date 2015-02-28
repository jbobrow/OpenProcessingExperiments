
/*
Roberto Holguin Barragan 11060625
Sergio  Alonso Herrera Perez 11060799
*/
 
  import controlP5.*;
ControlP5 controlP5;
  //variabes
  float v=20;
  float r=18;
  float r2=8; 
void setup(){
  size(500,500);
 
 
controlP5 = new ControlP5(this);
         
/* -----Controladores con su id----- */
    
controlP5.addSlider("Voltaje",0,120,v,10,400,200,20).setNumberOfTickMarks(121).setId(1); 
  controlP5.addSlider("Recistencia",0,199,r,10,430,200,20).setNumberOfTickMarks(200).setId(2);
  controlP5.addSlider("Recistencia2",0,199,r2,10,460,200,20).setNumberOfTickMarks(200).setId(3);
  }
void draw(){
//Formulas//
float i=(v/r+r2);
text(i,10,10);
  
background(63, 133, 127);
  
  
stroke(0, 0, 0);
strokeWeight(4);
textSize(15);
//s
line(50,50,350,50);
//I
line(50,300,165,300);
line(231,300,350,300);
//IZ
line(50,50,50,135);
line(50,205,50,300);
//D
line(350,50,350,150);
line(350,200,350,300);
//B
stroke(11, 3, 252);
fill(17, 0, 255);
text("V="+v+" v",87,180);
line(40,138,59,138);
line(24,165,74,165);
line(24,204,74,204);
line(40,185,59,185);
//C
fill(17, 0, 255);
stroke(255, 0, 0);
text("R2="+r2+" Ohms",373,183);
line(330,187,367,180);
line(330,167,351,151);
line(188,318,178,282);
line(368,179,330,169);
line(209,318,200,282);
line(209,318,221,282);
line(330,187,350,199);
//R
fill(17, 0, 255);
stroke(255, 0, 0);
text("R="+r+" Ohms",175,269);
line(167,300,178,282);
line(188,318,178,282);
line(188,318,200,282);
line(209,318,200,282);
line(209,318,221,282);
line(231,300,222,282);
//R2
fill(216, 230, 21);
stroke(250, 250, 5);
line(10,10,10,350);
line(280,10,280,350);
line(10,10,280,10);
line(10,350,280,350); 
 
//Resultados//
fill(250,250,250);
text("i = "+i,370,400);
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
    r2 = (int)(theEvent.controller().value());
    break;  
   }
 }
