
//Import Minim
import ddf.minim.*;

//GlobalVariable
color strokeColor = color (0,10);
//declare PI variable
PImage fractal;
//sound
Minim minim;
AudioPlayer guitar;


//setup
void setup() {
  size(720,720);
  colorMode(HSB, 360, 100,100, 100);
  noFill();
  background(360);
  
  //load Image
  fractal = loadImage("final.png");
  
  //music
  minim = new Minim(this);
  guitar = minim.loadFile("Guitar.wav");
  guitar.play();
}

//draw
void draw(){
//image
image(fractal,320,0);
  //mouse
if(mousePressed) {
 

pushMatrix();
translate(width/2, height/2);

//map(value, start1, stop1, start2, stop2);
int circleResolution = (int)map(mouseY+100, 0, height, 2,10);
int  radius = mouseX-width/2;
float angle = TWO_PI/circleResolution;

//stroke
strokeWeight(2);
stroke(strokeColor);

//figure
ellipse(100, 100, mouseX/2, mouseX/2);
popMatrix();
}
}

//key
void keyRelased () {
if (key == DELETE || key == BACKSPACE) background(360);
if (key == 's' || key == 'S') saveFrame("screenshot.png");

}

