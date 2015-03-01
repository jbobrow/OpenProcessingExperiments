
/* @pjs preload= "eye-000.jpg,eye-001.jpg,eye-002.jpg,eye-003.jpg,eye-004.jpg,eye-005.jpg,eye-006.jpg,eye-007.jpg,eye-008.jpg,eye-009.jpg"; */
 
int numFrames = 9;
PImage[] img = new PImage[numFrames];
float angle;
float opacity = 0;
 
void setup() {
  size(300,500);
  frameRate(100);
  for (int i = 0; i < img.length; i++) {
    String imageName = "eye-" + nf(i, 3) + ".jpg";
    img[i] = loadImage(imageName);
    
  }
}
 
void draw() {
  background(0);
  int frame = frameCount % numFrames;
  image(img[frame], 0, 0, 300, 500);
  angle += 0.01;
  translate(50,50);
  rotate(angle);
  fill(0);
  //rect(0, 0, 300, 260);
  //rect(0, 400, 300, 500);
  //rect(0, 260, 100, 400);
  //rect(240, 260, 300, 500);
  if (opacity <2255) {
    opacity += 0.5;
  }
  tint(255, 20, 240, opacity);
}



