
//PShape whale;
PImage whale;
float angle;
float disappear;
PImage potstickerwhale;


void setup() {
  size (640,480);
  colorMode(RGB);
  smooth();
  imageMode(CENTER);
  
  
  //whale = loadShape("whale.svg");
  whale = loadImage("whale.png");
  potstickerwhale = loadImage("POTSTICKERWHALE.png");
}

void draw() {
  background(255);
  angle = 0.083333333333333*PI*sin(mouseX*.15);
  println(angle);
  disappear = abs(255*(  mouseX - (width*.5))/ (width*.5));
  
 
  
   pushMatrix();
  translate(width*.5, height*.5);
  rotate(angle);
  tint(255,255,255,255-disappear);
  image(potstickerwhale, 0 , 0);
  popMatrix();
  
    pushMatrix();
  translate(width*.5, height*.5);
  rotate(angle);
  tint(255,255,255,disappear);
  image(whale, 0 , 0);
  popMatrix();
  
  
  
  
}
  
  

