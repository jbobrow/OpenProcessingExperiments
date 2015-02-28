
PImage img;
PImage imag;

void setup(){
  size(500,500);
  img = loadImage("LoveMatt.png");
  imag = loadImage("HPV2.png");
}

void draw (){
  background(imag);

  image(img,0,mouseY * -1);
}


