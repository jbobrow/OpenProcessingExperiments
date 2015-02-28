
PImage img1;

int leftEyeX = 106;
int leftEyeY = 42;
int rightEyeX = 143;
int rightEyeY = 36;

void setup(){
  size(321, 321);
  background(255);
  noStroke();
  smooth();
  img1 = loadImage("zombie.jpg");
}

void draw(){
  
  // Load Image
  
  image(img1, 0, 0);
  
  // Eyes
  
  fill(247, 243, 200);
  ellipse(rightEyeX, rightEyeY, 30, 30); //Right Eye
  ellipse(leftEyeX, leftEyeY, 21.5, 21.5); //Left Eye
  
  // Pupils
  
  fill(0); // Black Pupil
  
  float pupilLeftX = map(mouseX,0,width, leftEyeX-7, leftEyeX+7);
  float pupilLeftY = map(mouseY,0,height, leftEyeY-7, leftEyeY+7);
  float pupilRightX = map(mouseX,0,width, rightEyeX-7, rightEyeX+7);
  float pupilRightY = map(mouseY,0,height, rightEyeY-7, rightEyeY+7);
  
  ellipse(pupilLeftX, pupilLeftY, 5, 5);
  ellipse(pupilRightX, pupilRightY, 5, 5);
  
}

