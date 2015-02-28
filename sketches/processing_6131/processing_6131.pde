
int counter= 0;
PImage myImage;

void setup() {
  size(600,600);
  
}

void draw() {
  background(0);
  myImage = loadImage("final.jpg");
  image(myImage, mouseX, mouseY);
  tint(random (255), random (255), random (255), random(50));
}

void mousePressed(){
  save("naturelabscreenshot"+counter+".jpg");
counter= counter+1;
}

