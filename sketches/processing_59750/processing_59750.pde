
PImage imagem; 
PImage imagem2;
int numero;
PFont fonte;
PFont fonte2;
Boolean einstein;




void setup() {
  background(255);
  size (600, 900);
  numero=30;
  einstein=false;
  imagem=loadImage("e1.jpg");
  imagem2=loadImage("e2.jpg");
  frameRate(5);
  fonte=loadFont("MyriadWebPro-Bold-48.vlw");
  fonte2=loadFont ("MyriadWebPro-Italic-48.vlw");
}

void draw() {
  //colorMode(HSB,10,10,10);
  float r=random(255);
  float b=random(255);
  float g=random(255);
 // float a=random(100);
  if (einstein==false) {
  image (imagem, 50, 50);
 einstein=true;
  } else {
tint (r, g, b);
  image (imagem2, 50, 50);
  einstein=false;
  };
  textFont(fonte);
  text ("EINSTEIN", 300, 450);
  textFont (fonte2);
  text ("NEVERDIE", 300, 490);
  //fill(255,a);
  //ellipse (300,300,20,20);
}


