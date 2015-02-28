
PImage img, img2, img3;
float rotation = 0;
float angleObject = 360 / 10;

void setup() {
  size(1000, 1000);
  img = loadImage("final.png"); //the file has to be in the same folder 
  img2=loadImage("tatesun.png");
  img3= loadImage("zoe.png");
  imageMode(CORNER);
}



void draw() {
  background(random(255), random(255), random(150, 255));
  rotation+=10;
  imageMode(CORNER);
  for (int i=0; i<10; i++ )
  {
    pushMatrix();
    translate(500, 500);
    rotate(radians(i*angleObject +rotation));
    image(img, 0, 0);
    popMatrix();
  }

  imageMode(CENTER);

  pushMatrix();
  translate(500, 500);
  scale(.50);
  rotate(radians(rotation));
  image(img2, 0, 0);
  popMatrix();
  
  if (mousePressed)
{
  imageMode(CORNER);
  image(img3, 0, 0);
}

}




