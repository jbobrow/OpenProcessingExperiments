
PImage img;

void setup(){
  size(300,300);
  img = loadImage("flower.jpg");
  background(255);
}

void draw(){
  
  int x = floor(random(0,img.width));
  int y = floor(random(0,img.height));
  
  
  color myColor = img.get(x,y);
  stroke(myColor);
  line(x,0,x+random(0,300),300);
}

