
PImage f1, f2, f3, f5, f6, f7, back;


void setup() {
  background(0);
  size(640,480);
  noLoop();
  //frameRate(1);
}



void draw() {
  back = loadImage("back.jpg");
  image(back, 0, 0, 640, 540);
  float r = random(0, 2*PI);
  float x = random(0, 300);
  float y = random(0, 20);
  float s = random(0.5, 1.0);

  pushMatrix();

  f1 = loadImage("f1.png");
  scale(s);
  rotate(r);
  image(f1, x, y, 150, 150);
  blend(f1, 0, 0, f1.width, f1.height, 
  (int) x,(int)y,(int)(x*f1.width),(int)(f1.height*y),MULTIPLY); 

  translate(x, y);
  scale(s);
  rotate(r);
  f2 = loadImage("f2.png");
  image(f2, 110, 0, 150, 150);  
  blend(f2, 0, 0, f2.width, f2.height, 
  (int) x,(int)y,(int)(x*f2.width),(int)(f2.height*y),MULTIPLY);  

  translate(x, y);
  scale(s);
  rotate(r);
  f3 = loadImage("f3.png");
  image(f3, 110, 0, 150, 150); 
  blend(f3, 0, 0, f3.width, f3.height, 
  (int) x,(int)y,(int)(x*f3.width),(int)(f3.height*y),MULTIPLY); 

  translate(x, y);
  scale(s);
  rotate(r);
  f5 = loadImage("f5.png");
  image(f5, 110, 0, 150, 150);    
  blend(f5, 0, 0, f5.width, f5.height, 
  (int) x,(int)y,(int)(x*f5.width),(int)(f5.height*y),DARKEST);

  translate(x, y);
  scale(s);
  rotate(r);
  f6 = loadImage("f6.png");
  image(f6, 110, 0, 150, 150);     
  blend(f6, 0, 0, f6.width, f6.height, 
  (int) x,(int)y,(int)(x*f6.width),(int)(f6.height*y),DARKEST);

  translate(x, y);
  scale(s);
  rotate(r);
  f7 = loadImage("f7.png");
  blend(f7, 0, 0, f7.width, f7.height, 
  (int) x,(int)y,(int)(x*f7.width),(int)(f7.height*y),LIGHTEST);
  image(f7, 110, 0, 150, 150);

  popMatrix();

  fill(255, 120);
  rect(-5, -5, 645, 485);




  for (int i = 0; i < 641; i = i + 3) {
  float ran1 = random(50.0, 180.0);
  float ran2 = random(300.0, 430.0);
  stroke(255, 400);
  line(i, ran1, i, ran2); 
  }

}//where void draw ends



void mousePressed() {  
  redraw();  
}  

