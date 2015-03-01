
//Working with Images in Processing

//Global Variables
//Declare a PImage variable type
PImage flowers;
PImage bee;
PImage elk2;
PImage eagle;
PImage Snowflake1;
PImage Snowflake2;
PImage Snowflake3;
PImage Snowflake4;
//Set numeric variables for screen location of animals upon opening sketch
float beex = random(100, 650);
float beey = random(500, 800);
float elk2x = random(100, 600);
float elk2y = random(500, 700);
float eaglex = random(100, 700);
float eagley = random(100, 250);
//Set Boolean values for flow of program. When animals apear on screen,
//when eagle flyes, what happens when mouse is pressed.
boolean hasDrawnPictures = false;
boolean needToUpdate = false;
boolean eagleFlying = false;
boolean mPressed = false;
//Set counter and color for ornaments.
int counter = 0;
color[] palette =
{#7712B2, #1233FF, #FF2108, #CCC905, #37B200};
//Import Minim for playing of audio.
import ddf.minim.*;
Minim minim;
AudioPlayer grieg;
//Set size of sketch and load all image files from computer
//as well as the audio file, "grieg".
/*Don't forget to add the file to your sketch 'data' folder */
void setup() {
  size(800, 1000); 
  minim = new Minim(this);
  grieg = minim.loadFile("grieg.wav");
  grieg.play(); 
  flowers = loadImage("flowers.png");
  bee = loadImage("bee.png");
  elk2 = loadImage("elk2.png");
  eagle = loadImage("eagle.png");
  Snowflake1 = loadImage("Snowflake1.png");
  Snowflake2 = loadImage("Snowflake2.png");
  Snowflake3 = loadImage("Snowflake3.png");
  Snowflake4 = loadImage("Snowflake4.png"); 
}
//Draw the images to the screen upon 
void draw () {
   counter = 0;
   //If hasDrawnPictures is not false(because it is false to begin with), or if
   //the eagle is flying then, draw the pictures
   if(!hasDrawnPictures || eagleFlying){
      //Calculate the next position of the eagle
      if(eagleFlying){
       eaglex = eaglex + 15;
       eagleFlying = eaglex < 850;
      }
      redrawImages();
      hasDrawnPictures = true;
  }
  
  if(!eagleFlying && mPressed){
     beex = random(100, 650);
     beey = random(500,800);
     elk2x = random (75, 600);
     elk2y = random (500, 750);
     eaglex = random (75, 700);
     eagley = random (100, 250);
     redrawImages();
     mPressed = false;
    }
    
 }
  void mouseReleased(){
   eagleFlying = true;
   mPressed = true;
 }
 void keyReleased(){
   if (key == 'c'|| key == 'C') drawOrnaments(); 
   if (key == 's' || key == 'S') drawSnowflakes();
    } 

//Create a method for the placement, number, colors and size of the ornaments. 
void drawOrnaments(){
  //Draw ornaments of different colors in trees
  while(counter <100){
    float r = random (0,4);  
    fill(palette[int(r)]);
    strokeWeight(1);
  float x1 = random (0, 300);    
  float x2 = random (450, 800);
 // float x3 = random (0,1);
  float y1 = random (400, 500);
  float y2 = random (375, 500);
  if(counter < 50){
     ellipse(x1, y1, 10,10);
  }else {
    ellipse(x2, y2, 10, 10);
  }
     counter++;
  } 

}
//Create a method for the placement and size of each animal image to be redrawn after
//the eagle mouse is pressed.
void redrawImages(){
      image(flowers, 0, 0);
      image(bee, beex, beey, 75, 50); 
      image(elk2, elk2x, elk2y, 250, 225);
      image(eagle, eaglex, eagley, 150, 150);
}
//Create a method for the placement and size of each snowflake image.
void drawSnowflakes(){
     image(Snowflake1, 400, 50, 150, 150);
     image(Snowflake2, 500, 200, 100, 100);
     image(Snowflake3, 200, 300, 150, 150);
     image(Snowflake4, 600, 150, 105, 100);
     image(Snowflake4, 450, 350, 85, 80);
     image(Snowflake3, 350, 300, 100, 100);  
     image(Snowflake2, 250, 150, 150, 150);
     image(Snowflake1, 100, 50, 100, 100);
     image(Snowflake1, 150, 200, 75, 75);
     image(Snowflake2, 650, 350, 75, 75);
     image(Snowflake3, 700, 300, 75, 75);
     image(Snowflake4, 50, 300, 85, 80);   
}

