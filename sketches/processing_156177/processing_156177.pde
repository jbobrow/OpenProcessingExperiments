
PImage myImage;
PFont anyName;
float textPosY;

void setup(){
  size(800, 800);
  
  colorMode(HSB, 360, 100, 100);
  myImage = loadImage("rabbit.jpg");
//  printArray(PFont.list());
  anyName = createFont("arial", 32);
  textFont(anyName);

}

void draw(){
  float myColor1 = map(mouseX, 0, width, 2, 255);
  float myColor2 = map(mouseY, 0, height, 0, 255);
  background(myColor1, myColor2, 255);
  
  float scale = map(mouseX, 0, width, 0.5, 1); 
  
  
  image(myImage, 0, 0, myImage.width * scale, myImage.height * scale);
  
  fill(0);
  
textPosY = textPosY + 1; 
println(sin(frameCount));
  
  float pointPosY = map(sin(frameCount * 0.3), -1, 1, 200, height - 200);
  text("RABBITS", frameCount * 0.1, textPosY);

  
  
}

