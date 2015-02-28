
PImage cloud, back, img1, img2;

int i =1;

void setup() {
  size(600, 600);
  sky = loadImage("sky.png");
  clouds = loadImage("clouds.png");
  img1 = loadImage("birdA.png");
  img2 = loadImage("birdB.png");
  
  frameRate(10);


}

void draw() {

  image(sky, 0, 0, width, height);
  
  int x1 = ((5*frameCount) %width)-120;
  int x2 = width-((5*frameCount)%(width+170));
  image(clouds, x1, 100, 240, 120);
  image(clouds, x2, 400, 350, 170);
  
  if ( i < 3 ) image(img1, mouseX -50, mouseY-50, width/4, height/4);
  else  image(img2, mouseX -50, mouseY-50, width/4, height/4);
  
  if ( i < 6 ) i ++;
  else i = 1;

}


