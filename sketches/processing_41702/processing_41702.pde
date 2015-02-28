

Cloud clouds[] = new Cloud[4];
Rectangle recky[] = new Rectangle[4];

/*float rectX = 350;
 float rectY = 0;
 float speed = 0;
 float gravity = 0.1;*/

void setup() {
  size(700,400);

  smooth();

  int i = 0;

  while(i < 4) {

    clouds[i] = new Cloud((i+1)*(width/4), 120, 0.1, 60, 45);
    recky[i] = new Rectangle((i+1)*(width/4),0,0,0.1);

    i++;
  }
}

void draw() {

  int i = 0;

  background(0);

  while(i < 4) {

    clouds[i].drawCloud();
    clouds[i].fly();

    recky[i].drawRecky();
    recky[i].Movement();

    i++;
  }
}  

class Cloud {

  float xStore[] = new float[20];
  float yStore[] = new float[20];
  float s1Store[] = new float[20];
  float s2Store[] = new float[20];

  float xPos;
  float yPos;
  float wind;
  float size1;
  float size2;

  Cloud(float x, float y, float w, float s1, float s2) {

    xPos = x;
    yPos = y;
    wind = w;
    size1 = s1;
    size2 = s2;

    int i = 0;

    while(i < 20) {

      xStore[i] = random(-50,50);
      yStore[i] = random(-30,30);
      s1Store[i] = random(55,60);
      s2Store[i] = random(55,60);

      i++;
    }
  }

  void fly() {

    xPos = xPos+wind;

    if (xPos > width) {
      xPos = 0;
    }
  }

  void drawCloud() {

    int i = 0;

    fill(255, 240);
    noStroke();

    while(i < 20) {

      ellipse(xPos+xStore[i], yPos+yStore[i], s1Store[i], s2Store[i]); 

      i++;
    }
  }
} 

class Rectangle {

  float rectX;
  float rectY;
  float speed;
  float gravity;   

  Rectangle(float rx, float ry, float sp, float gy) {

    rectX = rx;
    rectY = ry;
    speed = sp;
    gravity = gy;
  } 

  void Movement() {

    rectY = rectY+speed;
    speed = speed+gravity;
    rectX = rectX+0.1;

    if (rectY > 105) {

      speed = speed*-0.979222;
    }

    if (rectX > width) {

      rectX = 0;
    }
  }

  void drawRecky() {

    fill(219, 187, 121);
    rect(rectX, rectY, 15, 15);
  }
}


