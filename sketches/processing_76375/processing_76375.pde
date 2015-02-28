

Primitive basket;
Circle r;
Rectangle r2;
Tri r3;

boolean startupscreen = false;

float xbPos = 0;
float ybPos = 450;
float xPos=230;
float yPos=60;
float x2Pos=320;
float y2Pos=60;
float x3Pos=380;
float y3Pos=100;
float x4Pos=400;
float y4Pos=60;
float x5Pos=420;
float y5Pos=100;

int timer =0;

PFont fontA;

PImage img;
PImage img2;
PImage img3;

int score = 0;
/*
String[]sh = { 
  r.render(), r2.render(), r3.render()
  };
  int index;
*/

// the setups for the game
void setup() {
  size(600, 500);
  smooth();
  noStroke();
  background(0);
  fontA = loadFont("ArialMT-14.vlw");
  textFont(fontA, 14);

  //Images that have been uploaded and used in the game
  img = loadImage("Cloud.png");
  img2 = loadImage("korg.png");
  img3 = loadImage("Start.png");

  basket = new Primitive(width/2, height/2, 2);
  r = new Circle(230, 60, 1, (int)random(255), random(20));
  r2 = new Rectangle(320, 60, 1, (int)random(255), random(20));
  r3 = new Tri(380, 100, 400, 60, 420, 100, 1, (int)random(255), random(20));

  strokeWeight(2);
  stroke(255);
  rect(20, 420, 170, 40);


  startupscreen();
}

//The screen that is displayed when the game is uploaded.
void startupscreen() {
  image(img3, 0, 0, img3.width, img3.height);
  fill(255, 255, 255);
  text("Click anywhere to Start", 55, 440);
}

void draw() {

  if (dist(xbPos, ybPos, xPos, yPos)<20) {
    fill(0);
    ellipse(xPos, yPos, 35, 35);
  }

  if (dist(xbPos, ybPos, x2Pos, y2Pos)<20) {
    fill(0);
    rect(x2Pos, y2Pos, 40, 40);
  }

/*
  if (dist(xbPos, ybPos, x3Pos, y3Pos, x4Pos, y4Pos, x5Pos, y5Pos)<20) {
    fill(0);
    triangle(x3Pos, y3Pos, x4Pos, y4Pos, x5Pos, y5Pos);
  } 

  timer++;

  if (timer==200) {
    index = (int)random(sh.length);
  }
  else {
    timer=0;
  }

  text(sh[index], width(random(230, 450)), height + 60);
*/
  if (startupscreen == false) {
    startupscreen();
  }
  if (startupscreen == true) {
    //game mode
    if (yPos>height) {
      yPos=0;
    }
    if (y2Pos>height) {
      y2Pos=0;
    }
    if (y5Pos>height) {
      y5Pos=0;
    }
    if (y4Pos>height) {
      y4Pos=0;
    }
    if (y3Pos>height) {
      y3Pos=0;
    }

    noStroke();
    background(0);
    printScore();
    r.check();
    r.render();
    r2.render();
    r3.render();
    basket.update();


    //image of the cloud.
    image(img, 160, -20, img.width-200, img.height/2);
    //box with correct falling shape detail.
    fill(204, 204, 102);
    rect(10, 180, 100, 120);
    //Text with game instruction.
    fill(50);
    String s = "Collect the shape.";
    textSize(15);
    text(s, 30, 190, 70, 90);
    stroke(2);
    fill(0, 0, 0);
    text("Yellow circle", 20, 260);
  }
}

//The game starts when the mouse is clicked.
void mouseClicked() {
  if (startupscreen == false);
  if (startupscreen = true);
}

void printScore() {
  fill(255);
  text("Score = " + score, 20, 20);
}

//moving basket
class Primitive {
  int xbPos=0;
  int ybPos=0;
  int m=0;
  int basketWidth=20;

  public Primitive(int x, int y, int m) {
    this.xbPos=x;
    this.ybPos=y;
    this.m=m;
  }

  public void update() {
    if (keyPressed) {
      if (keyCode == 37) {
        xbPos-=m;
      }
      if (keyCode == 39) {
        xbPos+=m;
      }
    }
    //image of basket.
    image(img2, xbPos, 450, img2.width/2, img2.height/2);
  }
}

class Circle {
  float xPos;
  float yPos;
  float m=20;
  float d=30;
  int c=20;
  int circleValue;
  boolean shapeCaught = false;

  public Circle(float n_xPos, float n_yPos, float n_m, int n_c, float n_d) {
    xPos=230;
    yPos=60;
    circleValue = 0;


    xPos= n_xPos;
    yPos= n_yPos;
    //m= n_m;
    //c= n_c;
    // d= n_d;
  }

  public void render() {
    fill(255, 255, 0);
    ellipse(xPos, yPos, 35, 35);
    yPos++;
  }
  // (r.xPos > basket.xPos && r.xPos < basket.xPos + basket.basketWidth && r.yPos > basket.yPos)
  public void check() {
    if (r.xPos > 480) {
      circleValue = 10;
    }

    if (basket.xbPos > r.xPos+5 && basket.xbPos < r.xPos+5 && basket.ybPos > r.yPos) {
      shapeCaught = true;
      score++;
    }
  }
}

class Rectangle {
  float x2Pos=0;
  float y2Pos=0;
  // float m=0;
  // float d=0;
  // int c=0;

  public Rectangle(float n_x2Pos, float n_y2Pos, float n_m, int n_c, float n_d) {
    x2Pos=320;
    y2Pos=60;
    // m=10;
    // d=0;
    // c=0;

    x2Pos= n_x2Pos;
    y2Pos= n_y2Pos;
    // m= n_m;
    // c= n_c;
    // d= n_d;
  }
  public void render() {
    fill(0, 0, 255);
    rect(x2Pos, y2Pos, 40, 40);
    y2Pos++;
  }
}

class Tri {
  float x3Pos=0;
  float y3Pos=0;
  float x4Pos=0;
  float y4Pos=0;
  float x5Pos=0;
  float y5Pos=0;
  // float m=0;
  // float d=0;
  // int c=0;

  //r3 = new Tri(380, 100, 400, 60, 420, 100, 1, (int)random(255), random(20));

  public Tri(float n_x3Pos, float n_y3Pos, float n_x4Pos, float n_y4Pos, float n_x5Pos, float n_y5Pos, float n_m, int n_c, float n_d) {
    x3Pos=380;
    y3Pos=100;
    x4Pos=400;
    y4Pos=60;
    x5Pos=420;
    y5Pos=100;
    // m=10;
    // d=0;
    // c=0;

    x3Pos= n_x3Pos;
    y3Pos= n_y3Pos;
    // m= n_m;
    // c= n_c;
    // d= n_d;
  }
  public void render() {
    fill(255, 0, 0);
    triangle(x3Pos, y3Pos, x4Pos, y4Pos, x5Pos, y5Pos);
    y3Pos++;
    y5Pos++;
    y4Pos++;
  }
}


