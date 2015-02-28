
PImage phone;
PImage owl;

PImage sky;


PFont font;
String word = "Wonderful";
char[] letters;
float[] y; // Y-coordinate for each letter
int currentLetter=0; // Letter currently in motion

float owlX, owlY; //position of the owl
float speed = 1; // how fast the owl move


//Create sound 
import ddf.minim.*;

Minim minim;
AudioSample camera;


void setup() {
  size(500, 700);
  phone=loadImage("smartphone.jpg");


  owl=loadImage("owl.png");
  owlX = 250;
  owlY = 250;

  sky=loadImage("moon.jpg");
  sky.resize(428, 485);


  //Create the font
  font= loadFont("Constantia-BoldItalic-45.vlw");
  textFont(font);
  letters= word.toCharArray();
  y= new float [letters.length];
  for (int i=0; i<letters.length; i++) {
    y[i]=800; // Position off the screen
  }
  fill(0);
  smooth();
  noStroke();
  
  //Crearte the clicking sound
  minim = new Minim(this);
  camera = minim.loadSample("camera-shutter-click-08.mp3");
}

void draw() {
  background(phone);
  image(sky, 30, 108);
   //Make the postion of the text
   if (y[currentLetter]>180) {
    y[currentLetter]-=6;
  }
  else {
    if (currentLetter<letters.length-1) {
      currentLetter++; //Switch to next letter
    }
  }
  // Calculate x to center the text on screen
  float x = (650 - textWidth(word)) / 2;
  for (int i = 0; i < letters.length; i++) {
    text(letters[i], x, y[i]);
    x += textWidth(letters[i]);
  }
  move();
  display();

 //Make the position of the moon's eyes
  eye(80, 200);
  eye(170, 200);
 
 //loop the sound when the mouse pressed 
  if (mousePressed)
    camera.trigger();
    
}

void move() {
  //Set how the owl move
  owlX= owlX + speed;
  owlY = owlY + speed;
  if (owlX*2 > 500) {
    owlX=1;
    }
  if (owlY*3 > 50) {
    owlY=1;
  }
  frameRate(30);

}
void display() {

  image(owl, owlX-20,owlY*3+300);

}

//Create the function of the moving eyes

void eye(int x, int y) {
  fill(255);
  ellipse(x, y, 60, 60);

  float dx = map(mouseX-x, 0, width, 0, 10);
  float dy = map(mouseY-y, 0, height, 0, 10);

  fill(0);
  ellipse(x+dx, y+dy, 30, 30);
  fill(255);
  ellipse(x+dx*2, y+dy*2, 6, 6);
}



//Source:

//Sound
 //camera clicking sound
 //http://www.soundjay.com/camera-sound-effect.html

//Picture

 //smile
 //http://www.google.com.hk/imgres?um=1&biw=1047&bih=612&hl=en&tbm=isch&tbnid=su63hri3w7d_aM:&imgrefurl=http://www.freepik.com/free-vector/outline-smiley-icons-clip-art_383130.htm&docid=DkzvoBJnVsSkTM&imgurl=http://static.freepik.com/free-photo/outline-smiley-icons-clip-art_434825.jpg&w=626&h=378&ei=VuRfUuzjDomaiAfw1IHYDw&zoom=1&ved=1t:3588,r:6,s:0,i:105&iact=rc&page=1&tbnh=167&tbnw=277&start=0&ndsp=10&tx=167&ty=52

 //camera
 //http://www.cameratechnica.com/2011/02/24/how-to-create-and-avoid-starburst-highlights/

 //magic wand
 //http://www.clker.com/clipart-magic-wand.html

 //owl
 //http://digitalbakeshop.com/item_376/Forest-Friends-Clipart.htm
 
 //sky
 //http://www.dragoart.com/tuts/5278/1/1/how-to-draw-night.htm



