
//This is my last proyect to the course of coursera "Introduction to Computational Arts: Processing" 

import ddf.minim.*;

//Global VAriables
color strokeColor = color(0, 10);
int numFrames = 42;
int frame= 0;
PImage [] images = new PImage [numFrames];
int direction = 1;
float signal;


 
  //Text
String advertisement = "This program contains images and sounds that can scare you.\nIf you are susceptible to this type of information,TURN OFF the sound\n to your computer.";
String intro = "Press ENTER to continue...";
String manual = ("Click in the middle of the screen and \n go making movements without releasing the mouse, \n pressing keys in this order: \n1, 2, 3, 4 and 5.\n\n If you dare ...");


  //Audio
Minim minim;
AudioSample grito;  

//setup()
void setup() {
  size(800, 600);
  colorMode(HSB, 360, 100, 100, 100);
  noFill();
  background(0);
  minim = new Minim(this);
  grito = minim.loadSample("grito.mp3");
  
    //Text function
  fill(#FFFFFF);
  textSize(60);
  textAlign(CENTER);
  text("ADVERTISEMENT:", 400, 100);
  textSize(20);
  textLeading(50);
  text( advertisement, 400,200);
  textSize(40);
  textAlign(CENTER);
  text( intro, 400,450);
  noFill();
  
  frameRate (10); 

    images[0] = loadImage ("frame-01.gif");
    images[1] = loadImage ("frame-02.gif");
    images[2] = loadImage ("frame-03.gif");
    images[3] = loadImage ("frame-04.gif");
    images[4] = loadImage ("frame-05.gif");
    images[5] = loadImage ("frame-06.gif");
    images[6] = loadImage ("frame-07.gif");
    images[7] = loadImage ("frame-08.gif");
    images[8] = loadImage ("frame-09.gif");
    images[9] = loadImage ("frame-10.gif");
    images[10] = loadImage ("frame-11.gif");
    images[11] = loadImage ("frame-12.gif");
    images[12] = loadImage ("frame-13.gif");
    images[13] = loadImage ("frame-14.gif");
    images[14] = loadImage ("frame-15.gif");
    images[15] = loadImage ("frame-16.gif");
    images[16] = loadImage ("frame-17.gif");
    images[17] = loadImage ("frame-18.gif");
    images[18] = loadImage ("frame-19.gif");
    images[19] = loadImage ("frame-20.gif");
    images[20] = loadImage ("frame-21.gif");
    images[21] = loadImage ("frame-22.gif");
    images[22] = loadImage ("frame-23.gif");
    images[23] = loadImage ("frame-24.gif");
    images[24] = loadImage ("frame-25.gif");
    images[25] = loadImage ("frame-26.gif");
    images[26] = loadImage ("frame-27.gif");
    images[27] = loadImage ("frame-28.gif");     
    images[28] = loadImage ("frame-29.gif");
    images[29] = loadImage ("frame-30.gif");
    images[30] = loadImage ("frame-31.gif");
    images[31] = loadImage ("frame-31.gif");
    images[32] = loadImage ("frame-31.gif");
    images[33] = loadImage ("frame-31.gif");
    images[34] = loadImage ("frame-31.gif");
    images[35] = loadImage ("frame-31.gif");
    images[36] = loadImage ("frame-31.gif");
    images[37] = loadImage ("frame-31.gif");
    images[38] = loadImage ("frame-31.gif");
    images[39] = loadImage ("frame-31.gif");
    images[40] = loadImage ("frame-31.gif");
    images[41] = loadImage ("frame-31.gif");
       
}


//draw()
void draw(){

  
if (mousePressed){
 
  pushMatrix();
  translate(width/2, height/2);
  int circleResolution = (int)map(mouseY, 0, height, 5, 5);
  int radius = mouseX-width/20; 
  float angle = TWO_PI/circleResolution;
  
  //style
  strokeWeight(3);
  stroke(strokeColor);
  
  beginShape();
  for (int i=0; i<=circleResolution; i++){
    float y=0 + cos(angle*i*2) * radius/2;
    float x=0 - sin(angle*i*2) * radius/2;
    vertex(x, y);
  }
  endShape();
  popMatrix();
}
if (key== '5'){
      
      frame = (frame+1) % numFrames;
      int offset = 0;
      for (int x = 0; x <= width; x++ );{
        image ( images[(frame+offset) % numFrames], 0, 0);
        offset+=0;
     }
  }
  
}

    
void keyPressed(){
if (key== '5'){
      grito.trigger();  
    }
  }


void keyReleased(){
  if (key == DELETE || key == BACKSPACE) background(0);
  if (key== 's' || key== 'S') saveFrame("screenshot.jpg");
  if (key == ENTER) {
    background (0);
    textAlign(CENTER);
    textSize(50);
    textLeading(50);
    text("INSTRUCTION:", 400, 100);
    textSize(30);
    textLeading(50);
    text( manual, 400,200);
    }
  
  switch(key){
    case '1':
      background(0);
      strokeColor = color(0,100,80,8);
      break;
      
    case '2':
      strokeColor = color(0,100,70,9);
      break;
      
    case '3':
      strokeColor = color(0,100,90,10);
      break;
      
    case '4':
      strokeColor = color(0,100,100,20);
      break;
  }
}

