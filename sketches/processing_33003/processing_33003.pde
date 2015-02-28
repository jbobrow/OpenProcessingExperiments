

//definitions
float xpos, ypos;

int ballsize = 30;

float xspeed = 1;
float yspeed = 1;

int xdirection = 3;
int ydirection = 1;

void setup() {
  size(500, 300);
  noStroke();
  frameRate(70);
  xpos = width/2;
  ypos = height/2;
  //starting with a random color
  fill(random(1,255),random(1,255),random(1,255));
}



void draw() {
  background(20, 100, 150);

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

  //ball


  ellipse(xpos, ypos, ballsize, ballsize);
}


