
PImage img;  // Declare variable "a" of type PImage

void setup(){
  size(700, 700);
  textFont(createFont("OCRAStd", 16));
  img = loadImage("plug.jpg");
}

void draw(){
  background(150, 150, 150);
  image(img, 225, 250, 250, 194);
  if(mouseX > width/2-125 && mouseY > height/2-97 && mouseX < width/2+125 && mouseY < height/2+97){
  noStroke();
  fill(255, 0, 0);
  ellipse(160, 100, 250, 125);
  rect(230, 110, 40, 40);
  fill(0);
  text("I can't work, there is a power cut!", 50, 105);
  fill(255, 247, 0);
  ellipse(540, 100, 250, 125);
  rect(430, 110, 40, 40);
  fill(0);
  text("I am sick, I need a new fuse!", 445, 105);
  fill(16, 0, 255);
  ellipse(160, 600, 250, 125);
  rect(230, 550, 40, 40);
  fill(0);
  text("I am not connected to anything!", 50, 605);
  fill(41, 255, 0);
  ellipse(540, 600, 250, 125);
  rect(430, 550, 40, 40);
  fill(0);
  text("I am connected to a foreign plug!", 430, 605);}
  }


