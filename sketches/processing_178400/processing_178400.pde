
//Introduction to Computational Arts
//Final Project
//Bringing it All Together
//Slide show of all of my Processing and Image Assignments
//Click the mouse to start slide show
//Hit return or enter to go to the next slide
//JavaScript cannot use minim sorry no sound with this version

//import ddf.minim.*; //sketch import library minim

//Minim minim; //Declare minim global variable
//AudioSample sp; //Load Audio Player

boolean bDisplayTitle = true; //Title page boolean

// An array of picture titles
String[] titles = {
  "Processing - A 20 Object Sketch" ,
  "Processing - A Dynamic Sketch" ,
  "Processing - An Interactive Sketch" ,
  "Images - Optimize a Black and White Image" ,
  "Images - Color Image Optimization" ,
  "Images - Collage" ,
  "Images - Image and Text" ,
  "Images - Language Games Exhibit" ,
};

PFont f;  //Global font variable
int maxTitles = 8; //Total # of titles
int titleIndex = 0; //Initial title to be displayed

int maxImages = 8; //Total # of images
int imageIndex = 0; //Initial image to be displayed

PImage[] images = new PImage[maxImages]; //Declaring an array of images


void setup() {
  size(900, 700);
  f = createFont("Arial-Black" ,40, true);
   
  //Loading the images into the array
  for (int i = 0; i < images.length; i++ ) {
    images[i] = loadImage( "Im" + i + ".png" );
  }
  
// minim = new Minim(this); //Pass this to Minim so that it can load files from the data directory
  
 //sp = minim.loadSample("sp.wav"); //Loads the Sound Project File
}



void draw() {

  //Loads the title page to the window
  if (bDisplayTitle) { 
  background(#4435F0);
  fill(255);
  textFont(f);
  textAlign(CENTER);
  text("Introduction to Computational Arts" ,width/2, 200);
  text("Final Project" , width/2, 300);
  text("Bringing It All Together" , width/2, 400);
  //text("Hit the s key to listen to my Sound Project", width/2, 550);
  text("Click the mouse to see slide show", width/2, 600);
  text("Hit return or enter to go to the next slide", width/2, 650);
  
  
  //Starts the slide show
  if (mousePressed == true) {
    bDisplayTitle = false;   
  }
 }
  else {
    
 //Draws the image to the center of the window
  background(0);
  imageMode(CENTER);   
  image(images[imageIndex],450,350);
  

  //Draws a boarder for the image title
  fill(0);
  rect(0,0,900,70);
  
  
  //Draws the title of the image to the screen
  fill(255);
  textFont(f);
  textAlign(CENTER);
  text(titles[titleIndex],width/2,50);
  }
}


void mousePressed() {
 
 //Loads the first slide to the screen
  titleIndex = (titleIndex) % titles.length;
  imageIndex = (imageIndex) % images.length;
}
  
  void keyPressed() {
    
    //Displays the next slide when the enter or return key is pressed
    if ((key == ENTER) || (key == RETURN)) {
       titleIndex = (titleIndex + 1) % titles.length;
       imageIndex = (imageIndex + 1) % images.length;
    }
    
    //if ((key == 's') || (key == 'S')) sp.trigger(); //Plays the sound project  
  }
      





