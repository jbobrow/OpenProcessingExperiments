
//draw garden
// draw flowers on mouse pressed below predtermined horizontal point, 
//draw clouds above that line

//PImage grass;
//PImage flower1;
//PImage flower2;
//PImage flower3;
//PImage flower4;
//PImage flower5;
//PImage flower6;
//PImage flower7;

int numFlowers = 7; //int[] flower = new int[7];
int numClouds = 5; //int[] clouds = new int[7];
PImage[] flower_image= new PImage[numFlowers];
PImage[] cloud_image= new PImage[numClouds];
PImage grass;


void setup() {
  frameRate(3);
  size(800, 600);
  PImage bg;
  bg = loadImage("CodeFinal_bg.jpg");
  image(bg, 0, 0);
  grass = loadImage("grass.png");
  //noLoop();

  flower_image[0] = loadImage("flower1.png");
  flower_image[1] = loadImage("flower2.png");
  flower_image[2] = loadImage("flower3.png");
  flower_image[3] = loadImage("flower4.png");
  flower_image[4] = loadImage("flower5.png");
  flower_image[5] = loadImage("flower6.png");
  flower_image[6] = loadImage("flower7.png");
  
  cloud_image[0] = loadImage("cloud1.png");
  cloud_image[1] = loadImage("cloud2.png");
  cloud_image[2] = loadImage("cloud3.png");
  cloud_image[3] = loadImage("cloud4.png");
  cloud_image[4] = loadImage("cloud5.png");
}

void draw() {
  
  for  (int i = 0; i < 10; i = i +1) {
    image (grass, random(width), random (350, 600));
  }
}

void mouseClicked() {

  if (mouseY < 250) {
  image (cloud_image[int(random(numClouds))], mouseX + (-85), mouseY + (-30));
  }
  else {
  image (flower_image[int(random(numFlowers))], mouseX +(-20), mouseY + (-30));

  }
}


