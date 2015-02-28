
int diameter = 15;
int positionY = 115;
int positionX = 250;
int Switch = 0;
PImage a;
PImage b;
PImage c;
PImage d;

void setup() {
  size(500, 500);
  a= loadImage("004.jpg");
  b= loadImage("005.jpg");
  c= loadImage("006.jpg");
  d= loadImage("007.jpg");
  imageMode(CENTER);
  noCursor();
}


void draw() {
  background(0, 139, 191);

  if (mousePressed & positionY <= height-diameter-10) {
    positionY = positionY + 6;
  }
  else if (positionX < 150) {
  }

  if (positionY <= 360) {
    image(a, 200, 150, a.width/4.5, a.height/4.5);
  }
  else if (positionY > 360) {
    image(b, 200, 150, b.width/4.5, b.height/4.5);
  }

  image(c, positionX, height-88, c.width/4.5, c.height/4.5);

  if (mousePressed & positionY <= 320) {
    positionX = positionX + 2;
  }
  else if (positionY > 320) {
  }  

  if (positionY >= height-diameter-10) {
    image(d, 50, height-88, d.width/4.5, d.height/4.5);
  }
  else if (positionY < height-diameter-10) {
  }



  noStroke();  
  ellipse(width/2, positionY, diameter, diameter);
  rect(0, 490, width, 10);
}  



