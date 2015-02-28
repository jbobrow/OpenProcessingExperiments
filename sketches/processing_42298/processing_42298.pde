
/*
  by Edmond Chew
 mouseClick
 
 */
//int numBirds = 50;
int c=0;
Bird[] b = new Bird[50];
int xPos, yPos;
float xVel, yVel;


void setup() {
  size(600, 600);
  smooth();
  //stroke(204);
  //strokeWeight(1);
  noStroke();
  for (int i=0; i<b.length; i++) {
    xPos = (int)random(width/4) + width/2 - width/8;
    yPos = (int)random(height/4) + height/2 - height/8;
    float xVel = max(random(0.1), 0.01);
    float yVel = xVel;
    b[i] = new Bird(xPos, yPos, xVel, yVel);
  }
}

void draw() 
{
  background(255);
  for (int i=0; i<b.length; i++) {
    b[i].update();
    noStroke();
    fill(60, 40, 0+c);
    b[i].display();
    c++;
  }
}

class Bird extends Multiple 
{
  float angle = 0.0;
  float birdSize = 3.0;

  Bird(int ix, int iy, float ivx, float ivy) 
  {
    super(ix, iy, ivx, ivy);
  }

  void display() 
  {
    pushMatrix();
    translate(x, y);
    rect(0, 0, 2, 2);
    popMatrix();
  }
}

class Multiple {

  float x, y;
  float vx, vy;
  float tx, ty;

  Multiple(int xpos, int ypos, float velx, float vely) 
  {
    x = xpos;
    y = ypos;
    vx = velx;
    vy = vely;
    tx = xpos;
    ty = ypos;
  }

  void update() 
  {
    stroke(200);
    strokeWeight(2);
    line(0, height/2.5, width, height/2.5);
    if (y>height/2.5)
    {
      ty += random(6)-5;
      tx += random(6)-5;
    }
    else if (y<height/2.6)
    {
      ty += random(3)-3;
      tx += random(3)-3;
    }

    if (ty<0) ty=height;
    else if (tx<0) tx=width;

    x += (tx - x);
    y += (ty - y);

    if (mousePressed) 
    {
      tx = mouseX;
      float dx = tx - x;
      if (abs(dx) > 1) 
      {
        x += dx*vx;
      }
      ty = mouseY;
      float dy = ty - y;
      if (abs(dy) > 1) 
      {
        x += dx*vx;
      }
    }
  }
}


