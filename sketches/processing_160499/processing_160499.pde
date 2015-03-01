
PImage myImage;
PFont f;

void setup(){
  size (1300,900);
  myImage = loadImage ("badseflie.JPG");
  f = loadFont ("MyriadPro-Cond-12.vlw");
}

void draw () {
  image (myImage,0,0);
  textAlign (CENTER);
  textFont (f);
  fill(255,255,255,125);
  text ("#blurry", 325,300);
  text("#badlighting", 650,600);
  text ("#misaligned", 975,300);
  fill (255,255,255);
  text ("Adventures in Bad Selfies;", width/2, height/2);
  text ("A Journey Through a Misguided Art Form", width/2, 500);
}


