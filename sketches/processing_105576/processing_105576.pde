
// From Algorithmic Animation
// with Zach Lieberman, Fall 2012
PImage mag;


void setup() {
  size(1500, 900);
  fill(#007DB4);
  noStroke();
  rectMode(CENTER);
   mag = loadImage( "mag.jpg");

}

void draw() {
//  background(160, 209, 206);
   background(175, 184, 206);
   
  float centerX = width/2;
  float centerY = height/2;
  
//  rect(centerX, centerY, 10, 10);
//  image (mag, centerX, centerY, 15, 45);

  for (int i = 0; i < 40; i++) {

    float radius = 50 + i * 20;
    float angle = millis() / 1500.0 * (1 + i / 10.0);
    //float angle = millis() / 1000.0;
    float x = centerX + radius * cos(angle);
    float y = centerY + radius * -sin(angle);

//    rect(x, y, 10, 10);
    image (mag, x, y, 20, 60);
  }
}

boolean sketchFullScreen() {
  return true;
}




