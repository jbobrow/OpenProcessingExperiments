
void setup() {
  size(500,374);
}

void draw(){
  frameRate(30);
  
if (mousePressed==true) {
PImage img;
img =loadImage ("meat.jpg");
image(img,0,0);
}

else {
  PImage img;
img =loadImage ("calf.jpg");
image(img,0,0);
}
}

