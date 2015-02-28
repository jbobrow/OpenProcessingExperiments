
//number of particles upon ball exploding
Explosion[] ex = new Explosion[100];
//ball callouts	
Ball ball ;
Ball ball2;
//initial coordinate variables
float x=0;
float y=0;


void setup() {
  size(600, 600);
  PFont fontA;
  fontA = loadFont("AgencyFB-Reg-48.vlw");
  textFont(fontA, 100);
  ellipseMode(CENTER);

  restart();
}  

void draw() {
  background(0);
  fill(0);
  pushMatrix();
  translate(0, -20);

  for (int g=0;g<30;g++) {
    translate(0, 20);
    pushMatrix();
    for (int i=0;i<20;i++) {

      rect(0, 0, 50, 20);
      translate(50, 0);
    }
    popMatrix();
  }
 popMatrix();

  //winner! appearing as balls colide
  if (dist(ball.x, ball.y, ball2.x, ball2.y)<35) {

    for (int i=0;i<ex.length;i++) {
      ex[i].render();
    }
    colorMode(RGB);
    fill(random(255), random(255), random(255));

    text("WINNER!", 180, height/2, 255);
    //noLoop();
  }
  else {
    ball.update();
    ball2.update();
  }
}

void restart() {
  //balls setup
  ball = new Ball(width/2, height/2, 0.1, 4);
  ball2 = new Ball(random(width), random(height), 0.1, 0);

  //exploding particles setup
  for (int i=0;i<ex.length;i++) {
    ex[i] = new Explosion(ball2.x, ball2.y);
  }
}

void mouseClicked() {
  restart();
}

void grid(int s) {

  for (int x=0;x<width/2;x+=s) {
    for (int y=0;y<width/2;y+=s) {
      rect(x, y, s, s);
    }
  }
}

//Exploding particles class
class Explosion {

  float xPos=0;
  float yPos=0;
  float t=0;
  float m=0;

  public Explosion(float xPos, float yPos) {
    this.xPos = xPos;
    this.yPos = yPos;
    t = random(360);
    m=random(5);
  }

  public void render() {
    //function calling particles to appear
    fill(255);
    xPos += m*cos(radians(t));
    yPos += m*sin(radians(t));
    fill(0);
    ellipse(xPos, yPos, 5, 5);
  }
}
//Ball Class
class Ball {
  public float x=0;
  public float y=0;
  float a=0;
  int d=0;

  public Ball(float x, float y, float a, int d) {
    this.x=x;
    this.y=y;
    this.a=a;
    this.d=d;
  }

  public void update() {

    if (keyPressed) {

      if (keyCode == 38) {
        y-=d;
      }
      if (keyCode == 37) {
        x-=d;
      }
      if (keyCode == 39) {
        x+=d;
      }
      if (keyCode == 40) {
        y+=d;
      }
      if (x>width) {
        x=0;
      }
      if (x<0) {
        x=width;
      }
      if (y>height) {
        y=0;
      }
      if (y<0) {
        y=height;
      }
    }

    //circular path of ball
    x+=cos(radians(a+=0.05))*d;
    y+=sin(radians(a+=0.05))*d;
   
    //balls colour change and inner colour
    fill(0);
    if (x<width && y<height) {
      if (key == ' ') {
        stroke(random(255)+100, random(255)+100, random(255)+100);
      }
    }
    //balls size alteration as it travels through window
    ellipse(x, y, map(x, 0, width, 10, 50)+map(y, 0, width, 10, 50), map(x, 0, height, 10, 50)+map(y, 0, height, 10, 50));
  }
}


