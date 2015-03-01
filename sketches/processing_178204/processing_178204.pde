
// This is my Project for the course: Introduction to Computational Arts
// A Merry Christmas with light, christmas tree and the melody of Jingel
//Bells

// press 's' or 'S' fot to save the screenshot
// click mouse left to stop the sound
// press 'c' to continue the sound
 
//We wish you are a merry christmas!!!!!
 
// Import Library
import ddf.minim.*;
 
// GLobal Variables
Minim minim;
AudioPlayer nature;
PFont f;
PImage christmasTree;
PImage santa;
 float[] xCoords = new float[500];
float[] yCoords = new float[500];
float[] xMove = new float[500];
float[] yMove = new float[500];
color[] palette = {#FF0F03,#FF4603,#FF8103,#FFCD03,#FFE203,#FAFF03};
int counter=0;

float xPos;
float yPos;
float xVel = 3;
float yVel = 2;
int imWidth;
int imHeight;

// Create setup code block
void setup(){
 //window size for the sky
 size(1280, 720);
 christmasTree = loadImage("Tree.jpg");
 santa = loadImage("sant.png");
 smooth();
  for (int i = 0; i < 500; i++) {
    xCoords[i] = random(width);
    yCoords[i] = random(height);
    yMove[i] = random(2, 5);
  }


 //Audio player in the background
 minim = new Minim(this);
 nature = minim.loadFile("JingleBells.mp3");
 nature.play();
nature.loop();
}
 void draw(){

    image (christmasTree, 0, 0);

   fill(palette[int(random(6))]);
   textSize(48);
   textAlign(CENTER);
   text("Merry Christmas",width*2/3,670);
   image (santa,width , height);

// loop
for(counter=0;counter<100;counter++) {
   float x = random(width);
   float y = random(height);
  
   
strokeWeight(random(2));
stroke(palette[int(random(6))]);
line(770,70,x,y);

fill(palette[int(random(6))]);
strokeWeight(0);
ellipse(770,70,10,10);

}

// draw snowfall 
  fill(255);
  for (int i = 0; i < 500; i++) {
    ellipse(xCoords[i], yCoords[i], 5, 5);
    xCoords[i] +=xMove[i];
    yCoords[i] +=yMove[i];
 
    //make it wiggle!!
    xCoords[i] += random(-5, 1);
 
    if (yCoords[i] > height) {
      yCoords[i] = 0;
    }
    if (xCoords[i] < 0) {
      xCoords[i] = width;
    }
  }
  
  //Move santa 
  float x,y;
 
  x=mouseX;
  y=mouseY;
  if(abs(x-xPos)>xVel) {
 
    if (x>xPos) {
      xPos+=xVel;
    }
    else
    {
      xPos-=xVel;
    }
  }
  if(abs(y-yPos)>yVel) {
    if (y>yPos) {
      yPos+=yVel;
    }
    else
    {
      yPos-=yVel;
    }
  }
 
  image(santa,map(xPos,0, width,(width/2)+((imWidth-width)/2),(width/2)-((imWidth-width)/2)), map(yPos,0, height,(height/2)+((imHeight-height)/2),(height/2)-((imHeight-height)/2)));
  
 }
 void keyReleased() {
 
   // Continues play the sound 
   if (key == 'c'){
     nature.play();
     nature.loop();
   }
   // save current drawings
  if (key=='s' || key=='S')
    saveFrame(timestamp() + ".png");
 }

void mousePressed() {
  nature.pause();
}
// timestamp return the current time
String timestamp() {
  return String.valueOf(year()) + '_' + String.valueOf(month()) + '_' + String.valueOf(day()) + '_' + String.valueOf(hour()) + '_' + String.valueOf(minute()) + '_' + String.valueOf(second());
}


 



