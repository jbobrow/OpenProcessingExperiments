
PImage a;
PImage b;

void setup(){
  size(350,400);
  
  a= loadImage("001.jpg");
  b= loadImage("002.jpg");
  imageMode(CENTER);
  noCursor();
}

void draw(){
  background(0);
  if(mouseY>200){
  image(a, mouseX,mouseY,a.width/2, a.height/2);
  }
  image(b, mouseY,mouseX,b.width/2, b.height/2);
}



