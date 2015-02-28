
PImage teahupoo;

void setup(){
  size(600,200);
  teahupoo = loadImage("chopes-teahupoo.jpg");
}

void draw (){
  tint(mouseX, mouseY, 255, 50);
  image(teahupoo, 0,0,200,200);
  image(teahupoo, mouseX, mouseY, 200, 200);
}

