
/*

mouse left button : save png & freeze(toggle)
mouse right button : reset
 
*/

Trace[] trace;
int num = 10;
boolean freeze = false;

void setup() {
  size(600, 600);
  background(255);
  smooth();
  noStroke();
  colorMode(HSB);

  trace = new Trace[num];
  for (int i=0; i<num; i++) {
    trace[i] = new Trace();
  }
}

void draw() {
  for (int i=0; i<num; i++) {
    trace[i].render(10+i*random(5, 15), i);
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    if (freeze) {
      freeze = false;
      loop();
    }   
    else if (!freeze) {
      freeze = true;
      noLoop();
      save("/capture/"+month()+"."+day()+"."+hour()+"."+minute()+"."+second()+".png");
    }
  }
  else if (mouseButton == RIGHT) {
    fill(255);
    rect(0, 0, width, height);

    if (freeze) {
      freeze = false;
      loop();
    }   

    for (int i=0; i<num; i++) {
      trace[i].x = width/2;
      trace[i].y = height/2;
    }
  }
}

class Trace
{
  Trace() {
  }

  float rad;
  float target_x = random(width);
  float target_y = random(height);
  float angle;
  float ratio = 0.02;
  float x = width/2;
  float y = height/2;

  void render(float r, int c) {

    switch(c) {
    case 1:
    case 9:
      fill(random(50), random(200, 255), random(100, 255), 200);
      break;
    case 7:
      fill(random(10, 60), random(255), random(200, 255), 200);
      break;
    case 3:
      fill(random(50), random(100, 255), 255, 200);
      break;
    case 8:
      fill(random(230, 255), random(255), random(100, 255), 200);
      break;
    case 4:
    case 6:
      fill(random(50), random(255), random(100, 255), 200);
      break;
    case 2:
    case 5:
      fill(random(250, 255), random(255), random(100, 255), 200);
      break;
    case 0:
      fill(0, 0, random(100, 255), 100);
      break;
    }

    rad = sin(frameCount*0.01) * r;
    angle += random(-6, 6);
    ellipse(x, y, rad*2, rad);

    x += (target_x - x ) * ratio;
    y += (target_y - y ) * ratio;

    target_x = x + tan(radians(angle))*random(50);
    target_y = y + sin(radians(angle))*random(50);

    if (x>=width-rad || x<=rad) {
      target_x = random(width);
    }
    if (y>=height-rad || y<=rad) {
      target_y = random(height);
    }
  }
}
