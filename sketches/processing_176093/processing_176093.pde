
import ddf.minim.*;

//Declare variables
//Common variables
float time = 0;
int start = 0;
float startTime, timeAnimation, roosterStart, mouse;
float fillcolour = 255;
float deltaTime; 
float x, y, size, randomAnimal;
Minim minim;

//Background image
PImage meadow;
AudioSample backgroundSound;

//Cow variables
PImage cow, cowMask;
float cowPresent = 0;
float cowPan = 0;
AudioSample cowSound;

//Sheep variables
PImage sheep, sheepMask;
float sheepPresent = 0;
float sheepPan = 0;
AudioSample sheepSound;

//Pig variables
PImage pig, pigMask;
float pigPresent = 0;
float pigPan = 0;
AudioSample pigSound;

//rooster variables
PImage rooster, roosterMask;
float roosterPresent = 0;
float roosterPan = 0;
AudioSample roosterSound;


//Setup
void setup() {
  size(1280, 720);
  
  //Load images
  meadow = loadImage("meadow.jpg");
  //Cow
  cow = loadImage("cow.jpg");
  cowMask = loadImage("cowMask.jpg");
  cow.mask(cowMask);
  //Sheep
  sheep = loadImage("sheep.jpg");
  sheepMask = loadImage("sheepMask.jpg");
  sheep.mask(sheepMask);
  //Pig
  pig = loadImage("pig.jpg");
  pigMask = loadImage("pigMask.jpg");
  pig.mask(pigMask);
  //Rooster
  rooster = loadImage("rooster.jpg");
  roosterMask = loadImage("roosterMask.jpg");
  rooster.mask(roosterMask);
  
  //Load sounds
  minim = new Minim(this);
  backgroundSound = minim.loadSample("background.mp3");
  cowSound = minim.loadSample("cow.wav");
  sheepSound = minim.loadSample("sheep.wav");
  pigSound = minim.loadSample("pig.wav");
  roosterSound = minim.loadSample("rooster.wav");
}

//Draw
void draw() {

  //Display background image
  image(meadow, 0, 0);
  
  //Start animation with black screen and message to click the screen
  if (start==0) {
    background(0);
    textSize(40);
    text("Farm Life", 100, 100);
    textSize(25);
    text("Click the screen to start the animation", 100, 300);
    text("Click the screen again to stop the animation", 100, 350);
  } 
  //Start counting the time, when the screen is clicked
  else if (start==1) {
    time = millis()-startTime;
  }
  
  //When time is 2 seconds start with displaying the rooster and trigger sound
  if (time>2000 && roosterStart == 1) {
    cowPresent = 0;
    sheepPresent = 0;
    pigPresent = 0;
    roosterPresent = 255;
  
    x = 265;
    y = 100;
    size = 0.5;
    roosterSound.trigger();
    deltaTime = 4000;
    timeAnimation = time;
    roosterStart = 0;
  }

  //After 7 seconds start the main animation
  if (time > timeAnimation + deltaTime && time > 7000) {
    //Set random location and size
    x = random(5, width-100);
    y = random(490, 650);
    size = (y-450)/1000;

    //Display the cows, sheep and pigs in random intervals and on random locations
    //The rooster is displayed less frequently 
    randomAnimal = floor(random(1, 4.25));
    if (randomAnimal==1) {
      cowPresent = 255;
      sheepPresent = 0;
      pigPresent = 0;
      roosterPresent = 0;
      
      cowPan = (x-width/2)/(width/2);
      cowSound.setPan(cowPan);
      cowSound.trigger();

      deltaTime = round(random(500, 2000)); 
      timeAnimation = time;
      
    } else if (randomAnimal==2) {
      cowPresent = 0;
      sheepPresent = 255;
      pigPresent = 0;
      roosterPresent = 0;
      
      sheepPan = (x-width/2)/(width/2);
      sheepSound.setPan(sheepPan);
      sheepSound.trigger();

      deltaTime = round(random(500, 2000)); 
      timeAnimation = time;
      
    } else if (randomAnimal==3) {
      cowPresent = 0;
      sheepPresent = 0;
      pigPresent = 255;
      roosterPresent = 0;
      
      pigPan = (x-width/2)/(width/2);
      pigSound.setPan(pigPan);
      pigSound.trigger();
      
      deltaTime = round(random(500, 2000)); 
      timeAnimation = time;

    } 
    
    //When the rooster is displayed, the rest of the animals disappear and the animation start all over again
    else if (randomAnimal==4) {
      cowPresent = 0;
      sheepPresent = 0;
      pigPresent = 0;
      roosterPresent = 255;

      x = 265;
      y = 100;
      size = 0.5;
      roosterSound.trigger();
      deltaTime = round(random(4000, 6000)); 
      timeAnimation = time;
    }      
  }
  
  //Display the animals
  tint(255, cowPresent);
  image(cow, x, y, 1014*size*2, 608*size*2);
  
  tint(255, sheepPresent);
  image(sheep, x, y, 2161*size*0.35, 1866*size*0.35);

  tint(255, pigPresent);
  image(pig, x, y, 2161*size*0.25, 1866*size*0.25);

  tint(255, roosterPresent);
  image(rooster, x, y, 1508*size, 1609*size);
}

//When the screen is clicked with the mouse the animation starts and stops
void mouseClicked() {
  if (mouse == 0) {
    start=1;
    startTime=millis();
    roosterStart=1;
    mouse = 1;
    backgroundSound.trigger();
  } else if (mouse == 1) {
    start = 0;
    mouse = 0;
    cowPresent = 0;
    sheepPresent = 0;
    pigPresent = 0;
    roosterPresent = 0;
    backgroundSound.stop();
  }
}

