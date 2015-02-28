
PImage Background;
PImage flower;
PImage cat1;
PImage cat2;
PFont font;




void setup () {
  size(640,480);
  background(0);
  colorMode(HSB, 360, 100, 100);
  smooth();
  Background= loadImage("background.png");
  flower= loadImage("flower.png");
  cat1= loadImage("cat1.png");
  cat2= loadImage("cat2.png");
  font= loadFont("font.vlw");
}
  
void draw() {
  image( Background,0,0);
  image( flower,0,-330);
  float h= random(0,360);
  float s=100;
  float b=100;
  fill(h,s,b,100);
  rect(-10,-40,700,800);
  

pushMatrix();
  float x = random(0, width - cat1.width);
  float y = random(0, height - cat1.height);
  translate(x + cat1.width/2, y + cat1.height/2);
  float angle = random(0, 45);
  rotate(radians(angle));
  image(cat1, -cat1.width/2, -cat1.height/2);
  popMatrix();
 

pushMatrix();
  x = random(0, width - flower.width);
  y = random(0, height - flower.height);
  translate(x + flower.width/2, y + flower.height/2);
  angle = random(0,45);
  rotate(radians(angle));
  scale(3);
  image(flower, -flower.width/2, -flower.height/2);
  popMatrix();


pushMatrix();  
  textFont(font);
  textSize(65);
  float h1= random(0,360);
  float s1=100;
  float b1=30;
  fill(h1,s1,b1);
  text("CatLover",380,100);
  popMatrix();



  }
  
 
void mousePressed() {
  loop();
}
 
void mouseReleased() {
  noLoop();



}

