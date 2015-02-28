
int pupilwidth = 30;
int pupilheight = 50;
float x = 0.0;
float y = 0.0;
float ease = 0.05;
float px;
float py;

void setup () {
  size (500,300);
  rectMode (CENTER);
  noCursor ();
}


void draw () {
  background (200);
  
//white
  fill (255);
  stroke (0);
  strokeWeight (2);
  rect (125,150, 150,100);
  rect (375,150, 150,100);

  float targetX = mouseX;
  float targetY = mouseY;
  x += (targetX - x) * ease;
  y += (targetY - y) * ease;


  float constrainX1 = constrain (x, 50+(pupilwidth/2),200-(pupilwidth/2));
  float constrainY1 = constrain (y, 100+(pupilheight/2),200-(pupilheight/2));
  float constrainX2 = constrain (x, 300+(pupilwidth/2),450-(pupilwidth/2));
  float constrainY2 = constrain (y, 100+(pupilheight/2),200-(pupilheight/2));
  
//pupils
  fill (0);
  rect (constrainX1,constrainY1, pupilwidth,pupilheight);
  rect (constrainX2,constrainY2, pupilwidth,pupilheight);
  
//blink
  if (mousePressed) {
    if (mouseButton == LEFT) {
      fill (200);
      noStroke ();
      rect (125,150, 250,300);
      stroke (0);
      line (50,150, 200,150);
    } 
    else if (mouseButton == RIGHT) {
      fill (200);
      noStroke ();
      rect (375,150, 250,300);
      stroke (0);
      line (300,150, 450,150);
    }
    else {
      fill (200);
      background (200);
      stroke (0);
      line (50,150, 200,150);
      line (300,150, 450,150);
    }
  }
  
//pen
  stroke (x,y,100);
  float weight = dist (x,y, px,py);
  strokeWeight (weight*5);
  line (x,y, px,py);
  py = y;
  px = x;  
}


