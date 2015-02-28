
PImage f1;
PImage f2;
PImage f3;
PImage f4;
PImage f5;
PImage f6;
PImage f7;
PImage f8;
PImage f9;
PImage f10;
PImage f11;
PImage f12;
PImage f13;
PImage f14;
PImage f15;

void setup() {
  size(640,480);
  smooth();
  noLoop();
  f1 = loadImage("f1.png");
  f2 = loadImage("f2.png");
  f3 = loadImage("f3.png");
  f4 = loadImage("f4.png");
  f5 = loadImage("f5.png");
  f6 = loadImage("f6.png");
  f7 = loadImage("f7.png");
  f8 = loadImage("f8.png");
  f9 = loadImage("f9.png");
  f10 = loadImage("f10.png");
  f11 = loadImage("f11.png");
  f12 = loadImage("f12.png");
  f13 = loadImage("f13.png");
  f14 = loadImage("f14.png");
  f15 = loadImage("f15.png");
  noFill();
}

void draw() {
  background(38,41,29);
  
  stroke(255,20);
  
  float a = random(width);
  float b = random(height);
  strokeWeight(2);
  ellipse(a,b,100,100);
  strokeWeight(15);
  ellipse(a,b,70,70);
  
  float c = random(width);
  float d = random(height);
  ellipse(c,d,80,80);
  strokeWeight(2*1.5);
  ellipse(c,d,100*1.5,100*1.5);
  strokeWeight(15*1.5);
  ellipse(c,d,70*1.5,70*1.5);
  
  float e = random(width);
  float f = random(height);
  strokeWeight(1);
  ellipse(e,f,45,45);
  ellipse(e,f,80,80);
  strokeWeight(8);
  ellipse(e,f,60,60);
  
  float m = random(width);
  float n = random(height);
  strokeWeight(2);
  ellipse(m,n,100,100);
  strokeWeight(15);
  ellipse(m,n,70,70);
  
  stroke(0,20);
  
  float g = random(width);
  float h = random(height);
  strokeWeight(2);
  ellipse(g,h,100,100);
  strokeWeight(15);
  ellipse(g,h,70,70);
  
  float i = random(width);
  float j = random(height);
  ellipse(i,j,80,80);
  strokeWeight(2*1.5);
  ellipse(i,j,100*1.5,100*1.5);
  strokeWeight(15*1.5);
  ellipse(i,j,70*1.5,70*1.5);
  
  float k = random(width);
  float l = random(height);
  strokeWeight(1);
  ellipse(k,l,45,45);
  ellipse(k,l,80,80);
  strokeWeight(8);
  ellipse(k,l,60,60);
  
  pushMatrix();
  translate(-100,-100);
  image(f1,random(width),random(height));
  image(f3,random(width),random(height));
  image(f4,random(width),random(height));
  image(f5,random(width),random(height));
  image(f6,random(width),random(height));
  image(f7,random(width),random(height));
  image(f9,random(width),random(height));
  image(f10,random(width),random(height));
  image(f11,random(width),random(height));
  image(f12,random(width),random(height));
  image(f13,random(width),random(height));
  image(f14,random(width),random(height));
  image(f15,random(width),random(height));
  pushMatrix();

}

void mousePressed(){
  redraw();
}


