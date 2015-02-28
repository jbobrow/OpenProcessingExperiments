
import ddf.minim.*;
Minim minim;
AudioPlayer bm;
AudioSample click;
// Below two values are variables that I will use later
float xPosition = 0;
float yPosition;
float xSpeed;
float ySpeed;
PImage img;
PImage bg;

void setup(){
  size(1600,1200);
  // The background image must be the same size as the parameters
  // into the size() method. In this program, the size of the image
  // is 1600 x 1200 pixels.
  bg = loadImage("Grass_HD_wallpaper.jpg");
  background(bg);  
  
yPosition = height/2;
ySpeed = random(-8,8);
xSpeed = random(-8,8);

img = loadImage("pil.jpg");
 
 minim = new Minim(this);
  bm=minim.loadFile("forest ambience.mp3");
  bm.loop();
  click=minim.loadSample("click.mp3",1024);


}

void draw(){
  
   background(bg); 


// checks to see if ball position is larger than width of sketch
if(xPosition>width){
xSpeed *= -1; 
}

// checks to see if ball position is smaller than 0 (left wall)
if(xPosition<0){
xSpeed *= -1; 
}
if(yPosition<0){
ySpeed *= -1; 
}
if(yPosition>height){
ySpeed *= -1; 
}

imageMode(CENTER);
image(img,xPosition,yPosition,50,50);  // Draw image using CENTER mode 
  
xPosition += xSpeed;
yPosition += ySpeed; 

if (mousePressed)
  click.trigger();
}


 



