
import ddf.minim.*;

/*
  - With this sketch, I pretend to show a free manipulation 
  using the palette of colors of the current image viewed.
  - The user can make changes over the current image viewed,  
  just by moving the mouse, at the same time automatically, 
  a rainy amount of colors based on the pallete is spread 
  over the image.
  - If the user press the mouse button, a music composition
  will be played (Made on Soundation)
  
  keys:
  
  0-9: changes background image
  backspace/delete: undo all modifications
  s or S: take a screenshot  
  Mouse Button: plays the music

*/

/* @pjs preload="01.jpg"; */
/* @pjs preload="02.jpg"; */
/* @pjs preload="03.jpg"; */
/* @pjs preload="04.jpg"; */
/* @pjs preload="05.jpg"; */
/* @pjs preload="06.jpg"; */
/* @pjs preload="07.jpg"; */
/* @pjs preload="08.jpg"; */
/* @pjs preload="09.jpg"; */
/* @pjs preload="10.jpg"; */

PImage photo;
String [] images = {"01.jpg", "02.jpg", "03.jpg", "04.jpg",
"05.jpg", "06.jpg", "07.jpg", "08.jpg", "09.jpg", "10.jpg"};
int sizeImg;
Minim minim;
AudioSample sound_1, sound_2, sound_3;
AudioPlayer music;
int len;

void setup() {
  size(800, 600);
  photo = loadImage(images[int(random(10))]);
  photo.loadPixels();
  image(photo, 0, 0);
  sizeImg = width * height;
  minim = new Minim(this);
  sound_1 = minim.loadSample("01.mp3");
  sound_2 = minim.loadSample("02.mp3");  
  sound_3 = minim.loadSample("03.mp3");
  music = minim.loadFile("04.mp3", 512); 
  music.cue(music.length());
  len = music.position();
  music.cue(0);
}

void draw() {
  int pixelColor = int(random(sizeImg));
  int rndX = int(random(width));
  int rndY = int(random(height));  
  color c = photo.pixels[pixelColor];
  stroke(c);
  strokeWeight(int(random(10)));
  point(rndX, rndY);
  
  noStroke();
  fill(c, 50);
  pushMatrix();
  translate(mouseX, mouseY);
  rotate(frameCount / -20.0);
  star(0, 0, 15, 35, 5); 
  popMatrix(); 
  if(mousePressed) {
    music.play();
    if(music.position()==len) music.rewind();
  } else {
    music.pause();
  }
}

void keyReleased() {
  if(key == DELETE || key == BACKSPACE){ 
    image(photo, 0, 0);   
    sound_2.trigger();
  }
  if(key == 's' || key == 'S'){ 
    sound_3.trigger();
    //saveFrame("screenshot.png"); This function has been disabled for web usage
  }
  switch(key){
    case '1':
    case '2':
    case '3':
    case '4':
    case '5':
    case '6':
    case '7':
    case '8':
    case '9':
    case '0':
    photo = loadImage(images[Character.getNumericValue(key)]);
    photo.loadPixels();
    image(photo, 0, 0);
    sound_1.trigger();    
    break;    
  }
}

void stop() {
  music.close();
  minim.stop();
  super.stop();
}

// Courtesy of http://processing.org/examples/star.html

void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}


