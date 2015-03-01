
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

AudioPlayer player;
Minim minim;
FFT fftLog;

PImage fade;
boolean playing = true;
boolean moving;
boolean test;

int currentTime = 0;
int previousTime = 0;
int wait = 1000;

int playhead;
float playheadScale;
float playheadDragged;
float pPlayheadDragged;
int playheadMove;
int playheadPressed;
float pPlayheadPressed;
int newPlayheadPressed;
float currentMouseXPos;


int bright = 0;
float mousePos;
boolean mouseDrag;
boolean playheadCirclePress;
boolean playheadCircleDrag;

void setup(){
  size(640, 400);
  background(0);
  minim = new Minim(this);
  player = minim.loadFile("piano.wav", 1024);
  fftLog = new FFT(player.bufferSize(), player.sampleRate());
  fftLog.logAverages(22, 16);
  //player.loop();
  rectMode(CORNERS);
  ellipseMode(RADIUS);
  background(0);
  fade = get(0, -10, width, height);
  mousePos = width/4 + 28;
}

void draw(){
  
  currentTime = millis();
  
  
    //***FFT & VISUALIZATION***
  
  background(0);
  
  tint(255, 255, 255, 255);
  image(fade, 0, -8);
  noTint();
  
  fftLog.forward(player.mix);
  int drops = int(width/fftLog.avgSize()*1.3);
  
  float maxValue=0; //or int, if it's an array of ints
  int position=-1;
  
  for(int i = 0; i < fftLog.avgSize()/3*2; i ++)
  {    
    if(fftLog.getAvg(i)>maxValue) // check to see if current value is highest so far
        {
          position=i; // if so, store what number it is
          maxValue=fftLog.getAvg(i); // and what its value is
        }      
    if(i == position){
      stroke(255, 0, 0);
    }
    else{
      stroke(255);
    }
    strokeWeight(int(fftLog.getAvg(i))/10);
    point(i*drops, 0);   
  }
  
  fade = get(0, -10, width, height);                              

    //***PLAYBAR***
  
  if((pmouseX - mouseX) == 0 && (pmouseY - mouseY) == 0){
    moving = false;
  } 
    
  //if(mouseX > width/4 && mouseX < width/4*3 && mouseY > height - 30 && mouseY < height - 5)
  if(mouseX > 0 && mouseY > 0)
  {
    if(currentTime-previousTime>wait){
      if(mouseX < width/4 || mouseX > width/4*3 || mouseY < height - 30 || mouseY > height - 10){
        if(!mousePressed){
          bright-=3;
        }
      }
    }
    else{bright=255;}
    fill(128, 128, 128, bright);
    strokeWeight(1);
    stroke(30, 30, 30, bright);
    rect(width/4, height - 30, width/4*3, height - 10); 
    stroke(60, 60, 60, bright);  
    line(width/4+20, height - 30, width/4+20, height - 10);   
    stroke(20, 20, 20, bright);
    strokeWeight(2);
    line(width/4 + 25, height - 20, width/4*3 - 5, height - 20);
    
    stroke(30, 30, 30, bright);
    strokeWeight(1);
    
    playhead = player.position();
    playheadScale = map(player.position(), 0, player.length(), width/4 + 28, width/4*3 - 8);

//PLAYBAR CIRCLE    
    if(playheadCircleDrag || playheadCirclePress){
      mousePos = map(mouseX, 0, width, 0, width);
      mousePos = constrain(mousePos, width/4 + 28, width/4*3 - 8);
      ellipse(mousePos, height - 20, 5, 5);
      
      playheadDragged = map(mouseX, width/4 + 28, width/4*3 - 8, 0, player.length());
      pPlayheadDragged = map(pmouseX, width/4 + 28, width/4*3 - 8, 0, player.length());
      
      if(playheadCircleDrag){
        playheadMove = int((playheadDragged - pPlayheadDragged) - playhead);
      }
      if(playheadCirclePress){
        playheadMove = int((map(mouseX, width/4 + 28, width/4*3 - 8, 0, player.length()))-playhead);
      }
        
      player.skip(playheadMove);
    }  
    else{
      ellipse(playheadScale, height - 20, 5, 5);
    }                     

//PAUSE/PLAY BUTTON    
    noStroke();
    if(!playing){
      fill(0);
      triangle(width/4 + 5, height - 25, width/4 + 5, height - 15, width/4 + 15, height - 20);
    }
    else{
      fill(0);
      rect(width/4 + 4, height - 25, width/4 + 9, height - 15);
      rect(width/4 + 11, height - 25, width/4 + 16, height - 15);
    }    
  }
  
  if(playing){player.play();}
  else{player.pause();}
  
  if(player.position() == player.length()){
    player.rewind();
    player.pause();
    playing = !playing;
  }
  
}

void mousePressed(){
  if(mouseX > width/4 && mouseX < width/4 + 20 && mouseY > height - 30 && mouseY < height - 10){
    playing = !playing;
  }
  if(mouseX > width/4 + 28 && mouseX < width/4*3 - 8 && mouseY < height-10 && mouseY > height-20){
    playheadCirclePress = true;
  }
  if(mouseX > playheadScale - 5 && mouseX < playheadScale + 5){
    test = true;
  }
}

void mouseDragged(){
  mouseDrag = true;
  if(mouseX > width/4 + 28 && mouseX < width/4*3 - 8 && mouseY < height-10 && mouseY > height-20){
    playheadCircleDrag = true;
  }
}

void mouseReleased(){
  mouseDrag = false;
  playheadCirclePress = false;
  playheadCircleDrag = false;
}

void mouseMoved(){
  moving = true;
  previousTime = currentTime;
}

void stop()
{
  player.close();
  minim.stop();
   
  super.stop();
}



