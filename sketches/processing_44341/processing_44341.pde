
 import ddf.minim.*;

Minim minim;
AudioSample wabbywabbo;

PImage img1;

void setup (){
  size (400,442);
  img1 = loadImage("Crazydavebody2.jpg");
  // always start Minim before you do anything with it
minim = new Minim(this);

// load growl.wav from the data folder, with a 2048 sample buffer
wabbywabbo = minim.loadSample("RA RA ROLL!!!.mp3", 2048);
}

void draw (){
  image(img1,0,0);
  strokeWeight (2);
  fill(255);
  ellipse(180, 125, 25, 20); //left eye
  ellipse(253, 113, 35, 25); //right eye
 //makes the pupils move to follow the mouse
  fill(0);
  float pupilX = map(mouseX, 0, width, 170, 190);
  float pupilY = map(mouseY, 0, height, 120, 130);
    float pupilY2 = map(mouseY, 0, height, 108, 118);
  float pupilA = map(mouseX, 0, width, 240, 260);
  ellipse(pupilX, pupilY, 2, 2); //left pupil
  ellipse(pupilA, pupilY2, 2, 2); //right pupil
   
 } 

void mousePressed ()
{
wabbywabbo.trigger();
}


void stop()
{
// always close Minim audio classes when you are done with them
wabbywabbo.close();
minim.stop();

super.stop();
}

