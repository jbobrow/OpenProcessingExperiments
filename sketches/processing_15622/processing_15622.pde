
PImage cloud1;
PImage cloud2;
PImage cloud3;
PImage cloud4;

float x1 = 50;
float speed1 = 0.6;
float x2 = 450;
float speed2 = 0.5;
float x3 = 350;
float speed3 = 0.25;
float x4 = 200;
float speed4 = .4;

void setup(){
 size (600,700);
 smooth();
 frameRate(70);
 cloud1 = loadImage ("cloud1.png");
 cloud2 = loadImage ("cloud2.png");
 cloud3 = loadImage ("cloud3.png");
 cloud4 = loadImage ("cloud4.png");
 
}

void draw (){
  background (40,40,40);
  x3 -= speed3;
  if (x3 < -375){
    x3 = 800;
  }
image(cloud3, x3, 12);  

  x4 -= speed4;
  if (x4< -300){
    x4 = 800;
  }
  image (cloud4, x4, 10);

  x2 += speed2;
  if (x2> width+225){
    x2 = -100;
  }
  image (cloud2, x2, 20);
  
  x1 += speed1;
  if (x1> width+100){
    x1= -100;
  }
  image(cloud1,x1, 80);
  
}

