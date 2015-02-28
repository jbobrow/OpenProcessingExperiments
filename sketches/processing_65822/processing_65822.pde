
PImage tree;
PImage man;
PImage man2;
PImage manDirection;
PImage lake;
PImage fish;
PImage lion;

float xPos = 0;
float xPos_2 = 350;
float xPos_3 = 0;
float speed = 5;

int direction = 1;

void setup() {
  size(600,300);
  smooth();
  rectMode(CENTER);
  imageMode(CENTER);
  frameRate(600);
  
    tree = loadImage("tree.png");
    lake = loadImage("lake.png");
    fish = loadImage("fish.png");
    lion = loadImage("lion.png");
    man = loadImage("man.png");
    man2 = loadImage("man2.png");
    manDirection = loadImage("manDirection.png");


}

void draw() {
  background(0);
  
  xPos += speed;
  
  image(tree,width/2,height/2,600,300);
  
  image(man, xPos, 240, 50, 176);
  
  if (xPos >= 600 + 50) {
  image(lake,width/2,height/2,600,300);
  image(fish,xPos_2,140,500,248);
  xPos_2 += speed;
  }
  
  if (xPos_2 > width + 250) {
    image(lion, 300, 150, 600, 300);
    xPos_3 += speed * direction;
  } 
    
  if (xPos_3 >= 125) {
    direction = -direction;
  }  
    
  if ((direction == 1) && (xPos_3 >= 1))  {
    image(man2, xPos_3, 240, 50, 176);
  } else if (xPos_3 >= 1) {
    image(manDirection, xPos_3, 240, 50, 176);
    xPos_3 -= speed * 5;
  }
  


}

