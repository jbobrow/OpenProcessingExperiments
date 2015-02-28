
//Star function borrowed from here: http://processing.org/learning/anatomy/

float x,y;
float rspeed = 1;
float xspeed;
float yspeed;
float xaccel;
float yaccel;
void setup() {

  size(800,500);

  xspeed = hour()/2;
  yspeed = hour()/2;
  xaccel = yaccel = minute()/60;
  smooth();
  x = width/2;
  y = height/2;
}



void draw() {
  background(50,100,180);

  println( hour()%12 + ":" + minute() + ":" + second());

  pushMatrix();
  translate(width/2, height/2);

  //MOVEMENT

  xspeed = xspeed + xaccel;
  yspeed = yspeed + yaccel;
  x += xspeed;
  y += yspeed;
  popMatrix();
  if (x > width) {
    xspeed = -xspeed;
    xaccel = -xaccel;
    x = width;
  }
  if (y > height) { 
    yspeed = -yspeed;
    yaccel = -yaccel;
    y = height;
  } 
  if (x < 0)
  {
    xspeed = -xspeed;
    xaccel = -xaccel;
    x = 0;
  }
  if (y < 0)
  {
    yspeed = -yspeed;
    yaccel = -yaccel;
    y = 0;
  }

  pushMatrix();
  translate(x,y);
  rspeed += 20*minute();
  rotate(rspeed);
  star(second()*3,0,0,hour()*10, second()/3 + 1,0,0);
  popMatrix();
}


void star(int n, float cx, float cy, float r, float proportion, int ix, int jy)
{
  star(n, cx, cy, 2.0 * r, 2.0 * r, 0.0, proportion, ix, jy);
}



void star(int n, float cx, float cy, float w, float h,
float startAngle, float proportion, int ix, int jy)
{

  fill((second()*10)%255,second()*10,hour()*10);
  if (n < 2)
    ellipse(0,0,w,h);

  if (n > 2)
  {
    float angle = TWO_PI/ (2 *n);  // twice as many sides
    float dw; // draw width
    float dh; // draw height

    w = w / 2.0;
    h = h / 2.0;

    //pushMatrix();

    beginShape();

    for (int i = 0; i < 2 * n; i++)
    {
      dw = w;
      dh = h;
      if (i % 2 == 1) // for odd vertices, use short radius
      {
        dw = w * proportion;
        dh = h * proportion;
      }

      vertex(cx + dw * cos(startAngle + angle * i),
      cy + dh * sin(startAngle + angle * i));
    }
    endShape(CLOSE);
  }

  //popMatrix();
}


