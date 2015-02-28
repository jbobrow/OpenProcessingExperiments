
//Built of off Minim Audio Library Example >> GetLineIn
//Copy onto computer to work

import ddf.minim.*;

Minim minim;
AudioInput in;
int kolor = 0;
int posx;
int posy;
int counter = 0;
int counterTrack = 1;
color [] colorChoosen = new color [20];
boolean colorSelected = false;
boolean refreshBG = false;
PFont helvet;
float time = 0;
float lastTime;

void setup(){
  size(800, 600, P2D);
  background(0, 0, 255);
  minim = new Minim(this);
  minim.debugOn();
  PImage SelectColor = loadImage("colorChooser.jpg");
  helvet = createFont("Helvet", 30);
  image(SelectColor, 0, 0);

  // get a line in from Minim, default bit depth is 16
  in = minim.getLineIn(Minim.STEREO, 800);
}


void mousePressed(){
  if (colorSelected == false){
  println("The " + counter + " color is equal to " + colorChoosen[counter]);
    counter++;
  }
}

void keyPressed(){
  if (key == 'D' || key == 'd'){
    colorSelected = true;
  }
}


void draw(){
if (colorSelected == false){
  textFont(helvet);
  fill(255);
  noStroke();
  rect(0, 0, 800, 90);
  fill(0, 0, 255);
  text("Choose up to 20 colors and hit 'D' when done.", 20, 40);
  text("The first color choosen will be the background color.", 20, 75);
  colorChoosen[counter] = get(mouseX, mouseY);

}

else{
  if(refreshBG == false){
  background(colorChoosen[0]);
  refreshBG = true;

  }
  //time = millis() - lastTime;
  if (millis()%20 == 0){
   // lastTime = millis();
    if (counterTrack < counter){
    counterTrack++;
    }
    else{
     counterTrack = 1; 
    }
  }  
  stroke(colorChoosen[counterTrack]);
  
  // draw the waveforms
  for(int i = 0; i < in.bufferSize() - 1; i++)
  {
    line(i, 300 + in.mix.get(i)*500, i+1, 300 + in.mix.get(i+1)*500);

  }
}
}


void stop()
{
  // always close Minim audio classes when you are done with them
  in.close();
  minim.stop();
  
  super.stop();
}
