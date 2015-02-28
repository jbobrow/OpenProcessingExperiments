
PShape s;
PShape f;
PImage i;
float r=0;
float angle;
float t=5;
float k;

void setup(){
  size(600,600);
  smooth();
  noStroke();
  s = loadShape("logo.svg");
  i = loadImage("Cloud.jpg");
  f = loadShape("type.svg");
  frameRate(60);
}

void draw(){
  image(i,0,0);
  
  pushMatrix();
  translate(width/2, height/2+150);
  shape (f, -100, -10, 200, 30);
  popMatrix();
  
  angle += 0.05;
  

  float theta = 2+ (t*k);

  translate(0, theta);
  
   if (mousePressed && mouseButton == LEFT) {
    t+=2;
  }
  
   if (mousePressed && mouseButton == RIGHT) {
  t-=2;
   }
     
   if (keyPressed){
    if (key == 'a'|| key == 'A') {
    k=sin(angle);
  }
  
   if (key == 's'||key == 'S') {
    k=tan(angle);
   }
   }
  pushMatrix();
  translate(width/2, height/2);
//  rotate(radians(r));
  shape(s,-100,-100,200,200);
  popMatrix();
  
  r+=10;
}


