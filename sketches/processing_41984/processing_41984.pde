
PImage img ;

void setup (){
  size (500,500);
  img= loadImage("reita4.jpg");
}

void draw (){
  background(0);
  image (img,0,0,mouseX * 2 ,mouseY*2);
}

