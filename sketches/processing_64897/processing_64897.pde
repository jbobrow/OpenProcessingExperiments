
float x ;
PImage devil;
PImage devil3;
float a= 1;



void setup() {

  size(400, 400);
  x = width;

  devil = loadImage("devil2.jpg");
  devil3 = loadImage("devil3.jpg");
}

void draw() {


  int y = int(map(noise(a), 0, 1, 0, 200));

  image(devil, x, 0);
  
  println(dist(mouseX, mouseY, 30, 30));
  
  if(dist(mouseX, mouseY, 30, 30) > 10){
    copy(devil3, mouseX, y, mouseY, 100, 100, 100, 200, y);
  }
  if (x<0) {
    x = x+1;
  };
  if (y<1) {
    y = 0;
  };
  ellipse(20, 0, 30, 30);
  fill(200, 0, 0);
  noStroke();

  x =x -1;
  a= a+1.2;
}


