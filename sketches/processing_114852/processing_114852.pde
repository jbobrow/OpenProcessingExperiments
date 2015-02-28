
//So Hei Man(53225141)_Ass4

//Declare variables and import the library
import ddf.minim.*;

PImage theft, police,shoot,start, car, win, lose;
PImage[] img= new PImage[3];

//Import the background music and sound effect
Minim minim;
AudioSample shooting;
AudioPlayer bgsound;

//Set the initial frame
int Frame = 0;

//Set up the world 
void setup() {
  size(500, 500);
  background(255,228,196);
  frameRate(8);

  // Load sounds and images from the data directory
  minim = new Minim(this);
  shooting = minim.loadSample("shooting3.mp3");
  bgsound = minim.loadFile("bg music.mp3");
  bgsound.loop();
 
  img[0]  = loadImage("THE THEFT.png");
  img[1]  = loadImage("THE POLICE.png"); 
  img[2]  = loadImage("THE POLICE.png");
  
  shoot  = loadImage("SHOOT.png");
  start  = loadImage("START.png"); 
  car  = loadImage("THE CAR.png");
  win  = loadImage("WIN.jpg"); 
  lose  = loadImage("LOSE.jpg");
}

void draw() {
  //Load the frame
  Frame = Frame + 1;
  
  if (Frame >= 0){
  image(start, 0, -5);
  image(car, 0, -5);
  }
  
  if (Frame > 30){
  background(255,228,196);
  
  //Set the motion of the police and theft that they change randomly at the location assigned 
  for( int i = 95; i<600; i = i+160){
     for( int j = 100 ; j < 600; j = j+160) { 
     image(img[(int)random(3)],i,j);
     }}
    //The shoot image would move with the mouse center
    frameRate(8);
    image(shoot,mouseX,mouseY);
    imageMode(CENTER);
    
    //if pressing the mouse, the win message would show and sound effect is added
    if (mousePressed == true) {
     image(win, 250, 250);
     shooting.trigger();
    }
  }
  
//Press the key to restart the frame 
if (Frame > 100) {
  image(lose, 250, 250);
  shooting.stop();
  if (keyPressed == true) {
  Frame=30; 
}
  }
}

//Sound Sources
//http://soundbible.com/tags-shooting.html
//http://incompetech.com/music/royalty-free/index.html?genre=Classical&page=1

