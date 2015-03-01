
//Final Project -- Working with Images and Sound in Processing

//Import 'Minim' library files
import ddf.minim.*;

//Declare global variables: Minim, PImage$, stars (number, size)
Minim minim;
AudioSample starfour;
PImage threekings;
int[] strX = new int[50];
int[] strY = new int[50];
color[] strCol = new color[255];
int strSze = 5; 

//Load audio and image files from HDD, specify canvas size
void setup() {
  minim = new Minim(this);
  starfour = minim.loadSample("starfour.wav");
  size(1200, 700);
  threekings = loadImage("threekings.png");
  smooth();

//Specify random colors and locations of stars on canvas
  for (int i = 0; i < strX.length; i++) {
    strX[i] =(int)random(900);
    strY[i] = (int)random(425);
    strCol[i] = color((int)random(200,255));
  }
}

//Draw the image to the screen at (0,0)
void draw() {
  background(#594B98);
  image(threekings, 0, 0);
  
//Draw the stars and make them twinkle
  stroke(0);
  strokeWeight(1);
  for (int i = 0; i < strX.length; i++) {
    fill(random(200,255)); 
    if (random(10) < 1) {
      strCol[i] = (int)random(200,255);
    }
    fill(strCol[i]);    
    ellipse(strX[i], strY[i], strSze, strSze);
  }
  
  //Specify random light motion of special star 
  int numberRays = (int) random (20, 50);
  float numberMoves = random (1, 5);
  float a = numberMoves* HALF_PI/ numberRays;
  float r = (float) 45/ numberRays;
 
  int b = 0;
 //Specify range of random angle directions of light rays
  while (b < numberRays){  
    float x= random(900,1200) + cos(r);
    float y= random (700) + sin(a);
 
    stroke (255);
    line (x, y, 1050, 100);
 
    b = b + 1;
  }
  
  //Greetings for the Holidays
  fill (#ffedbc);
  textSize(20);
  text ("I am the light of the world.", 920, 50);
  textSize(12);
  text ("(John 8:12)", 1020, 65);
  textSize(14);
  text ("Happy Hanukkah & Merry Messiahmas!", 915, 600);
  textSize(12); 
  text ("(Press S to hear star song.)", 970, 615);
} 
  
//Create a key trigger to play star song
void keyPressed() {
  if (key == 's') starfour.trigger();
}


  
  
 
 

