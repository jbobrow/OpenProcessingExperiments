
PImage myimage;
PImage secondimage;

void setup(){
  size(400, 400);
  myimage = loadImage("Flower7.jpg");
  secondimage = loadImage("flower3.jpg");
  frameRate(5); //how fast DRAW runs the program
}

void draw() {
  //image(image name, top left x, top left y);
  
  tint(155, 50);
  image(myimage, 0, 0, mouseX, mouseY);
  
  tint(255, random(200), random(200), 100);
  image(secondimage, random(200), random(200), random(400), random(300));
}


