
float posY = 250;
float posX = 250;
import gifAnimation.*;

PImage[] animation;
Gif loopingGif;
Gif img;


public void setup() {
  size(500, 500);
  frameRate(50);
  background(0);
  

  // create the GifAnimation object for playback
  loopingGif = new Gif(this, "tree.gif");
  loopingGif.loop();
 img = new Gif(this, "link.gif");
  img.loop();

  // create the PImage array for the interactive display
  animation = Gif.getPImages(this, "tree.gif");
  animation = Gif.getPImages(this, "link.gif");
}

void draw()


{
 float tileCountX = keyCode/10+1;
  float tileCountY = keyCode/10+1;
  float stepX = width/tileCountX;
  float stepY = height/tileCountY;
  for (float gridY = 0; gridY < height; gridY += stepY){   
    for (float gridX = 0; gridX < width; gridX += stepX){
      image(loopingGif, gridX, gridY, stepX, stepY);
      image(img, posX, posY);
    }
  }
}
  
    void keyPressed(){

if(keyCode==UP){
posY -= 10;
}
if(keyCode==DOWN){
posY += 10;
}
if(keyCode==LEFT){
posX -= 10;
}
if(keyCode==RIGHT){
posX += 10;

}
    }
 




