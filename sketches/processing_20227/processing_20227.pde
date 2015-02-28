
String myText = "L5A 3S8";
PFont fnt;
int counter=0;
float posX=25;
float posY=50;
float posYmax=200;
 
void setup(){
  size(250,250);
  background(255);
  smooth();
  frameRate(7);
}
 
void draw(){
  background(212,212,212);
  fill(255);
  rect(10,10,230,230);
   
  // multicoloured moving type
  fnt = loadFont("HelveticaNeueLTCom-Bd-48.vlw");
  textFont(fnt, 50); 
  fill(color(random(255),random(255),random(255)));
  text(myText,posX,posY);
   
  if(counter<18){
  posY=posY+10;
  }
  else {
  posY=posY-10;
}
if(counter==30){
  counter=0;
}
if (counter==0){
  posY=50;
}
  // static white type 1
  textFont(fnt, 50); 
  fill(255);
  text(myText,25,75);
  // static white type 2
  textFont(fnt, 50); 
  fill(255);
  text(myText,25,125);
  // static white type 3
  textFont(fnt, 50); 
  fill(255);
  text(myText,25,175);
  // static white type 4
  textFont(fnt, 50); 
  fill(255);
  text(myText,25,225);
 
counter++;
 println(counter);
   
}

