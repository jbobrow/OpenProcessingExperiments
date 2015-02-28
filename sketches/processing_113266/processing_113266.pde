
//reference: www.creativecoding.org/lesson/topics/audio/sound-in-processing

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioInput lineIn;
float vol;
boolean awake=false;

float x=0;
float y =20;
//PImage img;
//int s_time =0;
//int time = 0;

ArrayList arL;

void setup()
{
  size(250, 500);
  smooth();
  frameRate(60);

  minim = new Minim(this);
  // minim.debugOn();

  lineIn = minim.getLineIn(Minim.STEREO, 512);
  // img = loadImage("hey.gif");

  textFont(createFont("SanSerif", 16));
  textAlign(CENTER);
  
  //arL = new ArrayList();
}

void draw()
{
  vol = lineIn.mix.level () * width;
  background(0, 0, 255);
  stroke(255);
  fill(252, 221, 173); //skin

  // draw the waveforms
  for (int i = 0; i < lineIn.bufferSize() - 1; i++)
  {
    line(i+20, 50 + lineIn.left.get(i)*50, i+1-20, 50 + lineIn.left.get(i+1)*50);
    line(i+20, 130 + lineIn.right.get(i)*50, i+1-20, 130 + lineIn.right.get(i+1)*50);
  }
//  
//  arL.add(vol);
//  
//  println(arL);
//  
 // for(int i=0; i < arL.size(); i++)
 //   line(i, 200 + arL.get(i)*50, i+1, 200+arL.get(i+1)*50);

    noStroke();
    ellipse (width/2, height/4, 80, 90);
    stroke(0);
    line(width/2-30, height/5+8, width/2-20, height/5+8);
    line(width/2+30, height/5+8, width/2+20, height/5+8);
    stroke(247, 196, 117);
    strokeWeight(vol);
    line(width/2, height/4-5, width/2, height/4);
    strokeWeight(1);
    fill(10);
    ellipse (width/2-vol/2, height/4+vol/4, vol, vol);
    ellipse (width/2+vol/2, height/4+vol/4, vol, vol);

    noStroke();
    fill(255, 0, 0);
    ellipse(width/2, height/3-8+vol/2, 10, 20);


    fill(0, 0, 100);
    noStroke();
    rect(0, height/3+10, width, height);

    fill(255);
    textSize(16+vol);
    
    if(vol>70)
      awake = true;
      
    if(awake){
      wakeUp();
    }
      
}

void wakeUp(){
  
  vol = lineIn.mix.level () * width;
  background(0, 0, 255);
  stroke(255);
  fill(252, 221, 173); //skin

  // draw the waveforms
  for (int i = 0; i < lineIn.bufferSize() - 1; i++)
  {
    line(i+20, 50 + lineIn.left.get(i)*50, i+1-20, 50 + lineIn.left.get(i+1)*50);
    line(i+20, 130 + lineIn.right.get(i)*50, i+1-20, 130 + lineIn.right.get(i+1)*50);
  }
  
  noStroke();
    ellipse (width/2, height/4, 80, 90);
    fill(255);//white eye
    ellipse(width/2-20,height/5+8,20,20);
    ellipse(width/2+20,height/5+8,20,20);
    fill(0); // pupil
    ellipse(width/2-20,height/5+8,10,10);
    ellipse(width/2+20,height/5+8,10,10);
    stroke(247, 196, 117);
    strokeWeight(5);
    line(width/2, height/4-5, width/2, height/4);
    
    noStroke();
    fill(255, 0, 0);
    ellipse(width/2, height/3-8, 10, 20);


    fill(200, 0, 0);
    noStroke();
    rect(0, height/3+20, width, height);

    fill(255);
    textSize(32);
    text("Wake UP !!!",100,250);
    textSize(15);
    fill(0);
    text("Noisy Level you made : "+ (int)vol, 127,300);
    fill(0);
    textSize(10);
    text("direction : Change your position to the side." , 120,330);
    
    
}

void stop()
{
  // always close Minim audio classes when you are finished with them
  lineIn.close();
  // always stop Minim before exiting
  minim.stop();
  // this closes the sketch
  super.stop();
}



