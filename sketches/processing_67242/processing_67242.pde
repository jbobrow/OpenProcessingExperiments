
PImage helloKitty;
PImage snoopy;
PImage miffy;
PFont font;
float y1;
float y2;
float y3;

void setup(){
  size(450,600);
  smooth();
  helloKitty=loadImage("hellokitty.png");
  snoopy=loadImage("snoopy.png");
  miffy=loadImage("miffy.png");
  
font = createFont("Helvetica",24); 

}
void draw(){
  background(0);
  textFont(font, 32); 
 text((hour()+":"+minute()+":"+second()),30,50);
 y1=map(hour(),0,24,50,height-50);
 y2=map(minute(),0,60,50,height-50);
 y3=map(second(),0,60,50,height-80);
 image(snoopy,30,height-y1);
 image(miffy,200,height-y2);
 image(helloKitty,320,height-y3);
 
}

