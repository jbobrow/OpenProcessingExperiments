
PFont fontA;
PImage bg;
int a;

import ddf.minim.*;
AudioPlayer player;
Minim minim;



void setup () {
  size (640, 360, P3D);
  smooth ();
  imageMode (CENTER);
  rectMode (CENTER);
  ellipseMode (CENTER);
   bg = loadImage("galaxy.jpg");
   fontA = loadFont ("futura.vlw");
   textFont (fontA, 15);   
   
   minim = new Minim(this);
player = minim.loadFile("infinity.mp3");
player.play();
player.loop();
 
}
void draw () {
  
  float r = random (0, 255);
  tint (r, r); 
  image (bg, width/2, height/2);
 
  
  if (mousePressed) {
  tint (255, 100);
  stroke (255);
  float w = random (1, 5);
  strokeWeight (w);
  line (pmouseX, pmouseY, mouseX, mouseY, 25, 25);
  filter(BLUR,.9);
  
       minim = new Minim(this);
player = minim.loadFile("laser.mp3");
player.play();
player.setGain (-25);

  
  
 }

    if (keyPressed) {
      if (key == '1') {
        background(bg);
           minim = new Minim(this);
player = minim.loadFile("blast.mp3");
player.play();
      }     
     }
    
     if (key == '2') {
       
       float g = random (100, 500);

       noStroke();
       fill (255, 100);
       rect (100, 200, 50, 50, 250, 250);
        fill (255, 100);
       rect (400, 123, 70, 70, 270, 270);
        fill (255, 100);
       rect (375, 144, 40, 40, 240, 240);
        fill (255, 100);
       rect (500, 200, 10, 10, 210, 210);
        fill (255, 100);
       rect (510, 210, 10, 10, 210, 210);
       fill (255, 100);
       rect (700, 325, 20, 20, 210, 210);
       fill (255, 100);
       rect (600, 300, 30, 30, 210, 210);
       fill (255, 100);
       rect (400, 111, 10, 10, 210, 210);
       fill (255, 100);
       rect (300, 222, 10, 10, 210, 210);
       fill (255, 150, 0, 100);
       rect (100, 50, g, g, 100, 100);
       fill (255, 100);
       rect (20, 100, 50, 50, 250, 250);
      

       
     }
     
      if (key == '3') {

        noStroke ();
       fill (255, 100);
       ellipse (400, 200, 30, 30);
        fill (255, 100);
       ellipse (100, 23, 30, 30);
        fill (255, 100);
       ellipse (275, 44, 30, 30);
        fill (255, 100);
       ellipse (50, 250, 10, 10);
        fill (255, 100);
       ellipse (210, 110, 10, 10);
       fill (255, 100);
       ellipse (200, 225, 20, 20);
       fill (255, 100);
       ellipse (300, 50, 30, 30);
       fill (255, 100);
       ellipse (100, 151, 10, 10);
       fill (255, 100);
       ellipse (200, 100, 10, 10);
       fill (255, 100);
       ellipse (200, 120, 20, 20);
       fill (255, 100);
       ellipse (100, 150, 20, 20);
       fill (255, 100);
       ellipse (200, 20, 50, 50);


      }
       
       if (keyPressed) {
         if (key == '4') {
              float w = random (20, 30);
              strokeWeight (32);
         stroke (255);
  rect (pmouseX, pmouseY, 100, 100, 250, 250);
  filter(BLUR,.9);
         }
                minim = new Minim(this);
player = minim.loadFile("laser.mp3");
player.play();
player.setGain (-25);
       
     }
     
beginShape ();
fill (255, 175, 0, 50);
stroke (255, 50);
vertex (200, 360);
vertex (50, 50);
vertex (0, 50);
vertex (0, 100);
vertex (0, 360);
endShape (CLOSE);

beginShape ();
fill (255, 175, 0, 50);
stroke (255, 50);
vertex (440, 360);
vertex (590, 50);
vertex (640, 50);
vertex (640, 100);
vertex (640, 360);
endShape (CLOSE);

beginShape ();
fill (255, 100, 0, 25);
stroke (255, 50);
vertex (0, 300);
vertex (320, 330);
vertex (640, 300);
vertex (640, 360);
vertex (0, 360);
endShape (CLOSE);

fill (255, 200);
text ("Its time to create the new universe", 60, 50);
text ("mouse // plot star constellations", 60, 240);
text ("1 // erase current blueprint", 60, 260); 
text ("2 // create interstellar warpholes", 60, 280);
text ("3 // wireframe the new planets", 60, 300);
text ("4 // plot destination for new galaxy", 60, 320);
     
     }

