
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer player;



void setup() {
  
   minim= new Minim(this);
  player = minim.loadFile("safehaven.mp3");
  
  size(500,500);
  smooth();
  frameRate(3.5); // Synced up with Harp in music..ish
  background(0,0,0); 
  noStroke();

  fill(0,0,10);  // Gradient bricks at the bottom to create fog/unsettling atmosphere
  rect(0,310,500,500);

  fill(0,0,20);
  rect(0,320,500,500);

  fill(0,0,30);
  rect(0,330,500,500);

  fill(0,0,40);
  rect(0,340,500,500);

  fill(0,0,50);
  rect(0,350,500,500);

  fill(0,0,60);
  rect(0,360,500,500);

  fill(0,0,70);
  rect(0,370,500,500);

  fill(0,0,80);
  rect(0,380,500,500);

  fill(0,0,90);
  rect(0,390,500,500);

  fill(0,0,100);
  rect(0,400,500,500);

}

void draw() {

       player.play();
  
  strokeWeight(random(4)); // blue lines from top left corner - Harp strings
  stroke(0,100,150,100);
  line(random(1000),random(350),-100,0);

  strokeWeight(random(5)); // black lines to cover up blue lines - to ensure screen does not go fully blue
  stroke(0,0,0);
  line(random(1000),random(350),-100,0);

  strokeWeight(random(5)); // black lines to cover up blue lines AGAINZ
  stroke(0,0,0);
  line(random(1000),random(350),-100,0);

}


void stop() {
  player.close();
  minim.stop();
  super.stop();
}

// A blue light light was used in the game, blue beams used here.

