
//An Interactive Design with a message
//Press "t" or "T" to create trees on the Earth
//Press "g" or "G" to create grass on the Earth
//Press "m" or "M" to see the message

//Import audio library
import ddf.minim.*;

// Global variables

PImage world;
PImage tree;
PImage grass;
int counterX;
int counterY;
PFont f;
int imageX1, imageX2; // x-positions of the image earth
int imageY1, imageY2; // y-positions of the image earth

Minim minim;
AudioSample treeSound;
AudioSample grassSound;
AudioSample messageSound;

//setup
void setup(){
  size(900, 720);
  world = loadImage("world.jpg");
  background(world);
  tree = loadImage("small-tree.png");
  grass = loadImage("small-grass.png"); 
  f = createFont("Helvetica", 100);
  
  // Set positions of the earth image
  imageX1 = 210;
  imageX2 = 695;
  imageY1 = 178;
  imageY2 = 700;
  
  // Initialize for audio processing
  minim = new Minim(this);
  treeSound = minim.loadSample("tree-jingle.mp3");
  grassSound = minim.loadSample("grass-jingle.mp3");
  messageSound = minim.loadSample("message-jingle.mp3");
}

//Draw

void draw() {
  
}
  
// For key pressed, check if t/T is pressed and draw a tree 
// at a random place inside the image-load area
void keyPressed(){
  int objectposx, objectposy; // temp coordinates
  textFont(f, 60);
  fill(#74F262);
  
  if (key == 't' || key == 'T') {
    // Generate a random number between imageX & imageY positions
    objectposx = int (random( imageX1, imageX2));
    objectposy = int (random( imageY1, imageY2));
    
    println( "objectposx = " + objectposx + " objectposy = " + objectposy);
    
    // Draw a tree
    image(tree, objectposx, objectposy);
    
    // Play the tree jingle
    treeSound.trigger();
  }
  
  // For key pressed, check if g/G is pressed and draw a grass bunch 
 // at a random place inside the image-load area
  if (key == 'g' || key == 'G') {
    // Generate a random number between imageX & imageY positions
    objectposx = int (random( imageX1, imageX2));
    objectposy = int (random( imageY1, imageY2));
    
    println( "objectposx = " + objectposx + " objectposy = " + objectposy);
    
    // Draw grass
    image(grass, objectposx, objectposy);
    
    // Play the grass jingle
    grassSound.trigger();
  }
  
  // For key pressed, check if m/M is pressed and display a message
  // on top of screen
  
  //Print message
  if (key == 'm' || key == 'M') {
    text("Our Earth, Keep it Green!", width/8, height/8); 
  //Play the message jingle
  messageSound.trigger();
  }
}
  

