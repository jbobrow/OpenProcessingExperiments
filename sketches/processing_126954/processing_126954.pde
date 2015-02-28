
PImage img;
PFont apple;
int c;
int eSize = 10;
float X,Y;
float Cx=225, Cy=225;
float Angle = 0;
float R = 200;

void setup(){
  size(450,450);
  noStroke();
  smooth();
  colorMode(HSB,100);
  background(99);
  frameRate(5);
  apple = loadFont("Arial-BoldMT-48.vlw");
  img = loadImage("apple_white.png"); 
  tint(178, 34, 34);
  c = 0;
}

void mousePressed(){
  textFont(apple, 32);
  text("apple", 180, 245);
}

void draw(){
  fill(100);
  for(int y = 0; y <= height; y +=20){
  for(int x = 0; x <= width; x += 20){
    rect(x, y, eSize, eSize);
    }
  }
  
  tint(c);
  image(img, 140, 120, 160, 190);
  
  fade();

  Angle = Angle + 10;
  X = Cx-20 + ( R * cos(radians(Angle)) );
  Y = Cy-20 + ( R * sin(radians(Angle)) );
  if(c >= 50){
     c = 0;
  }
  c = c + 2;
  noStroke();
  fill(70);
  rectMode(CENTER);
  rect(X, Y, 20, 20);
   
  Angle = Angle + 15;
  X = Cx + ( R * cos(radians(Angle)) );
  Y = Cy + ( R * sin(radians(Angle)) );
  if(c >= 50){
     c = 0;
  }
  c = c + 2;
  noStroke();
  fill(70);
  rectMode(CENTER);
  rect(X, Y, 20, 20);   
   
  Angle = Angle + 30;
  X = Cx + ( R * cos(radians(Angle)) );
  Y = Cy + ( R * sin(radians(Angle)) );
  if(c >= 50){
     c = 0;
  }
  c = c + 2;
  noStroke();
  fill(70);
  rectMode(CENTER);
  rect(X, Y, 20, 20);
}

void fade(){
  noStroke();
  fill(99,30);
  rectMode(CORNER);
  rect(0, 0, 450, 450);
} 


