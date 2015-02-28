
//Dinosaur silhouette cut out from a Shutterstock image.
//Background + photo elements sourced from Google Search!

PImage bg;
PImage dino;
PImage c1, c2, c3, c4, c5, c6, c7, c8;

float x = random(width);
float y = random(height);

void setup() {
  size(1200, 800);
  background(255);
  smooth();
  frameRate(1);

  bg = loadImage("dirtbg.png");
  dino = loadImage("dino.png");
  
  //Collage Images
  c1 = loadImage("1donuts.png");
  c2 = loadImage("2sandcastle.png");
  c3 = loadImage("3vangogh.png");
  c4 = loadImage("4cheese.png");
  c5 = loadImage("5rainboots.png");
  c6 = loadImage("6truck.png");
  c7 = loadImage("7sun.png");
  c8 = loadImage("8corn.png");

  //Background
  image(bg, 0, 0);
}

void draw() {

  pushMatrix();
  float x = random(0, width-c1.width);
  float y = random(0, height-c1.height);
  translate(x+c1.width/3, y +c1.height/3);
  float angle = random(0, 90);
  rotate(radians(angle));
  image(c1, -c1.width/3, -c1.height/3);
  popMatrix();

  pushMatrix();
  x = random(0, width-c2.width);
  y = random(0, height-c2.height);
  translate(x+c2.width/2, y+c2.height/2);
  rotate(radians(30));
  image(c2, -c2.width/2, -c2.height/2);
  popMatrix();
  
  image(c5,x*width,y);
  image(c6,x,y);
  
  image(c7,x*width/2,y);
  image(c8,x,y);
  
  pushMatrix();
  x = random(0, width-c4.width);
  y = random(0, height-c4.height);
  translate(x+c2.width/2, y+c4.height/2);
  rotate(radians(30));
  image(c4, -c4.width/2, -c4.height/2);
  popMatrix();

  pushMatrix();
  x = random(0, width-c3.width);
  y = random(0, height-c3.height);
  translate(x+c3.width/2, y+c3.height/2);
  rotate(radians(random(0,45)));
  image(c3, -c3.width/2, -c3.height/2);
  popMatrix(); 
  
  //MUST BE LAST THING
  image(dino, 0, 0);
}



