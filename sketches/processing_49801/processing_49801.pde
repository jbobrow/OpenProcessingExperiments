
//created by luis gil
//http://www.legil.org

float ease = 0.001;

int numDots = 250;
Orange[] dot = new Orange[numDots];

boolean play = true;

void setup() {
  size(900, 450);
  background(255);
  colorMode(RGB, 255, 255, 255, 100);

  for (int i = 0; i < numDots; i++) {
    float wide = random(30, 60);
    float xplace = random(wide, width-wide);
    float yplace = random(wide, height-wide);
    float speedX = random(-1.5, 1.5);  
    float speedY = random(-1.5, 1.5);
    dot[i] = new Orange(xplace, yplace, wide, speedX, speedY, i, dot);
  }
}

void draw() {
  for (int i = 0; i < numDots; i++) {
    dot[i].collide();
    dot[i].move();
    //dot[i].display();
  }

}

void mousePressed() {
  play = !play;
  if(play == false) {
    noLoop();
  }
  else if(play == true) {
    loop();
  }
}

class Orange {
  float x, y;
  float diameter;
  float velocityX, velocityY;
  int id;
  Orange[] others;

  Orange(float xpos, float ypos, float dia, float velx, float vely, int ident, Orange[] oOr) {
    x = xpos;
    y = ypos;
    diameter = dia;
    velocityX = velx;
    velocityY = vely;
    others = oOr;
    id = ident;
  }

  void collide() {
    float pointSize = 0.5;
    for (int i = 0; i < numDots; i++) {
      if(i != id) {
        float dx = others[i].x - x;
        float dy = others[i].y - y;
        float distance = sqrt(dx*dx + dy*dy);
        float minDist = others[i].diameter/2 + diameter/2;
        if (distance < minDist) { 
          float angle = atan2(dy, dx);
          float targetX = x + cos(angle) * minDist;
          float targetY = y + sin(angle) * minDist;
          float ax = (targetX - others[i].x) * ease;
          float ay = (targetY - others[i].y) * ease;
          velocityX = -map(cos(angle), -1, 1, -1.5, 1.5);
          velocityY = -map(sin(angle), -1, 1, -1., 1.5);
          others[i].velocityX = map(cos(angle), -1, 1, -1.5, 1.5);
          others[i].velocityY = map(sin(angle), -1, 1, -1., 1.5);
          smooth();
          stroke(0, 25);
          strokeWeight(pointSize);
          point(x, y);
          pointSize += 0.25;
          //line(others[i].x, others[i].y, others[id].x, others[id].y);
        }
      }

    }   
  }

  void move() {
    x = x + velocityX;
    y = y + velocityY;
    if (x > width-diameter/2) {
      x = width-diameter/2;
      velocityX = -velocityX;
    }
    else if (x < diameter/2) {
      x = diameter/2;
      velocityX = -velocityX;
    }
    if (y > height-diameter/2) {
      y = height-diameter/2;
      velocityY = -velocityY;
    }
    else if (y < diameter/2) {
      y = diameter/2;
      velocityY = -velocityY;
    }
  }

  void display() {
    noFill();
    smooth();
    strokeWeight(1);
    stroke(225, 50, 25);
    ellipse(x, y, diameter, diameter);
  }
}
