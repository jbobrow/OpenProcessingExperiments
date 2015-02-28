
PImage bkgB;
PImage bkgA;
PImage logo;

int bkgTimer = 0;

float bkgRotation = 0;

void setup(){

  size(500, 200);
  
  bkgA = loadImage("bkga.png");
  bkgB = loadImage("bkgb.png");
  logo = loadImage("logo.png");
  
}

void draw(){
  
  image(bkgB, 0, 0);

  pushMatrix();

  translate(width/2, height/2);
  rotate(radians(bkgRotation));
  image(bkgA, -bkgA.width/2, -bkgA.height/2);

  bkgTimer++;

  if (bkgTimer >= 0) { 
    bkgRotation = bkgTimer/3;
  }

  popMatrix();
  
image(logo, 0, 0);


}


