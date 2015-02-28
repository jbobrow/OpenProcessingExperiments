
//Rotation taken from Rotate1, found in the examples folder of Processing.

 PFont myFont;
float a = 0.0;
float rSize;  // rectangle size

void setup() {
  size(360, 360, P3D);
  rSize = width / 6;  
  noStroke();
  fill(204, 204);
}

void draw() {
  background(166,164,149);
  
  a += 0.005;
  if(a > TWO_PI) { 
    a = 0.0; 
  }
  
  translate(width/2, height/2);
  
  rotateX(a);
  rotateY(a * 2.0);
   myFont = createFont("Helvetica", 48); 
  fill (209,195,105);
  textFont(myFont);
   text("15",-rSize, -rSize, rSize*2, rSize*2);
   
     rotateX(a);
  rotateY(a * 2.0);
  fill (255,223,13);
   text("15",-rSize, -rSize, rSize*2, rSize*2);
  
  rotateX(a * 1.001);
  rotateY(a * 2.002);
  text("West",-rSize, -rSize, rSize*2, rSize*2);
  
    rotateX(a * 1.001);
  rotateY(a * 2.002);
   fill (181,174,129);
  text("West",-rSize, -rSize, rSize*2, rSize*2);
   
    rotateX(a * 1.001);
  rotateY(a * 2.002);
  text("West",-rSize, -rSize, rSize*2, rSize*2);
  
   rotateX(a);
  rotateY(a * 2.0);
  fill (186,217,210);
   text("15",-rSize, -rSize, rSize*2, rSize*2);
   
    rotateX(a);
  rotateY(a * 2.0);
  fill (186,217,210);
   text("West",-rSize, -rSize, rSize*2, rSize*2);

}

