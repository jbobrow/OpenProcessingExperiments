
float centreX, centreY;
float velX, velY;
float radi;
 
void setup() {
  size(200, 200);
  background(0);
  smooth();
   
  noStroke();
  fill(255,0, 0);
   
  centreX = width/2;
  centreY = height/2;
  velX = random(3 ,4);
  velY = random(5 ,7);
  ellipseMode(RADIUS);
  radi = 25; 
}
 
void draw() {
  background(0);
  ellipse(centreX, centreY, radi, radi);
  centreX = centreX+velX;
  centreY = centreY+velY;
   
  if (centreX<=radi) {
    centreX = radi;
    velX = -velX;
  }
  if (centreX>=width-radi) {
    centreX = width-radi;
    velX = -velX;
  }
     
  if (centreY<=radi) {
    centreY = radi;
    velY = -velY;
  }
  if (centreY>=height-radi) {
    centreY = height-radi;
    velY = -velY;
  }
}

