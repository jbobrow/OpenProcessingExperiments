
PImage a;
PImage b;

void setup(){
  size(600,600);
  
  
  a= loadImage("001.JPG");
  b= loadImage("002.JPG");
  imageMode(CENTER);
  noCursor();
}


void draw(){
  background(192);
  if(mouseY > 100){
  image(a, 100, mouseY, 200, 300);
  image(b, 500, mouseY, 200, 300);
  }
  ellipse(100,100,100,100);
  
}


