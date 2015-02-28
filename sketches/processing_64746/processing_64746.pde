

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer track;
BeatDetect beat;

float diametro=60;
float kickIncremento;
float snareIncremento;
float hatIncremento;
float x,y;

void setup()
{
   size(600, 400);
   smooth(); 
   minim = new Minim(this);
   track = minim.loadFile("ALEXANDRA STAN - Mr. Saxobeat.mp3",2048); 
   track.play();  
   beat = new BeatDetect(track.bufferSize(), track.sampleRate());
   beat.setSensitivity(1);  
}

void draw()
{
    colorMode(HSB, width);
    beat.detect(track.mix);
    background(0);
    fill(0,0,width);
    noStroke();
    text("Riparte la canzone cliccando sul quadratino.",20,20);
    text("ALEXANDRA STAN - Mr. Saxobeat.mp3",40,60);
    rect(20,50,10,10);
    
    text("Kick Beat.",width/4-30,height/2+80);
    text("Snare Beat.",width/2-30,height/2+80);
    text("Hat Beat.",width/4+width/2-20,height/2+80);
    
    kickIncremento=0;
    snareIncremento=0;
    hatIncremento=0;
    
    if(beat.isKick()){
      kickIncremento=kickIncremento+40;
    }else{kickIncremento=0;}
    
    if(beat.isSnare()){
      snareIncremento=snareIncremento+40;
    }else{snareIncremento=0;}
    
    if(beat.isHat()){
      hatIncremento=hatIncremento+40;
    }else{hatIncremento=0;}
    
    x=mouseX;
    y=mouseY;
    
    color c=color(x,width,width);
    fill(c);
     
    ellipse (width/4,height/2,diametro+kickIncremento,diametro+kickIncremento);
    ellipse (width/2,height/2,diametro+snareIncremento,diametro+snareIncremento);
    ellipse (width/2+width/4,height/2,diametro+hatIncremento,diametro+hatIncremento);
        
    if((mousePressed==true) && (mouseX<30) && (mouseX>20) && (mouseY>50)&&(mouseY<60)){
      track.rewind();
    }
    
}
void stop()
{
   track.close();
   minim.stop();
   super.stop();
}

