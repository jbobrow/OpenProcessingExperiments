
PImage x;
float speed = 2.0;
float move;

void setup() {
  size(400, 400);
  x=loadImage ("http://static.guim.co.uk/sys-images/Observer/Pix/pictures/2012/8/24/1345827799458/Blindmans-Bluff-010.jpg");
}

void draw() {
  move=move+speed;
  rotate (random(0,255));
  background(random(0,255),random(20,90),random(50,100));
  image(x,0,move);
  if(move > 400) {
    move = 0
  }
}
