
//**0. The canvas starts with an evoking image and sounds from childhood.
//**1. Press spacebar to see an array of spheres in the canvas. If you move the mouse while you press the key, the colours and the direction of the spheres change.
//**2. If you keep pressed the key, it keeps on moving. If not, it stops. 
//**3. Press "s" if you want to save the composition in any moment.

//Declare a PImage variable type
PImage fractal;

//Colour palette, based on the real colours of the bubbles 
color[] palette = {#a017e9, #cee204, #13ffff, #1c6106, #d7c80b};
//Floats
float a = 0;
float r = 0;

//SOUND: Import Minim library files
import ddf.minim.*;

//SOUND: Declare global variables
Minim minim;
AudioPlayer Children;

//Setup
void setup() {
  //Here I've set the dimensions
  size(800,600);       
  //IMAGE: loading the photo which I've added in data folder
  fractal = loadImage("Bubble.jpg");
  //Parameters for the photo in the sketch
  image(fractal,0,0,800,600); 
  //SOUND: loading the sound which I've added in data folder 
  minim = new Minim(this);
  Children = minim.loadFile("Children.mp3");
  Children.play();
}

 
//Draw
void draw() {
   //Commands for an interactive sketch
   if (keyPressed == true){         
    colorMode(HSB, width, height,100);
    stroke(mouseX,80,mouseY);
    strokeWeight(1);
    fill(mouseX, mouseY, 75);
    rotateX(frameCount / 100.2);
    rotateY(frameCount / 20.2);
    
   //Circles
    translate(mouseX, mouseY, map(noise(a), 0, 1,-400,300));
    rotateY(r);
    ellipse(random(height),random(width),20,20);
    a = a+0.01;
    r = r+0.01;
    }
}

 //Save the image when you want pressing "s"
void keyPressed(){
  if(key=='s' || key=='S') saveFrame("Remembrance of childhood.png");
}


