
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;



private PImage room, mask;
private Minim minim;
private AudioSnippet ticktock, scream;
private PFont font;

private int stage = 0;
private long time;
private long delayTime;

private String[] txtStage0, txtStage1, txtStageCancel;

void setup(){
  size(500,400);
  minim = new Minim(this);
  ticktock = minim.loadSnippet("tick-tock.wav");
  scream = minim.loadSnippet("spook.wav");

  font = createFont("Sans Serif", 16, true);

  room = loadImage("room.jpg");
  mask = loadImage("mask.jpg");
  textFont(font);

  txtStage0 = loadStrings("stage0.txt");
  txtStage1 = loadStrings("stage1.txt");
  txtStageCancel = loadStrings("stageCancel.txt");
}

void draw(){
  if(stage >= 999)
    background(mask);
  else
    background(room);

  switch(stage){
  case 0:	// Opening screen
    ticktock.pause();
    drawStageText(txtStage0, 0.25f);
    break;
  case 1: // Start the tick-tock and get ready
    drawStageText(txtStage1, 0.25f);
    break;
  case 2: // Waiting for it
    if(millis() - time > delayTime){
      stage = 999;
    }
    break;
  case 9: // Chicken screen
    drawStageText(txtStageCancel, 0.4f);
    break;
  case 999: // SCREAM........
    scream.play();
    ticktock.pause();
    stage = 1000;
    time = millis();
    break;
  case 1000: // Pause for 20 seconds then restart
    if(millis() - time > 20000)
      stage = 0;
    break;
  }
}

void keyPressed(){
  switch(stage){
  case 0:
    if(key == 'x' || key == 'X'){
      ticktock.pause();
      stage = 9;
    }
    else if(key == '1'){
      ticktock.loop();
      stage = 1;
    }
    break;
  case 1:
    if(key == 'x' || key == 'X'){
      ticktock.pause();
      stage = 9;
    }
    else if(key == '2'){
      stage = 2;
      delayTime = (long) random(8000, 11000);
      time = millis();
    }
    break;
  case 9:
    if(key == 'r' || key == 'R')
      stage = 0;
    break;
  }
}

public void drawStageText(String[] words, float hfactor){
  rectMode(CENTER);
  textFont(font);
  fill(0,0,32, 140);
  rect(width/2, height/2, 0.95f*width, 0.95f*height );
  fill(255);
  textAlign(CENTER);
  for(int i = 0; i < words.length; i++){
    text(words[i],width/2, hfactor * height + 24 * i, 0.9f*width, 24);
  }
}

public void stop(){
  ticktock.close();
  scream.close();
  minim.stop();
  super.stop();
}



