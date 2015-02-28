
float circleX;
float circleY;
float speedX=2;
float speedY=2;
PImage hotDog;

void setup() {
  size(600, 500);
  circleX=0;
  circleY=0;
  hotDog=loadImage("hot_dog.jpg");
  imageMode(CENTER);
}

void draw() {
  background(255);
  circleX=circleX+speedX;
  circleY=circleY+speedY;
  
  if (circleX>width-50||circleX<0) {
    speedX=-speedX;
  }
  if(circleY>height||circleY<0){
    speedY=-speedY;
  }
  translate(50, 50);
  image(hotDog, circleX, circleY, 150, 150);
}


