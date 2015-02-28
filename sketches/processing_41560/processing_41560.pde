
// creation of 2 classes bomb and blast controlling the moving circular
// bombs and blast of triangles when clicked on the bomb i.e the eleipses
Bomb [] myBomb = new Bomb[30];
Blast [] myBlast = new Blast[120];
color ctemp;
// boolean to control the clicking on just the bomb to trigger the action on bursting squares
Boolean blast;

void setup() {
  size(600, 300);
  colorMode(RGB, 100);

  blast = false;

  for (int a=0;a < myBomb.length;a++) {
    ctemp = color(random(100), random(150), random(200));
    myBomb[a] = new Bomb(ctemp, random(width), random(height), random(5));
  }
}
// the main function of the program with referencing to the class constructed below
void draw() {
  background(0);
  for (int a=0;a < myBomb.length;a++) {
    myBomb[a].update();
    myBomb[a].display();
  }
  if (blast) {
    for (int a=0;a < myBlast.length;a++) {
      myBlast[a].update();
      myBlast[a].display();
    }
  }
  hit();
}

//creation of constructor for the ellipses across the screen
class Bomb {
  color c;
  float xpos;
  float ypos;
  float speed;
  Bomb(color tempC, float tempXpos, float tempYpos, float tempSpeed) {
    c = tempC+10;
    xpos=tempXpos;
    ypos=tempYpos;
    speed=tempSpeed;
  }

  void display() {
    stroke(c);
    strokeWeight(2);
    fill(c);
    ellipse(xpos, ypos, random(30), random(40));
  }
  void update() {// updating the position of the ellipses so that it can move across the screen
    xpos= xpos+speed;
    if (xpos>width) {
      xpos=0;
    }
  }
}

// creation of constructor for the squares particles
class Blast {

  float x;
  float y;
  float xv, yv;
  Blast(float x_, float y_, float xv_, float yv_) {
    x = x_;
    y = y_;
    xv = xv_;
    yv = yv_;
  }
  void update() {
    x = x + xv;
    y = y + yv;
  }
  void display() {
    fill(0); 
    stroke(12, 109, 167);
    strokeWeight(4);
    rect(x, y, 10, 10);
  }
}

void hit() {
  if (mousePressed) {
    // conditionalfunction for triggering the squares when clicked on the colored ellipses 
    // the boolean doesnt hold true when clicked on the black background
    color temp = get(mouseX, mouseY);
    color black = color(0, 0, 0);
    if (temp != black) {
      blast = true;
      for (int a=0;a < myBlast.length;a++) {
        myBlast[a]= new Blast(mouseX, mouseY, random(-5, 5), random(-5, 5));
      }
    }
  }
}


