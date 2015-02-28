
PImage dropAcid;

int posX;
int posY;

float radius = 0.27;

float deg;

void setup() {
  size(500,640);
  dropAcid = loadImage("tumblr_mb0w4aMlnm1qaabkvo1_500.jpg");
  
  posX = 0;
  posY = 0;
  
  smooth();
  strokeWeight(10);
  background(255);
  
  deg = 0.0;

}

void draw() {
  
  background(255,255);
  
  image(dropAcid, posX, posY);
  // Move the origin to the center of screen
  translate(width/3, height/3);
  
  if (mousePressed==true) {
    deg-=10;
    background(dropAcid);
  } else {
    background(dropAcid); 
  }
  
  float rad = radians(deg);
  rotate(rad);
  
  for (int i = 0; i < 1500; i++) {
    
    int deg1 = int(i);
    float angle1 = radians(deg1);
    float x1 = cos(angle1) * radius*i;
    float y1 = sin(angle1) * radius*i;
    
    int deg2 = int(i+1);
    float angle2 = radians(deg2);
    float x2 = cos(angle2) * radius*i;
    float y2 = sin(angle2) * radius*i;
    
    stroke(random(255),random(255),random(255));
    line(x1, y1, x2, y2);
  }
}
