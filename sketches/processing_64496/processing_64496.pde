
PImage chaos;
PImage C;
PImage H;
PImage A;
PImage O;
PImage S;

float xpos, ypos;

void setup() {
  size(600, 600);
  smooth();
  
  chaos = loadImage("chaos.png");
  C = loadImage("C.png");
  H = loadImage("H.png");
  A = loadImage("A.png");
  O = loadImage("O.png");
  S = loadImage("S.png");
  
  imageMode(CENTER);
  
  xpos = width/2;
  ypos = height/2;
}

void draw() {
 background (210);
 
 image(chaos, xpos, ypos);

 float c = random(255);

 if((mouseX>=250) && (mouseX<=350) && (mouseY>= 280) && (mouseY<=320)) {
  background(255, c, c);
  
  tint( 255, c, c, 100);
  image(C, random(width), random(height), random(10, 500), random(10, 500));
  image(S, random(width), random(height), random(10, 500), random(10, 500));
  
  tint( 255, c, c, 100);
  image(H, random(width), random(height), random(10, 500), random(10, 500));
  
  tint( c, 30, 30);
  image(H, random(width), random(height), random(10, 500), random(10, 500));
  image(H, random(width), random(height), random(10, 500), random(10, 500));
  
  tint( c, 40, 40);
  image(O, random(width), random(height), random(10, 500), random(10, 500));
  image(H, random(width), random(height), random(10, 500), random(10, 500));
  
  tint( 255, c, c);
  image(S, random(width), random(height), random(10, 500), random(10, 500));
  image(O, random(width), random(height), random(10, 500), random(10, 500));
  
  
 } 
}

