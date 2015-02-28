
//Firecrackers

/**
  With this sketch I emulated the effect of different firecrackers
  rising to the sky and exploding into different forms and colors.

  The sketch gives full control to the user to fire the crackers he 
  wants by pushing some given keys.

  As long as the user keeps pushing keys, the crackers will keep 
  firing  
**/

/**
 * Interactivity instructions 
 *
 * The following sketch draws different color firecrackers
 * 
 * KEYS
 * del, backspace      : erase sketch
 * s, S                : save to screenshot.png
 * 0                   : fires fire0.png
 * 1                   : fires fire1.png
 * 2                   : fires fire2.png
 * 3                   : fires fire3.png
 * 4                   : fires fire4.png
**/

//Import Minim Libraries
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

//Global variables
color[] rise ={#FFDC31, #E8A702, #FFA00F, #E8791C, #FF7D47}; // color palette for the firecracker rising
int elevation; // variable to determine the height of the firecracker
int target; // target position where the firecracker will explode
int xPos = 0; // x postion from where the firecracker starts elevating
int animationSpeed = 6; // sets the speed the firecracker will rise
int alpha = 3; // sets rising transparency

//Define images
PImage starSky;
int numCracks = 5; // number of different firecrackers
PImage[] firecrackers; // firecracker image array
int selected = 0; // user selected firecracker
boolean launched = false; // boolean to control if the user fires a cracker
boolean exploded = false; // boolean to detect if the cracker has exploded
float std_width = 400; // standard width for resizing all the crackers

//Define Audio Players
Minim minim;
AudioPlayer whistle; // audio player for the firecracker whistle
AudioPlayer crack; // audio player for the explosion

//Setup
void setup(){  
  //Frame settings
  starSky = loadImage("background.png");
  size(starSky.width, starSky.height);
  
  //Load background image
  image(starSky, 0, 0, width, height);
  
  //Load firecracker images in an array
  firecrackers = loadImages("Crackers/fire", ".png", numCracks);
  
  //Audio setup
  minim = new Minim(this);
  whistle = minim.loadFile("whistle.wav");
  crack = minim.loadFile("explosion.wav");
  
  //Global variables initialization
  initialize();
}

//Draw
void draw(){
  if (launched){
    //Firecracker elevating
    strokeWeight(5);
    line(xPos, height - 1, xPos, elevation);
    elevation -= animationSpeed;
    
    //Explosion
    //Drawn if we have met a random height target
    if (elevation <= target){
      imageMode(CENTER);
      image(firecrackers[selected], xPos, elevation);
      
      //Play explosion sound
      crack.play();
      crack.rewind();
      
      //Stop launching firecrackers
      launched = false;
      
      if(!crack.isPlaying()){
        exploded = true;
      }
      
      //Reinitialize the initial variables
      initialize();  
    }
    exploded = false;
  }  
}

//KeyPressed
void keyPressed(){
  //Delete sketch
  if (key == DELETE || key == BACKSPACE){
    imageMode(CORNER);
    image(starSky, 0, 0, width, height);
  } 
  
  //Select and launch firecracker
  switch(key){
    case '1': launch(0);
              break;
    case '2': launch(1);
              break;
    case '3': launch(2);
              break;
    case '4': launch(3);
              break;
    case '5': launch(4);
              break;
    default:  selected = 0;
              break;        
  }

  //Save sketch
  if (key =='s' || key =='S') saveFrame(str(year()) + str(month()) + str(day()) + "-" + str(hour()) + str(minute()) + str(second()) + "_screenshot.png");  
}

//Helper function to initialize variables at the beginning or when
//exploding a firecracker
void initialize(){
  elevation = height - 1;
  target = int(random(height/8, height/2));
  stroke(rise[int(random(0,rise.length - 1))], alpha);
  xPos = int(random(0, width - 1));
}

//Helper function for selecting a cracker and launching it with sound
void launch(int select){
  selected = select;
  launched = true;
  if(! whistle.isPlaying() && ! exploded ){
    whistle.play();
    whistle.rewind();
  }
}

//Helper function to load images in an array easily
/*
  The function consumes a folder inside data with a generic file name in a stub,
  then it takes an extension and the number of images (numImages) in that folder.
  By doing this we create an array of images we can access. 
*/
PImage [] loadImages(String stub, String extension, int numImages)
{
  PImage [] images = new PImage[0];
  for(int i =0; i < numImages; i++)
  {
    PImage img = loadImage(stub+i+extension);
    if(img != null)
    {
      images = (PImage [])append(images,img);
    }
    else
    {
      break;
    }
  }
  return images;
}


