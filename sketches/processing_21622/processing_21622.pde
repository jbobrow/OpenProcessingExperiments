
//Adam Oaks

int num = 300;


Rwalk[] myRwalk = new Rwalk[num];
color [] myColor = new color[4];


void setup() {
  size(400,400);
  background(255);
  noStroke();
  smooth();

  myColor[0] = color(89,132,189,30);
  myColor[1] = color(140,192,108,30);
  myColor[2] = color(232,210,88,30);
  myColor[3] = color(153,0,0,30);


  for(int i=0; i < myRwalk.length; i++) {
    myRwalk[i] = new Rwalk();
  }
}

void draw() {


  for(int i=0; i < myRwalk.length; i++) {
    myRwalk[i].update();
    myRwalk[i].display();
  }
}

  class Rwalk {
    float x = random(0,width);
    float y = random(0,width);
    float rectSize = random(3,6);
    color colorChoice = myColor[floor(random(0,4))];

    Rwalk() {
    }

    void update () {
      x = x + random(-2,2);
      y = y + random(-2,2);
    }

    void display() {
      fill(colorChoice);
      rect(x,y,rectSize,rectSize);
    }
  } 


