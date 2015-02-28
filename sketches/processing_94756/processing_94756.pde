
import java.util.List; //Imports the list utility.
import gifAnimation.*;

List <img> images = new ArrayList(); //Makes an image array list.


Gif allFrames;
Gif loopingGif;
Gif nonLoopingGif;

public void setup() {
  size(1680, 1050);
  smooth();
  allFrames = new Gif(this, "gifstreisand.gif");
  allFrames.loop();
  frameRate(100);
  imageMode(CENTER);
}


void draw() {
  background(255);
  for (img i: images) { //Cycles through every instance of the image.
    i.display(); //Calls the display function to display each instance.

  }
}

void mouseMoved() {
  images.add(new img()); //Adds new instance.
   images.add(new img()); //Adds new instance.
    images.add(new img()); //Adds new instance.
     images.add(new img()); //Adds new instance.
}

class img { //Image class.;
  int x; //Declares position x.
  int y; //Declares position y.
  img() {
    x = int(random(width)); //Defines position x.
    y = int(random(height)); //Defines position y.
  }

  void display() {
    image(allFrames, x, y, 70, 70); //Displays your image.
   

  }
}


