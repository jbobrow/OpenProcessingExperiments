
Fish[] fishes = new Fish[5];
bigFish[] bigFishes = new bigFish[5];
doubleFish[] doubleFishes = new doubleFish[5];
revFish[] revFishes = new revFish[5];

void setup() {
  size(480, 480);
  for (int i = 0; i < fishes.length; i++) {
    fishes[i] = new Fish();
  }
  for (int i = 0; i < bigFishes.length; i++) {
    bigFishes[i] = new bigFish();
  }
  for (int i = 0; i < doubleFishes.length; i++) {
    doubleFishes[i] = new doubleFish();
  }
  for (int i = 0; i < revFishes.length; i++) {
    revFishes[i] = new revFish();
  }
}

void draw() {
  background(0);
  for (int i = 0; i < fishes.length; i++) {
    fishes[i].move();
    fishes[i].display();
    fishes[i].timer();
  }
  for (int i = 0; i < bigFishes.length; i++) {
    bigFishes[i].move();
    bigFishes[i].display();
    bigFishes[i].timer();
  }
  for (int i = 0; i < doubleFishes.length; i++) {
    doubleFishes[i].move();
    doubleFishes[i].display();
    doubleFishes[i].timer();
  }
  for (int i = 0; i < revFishes.length; i++) {
    revFishes[i].move();
    revFishes[i].display();
    revFishes[i].timer();
  }
}

class bigFish {
  float Rgba;
  float rGba;
  float rgBa;
  float rgbA;
  float r;
  float x;
  float y;
  float xspeed;
  float yspeed;
  int savedTime;
  int totalTime = (int)random(3000, 6000);

  bigFish() {
    x = random(r,width-r);
    y = random(height-r);
    r = random(5, 10);
    xspeed = random(-2+(r/15), 2-(r/15));
    yspeed = random(-2+(r/15), 2-(r/15));
    Rgba = random(50, 250);
    rGba = random(50, 250);
    rgBa = random(50, 250);
    rgbA = random(100, 180);
    savedTime = millis();
  }

  void move() {
    x += xspeed;
    y += yspeed;
    if (x>(width-(r/2)) || x<(r/2)) {
      xspeed *= -1;
    }

    if (y>(height-(r/2)) || y<(r/2)) {
      yspeed *= -1;
    }
  }

  void display() {
    noStroke();
    fill(Rgba,rGba,rgBa,rgbA/3);
    ellipse(x,y,5*r,5*r);
    fill(Rgba, rGba, rgBa, 2*rgbA/3);
    ellipse(x, y, r, r);
  }

  void timer() {
    int passedTime = millis() - savedTime;
    if (passedTime > totalTime) {
      xspeed = random(-2+(r/15), 2-(r/15));
      yspeed = random(-2+(r/15), 2-(r/15));
      savedTime = millis();
      int totalTime = (int)random(2500, 5000);
      r += (int)random(0,2);
      rgbA -= (int)random(1,3);
      
      if(r > 30){
 r = random(5,10);
 
      }
    }
  }
}

class doubleFish {
  float Rgba;
  float rGba;
  float rgBa;
  float rgbA;
  float r;
  float x;
  float y;
  float xspeed;
  float yspeed;
  int savedTime;
  int totalTime = (int)random(3000, 6000);

  doubleFish() {
    x = random(r,width-r);
    y = random(r,height-r);
    r = random(5, 10);
    xspeed = random(-2+(r/20), 2-(r/20));
    yspeed = random(-2+(r/20), 2-(r/20));
    Rgba = random(50, 250);
    rGba = random(50, 250);
    rgBa = random(50, 250);
    rgbA = random(100, 180);
    savedTime = millis();
  }

  void move() {
    x += xspeed;
    y += yspeed;
    if (x>(width-(r/2)) || x<(r/2)) {
      xspeed *= -1;
    }

    if (y>(height-(r/2)) || y<(r/2)) {
      yspeed *= -1;
    }
  }

