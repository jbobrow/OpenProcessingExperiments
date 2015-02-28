

PImage bg;
int a;

import ddf.minim.*;
AudioPlayer player;
Minim minim;



void setup () {
  size (640, 360);
  smooth ();
   bg = loadImage("ricepaper.jpg");
   background(bg);
   
   minim = new Minim(this);
player = minim.loadFile("taiko.mp3");
player.play();
player.loop();
 
}
void draw () {
  
  if (mousePressed) {
  stroke (0);
  float r = random (12, 30);
  strokeWeight (r);
  line (pmouseX, pmouseY, mouseX, mouseY);
  filter(BLUR,.9);
  
       minim = new Minim(this);
player = minim.loadFile("sword.wav");
player.play();
player.setGain (-25);

  
  
 }

    if (keyPressed) {
      if (key == '1') {
        background(bg);
           minim = new Minim(this);
player = minim.loadFile("whoosh.mp3");
player.play();
      }     
     }
    
     if (key == '2') {

       fill (0);
       ellipse (100, 200, 50, 50);
        fill (0);
       ellipse (400, 123, 70, 70);
        fill (0);
       ellipse (375, 144, 40, 40);
        fill (0);
       ellipse (500, 200, 10, 10);
        fill (0);
       ellipse (510, 210, 10, 10);
       fill (0);
       ellipse (700, 325, 20, 20);
       fill (0);
       ellipse (600, 300, 30, 30);
       fill (0);
       ellipse (400, 111, 10, 10);
       fill (0);
       ellipse (300, 222, 10, 10);
       fill (0);
       ellipse (10, 20, 300, 300);
       fill (0);
       ellipse (100, 50, 200, 200);
       fill (0);
       ellipse (20, 100, 50, 50);
      

       
     }
     
      if (key == '3') {

        noStroke ();
       fill (255);
       ellipse (600, 200, 50, 50);
        fill (255);
       ellipse (100, 23, 70, 70);
        fill (255);
       ellipse (675, 44, 40, 40);
        fill (255);
       ellipse (50, 250, 10, 10);
        fill (255);
       ellipse (310, 110, 10, 10);
       fill (255);
       ellipse (200, 225, 20, 20);
       fill (255);
       ellipse (700, 50, 30, 30);
       fill (255);
       ellipse (500, 151, 10, 10);
       fill (255);
       ellipse (300, 100, 10, 10);
       fill (255);
       ellipse (300, 120, 150, 150);
       fill (255);
       ellipse (700, 150, 200, 200);
       fill (255);
       ellipse (200, 20, 50, 50);


      }
       
       if (keyPressed) {
         if (key == '4') {
              float r = random (20, 30);
              strokeWeight (32);
         stroke (255);
  line (pmouseX, pmouseY, mouseX, mouseY);
  filter(BLUR,.9);
         }
                minim = new Minim(this);
player = minim.loadFile("sword.wav");
player.play();
player.setGain (-25);
       
     }
     
            if (keyPressed) {
         if (key == '5') {
              float r = random (20, 30);
              strokeWeight (32);
         stroke (0);
  line (pmouseX, pmouseY, mouseX, mouseY);
  filter(BLUR,.9);

         }
                minim = new Minim(this);
player = minim.loadFile("sword.wav");
player.play();
player.setGain (-25);
     }
     
     }

