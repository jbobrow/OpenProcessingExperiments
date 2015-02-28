

/*
    PLAY SOUND FILE TUTORIAL - press 'p' to play 's' to stop
    place sound files in a folder called "data" in your sketch folder
 */

import ddf.minim.*; // import the minim sound library in Processing
import ddf.minim.analysis.*;

Minim bob; // declare Minim variable called bob
AudioPlayer sue; // declare AudioPlayer called sue
int buffer = 1024; // buffer size in samples for file playback
FFT fft;

void setup()
{
  size(700,700);
  bob = new Minim(this); // create a Minim object
  sue = bob.loadFile("What is love.wav", buffer); // load a file to buffer
  fft = new FFT(sue.bufferSize(), sue.sampleRate());
}

void draw()
{
      float volume = (sue.left.get(1) + sue.right.get(1)); // get vol. for both channels
      volume = ((volume+2)*64); // scale volume to between 0 and 255
      background(50, 70, 200);
      smooth();
      
      beginShape();
      fill(256, 256, 230);
      vertex(240, 130);
      bezierVertex(240, 130, 195, 200, 190, 210);
      bezierVertex(190, 210, 180, 200, 170, 210);
      bezierVertex(170, 210, 160, 230, 160, 250);
      bezierVertex(160, 250, 160, 270, 190, 290);
      bezierVertex(190, 290, 200, 400, 250, 500);
      bezierVertex(250, 500, 280, 540, 340, 540);
      
      bezierVertex(340, 540, 400, 540, 430, 500);
      bezierVertex(430, 500, 480, 400, 490, 290);
      bezierVertex(490, 290, 520, 270, 520, 250);
      bezierVertex(520, 250, 520, 230, 510, 210);
      bezierVertex(510, 210, 500, 200, 490, 210);
      bezierVertex(490, 210, 485, 200, 410, 130);
      
      strokeWeight(5);
      //point(310, 530);
      endShape();
      
      beginShape(); // neck
      fill(256, 256, 230);
      vertex(295, 530);
      bezierVertex(295, 530, 295, 520, 295, 570);
      bezierVertex(295, 570, 340, 630, 385, 570);
      bezierVertex(385, 570, 385, 530, 385, 533);
      bezierVertex(385, 533, 340, 544, 295, 533);
      endShape();
      
      
      //ellipse(350, 365, 400, 500); // face
      fill(256, 256, 256);
      strokeWeight(5);
      ellipse(390, 250, 95, 120); //eye
      ellipse(290, 250, 95, 120); //eye
      fill(256, 256, 256);
      strokeWeight(volume/3);
      stroke(0);
      point(390,270);
      point(290, 270);
      
      float x;
          
     if (volume > 130)
    {
      x = volume/2;
    }
    
    else
    {
      x = 2*(volume-130);
    }
    
    fft.forward(sue.mix);

      float f;
      f = fft.getFreq(20)*2;
      
      if(f>50)
      {
        f=50;
      }
      
      
      beginShape();
      noFill();
      strokeWeight(5);
      vertex(280, 440);
      bezierVertex(280, 440, 350, 450+f, 400, 440); // mouth
      endShape();
      
      beginShape();
      noFill();
      strokeWeight(5);
      vertex(280, 440);
      bezierVertex(280, 440, 350, 450-f, 400, 440); // mouth
      endShape();
      
     
      
      
      stroke(165, 40, 40);
      for (int i = 0; i < fft.specSize(); i++)
      {
        triangle(110+(i/2+200)/1.5, 60+100/1.5, 110+(i+100)/1.5, 60+(200 - fft.getFreq(i))/1.5, 110+350/1.5, 60+110/1.5);  
      }
      
  
        beginShape();//shoulders
        stroke(0);
        fill(250, 250, 10);
        vertex(295, 570);
        bezierVertex(295, 570, 340, 630, 385, 570);
        bezierVertex(385, 570, 500, 560-x, 700, 570-x);//corner
        bezierVertex(700, 570-x, 700, 600-x, 700, 600-x);
        bezierVertex(700, 600-x, 550, 600-x, 530, 700);
        bezierVertex(530, 700, 150, 700, 150, 700);
        bezierVertex(150, 700, 140, 600+x, 0, 600+x);//corner
        bezierVertex(0, 600+x, 0, 600+x, 0, 570+x);
        bezierVertex(0, 570+x, 200, 560+x, 295, 570);
        endShape();  
  
}

void keyPressed()
{
  if (key == 'p')
  {
    sue.play(); // play an audio file defined by variable sue
    sue.loop(10); // specify # of loops or leave blank for infinite looping
  }
  if (key == 's')
  {
    sue.pause(); // pause playback of sue
  }
}

void stop()
{
  sue.close(); // close audio I/O
  bob.stop(); // stop the Minim object 
  super.stop();
}

