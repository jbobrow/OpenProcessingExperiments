
/*

Creative Flame

A REALLY small sketch based on this "Simple Desktop" wallpaper : 
http://simpledesktops.com/browse/desktops/2012/jul/28/creative-flame/

The trick here is encoding the image so I don't have to worry about image preloading (http://processingjs.org/reference/loadImage_/)

*/

PGraphics bufferSprite, bufferFire;
PImage fireSprite;
float pct;

void setup(){
  size(640, 360);
  
  fireSprite = loadImage("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABaCAIAAACHRsd0AAAAAXNSR0IArs4c6QAAAAZiS0dEAP8A/wD/oL2nkwAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0SU1FB9wIARENKcscdTYAAAFbSURBVHja7ZoxTsMwFIZtN02DkooBxg6VGBArF+AArD1Fr8HWjYF7cI5K5QJdKnUqUjaEBEkxa5f3VNxgOer3b9GTnHx6v/3HiW1ZluaP+siupFLV1iaunOm5AAAAAAAAOEk2IMjoAAAHyg4vFq6cuyKd9xwsBEDsOdCVYm4Y6EAUKS1lEgOQ4stc56sQc4Bl9BgzhBkMC5HEx0ixFhYCAIDzXIX0PFLkR9Z++dSX0e/70GGXzAEAAAAAAAA6CzIlbv2Fbe4GUjV/2kil/arav14H3FHaEmAhAAAAAIAzDzIlO5SNlS2a/HZLBwAAAAAAAEh5R5ZN38XaxJsHK1aVD6fDQTwAd/kp1kbG3NiQG1Y/WAgAAAAAoCdB9h/S//AFnFZRAWZKoKqjPotP6dY+f2uxEAAAAAAAAF0lo3L0WDtTM23My06sPk6kyritfa874LEQAAAAAEBS+gXVX0Ar1x59kgAAAABJRU5ErkJggg==");
  
  bufferSprite = createGraphics(64, 90);
  frameRate(8);
}

void flipFire(PGraphics bs){
  if(frameCount % 4 == 0) pct = -1;
  else pct = 1;

  bs.beginDraw();
  //Flip accordingly
  if(pct <= 0){
    bs.scale(-1, 1);
    bs.image(fireSprite, -fireSprite.width, 0);
  } else {
    bs.scale(1);
    bs.image(fireSprite, 0, 0);
  }
  
  bs.endDraw();
}

void draw() {
  background(0);
  flipFire(bufferSprite);
  image(bufferSprite, width/2-bufferSprite.width/2, height/2-bufferSprite.height/2);  
}
