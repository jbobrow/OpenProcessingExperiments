
PImage myImage;
int vel = 30;


void setup() {
  size(540, 558);
}   

float y = height;
float x = 0;

void draw() {

  myImage = loadImage("mark_ryden_art_basel_0x.jpg");
  background(0, 84, 166);
  image(myImage, 0, 0);

  y = y - 1; 
  if (y < -93) { 
    y = height;
  }  

  myImage = loadImage("baby_bubble.png");
  image(myImage, 289, y);

  x = x + 1; 
  if (x > width) { 
    x = -253;
  }  

  myImage = loadImage("mandrake.png");
  image(myImage, x, 307);

 /* y = y + 1; 
  if (y > height) { 
    y = 0;
  } */

  myImage = loadImage("hand_bubble.png");
  image(myImage, 326, 20);

// y=height;

  // line(0, y, width, y);
} 


