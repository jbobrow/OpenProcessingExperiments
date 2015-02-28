
void setup (){
  
  size (900,600);
background (200,180,60);
}

void draw(){
  PImage b;
b = loadImage("Tsinghua_Science_Park.jpg");
image(b,mouseX, mouseY);
}

