
PImage a;
PImage b;



void setup(){
  size(600,600);
  
  a= loadImage("01.jpg");
  imageMode(CENTER);
  b= loadImage("2.jpg");
  imageMode(CORNER);
}

void draw(){
  background(65);
  image(a, mouseX, mouseY, a.width/2, a.height/2);
  
  image(b,100, 100, b.width/2, b.height/2);
  
}


