
PImage myimage;
PImage secondimage;

void setup(){
  size(400,400);
  myimage = loadImage("2.jpg");
  secondimage = loadImage ("3.jpg");
  frameRate(15); //how fast DRAW runs the program
}

void draw(){
  //image(image name, top left x, top left y);
  tint(100,  random(0),random(0),100); //changes brightness
  image(myimage,random(15),random(10),width, height);
  
  
  tint(255, random(200),random(200),150);
  image(secondimage,random(75),random(50),mouseX,mouseY);
}

