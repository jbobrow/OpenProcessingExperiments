
class Block {
  PImage monsterBlue;
//color c = color(255);
float x = 0;
float y = 400;
float speed = 4;

void setup() {
  monsterBlue = loadImage("monsterblue.png");
  //size(400,400);

}

void draw() {
  monsterBlue.loadPixels();
  background(0);
  move(); 
  display();
  image(monsterBlue,x,y,monsterBlue.width,monsterBlue.height);

}

void move() {
  x = x + speed;
  
  if (x > width) {
    x = 0;
  
    
  }
}

void display() {
  //image(monsterBlue,x,y,monsterBlue.width,monsterBlue.height);
  //fill(c);
  //rect(x,y,30,10);
}
}


