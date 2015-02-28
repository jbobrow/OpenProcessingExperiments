
//definitions

PImage b;

float xpos, ypos;

int ballsize = 30;

float xspeed = 1;
float yspeed = 1;

int xdirection = 3;
int ydirection = 1;

void setup() {
  size(500, 300);
  b = loadImage("disco.jpg");
    noStroke();
  frameRate(70);
  xpos = width/2;
  ypos = height/2;
  //starting with a random color
  fill(random(1, 255), random(1, 255), random(1, 255));
}



void draw() {
  //  fill(255, 40);
  //  rect(0,0,width,height);
  background(20, 100, 150);
  
  image(b,0,0);

  //changing position of ball
  xpos += (xspeed * xdirection);
  ypos += (yspeed * ydirection);


  //setting boundaries
  if (xpos > width-ballsize/2 || xpos < 0 +ballsize/2) {
    xdirection *= -1;

    int r = int(random(1, 255));
    int g = int(random(1, 255));
    int b = int(random(1, 255));

    fill(r, g, b);
    //ellipse(xpos, ypos, ballsize, ballsize);
  }
  if (ypos > height-ballsize/2 || ypos < 0 +ballsize/2) {
    ydirection *= -1;

    int r = int(random(1, 255));
    int g = int(random(1, 255));
    int b = int(random(1, 255));

    fill(r, g, b);
    //ellipse(xpos, ypos, ballsize, ballsize);
  }

  if (mousePressed && (mouseButton == LEFT)) {
    ballsize --;
    if (ballsize<3) {
      ballsize=3;
    }
  } 
  else if (mousePressed && (mouseButton == RIGHT)) {
    ballsize ++;
    if (ballsize>200) {
      ballsize=200;
    }
  } 
  else {
    xspeed = 1;
  }

  //ball


  ellipse(xpos, ypos, ballsize, ballsize);
}

void mouseDragged() {
  int r = int(random(1, 255));
  int g = int(random(1, 255));
  int b = int(random(1, 255));

  fill(r, g, b);
}


