
PImage img; 

void setup() {
  size(600, 600);
  img=loadImage("building01.png");
}

void draw() {
  colorMode(HSB, 360, 100, 100);

  float hueBackground=map(mouseX, 0, width, 0, 360);
  background(hueBackground, 100, 100);

  image(img, 0, 0, width, height);
  if(mousePressed){
    float hueImage=random(0,360);
    tint(hueImage,100,100);
    image(img,0,0,width,height);
  }
}

