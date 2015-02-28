
Monster[] bob = new Monster[10];

void setup() {
  size(800, 600);
  for (int i=0;i<bob.length;i++) {  
    bob[i]=new Monster();
    bob[i].prime(i* width/bob.length+40,height-50);
  }
}

void draw() {
  background(255);
  for (int i=0;i<bob.length;i++) {
    bob[i].animate();
  }
}

class Monster {

  //declare variables
  float x;
  float y;

  //declare animation variables
  float speed;
  float gravity;
  boolean shoot;

  //set up
  void prime(float a, float b) {
    x=a;
    y=b;
    speed=0;
    gravity=0.8;
    shoot=false;
  }

  void animate() {

    //head
    fill(195);
    ellipse(x, y, 100, 100);

    //nose
    noStroke();
    fill(255, 0, 0);
    ellipse(x+3, y, 10, 10);

    //Eyes
    noStroke();
    fill(mouseX, mouseY, 155);
    ellipse(x-5, y-18, 10, 10);
    ellipse(x+10, y-18, 10, 10);

    //legs
    stroke(mouseX, mouseY, 155);
    strokeWeight(5);
    line(x-20, y+20, x-10, y+20);
    line(x-20, y+10, x-10, y+10);
    line(x-20, y, x-10, y);
    line(x+16, y+20, x+26, y+20);
    line(x+16, y+10, x+26, y+10);
    line(x+16, y, x+26, y);

    if (shoot) {
      y = y + speed;
      x = x + random(-3, 3);
      speed = random(-5, 0);
      line(x,y+53,width/2,height);
    }

    if (mousePressed) {
      shoot=true;
    }
  }
}



