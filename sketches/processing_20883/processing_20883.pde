
import processing.opengl.*;

int cellSize = 12;
float Red, Green, Blue = 0;
int pixelCount = 0;
PImage FM2;

void setup () {
  FM2 = loadImage ("http://i3.photobucket.com/albums/y53/Getitrightschmoo/Camera.jpg");
  size(600, 600, OPENGL);
  smooth();
  lights();
  if (cellSize < 10){
    noStroke();
  }
}

void draw () {
  background (255);
  camera(-200, mouseY,-400,width/2,height/2,0,0,1,0);
  translate (width/2, height/2);
 
  rotateY (frameCount * 0.005);

  for (int x = -200; x < 200; x+= cellSize + .25*cellSize) {
    pushMatrix ();
    for (int z = -200; z < 200; z+= cellSize + .25*cellSize) {

      pushMatrix ();
      translate (x, -100, z); 
      Red = int(red(FM2.get(x + 200,z + 200)));
      fill(Red, 0, 0);
      box (cellSize, Red/4, cellSize);
      
      translate (0, 100, 0);
      Green = int(green(FM2.get(x + 200, z + 200)));
      fill(0, Green, 0);
      box (cellSize, Green/4, cellSize);
      
       translate (0, 100, 0);
      Blue = int(blue(FM2.get(x + 200, z + 200)));
      fill(0, 0, Blue);
      box (cellSize, Blue/4, cellSize);
      
      
      popMatrix ();
      

      
    }
    popMatrix();
  }
}


