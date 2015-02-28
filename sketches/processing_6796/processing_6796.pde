
//Image taken from http://www.flickr.com/photos/webtreatsetc/4209587931/
// "Webtreatsetc Abstract Warped Dots Seamless Patterns 1"
// by user webtreats

import ddf.minim.*;

AudioPlayer player;
Minim minim;
int imageCount = 14;

PImage pattern,prevImg,silhouette;
int randomX1,randomX2,randomY1,randomY2,imageNum,prevSecond;

void setup()
{
  prevSecond=second();
  minim = new Minim(this);
  player = minim.loadFile("4-28 28 Ghosts IV.mp3", 2048);
  player.loop();
  pattern = loadImage("Pattern.jpg");
  pattern.resize(pattern.width,pattern.height);
  size(pattern.width,pattern.height);
  image(pattern,0,0);
  prevImg= get(0,0,width,height);
  imageNum = 1+int(random(imageCount));
        silhouette = loadImage(imageNum+".png");
  frameRate(5);
}

void draw()
{
    image(prevImg,0,0);
    randomX1 = 50*int(random(10));  
    randomX2 = 50*int(random(10));
    randomY1 = 50*int(random(10));
    randomY2 = 50*int(random(10));
    PImage area1 = get(randomX1,randomY1,50,50);
    PImage area2 = get(randomX2,randomY2,50,50);
    image(area2,randomX1,randomY1);
    image(area1,randomX2,randomY2);
    prevImg= get(0,0,width,height);
    if((second()%3==0)&&(second()!=prevSecond))
    {
      prevSecond=second();
      imageNum = 1+int(random(imageCount));
      silhouette = loadImage(imageNum+".png");
    }
    image(silhouette,0,0);
}

void stop()
{
  // always close Minim audio classes when you are done with them
  player.close();
  minim.stop();
  
  super.stop();
}

