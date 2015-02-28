

PImage Man;
PImage plane;
PImage skyline2;
PImage tank;
PImage big;
PImage small;
PImage Woman;
float WomanX= 420;
float tankX= 420;
float skylineX;

void setup()  {
  size(640, 480);
  smooth();
  Man= loadImage ("Man.png");
  plane= loadImage ("plane.png");
  skyline2= loadImage ("skyline2.png");
  tank= loadImage ("tank.png");
  big= loadImage ("big.png");
  small= loadImage ("small.png");
  Woman= loadImage ("Woman.png");
  WomanX= random(0,420);
  tankX= random(0,420);
  skylineX= random(0,420);
 
}

void draw() {
  smooth();
  image(skyline2, skylineX, 320);
  image(tank, tankX, 422);
  image(Woman, WomanX, 0);
 
  float r= random(0,40);
  if (r>5) 
  scale(sin(radians(frameCount + .05)));
  translate( mouseX,mouseY);
  image(Man, 320 ,240);
  translate( mouseX,mouseY);
  rotate(radians(frameCount + 4));
  image(plane, 450, 320);
  
  image(skyline2, 100, 100); 
  image(tank, 100, 100); 
  image(big, mouseX, mouseY);
  image(small, mouseX,mouseY);
  
  
}
  

