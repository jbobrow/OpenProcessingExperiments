
// mouse interaction codes used from Generative Gestaltung, ISBN: 978-3-87439-759-9


// imports the capability to animate .gif files
import gifAnimation.*;

PImage[] animation;
Gif loopingGif;

// setting up static elements
public void setup() {
  size(500, 500);
  frameRate(50);
  background(0);
  //allows the .gif to loop forever as long as the sketch is running
  println("gifAnimation " + Gif.version());
  // create the GifAnimation object for playback
  loopingGif = new Gif(this, "skullglow.gif");
  loopingGif.loop();

  // create the PImage array for the interactive display
  animation = Gif.getPImages(this, "skullglow.gif");
}

void draw()

// enables the ability to multiply and subtract the amount and size of the .gif by sensing X and Y mouse movements
{
 float tileCountX = mouseX/3+1;
  float tileCountY = mouseY/3+1;
  float stepX = width/tileCountX;
  float stepY = height/tileCountY;
  for (float gridY = 0; gridY < height; gridY += stepY){
    for (float gridX = 0; gridX < width; gridX += stepX){
      image(loopingGif, gridX, gridY, stepX, stepY);
    }
  }
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}



