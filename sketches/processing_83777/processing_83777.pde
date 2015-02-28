
//Gabby Garuz
//Creative Computing Section F
//12/18/12
//Final

int lastSecond;
PImage bground;
PImage clouds;
PImage bolt;
Drop aDrop;
ArrayList drops = new ArrayList();
void setup() {
  size(800, 600);
  smooth();
  noStroke();
  bground = loadImage("background.png");
  clouds = loadImage("cloudsngirl.png");
  bolt = loadImage("bolts.png");
}

void draw() {
  background(200);
  image(bground, 0, 0, width, height);
  image(clouds, 5, 5, 795, 400);
  fill(80, 140, 200, 150);
  rect(0, map(hour(), 0, 20, 0, height), width, height);
  if (second() == 0) {
    image(bolt, 80, 250, 250, 150);
  }

  //  aDrop.display();
  //  aDrop.update();

  if (lastSecond != second()) {
    lastSecond = second();

    //create new drop

    Drop temp_drop = new Drop(random(20, 750), 230) ;
    drops.add(temp_drop);



    //add it to array
  }

  //update all drops
  for (int i =0; i<drops.size(); i++) {
    Drop my_drop = (Drop) drops.get(i);
    my_drop.update();
    my_drop.display();
    if (my_drop.y > height+200) {//remove the drop if offscreen
      drops.remove(i);
    }
  } 
  fill(70, 130, 200);
}
class Drop {
  float x, y;
  float speed = 10;
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
    for (int i = 7; i > 0;i--) {
      ellipse(x, y + i*4, i*2, i*2);
    }

         image(clouds, 5, 5, 795, 400); 
    }
  }




