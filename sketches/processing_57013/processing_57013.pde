
PImage myimage;
PImage secondimage;

void setup(){
  size(400, 400);
  myimage = loadImage("sloth.gif");
  secondimage = loadImage("Sloth-1.jpg");
}

void draw(){

  
  tint(random(200), 250, 244, 100);
  image(secondimage, 0, 0, 400, 400);
  
  noStroke();
  smooth();
  fill(250, random(3), random(122), 100);
  ellipse(147, 340, 80, 80);
  ellipse(90, 145, 30, 30);
  ellipse(207, 135, 30, 30);
  ellipse(310, 60, 28, 28);
  ellipse(235, 103, 20, 20);
  
  image(myimage, 0, 0, 400, 400);
}

