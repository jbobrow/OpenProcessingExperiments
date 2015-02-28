
//Maps in Motion - In this sketch the image (a world map or a US map) moves with the mouse across the background creating an interactive picture

//SEE THE INSTRUCTIONS BELOW AS TO HOW TO TRIGGER COLOR CHANGES AND ADD  AUDIO TO THE SKETCH:

//1) You can change the STROKE COLOR of the image with keys "2", "3", "4", "5" which creates a trail of color as the image moves
//2) You can stop the motion of the image with key "F" or "f" and you can restart the motion with "R" or "r"
//3) Audio initiates with key "b" and a slow jam beat plays 
//4) You can change images using "w" for world maps, "u" for map1 of US and "U" for map2 of US


//setup Audio capability   <<<<<<<<<<<<AUDIO
import ddf.minim.*;

//setup Audio capability
AudioSample beat1;
Minim minim;

//declare PImage variable types
PImage image1, image2, image3, imageX;

int formResolution = 15;
color wht; //white
color blk; //black

color[] muted = {#2F3440, #3F5666, #F5E5C0, #F8CA4D, #EA6045};
color[] palette = muted;

color strokeColor = color(0);

int centerX;
int centerY;
int i;

float [] x = new float[formResolution];
float [] y = new float[formResolution];

boolean freeze = false;
boolean filled = false;


//______________________setup()__________________________
void setup() {
   
 size(800, 800);
 colorMode(HSB, 360, 100, 100); //set HSB color mode
 wht = color(300, 2, 98);
 //background(wht);              //white background
 blk = color(0,0,0);  //black
 
image1 = loadImage("three maps.png");       // load the images from the Data Folder
image2 = loadImage("us_map.jpeg");
image3 = loadImage("us_map2.jpeg");
imageX = image1;
 

minim = new Minim(this);                    //establish the mimim as a new instance of the Minim Class
beat1 = minim.loadSample("Slow_Jam1.wav");  //load the audio from the Data Folder
 
//initialize form with the image placed at the center of the canvas
centerX = width/2;
centerY = height/2;
//allow the trail to be created as the image moves with the mouse
float angle = radians(360/float(formResolution));
//set canvas backgorund color to to a rich blue color
background(220, 93, 96);    
  
}

//__________________________draw()________________________
void draw() {
  // floating towards mouse position
  if (mouseX != 0 || mouseY != 0) {
    centerX += (mouseX-centerX) * 0.01;
    centerY += (mouseY-centerY) * 0.01;
  }
  //place the image in a rectangle and apply a stroke color 
  stroke(strokeColor);
  strokeWeight(4);
  rect(centerX, centerY, 243, 223);
  image(imageX, centerX, centerY, 240, 220);  
}

//______________________user defined functions____________

void keyReleased() {
  // switch draw loop on/off
  if (key == 'f' || key == 'F') freeze = true;
  if (key == 'r' || key == 'R') freeze = false;
  if (freeze == true) noLoop();
    else loop();
    
}



void keyPressed(){  
  
  if (key == 'b' ) beat1.trigger();              //initiates the audio
  if (key == 'b' ) println("sample triggered");  //prints a message to the console
  
  if (key == 'u' ) imageX = loadImage("us_map.jpeg");
  if (key == 'U' ) imageX = loadImage("us_map2.jpeg");
  if (key == 'w' ) imageX = loadImage("three maps.png"); 
  
  if (key == 'c' ) background(220, 93, 96); 
  
  switch(key) {
    case '2' :
    strokeColor = color(blk);   //black
    break;
    case '3':
    strokeColor = color(220, 2, 97, 100);  //white
    break;
    case '4' :
    strokeColor = color(0, 93, 96, 75);   //pink red
    break;
    case '5' :
    strokeColor = color(359, 1, 0, 50);   //grey
    
    
  } 
  
  
} //end of keyPressed



//______________________end of program_______________________

