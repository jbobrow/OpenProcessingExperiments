
//GIF Collage filter by Jordan Dozzi
// for gifAnimation library, see: 
// http://www.extrapixel.ch/processing/gifAnimation/

import gifAnimation.*;

//import the gifAnimanton library to use the Gif type objects and their methods

Gif a;
Gif b;
Gif c;
Gif d;
Gif e;
Gif f;
int y = 0;

void setup(){
  size(900,900);
  frameRate(10);
  a = new Gif(this, "one.gif");
  b = new Gif(this, "two.gif");
  c = new Gif(this, "three.gif");
  e = new Gif(this, "five.gif");
  f = new Gif(this, "six.gif");
  
  a.play();
  b.play();
  c.play();
  e.play();
  f.play();
  }

//Draw the Gifs and set the "get" filters for the moving collage

void draw(){
  image(a, 0, 0);
  image(b, 500, 0);
  image(c, 0, 500);
  image(e, 1000, 0);
  image(f, 1000, 500);
  PImage crop = get();
  PImage scramble = get(250, 250, 250, 250);
  PImage hash = get(900,300, 500, 50);
  image (crop, 0, 50);
  image (scramble, 200, 200);
  image (hash, 400, 700);
  
//mouse interactivity filter
  
  y = constrain(mouseY, 0, 1000);
for (int i = 0; i < 1000; i++) {
color c = get(i, y);
stroke(c);
line(i+50, 50, i+50, 70);
}
stroke(255);
line(0, y, 49, y);
}




