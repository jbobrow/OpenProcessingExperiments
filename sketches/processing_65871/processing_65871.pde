
PFont font; 

PImage Bird1;
PImage Bird2;
PImage Flower;
PImage Pinkworm;
PImage Grass;
 
 
void setup() {
  size(480, 640);
  smooth();
  
  font = loadFont("Georgia-48.vlw");
  textFont(font);
  
  Bird1 = loadImage("Bird1.png");
  Bird2 = loadImage("Bird2.png");
  Flower = loadImage("Flower.png");
  Pinkworm = loadImage("Pinkworm.png"); 
  Grass = loadImage("Grass.png");
  
  frameRate(1);
  imageMode(CENTER);
}

   
void draw() {
  background(0);
  
  float x = random(width);
  float y = random(height);
  float x2 = random(width);
  float y2 = random(height);
  float d = random(100, 300);

//Bird1
float B1 = random(240, 100);

//Bird2
float B2 = random(420, 300);

//Flower
float F = random(200, 400);

//Pinkworm
float W = random(80, 100);


    
  image(Grass, 240, 320, width, height);
  image(Bird1, x2, y2, B1, B1);
  image(Bird2, d, y+400, B2, B2);
  image(Flower, x, y, F, F);
  image(Pinkworm, x*3, y*2, W*1.25, W);

  textSize(36);
  text("Early bird get's the worm.", 550, 50);
    
}

