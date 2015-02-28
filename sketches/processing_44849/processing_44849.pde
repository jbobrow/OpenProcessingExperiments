
PImage img;
PImage img2;
int x = 0;
int y = 0;

void setup(){
  size(800,533);
  img=loadImage("toothbrush2.jpg");
  img2=loadImage("toothpaste.png");
 
}

void draw(){
  smooth();

fill(29, 213, 222);


 image(img, 0,0);
 image(img2,mouseX-150,mouseY-100);

 
  if (mousePressed==true) {
    noStroke();
    ellipse(mouseX+275, mouseY+260, 40, 40);
  }
}

