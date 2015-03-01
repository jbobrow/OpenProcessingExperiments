
/* 11 December - International Mountain Day.
As a fun of climbing, a made this presentaion  */

/* The presentations starts when we press a mouse button. The music also starts.
Every time we press again a button, we add a new image on the scene.
Pressing del or backspace, we erase the scene and the music stops. So, we are ready to start again.
Pressing 's'  we save the scene making the sreenshot.png file
*/

// All photos are mine. The music entitled "Saturnus" is free (Last.fm/music)
// Import 'Minim' files
import ddf.minim.*;

// Declare music variables
Minim minim;
AudioPlayer song1;


// declare a PImage array variable type for mountain images
PImage[] mountains;
// We have 15 different mountain images
int imageTotal = 15;
// declare a PImage variable type for the title image
PImage title;
// declare a PImage variable type for the button image
PImage button;

//Define Color Palette to fill the scene 
color[] scene = {#ADDAF5,#5FB6EA,#0C72AF,#8BB8D3,#0677BC,#DEEEF7,#DEEEF7};
color[] palette = scene;


// keyPressed
void keyReleased()  {
  if (key == DELETE || key == BACKSPACE) 
    song1.pause();
    background(palette[int(random(0, 6))]);
  if(key == 's'  || key == 'S') 
    saveFrame("sreenshot.png");
} 


void setup() {
  //Size and background settings 
  size(1200,600);
  background(palette[int(random(0, 6))]);
  
  // Load the title image file from HDD
  title=loadImage("Title1.png");
  
  // Load the button image file from HDD
  button=loadImage("Button1.png");
  
  mountains=new PImage[15];
  // Load mountain image files from HDD
  for (int i = 0; i < 15; i++){
    mountains[i] = loadImage("Mountain"+i+".jpg");
  }
  
  minim=new Minim(this);
  song1=minim.loadFile("Saturnus.mp3");
}

//Create the draw code block
void draw (){
  image(title, 190,0);
  image(button, 0,540);
}

// Clicking on the screen, a random image is displayed, exactly on the point of clicking. The music starts
// The size of each image is 200x150
void mousePressed (){
  song1.play();
  for(int b=0;b<13;b++){
    image(mountains[(int(random(b)))], mouseX,mouseY, 200,133);
  }
}
  


