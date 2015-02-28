
PFont font;
float opacityv = 0; //opacity variables
float opacity5 = 0;
float opacityb = 0;
float opacity1 = 0;
float opacityz = 0;
float opacity9 = 0;

void setup() {
  size(250, 250);
  font = loadFont("Futura-Medium-20.vlw"); //futura
  smooth();
}
 
void draw() {
  background(20);
  textFont(font);
  frameRate(15);
   
  fill(255, opacityv); //colour
  text("V", 20, 125);
  fill(255, opacity5); //colour
  text("5", 40, 125);
  fill(255, opacityb); //colour
  text("B", 60, 125);
  fill(255, opacity1); //colour
  text("1", 80, 125);
  fill(255, opacityz); //colour
  text("Z", 100, 125);
  fill(255, opacity9); //colour
  text("9", 120, 125);
  
  opacityv += 30; //increasing opacity from 0 at different rates
  opacity5 += 25;
  opacityb += 20;
  opacity1 += 15;
  opacityz += 10;
  opacity9 += 5;
  
  //rates of opacity change because speed of reachign 500 varies
   
  if(opacityv > 500){  //if opacity reaches 500, change back to 0
     opacityv = 0;}
   if(opacity5 > 500){
     opacity5 = 0;}
   if(opacityb > 500){
     opacityb = 0;}
   if(opacity1 > 500){
     opacity1 = 0;}
   if(opacityz > 500){
     opacityz = 0;}
   if(opacity9 > 500){
     opacity9 = 0;}
}


