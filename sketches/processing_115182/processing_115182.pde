
import ddf.minim.*;//import audio source from Minim

Minim minim;
AudioPlayer bgm;
AudioSample pikachu;
AudioSample yep;

PImage rainbow, pika, awesome, farmgirl;
PImage cursor;
boolean clicked = false;

void setup() {
  frameRate(4); //slow down the frame rate to slow decrease the times of trigger
  size(800,500);
  background(loadImage("image/grass.jpg")); //Grass Stock by Rai-Stock
  
  //load images
  cursor = loadImage("image/rainbow.gif"); //Rainbow Sheep by Meninasuitcase
  pika = loadImage("image/pika.gif"); //Pikachu Sheep by srcuca-d3daaqe
  awesome = loadImage("image/awesome.gif"); //Rainbow Sheep Awesome Face by srcuca-d3d2cmp
  farmgirl = loadImage("image/farmgirl.png"); //Chibi Farm Girl 3by darknadin-d37b6b2
  
  //audio setting
  minim = new Minim(this);
  pikachu = minim.loadSample("audio/pika.mp3"); //Pikachu001.mp3 by Kyutwo
  yep = minim.loadSample("audio/yep.mp3"); //yep yep yep by SFXsource_Sound_Effects
  bgm = minim.loadFile("audio/bgm.mp3"); //Mary Had a Little Lamb by Nursery Rhymes Piano
  bgm.loop(); //loop the background music
}

void mouseClicked(){
  //change clicking status
  clicked = true;
}

//set no response for dragging
void mouseDragged(){
  //change clicking status
  clicked = false;
}

void draw(){
  //draw cursor image
    cursor(cursor, 0, 0);
  
  //mouse event of letf click
  if ((clicked) && (mouseButton == LEFT)) {
    image(pika, mouseX, mouseY);
    pikachu.trigger();
  }
  
  //mouse event of right click
  if ((clicked) && (mouseButton == RIGHT)){
    image(awesome, mouseX, mouseY);
    yep.trigger();
  }
  
  //draw the image of the girl
  image(farmgirl, 50, 300);
}

