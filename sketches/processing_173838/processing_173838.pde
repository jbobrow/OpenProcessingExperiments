
Frog kermit;
Car [] first = new Car[9];
Car [] second = new Car[9];
Car [] third = new Car[9];
Car [] fourth = new Car[9];
Car [] fifth = new Car[9];

Log [] lfirst = new Log [3];
Log [] lsecond = new Log [3];
Log [] lthird = new Log [3];
Log [] lfourth = new Log [3];
Log [] lfifth = new Log [3];


boolean alive = true;


void setup() {
  size(400, 600);
  kermit = new Frog(520, 200);
  float x = 0;

  for (int i = 0; i < first.length; i++) {
    first [i] = new Car(x, 360);
    x += 200;
    first[i].speed = -3;
  }  
  x = 0;
  for (int i = 0; i < second.length; i++) {
    second [i] = new Car(x, 480);
    x += 200;
    second[i].speed = 2;
  }
  x = 0;
  for (int i = 0; i < third.length; i++) {
    third [i] = new Car (x, 440);
    x += 200;
    third[i].speed = 4;
  }
  x = 0;
  for (int i = 0; i < fourth.length; i++) {
    fourth[i] = new Car (x, 400);
    x += 200;
    fourth[i].speed = -1;
  }
  x = 0;
  for (int i = 0; i < fifth.length; i++) {
    fifth[i] = new Car (x, 320);
    x += 200;
    fifth[i].speed = 5;
  }


  x = 0;
  for (int i = 0; i < lfirst.length; i++) {
    lfirst[i] = new Log (x, 240);
    x += 400;
    lfirst[i].speed = 1;
  }
  x = 0;
  for (int i = 0; i < lsecond.length; i++) {
    lsecond[i] = new Log (x, 200);
    x += 100;
    lsecond[i].speed = -2;
  }
  x = 0;
  for (int i = 0; i < lthird.length; i++) {
    lthird[i] = new Log (x, 160);
    x+=100;
    lthird[i].speed = -4;
  }
  x = 0;
  for (int i = 0; i < lfourth.length; i++) {
    lfourth[i] = new Log (x, 120);
    x+= 100;
    lfourth[i].speed = 2;
  }
  x = 0;
  for (int i = 0; i < lfifth.length; i++) {
    lfifth[i] = new Log (x, 80);
    x+=100;
    lfifth[i].speed = 4;
  }
}
  void draw() {
    drawBackground();

    for (int i = 0; i < lfirst.length; i++) {
      lfirst[i].move();
      lfirst[i].display();
      lsecond[i].move();
      lsecond[i].display();
      lthird[i].move();
      lthird[i].display();
      lfourth[i].move();
      lfourth[i].display();
      lfifth[i].move();
      lfifth[i].display();
    }

    kermit.display();


    for (int i = 0; i < first.length; i++) {
      second[i].move();
      second[i].display();

      third[i].move();
      third[i].display();

      fourth[i].move();
      fourth[i].display();

      fifth[i].move();
      fifth[i].display();
    }
    for (int i = 0; i < first.length; i++) {
      first[i].move();
      first[i].display();
      if (first[i].didHitFrog(kermit.x, kermit.y)||second[i].didHitFrog(kermit.x, kermit.y)||third[i].didHitFrog(kermit.x, kermit.y)||fourth[i].didHitFrog(kermit.x, kermit.y)||fifth[i].didHitFrog(kermit.x, kermit.y)) {
        alive = false;
      }
    }
    if (kermit.y < 280) {
      alive = false;
      for ( int i = 0; i < lfirst.length; i++) {
        if (lfirst[i].logDidHitFrog(kermit.x, kermit.y)) {
          alive = true;
          kermit.x += lfirst[i].speed;
          break;
        }
      }
    }

    if (kermit.y < 240) {
      alive = false;
      for ( int i = 0; i < lsecond.length; i++) {
        if (lsecond[i].logDidHitFrog(kermit.x, kermit.y)) {
          alive = true;
          kermit.x += lsecond[i].speed;
          break;
        }
      }
    }

    if (kermit.y < 200) {
      alive = false;
      for ( int i = 0; i < lthird.length; i++) {
        if (lthird[i].logDidHitFrog(kermit.x, kermit.y)) {
          alive = true;
          kermit.x += lthird[i].speed;
          break;
        }
      }
    }
     
    if(kermit.y < 160) {
      alive = false;
      for (int i = 0; i < lfourth.length; i++) {
        if(lfourth[i].logDidHitFrog(kermit.x,kermit.y)) {
          alive = true;
          kermit.x += lfourth[i].speed;
          break;
        }
      }
    }
     if(kermit.y < 120) {
      alive = false;
      for (int i = 0; i < lfifth.length; i++) {
        if(lfifth[i].logDidHitFrog(kermit.x,kermit.y)) {
          alive = true;
          kermit.x += lfifth[i].speed;
          break;
        }
      }
    }

    if (kermit.x > 360 ) {
      kermit.x = 360;
    }
    
    if (kermit.x < 0) {
      kermit.x = 0;
    }
    
    if (kermit.y > 520) {
      kermit.y = 520;
    }

    if (alive == false) {
      kermit.x = 200;
      kermit.y = 520;
      alive = true;
    }
  }
  
    void keyPressed() {
    if (key == CODED) {
      if (keyCode == UP) {
        kermit.y -= 40;
      }
      if (keyCode == DOWN) {
        kermit.y += 40;
      }
      if (keyCode == LEFT) {
        kermit.x -= 40;
      }
      if (keyCode == RIGHT) {
        kermit.x += 40;
      }
    }
  }

  void drawBackground() {
    //lilys
    fill(#6BD84A);
    stroke(#6BD84A);
    rect(0, 0, width, 80);
    //pond
    fill(#37AAAF);
    stroke(#37AAAF);
    rect(0, 80, width, 200);
    rect(40, 40, 40, 40);
    rect(120, 40, 40, 40);
    rect(200, 40, 40, 40);
    rect(280, 40, 40, 40);
    rect(360, 40, 40, 40);
    //sidewalk
    fill(#6B6083);
    stroke(#6B6083);
    rect(0, 280, width, 40);
    //street
    fill(20);
    stroke(20);
    rect(0, 320, width, 200);
    stroke(255);
    for (int i = 0; i < width; i+=10) {
      stroke(#FAEE00);
      point(i, 480);
      point(i, 440);
      point(i, 400);
      point(i, 360);
    }
    //sidewalk
    fill(#6B6083);
    stroke(#6B6083);
    rect(0, 520, width, 40);
    //score
    fill(150);
    stroke(150);
    rect(0, 560, width, 40);
  }


class Car {
  int Length;
  float x, y;
  float speed;

  Car(float nx, float ny) {
    x = nx;
    y = ny;
    speed = 2;
    Length = 50;
  }
  void move() {
    x += speed;
    if (x > width) {
      x = -200;
    }
    if (x < -200) {
      x = width;
    }
  }
  boolean didHitFrog(float fx, float fy) {
    if (abs(x-fx) < Length && abs(y-fy) < 1) {
      return true;
    } else return false;
  }

  void display() {
    noStroke();
    fill(#FF55C4);
    rect(x, y+5, Length, 30);
  }
}

class Frog {
  
  float g = 40;
  float x, y;
 
  Frog(float nx, float ny) {
    x=ny;
    y=nx;

  }
  void display() {
    fill(0,240,0);
    noStroke();
    ellipse(x+g/2, y+g/2, g, g);
  }
}

class Log {
  int Length;
  float x, y;
  float speed;

  Log(float nx, float ny) {
    x = nx;
    y = ny;
    speed = 1;
    Length = 45;
  }
  void move() {
    x += speed;
    if (x > width) {
      x = -200;
    }
    if (x < -200) {
      x = width;
    }
  }
  boolean logDidHitFrog(float fx, float fy) {
    if (abs(x+30-fx) < Length && abs(y -fy) < 40) {
      return true;
    } else return false;
  }

  void display() {
    fill(#4D1414);
    noStroke();
    rect(x+30, y+5, Length, 30);
    rect(x, y+5, 60, 30);
  }
}



