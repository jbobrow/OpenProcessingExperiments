


import ddf.minim.*; // import the minim sound library in Processing
import ddf.minim.analysis.*;

Minim bob; // declare Minim variable called bob
AudioPlayer sue; // declare AudioPlayer called sue
int buffer = 1024; // buffer size in samples for file playback
FFT fft;
int s;


void setup()
{
  size(700,700);
  bob = new Minim(this); // create a Minim object
  sue = bob.loadFile("Beat1.mp3", buffer); // load a file to buffer
  fft = new FFT(sue.bufferSize(), sue.sampleRate());
}



void draw()
{
   float volume = (sue.left.get(1) + sue.right.get(1)); // get vol. for both channels
  volume = ((volume+2)*64); // scale volume to between 0 and 255
   fft.forward(sue.mix);
   
  float x;
  x = random(0,2);
  background(0);
  strokeWeight(volume/3);
 // point(130, 130);
  
  
  stroke(100, 200, 30);
  
  for (int i = 0; i < fft.specSize(); i++)
      {
        
        float a = fft.getFreq(i);
        
         noStroke();
        
         fill(250-30*fft.getFreq(i), 180 - 20*fft.getFreq(i), 30+10*fft.getFreq(i));
        rect(470, 403, 100, 300);
        fill(180-30*fft.getFreq(i), 10+ 20*fft.getFreq(i), 100+10*fft.getFreq(i));
         rect(130, 403, 100, 303);
         fill(30*fft.getFreq(i), 250 - 20*fft.getFreq(i), 30+10*fft.getFreq(i));
         rect(300, 303, 100, 403);
        noFill();
         stroke(256, 256, 256);
        strokeWeight(3);
        
        //println(fft.getFreq(i));
      
          line(520, 275, 470, 250-volume/3); //R arms
          line(520, 275, 570, 250-volume/3);
          
            //arms
  line(180, 270, 130, 250-volume/3); //L
  line(180, 270, 230, 250-volume/3);
       
        ellipse(520, 202, 70, 70); //R
     
      }
  
if (mouseX >470 && mouseX < 570 && mouseY< 400 && mouseY>150)
        {
          PFont font;
          font = loadFont("EurostileBold-16.vlw");
          textFont(font, 16);
        text("DANCE!", 550, 150);
        stroke(256, 256, 256);
          ellipse(520, 220, 3, 3);
           ellipse(510, 196, 5, 5);
        ellipse(530, 196, 5, 5);
                ellipse(580, 145, 85, 40);
        ellipse(560, 180, 20, 20);
          
          noFill();
          strokeWeight(3);
        line(520, 320, 520, 240);
        strokeWeight(2);
       
        }
        
        else
        {
        
        beginShape();
        vertex(506, 220);
        bezierVertex(506, 220, 520, 230, 534, 220);
        endShape();
        ellipse(510, 196, 5, 5);
        ellipse(530, 196, 5, 5);
        line(520, 320, 520, 240);
        }



  //rect(470, 403, 100, 303);
  strokeWeight(5);
  line(180, 320, 180, 240);
  line(350, 220, 350, 140);
  noFill();
  strokeWeight(3);
  
  if (mouseX >130 && mouseX < 230 && mouseY< 400 && mouseY > 168)
  {
    PFont font;
          font = loadFont("EurostileBold-16.vlw");
  ellipse(180, 202, 70, 70); //Lface
  ellipse(170, 196, 5, 5);
  ellipse(190, 196, 5, 5);
  line(166, 220, 194, 220);
         strokeWeight(2);
        stroke(256, 256, 256);
        ellipse(123, 145, 85, 40);
        ellipse(120, 184, 20, 20);
        
        textFont(font, 16);
        text("DANCE!", 90, 150);
  }
  else
  {
     ellipse(180, 202, 70, 70); //Lface
  ellipse(170, 196, 5, 5);
  ellipse(190, 196, 5, 5);
  beginShape();
  vertex(166, 220);
  bezierVertex(166, 220, 180, 230, 194, 220);
  endShape();
  }
  
  if (mouseX >130 && mouseX < 230 && mouseY< 400 && mouseY > 168 && mousePressed == true)
  {
  
  // light rays
 int b;
  stroke(256, 256, 256, 255-volume);
 for (b = 0; b<50; b++)
  {
  line(210, 0, (3*b)+volume, 90 + volume);
 }
  
  }
  
   int b;
  stroke(256, 256, 256, 200-volume);
  strokeWeight(2);
 for (b = 0; b<40; b++)
  {
  line(350, 0, 150-(3*b)+2*volume, 90 + volume);
  line(350, 0, 350-(3*b)-volume, 50+volume);
  line(350, 0, 100-(3*b)+4*volume, 90 +volume);
  
 }
  
  
  strokeWeight(3);
  stroke(256, 256, 256);
  //legs
  line(180, 320, 135, 400); // L
  line(180, 320, 225, 400);
  line(135, 400, 130, 400); //LF
  line(225, 400, 230, 400); //RF
  
  line(520, 320, 475, 400); // R
  line(520, 320, 565, 400);
  line(475, 400, 470, 400); //LF
  line(565, 400, 570, 400); //LF
  
  if(mouseX > 300 && mouseX < 400 && mouseY > 50 && mouseY < 300 && mousePressed == true)
  {
    sue.play(); // play an audio file defined by variable sue
    sue.loop(10); // specify # of loops or leave blank for infinite looping
  //println(volume);
   s = 9;
  }
  
  else if (mousePressed == true)
  {
    sue.pause(); // pause playback of sue
  }
  
    if(mouseX > 300 && mouseX < 400 && mouseY > 50 && mouseY < 300)
    {
        PFont font;
          font = loadFont("EurostileBold-16.vlw");
      strokeWeight(2);
      textFont(font, 16);
        text("click me!!", 391, 45);
      
        
        ellipse(420, 40, 85, 40);
        ellipse(400, 75, 20, 20);
     
        
        ellipse(350, 102, 70, 70); //M
        ellipse(340, 96, 9, 9);
        ellipse(360, 96, 9, 9);
      
      beginShape();
  vertex(330, 114);
  bezierVertex(330, 114, 350, 135, 370, 114);
  endShape();
    
  }
  
  else{
  
    beginShape();
  vertex(336, 120);
  bezierVertex(336, 120, 350, 130, 364, 120);
  endShape();
  }
  
  if (volume > 130 && x > 1) // left leg up
  {
    line(350, 220, 300, 280);
    line(350, 220, 395, 300);
    line(300, 280, 295, 275);
    
     ellipse(350, 102, 70, 70); //M
  ellipse(340, 96, 5, 5);
  ellipse(360, 96, 5, 5);
 
      //arms
    line(350, 165, 300, 145);
    line(350, 165, 400, 145);
    
}
  
  else if (volume > 130 && x < 1) // right leg up
  {
    line(350, 220, 405, 280);
    line(350, 220, 305, 300);
    line(405, 280, 410, 275);
    
    //arms
    line(350, 165, 300, 145);
    line(350, 165, 400, 145);
    
      ellipse(350, 102, 70, 70); //M
  ellipse(340, 96, 5, 5);
  ellipse(360, 96, 5, 5);
 
  }
  
  
  else
  {
    line(350, 220, 305, 300); // M
    line(350, 220, 395, 300);
    line(305, 300, 300, 300); //LF
    line(395, 300, 400, 300); //RF
    
    //arms
    line(350, 170, 300, 150);
    line(350, 170, 400, 150);
    
      ellipse(350, 102, 70, 70); //M
  ellipse(340, 96, 5, 5);
  ellipse(360, 96, 5, 5);

  }  
  

  
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
  sue.close(); // close audio I/Os
  bob.stop(); // stop the Minim object 
  super.stop();
}


