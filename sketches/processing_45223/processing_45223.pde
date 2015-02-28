
PImage tortoise;
PImage croc;
PImage tortoise2;

void setup(){
   size(1000,1000);
   tortoise = loadImage("tortoise.jpg");
   croc = loadImage("croc.jpg");
   tortoise2 = loadImage("tortoise2.jpg");
}

void draw(){
  tint(mouseX,mouseY,131,20);
  image(tortoise, mouseY, mouseX, mouseY, mouseY);
  image(croc, mouseX, mouseY, mouseX, mouseX);
  image(tortoise2, mouseY, mouseY, mouseY, mouseX);
  
}

