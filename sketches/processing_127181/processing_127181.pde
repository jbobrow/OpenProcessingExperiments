
/*@pjs preload="apple_white.png";*/
PImage img;

//program setup
void setup() {
  size(450, 450);
  background(0);
  smooth();
  imageMode(CENTER);
  img = loadImage("apple_white.png");
  frameRate(10);
}

//apple loop
void draw() {
  int x =int(random(width));
  int y =int(random(height));
  color c = getRandomColor();
  drawApple(x,y,c);
  fadeToWhite();
}

//randome color 
color getRandomColor(){
  colorMode(HSB,360,100,100);
color c = color(random(30,360),45,100);
  return c;
}

//draw apple setup
void drawApple(float appleX, float appleY ,color appleColor){
  tint(appleColor);
  image(img,appleX,appleY,180,180);
}

//fadeout
void fadeToWhite() {
  noStroke();
  fill(255,35);
  rectMode(CORNER);
  rect(0, 0, width, height);
}

//loop stop
void mousePressed() {
  noLoop();
//background  
  for(int y = 0; y < 450; y++){
  for(int x = 0; x < 450 ; x++){
    fill(30*x, 5+y*4, 100);
    rect(x*50, y*50, 50, 50);
  }
 }
 //apple logo
 PFont font = loadFont("AppleSDGothicNeo-Bold-170.vlw");
  textFont(font);
  fill(200, 255);
  textAlign(CENTER);
  textSize(random(150, 150));
  float x = (225);
  float y = (400);
  text("Apple", x,y);
//apple  
  image( img, 225, 200, 180, 180 ); 
}

//loop start
void mouseReleased() {
  loop();        
}