  void display() {
    noStroke();
    fill(Rgba,rGba,rgBa,rgbA/4);
    ellipse(x,y,5*r,5*r);
    fill(Rgba,rGba,rgBa,rgbA/4);
    ellipse(x,y,3*r,3*r);
    fill(Rgba, rGba, rgBa, rgbA/2);
    ellipse(x, y, r, r);
  }

  void timer() {
    int passedTime = millis() - savedTime;
    if (passedTime > totalTime) {
      xspeed = random(-2+(r/15), 2-(r/15));
      yspeed = random(-2+(r/15), 2-(r/15));
      savedTime = millis();
      int totalTime = (int)random(2500, 5000);
      r += (int)random(0,2);
      rgbA -= (int)random(1,3);
      
      if(r > 30){
 r = random(5,10);
      }
    }
  }
}

class Fish {
  float Rgba;
  float rGba;
  float rgBa;
  float rgbA;
  float r;
  float x;
  float y;
  float xspeed;
  float yspeed;
  int savedTime;
  int totalTime = (int)random(3000, 6000);

  Fish() {
    x = random(r,width-r);
    y = random(r,height-r);
    r = random(5, 10);
    xspeed = random(-2+(r/20), 2-(r/20));
    yspeed = random(-2+(r/20), 2-(r/20));
    Rgba = random(50, 250);
    rGba = random(50, 250);
    rgBa = random(50, 250);
    rgbA = random(100, 180);
    savedTime = millis();
  }

  void move() {
    x += xspeed;
    y += yspeed;
    if (x>(width-(r/2)) || x<(r/2)) {
      xspeed *= -1;
    }

    if (y>(height-(r/2)) || y<(r/2)) {
      yspeed *= -1;
    }
  }

  void display() {
    noStroke();
    fill(Rgba,rGba,rgBa,rgbA/2);
    ellipse(x,y,3*r,3*r);
    fill(Rgba, rGba, rgBa, rgbA/2);
    ellipse(x, y, r, r);
  }

  void timer() {
    int passedTime = millis() - savedTime;
    if (passedTime > totalTime) {
      xspeed = random(-2+(r/20), 2-(r/20));
      yspeed = random(-2+(r/20), 2-(r/20));
      savedTime = millis();
      int totalTime = (int)random(2500, 5000);
      r += (int)random(0,3);
      rgbA -= (int)random(1,3);
      
      if(r > 40){
 r = random(5,10);
      }
    }
  }
}

class revFish {
  float Rgba;
  float rGba;
  float rgBa;
  float rgbA;
  float r;
  float x;
  float y;
  float xspeed;
  float yspeed;
  int savedTime;
  int totalTime = (int)random(3000, 6000);

  revFish() {
    x = random(r,width-r);
    y = random(r,height-r);
    r = random(5, 10);
    xspeed = random(-2+(r/20), 2-(r/20));
    yspeed = random(-2+(r/20), 2-(r/20));
    Rgba = random(50, 250);
    rGba = random(50, 250);
    rgBa = random(50, 250);
    rgbA = random(100, 180);
    savedTime = millis();
  }

  void move() {
    x += xspeed;
    y += yspeed;
    if (x>(width-(r/2)) || x<(r/2)) {
      xspeed *= -1;
    }

    if (y>(height-(r/2)) || y<(r/2)) {
      yspeed *= -1;
    }
  }

  void display() {
    noStroke();
    fill(Rgba,rGba,rgBa,rgbA/3);
    ellipse(x,y,3*r,3*r);
    fill((255-Rgba)/2, (255-rGba)/2, (255-rgBa)/2, rgbA);
    ellipse(x, y, r, r);
  }

  void timer() {
    int passedTime = millis() - savedTime;
    if (passedTime > totalTime) {
      xspeed = random(-2+(r/20), 2-(r/20));
      yspeed = random(-2+(r/20), 2-(r/20));
      savedTime = millis();
      int totalTime = (int)random(2500, 5000);
      r += (int)random(0,3);
      rgbA -= (int)random(1,3);
      
      if(r > 40){
        r = random(5,10);
      }
    }
  }
}



