
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;


//My Week#15 Project
//In this project I was practising with interactive computer drawing
//I used a rectangle as a shape
//By pressing '1', '2', '3' you can change of stroke-colors
//Just enjoy your drawing:-)

//Import 'Minim' library files


//Global Variables
color strokeColor=color(#5E5E53);
//Declare a PImage variable type
PImage background02;
//declare global variables
Minim minim;
AudioPlayer music;

//setup()
  void setup(){
    size(800,800);
    background02=loadImage("background02.jpg");
    noFill();
    //load audio file from HDD
    minim = new Minim(this);
    music = minim.loadFile("music.wav");
    music.play();
    }

//draw()
void draw(){
  image(background02,0,0);
 
  if (mousePressed){
    pushMatrix();
    translate (width/4, height/4);
    int CircleResolution=(int)map(mouseY+100,0,height,2,10);
    int radius=mouseX-width/2;
    float angle=height/CircleResolution;
    
    //style()
    strokeWeight(1);
    stroke(strokeColor);

    
    //rectangle()
    for(int i=0; i<CircleResolution;i++){
    float x=0+cos(angle*i)*radius;
    float y=0+sin(angle*i)*radius;
    rect(random (width), random (height), x, y);
    }
    popMatrix();
  }
}
//keyPressed()
void keyReleased(){
  if (key==DELETE) background (background02);
  if (key==BACKSPACE) background (#F56632);
  if (key=='s'||key=='S')saveFrame("screenshot.png");
  
  switch(key){
    case'1':
    strokeColor=color(#CCCC9F);
    break;
    case'2':
    strokeColor=color(#5E5E53);
    break;  
    case'3':
    strokeColor=color(#FF9862);
    break;
  }
}

