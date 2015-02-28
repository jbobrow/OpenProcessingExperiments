
PImage a;
PImage b;
PImage c;

void setup(){
  size(400,400);

a= loadImage("001.jpeg");
b= loadImage("002.png");
c= loadImage("003.png");
imageMode(CENTER);
noCursor();
}

void draw(){
  background(255);
  if (mouseY > 100){
  image(a, 200,200,400,400);
  image(b, mouseX,mouseY,b.width/2,b.height/2);
  image(c,mouseY, mouseX, c.width/2, c.height/2);
  }
}


