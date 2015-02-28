
// ua·tm
// Tipografía e Imagen en Movimiento
// 2013
// Prof. Stefan Gassner
// Student:



PFont font;
PImage img;
int count=0;

import ddf.minim.*;
float vol; // vol =  line in volumen
float vol_eased; // Volumen with easing effect
float vol_reduced; // Volumen on each 10 frames
float vol_target;
float easing = 0.05;

int c; // count

Minim minim;
AudioInput in;

void setup() {
  size(1200, 903);
  smooth();
  img = loadImage("fondo.png");
   background(193,29,34);


  // The font must be located in the sketch's 
  // "data" directory to load successfully
  font = loadFont("Helvetica-Bold-75.vlw");

  minim = new Minim(this);
  // get a line in from Minim, default bit depth is 16
  in = minim.getLineIn(Minim.STEREO, 512);
  frameRate(10);

}


void draw () {
count++;
     if (count>20){
   background(193,29,34);
   count=1;

}
    //background(188,94,105,50);
  //background(125);
   //image(img, 0, 0);


 
  // get a line in from Minim, default bit depth is 16
  stroke(0);
  pushMatrix();
  translate(4000, 4000);
  for (int i = 0; i < in.bufferSize() - 1; i++)
  {
    line(i, 340 + in.left.get(i)*1000, i+1, 340 + in.left.get(i+1)*1000);
    vol = in.left.get(i)*6000;
  }
  popMatrix();

  if (vol > 1) {
    vol_target = vol;
  }

  // get vol eased
  vol_reduced = vol_target;
  float vol_difference = vol_target - vol_eased;
  if (abs(vol_difference) > 1) {
    vol_eased += vol_difference * easing;
  }



  // rotate
  pushMatrix();
  translate((width/2), height/2);
  fill(255,98);
  textFont(font, 50);
  rotate(vol_eased/50);
  text("The", 0, 0);
  
  textFont(font, 100);
  rotate(vol_eased/50);
  text("Museum", 10, 10);
  
  textFont(font, 80);
  rotate(vol_eased/50);
  text("of", 20, 20);
  
  textFont(font, 90);
  rotate(vol_eased/50);
  text("Modern", 30, 30);
  
  textFont(font, 150);
  rotate(vol_eased/50);
  text("Art", 40, 40);
  popMatrix();


  stroke(0);
  textFont(font, 170);
  fill(0);
  text("M", (width/2 -250) + (vol_eased*-.5), height/2+ (vol_eased*-.5));
  fill(0);
  text("o", (width/2 -100)  + (vol_eased*.5), height/2+ (vol_eased*.5));
  fill(0);
  text("M", (width/2)  - (vol_eased*.13), height/2+ (vol_eased*.13));
  fill(0);
  text("A", (width/2 +150)  + (vol_eased*.3), height/2- (vol_eased*.3));
  //text("e", (width/2 +250)  - (vol_eased*25), height/2);
  //text("n", (width/2 +400)  - (vol_eased*25), height/2);



}


// Hit 'r' to record a single frame
void keyPressed() {
  if (key == 'r') {
    saveFrame("sample_#####.png");
  }
}

// always close Minim audio classes when you are done with them
void stop()
{
  in.close();
  minim.stop();

  super.stop();
}


//The Museum of Modern Art
