

/*
Violet Wheel

The idea is to create a circle pattern with some color purple combination.
The code is featured with some stuffs such as color mode switch, auto-angle increment, etc.



CONTROL DESCRIPTION:
s/S : to save screenshot
BACKSPACE or DELETE : to erase/background(360)
m/M : QUATER_PI mode
n/N : TWO_PI mode
c/C : change color mode


*/


import ddf.minim.*;
//global variable for sounds
Minim minim;
AudioSample changeColor;
AudioSample changeMode;
AudioSample sketch;


void setup(){
  minim = new Minim(this);

  changeColor = minim.loadSample("color.mp3");
  changeMode = minim.loadSample("mode.wav");
  sketch = minim.loadSample("sketch.aif");
  
  size(800,600);
  colorMode(HSB, 360,100,100);
  noFill();
  background(360);
  smooth();
}
color[] pallete = {#592D4D, #734D69, #260D20, #BFB2A3,#A6978A};
float thePi = PI ; 
float strokeW = 0.2;
int theAngle = 180;
int storeArray=0 ; 


void draw(){
 if (mousePressed){
  
  
  pushMatrix();
  translate(width/2, height/2);
  stroke(pallete[storeArray]);
  strokeWeight(strokeW);
  rotate(radians(theAngle));
  ellipseMode(CENTER);
  arc(0 ,0, mouseX, mouseY ,0, thePi );
  popMatrix();
  theAngle+=10;
  
 } 
  
}


void mousePressed(){
sketch.trigger();}
void keyPressed(){


if (key == 'C' || key == 'c'){
   if (storeArray==4){
 storeArray=0; 
}else{
  storeArray++; 
}
changeColor.trigger();
}
if (key == 'm' || key == 'M'){
 thePi = QUARTER_PI ;
 changeMode.trigger();
}

if (key == 'n' || key == 'N'){
 thePi = TWO_PI ;
 changeMode.trigger();
}


if (key == BACKSPACE || key == DELETE){
 background(360); 
}


  if (key == 's' || key =='S') saveFrame("screenshot.png"); 

}

