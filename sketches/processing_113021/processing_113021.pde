
PImage a;
PImage b;


void setup(){
  size (600,600);
  
  a= loadImage("001.jpg");
  imageMode(CENTER);
  b= loadImage("002.jpg");
  imageMode(CORNER);
}


void draw(){
  image(a,mouseX,mouseY,a.width/4,a.height/4);
  
  image(b, mouseX,mouseY,200,200);
  
}


