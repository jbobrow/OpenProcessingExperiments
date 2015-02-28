
PImage myimage;
PImage secondimage;
PImage banana;

void setup(){
  size(500, 1000);
  background(181, 240, 131);
  smooth();
  myimage = loadImage("babyface.jpg");
  secondimage = loadImage("baba.jpg");
  banana = loadImage("banana.jpg");
  frameRate(700000);
}

void draw(){
  tint(250, random(100), random(1000), 3);
  image(myimage, random(500), random(1000), 50, 1000, 4, 40, 400, 4);
  image(secondimage, random(1000), random(500), 10, 5000, 4, 400, 400, 4);
  image(myimage, random(1000), random(1000), 10, 500, 40, 40, 400, 4);
  image(secondimage, random(1000), random(500), 50, 5000, 70, 400, 400, 40);
  image(myimage, random(1000), random(1000), random(mouseX), random(mouseY));
  image(myimage, random(80), random(98), random(mouseX), random(mouseY));
  image(myimage, random(50), random(500), random(mouseX), random(mouseY));
}

