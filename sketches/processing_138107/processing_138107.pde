
// Theme is Reggae Music
// Both Mouse Input and Keyboard Input are active to interact 
//with this sketch
// Sound is also integrated in this sketch is one of 
//Bob Marley's Hit songs "One Love"
// There is also an imported image in the form of a specker

/*
MOUSE
position x : length
position y : thickness and number lines to be drawn
drag : draw

KEYS
1-25 : stroke color
del, backspace : erase
s : save png

*/

//Import 'Minim'
import ddf.minim.*;

PImage Speaker;
//Global variables
Minim minim;
AudioPlayer OneLove;

color strokeColor = color(0, 25);

void setup(){
  
  size(952, 856);
  minim = new Minim(this);
  OneLove = minim.loadFile("OneLove.mp3");
  OneLove.play();
  

  colorMode(HSB, 360, 80, 150, 100);
  smooth();
  noFill();
  background(360);
  Speaker = loadImage("Speaker.jpeg");
  image(Speaker, 0, 0);
  
}

void draw(){
 
  if(mousePressed){
    pushMatrix();
    translate(width/2,height/2);

    int circleResolution = (int)map(mouseY+200,0,height,2, 10);
    int radius = mouseX-width/2;
    float angle = TWO_PI/circleResolution;
    
    strokeWeight(2);
    stroke(strokeColor);
  
    beginShape();
    for (int i=0; i<=circleResolution; i++){
      float x = 0 + cos(angle*i) * radius;
      float y = 0 + sin(angle*i) * radius;
      vertex(x, y);
    }
    endShape();
    
    popMatrix();
    

  }
}
  

//keyReleased()

void keyReleased() {
  if (key == DELETE || key == BACKSPACE) background(360);
  if (key == 's' || key == 'S') saveFrame("screenshot.png");
  
  switch(key) {
    case '1':
     strokeColor = color(0, 10);
     break;
     case '2':
     strokeColor = color(192, 100, 64, 10);
     break;
     case '3':
     strokeColor = color(52, 100, 71, 10);
     break;
     case '4':
     strokeColor = color(5, 80, 17, 99);
     break;
     case '5':
     strokeColor = color(155, 179, 89, 19);
     break;
     case '6':
     strokeColor = color(34, 78, 101, 66);
     break;
     
    
    
  }
  
}



