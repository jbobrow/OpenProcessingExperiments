
PImage [] images = new PImage [17];
int i=1;

void setup() {
  colorMode(HSB, 100);
  float r = random (0, 100);
  size(480, 676);
  noStroke();
  smooth();

  PImage bg = loadImage("flower10a.jpg");

  for (int i = 1; i<images.length; i++)
  {
    images [i] = loadImage (i+".png");
  }

  frameRate(1.5);
  imageMode(CENTER);
  image(bg, width/2, height/2);

  noFill();
  strokeWeight(20);
  stroke(r, 30, 100, 50);
  quad(40, 40, width-40, 40, width-40, height-40, 40, height-40);

}


void draw() {

  float offsetA = random(0, width);
  float offsetB = random(0, height);
  float offsetX = random(125, 170);

  float r = random (0, 360);
  color c = color(r, 30, 100);
  tint(c);


  image(images [(int)random(1, 17)], offsetA, offsetB, offsetX, offsetX); 

  noFill();
  strokeWeight(20);
  stroke(r, 30, 100, 10);
  quad(40, 40, width-40, 40, width-40, height-40, 40, height-40);

  noTint();
  noStroke();
}



