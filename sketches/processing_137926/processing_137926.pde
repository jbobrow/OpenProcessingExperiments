
ArrayList bricks = new ArrayList();
ArrayList bricks2 = new ArrayList();

void setup() {

  rectMode(CORNERS);
  size(800, 400);
  stroke(3);


  int y = 0;
  int h = 1;
  float w = 200;
  float theta = 0;

 while (y<100) {
    y= h+y/2;
    Brick brick = new Brick(y, h, theta, 300, 1);
    bricks.add(brick);
    Brick brick2 = new Brick(y, h, theta+PI/4, 250, 2);
    bricks2.add(brick2);
    h= h+2;
    theta = theta+PI/15;
  }
}

void draw() {
  background(210, 208, 73);
  for (int i=0; i<bricks.size();i++) {
    Brick brick = (Brick) bricks.get(i);
    brick.run();
    Brick brick2 = (Brick) bricks2.get(i);
    brick2.run();
    saveFrame(); 
  }
}
class Brick {
  
  float y, h, cards, theta, w, cat
  ;
  Brick(float _y, float _h, float _theta, float _w, float _cat) {
    y = _y;
    h = _h;
    w = _w;
    theta = _theta;
    cat = _cat;
  }

  void run() {
    move();
    display();
  }


  void move() {
    theta = 0.05+theta;
    cards = map(sin(theta), -1, 1, .5, 2.5);
  }


  void display() {
    float sizex = ((w-5*h)*cards);

    if (cat==1) {
      fill(19, 105, 133);
    } 
    else {
      fill(161, 198, 206);
    }    
    rect(-width/2, y+height/3, sizex, h+height/4);
  }
}



