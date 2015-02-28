
PImage irisImage;

PImage faceImage;

PImage eyeballsImage;

//float mapper

void setup() {

  size (600, 600);
  irisImage = loadImage("iris.png");
  faceImage = loadImage("face.png");
  eyeballsImage = loadImage("eyeballs.png");
}





void draw() {

  background(40, 40, 40);
  
  
  image(eyeballsImage, 0, 0, 600, 600);
  image(irisImage, mouseX-300, mouseY=0, 600, 600);
  
//  "mapper" = map(mouseX, 0, 600, 200,400);



  image(faceImage, 0, 0, 600, 600);



  // Mike Note: same size as image and mouse location offset and centered at -300
}


