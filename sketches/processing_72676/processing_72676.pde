
void setup(){
size(500, 750);
background(153);
PImage img;
img = loadImage("Open.JPG");
image(img, 0, 0);
int value = 0;
}
void draw(){
}
void mousePressed(){PImage img;
img = loadImage("Closed.JPG");
image(img, 0, 0);}
int value = 0; {
  if(value == 0) {
    value = 255;
  } else {
    value = 0;
  }
}


