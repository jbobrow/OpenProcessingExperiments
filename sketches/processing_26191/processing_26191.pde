
//After running the sketch, please select "Theme.mp3" inside the data folder of the sketch folder.

//This sketch shows Arnie as the Terminator that is backdropped by an endoskeleton. 
//In this sketch you will hear the dramatic theme music from the Terminator movies while 
//a target moves as you scan the images. When you click the mouse you'll hear the 
//Terminator speak! Enjoy!


import beads.*;
//Beads from the libraries on processing.org

AudioContext ac;

TTS tts;

PImage term, endo, flames;
//Image of terminator and endoskeleton


void setup() {
  size (1300, 1000);
  smooth();
  //sketch is at a size of 1300 across and 1000 down
  term = loadImage ("arnie1.jpg");
  endo = loadImage ("arnie2.jpg");

  ac = new AudioContext ();
  String audioFile = selectInput();
  SamplePlayer player = new SamplePlayer (ac, SampleManager.sample(audioFile));
  //Theme.mp3 needs to be selected after running the sketch
  Gain g = new Gain (ac, 3, 0.5);
  //Volume of the sketch should be at a similar level to that of the spoken voice 
  g.addInput(player);
  ac.out.addInput(g);
  ac.start();

  tts = new TTS();
}


void draw () {

  image (term, 0, 0, width, height);
  //terminator image will be size (1300, 1000)

  int my = constrain (mouseY, 0, height-250);
  //When the mouse moves outside of the sketch area, the block will not move past the sketch border

  copy (endo, 0, my, width, 250, 0, my, width, 250);
  //endoskeleton image will be constrained and move according the mouse, revealing and hiding the image below

  fill (255, 0, 0);
  ellipse (mouseX, mouseY, 100, 100);
  fill (0, 0, 0);
  ellipse (mouseX, mouseY, 90, 90);
  fill (255, 0, 0);
  ellipse (mouseX, mouseY, 80, 80);
  fill (0, 0, 0);
  ellipse (mouseX, mouseY, 70, 70);
  fill (255, 0, 0);
  ellipse (mouseX, mouseY, 60, 60);
  fill (0, 0, 0);
  ellipse (mouseX, mouseY, 50, 50);
  fill (255, 0, 0);
  ellipse (mouseX, mouseY, 40, 40);
  fill (0, 0, 0);
  ellipse (mouseX, mouseY, 30, 30);
  fill (255, 0, 0);
  ellipse (mouseX, mouseY, 20, 20);
  fill (124, 252, 0);
  ellipse (mouseX, mouseY, 10, 10);
  //gun target that moves with the mouse, as if the viewer is going to shoot
}


void mousePressed() {
  tts.speak ("I'll, be back!");
  //When mouse is pressed, one of the iconic phrases from the Terminator series will be heard
}


