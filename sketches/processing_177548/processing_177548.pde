
/* Coursera - Introduction to Computational Arts
 * Final Project.
 * This sketch displays a dark lamp with a sinister ambiant light,
 * a particles field hovering around it and a strange pattern 
 */

PImage darkLamp;
int W = 1280;
int H = 720;
int darkenLevel = 0;

void setup() {
   size(W, H);
   darkLamp = loadImage("darklamp.jpg");
}

import java.util.Random;
Random random = new Random();

/* Particles are always visible, hover around the mouse, and become more
 * intense as the light gets more intense */
void drawParticles(){
 for (int i = 0; i < 25 * darkenLevel; i++){
   strokeWeight(random(2));
   float noiseVal = noise(mouseX, mouseY);
   stroke(noiseVal * 255);
   float particleX = (float)random.nextGaussian()  * 100 - 100;
   float particleY = (float)random.nextGaussian() * 100 - 100;
   point(mouseX + particleX, mouseY + particleY);
 } 
}

/* The pattern that appears randomly and when the user clicks on it */
/* Basically, a series of ellipses, with vertical symmetry.
 * The dark pattern is only shown for a single frame 
 */
void renewDarkPattern(){
   for (int i = 0; i < 70; i++) {
       float circleX = (float)random.nextGaussian() * 80 - 70;
       float circleY = (float)random.nextGaussian() * 80;
       float sizeX = (float)random.nextGaussian() * 40 + 20;
       // We don't want "random" ellipses, so we constrain sizeY around
       // sizeX
       float sizeY = sizeX + (float)random.nextGaussian() * 10 - 10;
   
       //darkPattern.clear();
       //darkPattern.beginDraw();   
      noStroke();
      fill(#331111, 150 + i);
      
      /* Circle on the left */
      ellipse(mouseX - circleX, circleY + H/2, sizeX, sizeY);
      /* And on the right */
      ellipse(mouseX + circleX, circleY + H/2, sizeX, sizeY);
      //darkPattern.endDraw();
   }
}


/* Usage text, how to interact ? Shown for the 355 first frames, with
 * decreasing opacity */
int frame = 0;
public void drawUsage() {
  textSize(30);                      // set size of text
  
  if (frame < 100) {
    fill(#441111);
  } else {
     fill(#441111, 255 - (frame-100)); 
  }
  text("What is going on in this so dark place ?\n  Click and move to see but beware... ",
       400, 600);
}



void draw(){
  /*  The lamp, goes up in intensity */
  tint(10 * darkenLevel, 10*darkenLevel, 10*darkenLevel);
  image(darkLamp, 0, 0, W, H); 
  drawParticles();
  
  /* Count frames */
  ++frame;
  if (frame < 356) {
     drawUsage(); 
  }
  
  /* The dark pattern sometimes appear spontaneously */
  if (random(1000) > 994) {
     renewDarkPattern(); 
  }
}


/* The lamp gets brighter and the dark pattern appears on click */
void mousePressed(){
   darkenLevel ++; 
   if (darkenLevel > 20) {
     darkenLevel = 4;
   }
   renewDarkPattern(); 
}

void keyReleased(){
  if (key == 's' || key == 'S') saveFrame("screenshot.png");
  if (key == DELETE || key == BACKSPACE) darkenLevel = 0;
}

