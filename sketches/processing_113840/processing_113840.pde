

PImage a;
PImage b;
int movementX = height/2;
int movementY = width/2;

void setup() {
  size(600, 600);
  a= loadImage("001.png");
  b= loadImage("002.jpg");
  imageMode(CENTER);
  noCursor();
}

void draw() {
  image(b,movementX,movementY,b.width/2,b.height/2);
  image(a,mouseX,mouseY,a.width/5,a.height/5);
  
}

void mouseDragged() 
{
  movementX = mouseX;
  movementY = mouseY;
  
  image(b,mouseX,mouseY,b.width/2,b.height/2);
  image(a,mouseX,mouseY,a.width/5,a.height/5);
 
}

void mouseReleased() {
   movementX = pmouseX;
   movementY = pmouseY;
  
}


