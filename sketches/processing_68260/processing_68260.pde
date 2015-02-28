
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
BeatDetect beat;
AudioInput in;


float kickSize, snareSize, hatSize;



void setup(){
    size(1280, 720);
    noStroke();
    background(250);
    minim = new Minim(this);
    in = minim.getLineIn( Minim.MONO, 500 );
    beat = new BeatDetect();
    beat.setSensitivity(8);


}

void draw(){
    fill(0, 10);
    rect(0, 0, width, height);
    beat.detect(in.mix);
    if (beat.isOnset())
    {
      fill(random(255),random(0),random(250));
      rect(random(1290),random(720),random(10),random(10));
      rect(random(1290),random(720),random(10),random(10));
      rect(random(1290),random(720),random(10),random(10));
      rect(random(1290),random(720),random(10),random(10));
      fill(random(50),random(0),random(250));
      rect(random(1290),random(720),random(10),random(10));
      fill(random(250),random(0),random(200));
      rect(random(1290),random(720),random(10),random(10));
      fill(random(25),random(0),random(200));
      rect(random(1290),random(720),random(20),random(20));
      rect(random(1290),random(720),random(20),random(20));
      rect(random(1290),random(720),random(20),random(20));
      rect(random(1290),random(720),random(20),random(20));
      rect(random(1290),random(720),random(20),random(20));
      rect(random(1290),random(720),random(20),random(20));
      fill(random(255),random(0),random(200));
      rect(random(1290),random(720),random(20),random(20));
      fill(random(50),random(0),random(200));
      rect(random(1290),random(720),random(20),random(20));
      fill(random(50),random(0),random(250));
      rect(random(1290),random(720),random(20),random(20));
      fill(random(250),random(0),random(250));
      rect(random(1290),random(720),random(20),random(20));
      fill(random(50),random(0),random(250));
      rect(random(1290),random(720),random(20),random(20));
      rect(random(1290),random(720),random(20),random(20));
      rect(random(1290),random(720),random(20),random(20));
      rect(random(1290),random(720),random(20),random(20));
      rect(random(1290),random(720),random(20),random(20));
      rect(random(1290),random(720),random(20),random(20));
      fill(random(250),random(0),random(50));
      rect(random(1290),random(720),random(20),random(20));
      fill(random(50),random(0),random(250));
      rect(random(1290),random(720),random(20),random(20));
      fill(random(50),random(0),random(250));
      rect(random(1290),random(720),random(20),random(20));
      fill(random(25),random(0),random(200));
      rect(random(1290),random(720),random(20),random(20));
      fill(random(255),random(0),random(200));
      rect(random(1290),random(720),random(20),random(20));
      fill(random(50),random(0),random(250));
      rect(random(1290),random(720),random(20),random(20));
      fill(random(250),random(0),random(50));
      rect(random(1290),random(720),random(20),random(20));
      fill(random(255),random(0),random(200));
      rect(random(1290),random(720),random(20),random(20));
       fill(random(50),random(0),random(250));
      rect(random(1290),random(720),random(20),random(20));
      rect(random(1290),random(720),random(20),random(20));
      rect(random(1290),random(720),random(20),random(20));
      rect(random(1290),random(720),random(20),random(20));
      
      
     
      
      ;
    }
       
        
    }


void stop(){

    minim.stop();
    super.stop();
}
