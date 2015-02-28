
Thing one;
Thing two;


void setup() {
  size(1200, 700);
  smooth();
  one = new Thing();
  two = new Thing();
  one.clr = color(255, 40);
  two.clr = color(#FF0009, 35);
  noStroke();
}

void draw() {
  background(#740D0D);

  one.display();
  one.move();

  two.display();
  two.move();


  //PLAYER ONE
  if (keyPressed) {
    if (key == 'a') {
      one.updateAngle(radians(-1));
    } 
    else if (key == 'd') {
      one.updateAngle(radians(1));
    }
  }

  //PLAYER TWO
  if (mousePressed) {
    if (mouseButton == LEFT) {
      two.updateAngle(radians(-1));
    } 
    else  if (mouseButton == RIGHT) {
      two.updateAngle(radians(1));
    }
  }


  for (int i=0; i<one.bulletCount; i++) {
    if(dist(one.bullets[i].x, one.bullets[i].y, two.x, two.y) < two.radius) {
      two.cellCount--;
    }
  }


  if (two.cellCount < 0 ) {
    fill(255, 80);
    textSize(35);
    text ("WHITE BLOOD CELL WINS!", 380, 350);
    textSize(25);
    text("RED BLOOD CELL ELIMINATED.", 420, 310);  
  }


  for (int i=0; i<two.bulletCount; i++) {
    if(dist(two.bullets[i].x, two.bullets[i].y, one.x, one.y) < one.radius) {
      one.cellCount--;
    }
  }
  
    if (one.cellCount < 0 ) {
    fill(#640101);
    textSize(35);
    text ("RED BLOOD CELL WINS!", 420, 350);
    textSize(25);
    text("WHITE BLOOD CELL ELIMINATED.", 420, 310);  
  }
  
}

void keyPressed() {
  if (key == ' ') {
    //one.cellCount--;
    //two.cellCount++;
    one.fire();
  }

  if (key == 'p') {
    //two.cellCount--;
    //one.cellCount++;
    two.fire();
  }
}

class Bullet {
  float x = 0;
  float y = 0;
  float startX = 0;
  float startY = 0;
  float radius = 0;
  float angle = 0;

  float speed = 5;
  color clr;


  Bullet() {
  }

  void display() {
    fill(clr);
    ellipse(x, y, 16, 16);
  }



  void move() {
    radius += speed;
    x = startX + cos(angle) * radius;
    y = startY + sin(angle) * radius;
  }
}

class Thing {
  float x;
  float y;
  float radius = 80;
  float angle = 0;

  float speed;
  color clr;

  int cellCount = 150;
  int bulletCount = 0;

  Cell[] cells = new Cell[cellCount*10];
  Bullet [] bullets = new Bullet[3000];

  Thing() {
    x =  random(radius, width - radius);
    y = random(radius, height - radius);
    angle = random(-PI, PI);
    speed = 2;

    for (int i=0; i<cells.length; i++) {
      cells[i] = new Cell(radius);
    }
  }




  void display() {
    pushMatrix();
    translate(x, y);

    fill(clr);
    noStroke();
    ellipse(0, 0, radius*2, radius*2);

    for (int i=0; i<cellCount; i++) {
      cells[i].display();
    }


    //mouth
    float mouthX = cos(angle) * (radius+8);
    float mouthY = sin(angle) * (radius+8);
    ellipse(mouthX, mouthY, 16, 16);

    popMatrix();

    for (int i=0; i<bulletCount; i++) {
      bullets[i].display();
    }
  }

  void updateAngle(float a) {
    angle +=a ;
  }

  void move() {
    angle += radians(random(-4, 4));
    x += cos(angle) * speed;
    y += sin(angle) * speed;


    if (x > width-radius) {
      x = width-radius - speed;
    }

    if (y > height-radius) {
      y = height-radius - speed;
    }

    if (x < radius) {
      x = speed+radius;
    }

    if (y < radius) {
      y = speed+radius;
    }

    for (int i=0; i<cellCount; i++) {
      cells[i].move();
    }

    for (int i=0; i<bulletCount; i++) {
      bullets[i].move();
    }
  }

  void fire() {
    bullets[bulletCount] = new Bullet();
    bullets[bulletCount].startX = x;
    bullets[bulletCount].startY = y;
    bullets[bulletCount].angle = angle;
    bullets[bulletCount].clr = clr;

    bulletCount++;
    if (bulletCount > bullets.length) {
      bulletCount=0;
    }
  }
}


class Cell {
  float angle;
  float radius;
  float maxRadius;
  float angleSpeed;
  float radiusSpeed = 1;
  float easing = 0.25;

  Cell(float amaxRadius) {
    maxRadius = amaxRadius;
    angle = random(0, TWO_PI);

    //bound dots within big blood cells
    radius = random(20, maxRadius - 30);
    angleSpeed = radians(0.5);
  }

  void move() {
    angle += random(-angleSpeed, angleSpeed);
    radius +=  random(-radiusSpeed, radiusSpeed);
    if (radius > maxRadius) {
      radius = maxRadius - radiusSpeed;
    }
  }


  void display() {
    float x = cos(angle) * radius;
    float y = sin(angle) * radius;
    ellipse(x, y, 16, 16);
  }
}


