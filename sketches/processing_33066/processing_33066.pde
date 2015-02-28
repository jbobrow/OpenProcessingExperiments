
PImage myImage;

void setup(){
  smooth();
  size(500,500);

}

void draw(){
  background(255);
  
  variableRect(mouseX, mouseY, pmouseX, pmouseY);
  smooth();
  size(500,500);
}
void variableRect(int x, int y, int px, int py){
   float speed = abs(x-px) + abs(y-py);
   stroke(speed);
   myImage = loadImage("glitchmob.png");
   image(myImage,x, y, speed, speed);
  
}

