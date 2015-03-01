
/* @pjs font="RINGM_.ttf"; */

PFont ring;
PImage me;
PImage smile;
int sec;
float p=2;
float a=.5;
int i=0;
int t=20;
int mill;
boolean thresh=true;
void setup(){
  size(595,527);
  strider=loadImage("strider.png");
  ring = loadFont("RINGM_.ttf"); 
  smile=loadImage("smile.jpg");
}

void draw(){

 sec=second();
 mill=millis();
 p+=a;
 
 
 if(p==40){
 a=-a;
 println(sec);
 }
 if(p==2){
 a=-a;
 println(sec);
 thresh=!thresh;}
 textFont(ring,40);
 if(thresh){
 image(strider,0,0);
 text("Set", 15, 30);
 text("Aside", 15, 60);
 text("The", 15, 90);
 text("Ranger", 15, 120);
 }
 if(!thresh){
   image(smile,0,0);
   text("Don't", 15, 30);
   text("Be", 15, 60);
   text("Afraid", 15, 90);
   text("Of", 15, 120);
   text("The", 15, 150);
   text("Light", 15, 180);
 }
 filter(POSTERIZE, p);
 fill(i, i, i);
 i+=t;
 if((p==40)||(p==2)){
   t=-t;}
}



