
/* 
* Slideshow_1
* by Juego [http://xux.be]
*
* Photos by Luigi Torreggiani published under Creative Commons Attribution 2.0 Generic 
* http://www.flickr.com/people/torremountain/
*
* shapeTween library by Lee Byron & Golan Levin  
*
*/

import megamu.shapetween.*;
Tween anim1, anim2, anim3;

int nbImages = 5;
PImage[] images = new PImage[nbImages];

int index = 0; 
float centerX, centerY;
int lastPlayed = 0;

void setup(){
  size(640,480);
  centerX = (width/2)-50;
  centerY = (height/2)-10;

  imageMode(CENTER);
  for (int i=0; i < nbImages; i++) {
    images[i] = loadImage("Image_" + i + ".jpg");
    images[i] = makeTransparent( images[i], 50 ); 
  }
  
  anim1 = new Tween(this, 7, Tween.SECONDS, Shaper.COSINE);
  anim1.setPlayMode( Tween.REVERSE_REPEAT );
  
  anim2 = new Tween(this, 11, Tween.SECONDS, Shaper.COSINE);
  anim2.setPlayMode( Tween.REVERSE_REPEAT );
  anim2.seek(0.6);

  anim3 = new Tween(this, 19, Tween.SECONDS, Shaper.COSINE);
  anim3.setPlayMode( Tween.REVERSE_REPEAT );
  anim3.seek(0.3);

}


void draw() {
  image( images[index], centerX+100.0f*anim1.position()*anim3.position(), centerY+20.0f*anim2.position());
  if ( anim3.playCount() != lastPlayed ) {
    lastPlayed = anim3.playCount();
    if (index < nbImages-1) {
      index++;
    } else {
      index=0;
    }
  }
}


//--- Functions ---

PImage makeTransparent(PImage src, int a) {
  int w = src.width;
  int h = src.height;
  PImage tmp = createImage(w, h, ARGB);
  
  tmp.copy(src, 0, 0, w, h, 0, 0, w, h);
  tmp.loadPixels();
  for (int i = 0; i < tmp.pixels.length; i++) {
    color c = tmp.pixels[i];
    tmp.pixels[i] = color( (c >> 16) & 0xFF, (c >> 8) & 0xFF, c & 0xFF, a); 
  }
  tmp.updatePixels();
  
  return tmp;
}

