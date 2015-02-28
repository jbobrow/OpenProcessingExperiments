
import ddf.minim.*;
Minim minim;
AudioPlayer groove;

PImage schnuppe;
PImage schnuppe2;
PImage back1;
PImage back2;
int backX = 0;

PImage stern;

PImage wolke1;
float WY = 0;
float WX = 1;
float WX2 = 0;

int numFrames = 12;  // The number of frames in the animation
int frame = 0;

PImage[] images = new PImage[numFrames];

void setup () {
  size (1024, 768, P2D);
  
  wolke1 = loadImage("wolke1.png");
  stern = loadImage ("sterne.png");
  schnuppe =loadImage("sternschnuppe.png");
  schnuppe2 =loadImage("sternschnuppe2.png");

  frameRate(30);


  minim = new Minim(this);
  groove = minim.loadFile("unicorn.mp3",1500);
groove.loop();


  images[0]  = loadImage("pferd1.png");
  images[1]  = loadImage("pferd1.png"); 
  images[2]  = loadImage("pferd1.png");
  images[3]  = loadImage("pferd1.png"); 
  images[4]  = loadImage("pferd1.png");
  images[5]  = loadImage("pferd1.png"); 
  images[6]  = loadImage("pferd1.png");
  images[7]  = loadImage("pferd2.png"); 
  images[8]  = loadImage("pferd2.png");
  images[9]  = loadImage("pferd2.png"); 
  images[10] = loadImage("pferd2.png");
  images[11] = loadImage("pferd2.png");
  
  noCursor();
} 

void draw() 
{ 


  backX = backX+-1;
  if (backX < -1024) {
    backX = 0;
  }
  image(stern, backX, 0);
  image(stern, backX+1024, 0);
  tint (random(244));
  image(schnuppe2, mouseX-20, mouseY-20);
  noTint();
  image(schnuppe, mouseX-20, mouseY-20);


  WX = WX + 1;
  WY = 1;
  if (WX  > 1124) {
    WX = 0;
  }
  WX2 = WX2 +1.2;
  if (WX2 > 1244) {
    WX2 = 0 - random (10, 0);
  } 

  image(wolke1, WX-60, WY+100);
  image (wolke1, WX2-210, WY+70);
  image (wolke1, WX2-610, WY+115);


  frame = (frame+1) % numFrames;  // Use % to cycle through frames
  image(images[frame], 150, 150);
  
  
  if (mousePressed) {
  tint (random(255), 0, random(210), random(60));
}else{
  noTint();
}
}


