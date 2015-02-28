
PImage img;

PFont font;
float opacityv = 0; //opacity variables
float opacity5 = 0;
float opacityb = 0;
float opacity1 = 0;
float opacityz = 0;
float opacity9 = 0;

void setup() {
  size(733, 477);
   img = loadImage("027.jpg");
   background (200);
  image(img,0,0);
   font = loadFont("HelveticaNeue-Light-48.vlw"); 
    smooth();
}

void draw() {
  background(20);
    image(img,0,0);
  textFont(font);
  frameRate(15);
   
  fill(255, opacityv); //colour
  text("W", 420, 125);
  fill(255, opacity5); //colour
  text("H", 465, 125);
  fill(255, opacityb); //colour
  text("A", 500, 125);
  fill(255, opacity1); //colour
  text("T", 530, 125);
  
  fill(255, opacityz); //colour
  text("A", 420, 175);
  fill(255, opacity9); //colour
  text("M", 450, 175);
  
  fill(255, opacityv); //colour
  text("I", 500, 175);
  
  fill(255, opacity5); //colour
  text("E", 420, 225);
  fill(255, opacityb); //colour
  text("A", 453, 225);
  fill(255, opacity1); //colour
  text("T", 485, 225);
  fill(255, opacityz); //colour
  text("I", 515, 225);
  fill(255, opacity9); //colour
  text("N", 530, 225);
  fill(255, opacityb); //colour
  text("G", 565, 225);
  
  fill(255, opacity1); //colour
  text("?", 420, 275);
  
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


