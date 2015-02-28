
int lastSecond;
PImage img;
PImage bolt;
Drop aDrop;
ArrayList drops = new ArrayList();
void setup() {
  size(600, 800);
  smooth();
  img = loadImage("clock.png");
  bolt = loadImage("bolt.png");
  aDrop = new Drop(300, 0);
}

void draw() {
  background(200);
  image(img, 0, 0, width, height);
  if (second() == 0) {
    image(bolt, 150, 300, 150, 150);
  }

  aDrop.display();
  aDrop.update();
  if (lastSecond != second()) {
    lastSecond = second();

    //create new drop
    Drop temp_drop = new Drop(random(100, 500), 230);
    drops.add(temp_drop);

    //add it to array
  }
  //update all drops
  for (int i =0; i<drops.size(); i++) {
    Drop my_drop = (Drop) drops.get(i);
    my_drop.update();
    my_drop.display();
  } 
  fill(70, 130, 180);
  // arc(100,100,100,100, radians(270),radians(270 + second()*6));
  // arc(100,100,100,100, radians(180), radians(180 +second()*3));
}
class Drop {
  float x, y;
  float speed = 0;
  float gravity = .3;
  Drop(float _x, float _y) {
    x = _x;
    y = _y;
  }
  void update() {
    //move it
    y += speed;
    speed += gravity;
  } 
  void display() {
    fill(100, 150, 220);
    noStroke();
    for (int i = 10; i > 0;i--) {
      ellipse(x, y + i*4, i*2, i*2);
    }
  }
}



