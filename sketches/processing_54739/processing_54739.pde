
/**
 * Rotate 1. 
 * 
 * Rotating simultaneously in the X and Y axis. 
 * Transformation functions such as rotate() are additive.
 * Successively calling rotate(1.0) and rotate(2.0)
 * is equivalent to calling rotate(3.0). 
 */
 
float a = 0.0;
float rSize;  // rectangle size

void setup() {
  size(640, 360, P3D);
  rSize = width / 6;  
  noStroke();
  fill(204, 204);
}

void draw() {
  background(49,108,47);
  
  a += 0.005;
  if(a > TWO_PI) { 
    a = 0.0; 
  }
  
  translate(width/2, height/2);
  
  rotateX(a);
  rotateY(a * 2.0);
  fill(250);
  textSize(rSize/2);
  text("WICKENDEN", -rSize, -rSize);
  
    rotateX(a * 3);
  rotateY(a * 2.0);
  fill(130);
  textSize(rSize/1.5);
  text("S MAIN ", -rSize, -rSize);
  
      rotateX(a * 1.004);
  rotateY(a * 2.2);
  fill(100);
  textSize(rSize/4);
  text("PROSPECT", -rSize, -rSize);
  
  rotateX(a);
  rotateY(a);
    fill(50);
  textSize(rSize);
  text("WATERMAN", -rSize, -rSize);
  
    rotateX(a * .9992);
  rotateY(a * 1.992);
    fill(190);
  textSize(rSize);
  text("THAYER", -rSize, -rSize);
  
    rotateX(a * 1.002);
  rotateY(a * 2.003);
    fill(50);
  textSize(a+a+a);
  text("BENEFIT", -rSize, -rSize);
  
    
    rotateX(a * 1.003);
  rotateY(a * 2.004);
    fill(20);
  textSize(a+a+a+a+a);
  text("BENEVOLENT", -rSize, -rSize);
  
  rotateX(a * 1.013);
  rotateY(a * 2.00);
    fill(150);
  textSize(a+a+a+a+a+a+a);
  text("MEETING", -rSize, -rSize);
  
    rotateX(a * 1.013);
  rotateY(a * 2.0045);
    fill(40);
  textSize(a+a+a+a+a+a+a);
  text("ANGELL", -rSize, -rSize);
  
    rotateX(a * 1.013);
  rotateY(a * 2.006);
    fill(120);
  textSize(a+a+a+a+a+a+a+a+a+a+a+a);
  text("BROWN", -rSize, -rSize);

}

