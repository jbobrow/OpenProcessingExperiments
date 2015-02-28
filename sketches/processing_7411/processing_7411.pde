
PImage emotion1;
PImage emotion2;
PImage emotion3;
PImage emotion4;
PImage emotion5;
PImage emotion6;
PImage emotion7;
PImage emotion8;
PImage emotion9;
PImage emotion10;
PFont amtype;

float x, y, r, s;

void setup() {
  size(640, 480); 
  background(155);
  smooth();
  
  amtype = loadFont("AmericanTypewriter-48.vlw");
  textFont(amtype);
  textSize(48);
  
  emotion1 = loadImage("emotion1.jpg");
  emotion2 = loadImage("emotion2.jpg");
  emotion3 = loadImage("emotion3.jpg");
  emotion4 = loadImage("emotion4.jpg");
  emotion5 = loadImage("emotion5.jpg");
  emotion6 = loadImage("emotion6.jpg");
  emotion7 = loadImage("emotion7.jpg");
  emotion8 = loadImage("emotion8.jpg");
  emotion9 = loadImage("emotion9.jpg");
  emotion10 = loadImage("emotion10.jpg");
  
  noLoop();
}

void draw() {
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  s = random(1, 4);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  image(emotion1, -emotion1.width/2, -emotion1.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  s = random(1, 4);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  image(emotion2, -emotion2.width/2, -emotion2.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  s = random(1, 4);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  image(emotion3, -emotion3.width/2, -emotion3.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  s = random(1, 4);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  image(emotion4, -emotion4.width/2, -emotion4.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  s = random(1, 4);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  image(emotion5, -emotion5.width/2, -emotion5.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  s = random(1, 4);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  image(emotion6, -emotion6.width/2, -emotion6.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  s = random(1, 4);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  image(emotion7, -emotion7.width/2, -emotion7.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  s = random(1, 4);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  image(emotion8, -emotion8.width/2, -emotion8.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  s = random(1, 4);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  image(emotion9, -emotion9.width/2, -emotion9.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  s = random(1, 4);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  image(emotion10, -emotion10.width/2, -emotion10.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  s = random(1, 4);
  pushMatrix();
  translate(x, y);
  rotate(r);
  fill(255, 0, 0);
  text("emotions", x, y, width, height);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  s = random(1, 4);
  pushMatrix();
  translate(x, y);
  rotate(r);
  fill(255);
  text("full", x, y, width, height);
  popMatrix();
  
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  s = random(1, 4);
  pushMatrix();
  translate(x, y);
  rotate(r);
  fill(255);
  text("of", x, y, width, height);
  popMatrix();
}

void mousePressed() { 
  redraw(); 
  background(155);
} 

