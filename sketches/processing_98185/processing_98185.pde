
//Charlotte Lim
//Week 7 homework
//"Collage"

PImage bg;
PImage bird;
PImage beiber;


void setup(){
  
  size(800, 480);
  
  //loading images
  bg = loadImage("bg.png");
  bird = loadImage("bird.png");
  beiber = loadImage("beiber.png");
  image(bg, 0, 0);
}

void draw(){  
  
  tint(255, 130);
  
  int x = int(random(0, 800));
  int y = int(random(0, 480));
  
  //randomly 'collages' Twitter birds upon mouse press
  if (mousePressed){
    image(bird, x, y);
  }
  if (keyPressed){
    image(beiber, x, y);
  }
}


