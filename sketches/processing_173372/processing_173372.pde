
/*@pjs preload="1.png","0.png";*/
PImage IMG;
int i = 1;

void setup() {
  size(500, 500);
}

void draw() {
    
  if ((keyPressed == true) && (key == 'a')) {
  background(204);
  }
  
  if (mousePressed == true){
  IMG = loadImage("1.png");
  image(IMG, mouseX, mouseY);
  }
  if ((mousePressed == true) && (keyPressed == true) && (key == 's')) {
  IMG = loadImage("0.png");
  image(IMG, mouseX, mouseY);
  }

}


