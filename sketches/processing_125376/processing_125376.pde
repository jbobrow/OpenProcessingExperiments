


//get Minim as a way of playing sound
import ddf.minim.*;

//Global variables
color strokeColor = color(0, 100);
Minim minim; 
AudioSample humming;

//setup()
void setup(){
  size(1280, 720);
  colorMode(HSB, 360, random(100), random(100), random(100));
  noFill();
  background(360);
//Load audio file using Minim  
 minim = new Minim (this);
 humming = minim.loadSample("humming-1.mp3");
  }
  
//draw()
void draw() {
if (mousePressed) {
 pushMatrix();
 translate(width/2, height/ 2);
 //map(value, start1, stop1, start2, stop2);
 int circleResolution = (int)map(mouseY+100, 5, height, 2, 17);
 int radius = mouseX-width/2;
 float angle = TWO_PI/circleResolution;
 //style
 strokeWeight(random(0.7));
 stroke(random(20), random(100), random(40), random(50));
 beginShape();
 for (int i=0; i<=circleResolution; i++) {
  float x=0+tan(angle*i/2) * radius;
  float y=0+tan((angle*i)*3) *radius;
 vertex(x,y); 
 }
 endShape();
 popMatrix();
 
}
}

//keyPressed()
void keyReleased(){
  if(key == DELETE || key == BACKSPACE) background(360);
// Takes screen-grab png of current state of sketch
  if(key == 's' || key == 'S') saveFrame("screenshot.png"); 
  
  switch(key){
      case '1' :
      strokeColor = color(0, 10);
      break;
 
      case '2' :
      strokeColor = color(192, 100, 64, 10);
      break;
 
      case '3' :
      strokeColor = color(52, 100, 71, 10);
      break;
 }
}

//Create a key trigger void for the audio sample
void mouseDragged() { 
humming.trigger(); 
}




