
/* @pjs preload="dog.png,poo1.png"; */
PImage Img1;
PImage Img2;
PImage poocumilator;

void setup() { 
  frameRate(15);
  background(255);
  size(800, 500); 
  smooth(); 
  Img1 = loadImage("dog.png");
  Img2 = loadImage("poo1.png");
  poocumilator = createImage(width,height);
  poocumilator.background(255);
}

void draw() {
   background(255);

  int w=Img2.width;
  int h=Img2.height;
  
  if (mousePressed==true) {
    float a=random(0.5,1.2);
    poocumilator.image(Img2, mouseX+120, mouseY+30,w*a,h*a); 
  }
      image(poocumilator,0,0);
      image(Img1, mouseX, mouseY+20);
}
