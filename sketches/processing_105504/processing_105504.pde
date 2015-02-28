
PImage happy;
PImage lady;
PImage leftice;
PImage rightice;
PImage water;
PImage heart;
boolean chase = true;
int yPos1;
int yPos2;
int yPos3;
int yPos4;


void setup() {
  size(1000, 600);
  happy = loadImage("happy.png");
  lady = loadImage("lady.png");
  leftice = loadImage("leftice.png");
  rightice = loadImage("rightice.png");
  water = loadImage("water.png");
  heart = loadImage("heart.png");
  noStroke();
 
 //her ice
 yPos1 = 310;
yPos2 = 312;

 //his ice
 yPos3 = 410;
yPos4 = 412;

  chase=true;
}


void draw() {
  //bgimage
  image(water, 0, 0);

  //"water
  for (int i = 0; i < 700; i++) {
    fill(35, 144, random(200, 230));
    ellipse (random(width), random(350, 600), 40, 40);
  }

  //her

  image(rightice, mouseX+200, random(yPos1 , yPos2));
  

  //his ice
  image(leftice, mouseX-465,random(yPos3 , yPos4));

  //him
if (mouseY<110) {
    chase = true;
  }
  else {
    chase = false;
  }
  
  

  if (chase == true) {
    image(happy, mouseX, mouseY);
  }
  else {
    image(happy, mouseX-465, 210);
  }

  
  
  for (int i = 0; i < 3; i++){


image (heart, random(0,mouseX), random(350, 450), 20, 21); }
  
  
  
  
  
  
  
  
  
  //end
}



