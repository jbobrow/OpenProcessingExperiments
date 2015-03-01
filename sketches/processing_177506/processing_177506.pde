
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioSample mpiano;
PImage love;
color[] bricks = {#369937, #6BFF6B, #49E649, #E11279, #E64796};
color[] palette = bricks;
//Load an image file from HDD
void setup() {
  size(900, 671);
  love = loadImage("love.jpg");
  minim = new Minim(this);
   mpiano = minim.loadSample("mpiano.wav");
 

  
}
//Draw the image to the screen at (0, 0)
void draw() {
  image(love, 0, 0);
     pushMatrix();
  if(mousePressed) {
  float d=random(30, 150);
  //Set stroke color to random palette color
     stroke(palette[int(random(1,5))]);
      strokeWeight(int(random(1, 10)));
      fill(palette[int(random(1, 5))]);
 //bricks     
     float x = random(width);
     float y = random(height);
   
           rect(x, y, d, d);
  }
popMatrix(); 
}
void keyPressed() {
  if ( key == 'b' ) mpiano.trigger();
  if (key=='s' || key== 'S') saveFrame("randombricks.png");
  if (key=='c' || key== 'C') background(color(100, 200, 50, 10));
   }


