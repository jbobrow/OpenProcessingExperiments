
/*
* Just for Fun
* A simple Firework
* by Daniel Barben
* 
*/ 

float g=-0.098;
int tempo = 3;
int numfireworks1=30;
int numfireworks2=30;
int numfireworks3=30;
int diameter1;
int diameter2;
int diameter3;
int xstart1;
int xstart2;
int xstart3;
int ystart1;
int ystart2;
int ystart3;
int rocketcolor1;
int rocketcolor2;
int rocketcolor3;

color[] rocketcolor = {
  color(255, 236, 24), 
  color(255, 184, 48), 
  color(242, 66, 105), 
  color(168, 87, 162), 
  color(164, 201, 70), 
  color(0, 175, 234)
};

Rocket[] fireworks1 = new Rocket[numfireworks1];
Rocket[] fireworks2 = new Rocket[numfireworks2];
Rocket[] fireworks3 = new Rocket[numfireworks3];

void setup() {
  size(192, 157);
  frameRate(25);
  smooth();
  noStroke(); 
  fire();
}

void draw() {
  fill(0, 15);
  rect(0, 0, width, height);
  for (int i = 0; i < fireworks1.length; i++) {
    fireworks1[i].move();
    fireworks1[i].display();
  }
  for (int i = 0; i < fireworks2.length; i++) {
    fireworks2[i].move();
    fireworks2[i].display();
  }
  for (int i = 0; i < fireworks3.length; i++) {
    fireworks3[i].move();
    fireworks3[i].display();
  }
}

void fire() {
  diameter1=int(random(1, 6));
  diameter2=int(random(1, 6));
  diameter3=int(random(1, 6));
  xstart1=int(random(30, width/3));
  xstart2=int(random(width/3, width/3*2));
  xstart3=int(random(width/3*2, width-30));
  ystart1=int(random(30, height/2));  
  ystart2=int(random(30, height/2));  
  ystart3=int(random(30, height/2));
  rocketcolor1=int(random(0, rocketcolor.length));
  rocketcolor2=int(random(0, rocketcolor.length));
  rocketcolor3=int(random(0, rocketcolor.length));

  for (int a = 0; a < 50; a++) {
    fill(200);
    ellipse(width/2-(width/2-xstart1)*a/49, height-(height-ystart1)*a/49, 2, 2);
    ellipse(width/2-(width/2-xstart2)*a/49, height-(height-ystart2)*a/49, 2, 2);
    ellipse(width/2-(width/2-xstart3)*a/49, height-(height-ystart3)*a/49, 2, 2);
    fill(0, 15);
    rect(0, 0, width, height);
  }

  for (int i = 0; i < fireworks1.length; i++) {
    float beta = TWO_PI/fireworks1.length*i;
    fireworks1[i] = new Rocket(xstart1, ystart1, diameter1, tempo, beta, rocketcolor1);
  }
  for (int i = 0; i < fireworks2.length; i++) {
    float beta = TWO_PI/fireworks2.length*i;
    fireworks2[i] = new Rocket(xstart2, ystart2, diameter2, tempo, beta, rocketcolor2);
  }
  for (int i = 0; i < fireworks3.length; i++) {
    float beta = TWO_PI/fireworks3.length*i;
    fireworks3[i] = new Rocket(xstart3, ystart3, diameter3, tempo, beta, rocketcolor3);
  }
}

class Rocket {
  float x, y, xstart, ystart, diameter, startspeed;
  int direction;
  int time=0;
  float beta;
  color rc;

  Rocket(float xpos, float ypos, float dia, float sp, float b, int rocketcolor) {
    x = xpos;
    y = ypos;
    ystart = ypos;
    xstart = xpos;
    diameter = dia;
    startspeed = sp;
    beta = b;
    rc = rocketcolor;
  }

  void move() {
    x = (startspeed * time * cos(beta))/2 + xstart;
    y = ((startspeed * time * sin(beta))-(g/2*time*time))/2+ystart;
  }

  void display() {
    fill(rocketcolor[rc],255-time*2);
    noStroke();
    ellipse(x, y, diameter, diameter);
    time++;
    if (time>120) {
      fire();
      time=0;
    }
  }
}
