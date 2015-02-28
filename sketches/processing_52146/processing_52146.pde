
import netscape.javascript.*;
PImage base;

PFont font;

ArrayList heartpop;
int numHearts = 30;
 float angle = 0;
  float angleSpeed = random (1,3);
  PImage heart;


void setup(){
  PImage heart;
  size(1069,698);
  smooth();
  base = loadImage("CHOCOLATE.png");//trial
  font = loadFont ("NanumPen-20.vlw");
  heart =loadImage("Heart_symbol_c00 copy.png");

frameRate (16);
heartpop = new ArrayList();

 for (int i = 0; i < numHearts; i++) {

    PVector loc = new PVector(random(0,width),random(0,height), 0);
    PVector vel = new PVector(random(-10,60 ), random(-20, 10), 0);
   
    Heart kii = new Heart(loc, vel);
    heartpop.add(kii);
  }

 

  //load image first, this is my card base!
  image (base, 0,0);//trial
  //setup my chosen font, most likely to be Eva's writing
  textFont (font, 30);
// noLoop();
}
  //position them...><
 
void draw(){
   image (base, 0,0);
   
   
   
 for (int i = 0; i < numHearts; i++) {

    Heart a = (Heart) heartpop.get(i);
    a.run();}
  mousePressed();
}
  

   


  void mousePressed(){
  
  if (mouseX > 327 && mouseX < 402 && mouseY >240 && mouseY < 315){
  text("I",360,290);}
  else if (mouseX > 402 && mouseX < 477 && mouseY >240 && mouseY < 315){
  text("will",420,290);}
  else if (mouseX > 477 && mouseX < 552 && mouseY >240 && mouseY < 315){
  text("bring",490,290);}
  else if (mouseX > 552 && mouseX < 627 && mouseY >240 && mouseY < 315){
  text("this",570,290);}
  else if (mouseX > 627 && mouseX < 702 && mouseY >240 && mouseY < 315){
  text("to",655,290);}
  else if (mouseX > 702 && mouseX < 777 && mouseY >240 && mouseY < 315){
  text("U",735,290);}
  else if (mouseX > 327 && mouseX < 402 && mouseY >315 && mouseY < 390){
  text("one",350,365);}
  else if (mouseX > 402 && mouseX < 477 && mouseY >315 && mouseY < 390){
  text("day",420,365);}
  else if (mouseX > 477 && mouseX < 552 && mouseY >315 && mouseY < 390){
  text("in",505,365);}
  else if (mouseX > 552 && mouseX < 627 && mouseY >315 && mouseY < 390){
  text("person",563,365);}
  else if (mouseX > 627 && mouseX < 702 && mouseY >315 && mouseY < 390){
  text(",",660,365);}
  else if (mouseX > 702 && mouseX < 777 && mouseY >315 && mouseY < 390){
  text("and",725,365);}
  else if (mouseX > 327 && mouseX < 402 && mouseY >390 && mouseY < 465){
  text("I",360,440);}
  else if (mouseX > 402 && mouseX < 477 && mouseY >390 && mouseY < 465){
  text("can",425,440);}
  else if (mouseX > 477 && mouseX < 552 && mouseY >390 && mouseY < 465){
  text("help",495,440);}
  else if (mouseX > 552 && mouseX < 627 && mouseY >390 && mouseY < 465){
  text("U",585,440);}
  else if (mouseX > 627 && mouseX < 702 && mouseY >390 && mouseY < 465){
  text("eat",650,440);}
  else if (mouseX > 702 && mouseX < 777 && mouseY >390 && mouseY < 465){
  text("it!",725,440);
  }
  if(mouseX > 800 && mouseX < 850 && mouseY >390 && mouseY < 465){
 for (int i = 0; i < numHearts; i++) {

    PVector loc = new PVector(random(250,750), random (200,500), 0);
    PVector vel = new PVector(random(-10,10 ), random(-10, 10), 0);
   
    Heart kii = new Heart(loc, vel);
    heartpop.add(kii);
  };}
  
  }
  
  
 void heartappear(){
 
 // base = loadImage("CHOCOLATE.png");
  image (base, 0,0);
   
   
   
 for (int i = 0; i < numHearts; i++) {

    Heart a = (Heart) heartpop.get(i);
    a.run();}
    //mousePressed();
}
    
  
/* void keyPressed(){

 loop();
 }
 */
  
  


