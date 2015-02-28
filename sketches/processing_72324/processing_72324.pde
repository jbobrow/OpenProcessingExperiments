
PImage spoon;
PImage yellow;
PImage plate;
float deg;

void setup(){
  size (500, 388);
  //background (255,100,100);
  spoon = loadImage ("spoon.png");
  yellow = loadImage ("yellow.png");
  plate = loadImage ("plate.png");
  image (yellow,0,0);
  image (plate,50.5,42);
  deg = 0.0;
}

void draw(){
  if (mousePressed == true) {
    
    image(yellow,0,0);
    image(plate,50.5,42);
    
    pushMatrix();
    //translate (width/2,height/2);
    translate (mouseX,mouseY);
    deg+=3;
    float rad = radians(deg);
    rotate(rad);
    //background (random(255),100,100);
    imageMode(CORNER);
    image (spoon,mouseX-255,mouseY-194);
    popMatrix();
    
    
    
    
    
    
    
  } else {
    
    image(yellow,0,0);
    image(plate,50.5,42);
    
    imageMode(CORNER);
    image (spoon,mouseX,mouseY);
    
  }}

