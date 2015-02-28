
Fish[] fishes = new Fish[10];

void setup(){
  size(480,480);
  for(int i = 0; i < fishes.length; i++){
  fishes[i] = new Fish();
  }
}

void draw(){
  background(0);
  for(int i = 0; i < fishes.length; i++){
    fishes[i].move();
    fishes[i].display();
    fishes[i].timer();
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
  int totalTime = (int)random(2500, 5000);

  Fish() {
    x = random(width);
    y = random(height);
    r = random(10, 20);
    xspeed = random(-2, 2);
    yspeed = random(-2, 2);
    Rgba = random(50, 250);
    rGba = random(50, 250);
    rgBa = random(50, 250);
    rgbA = random(100, 180);
    savedTime = millis();
  }

  void move() {
    x += xspeed;
    y += yspeed;
    if (x>width || x<0) {
      xspeed *= -1;
    }

    if (y>height || y<0) {
      yspeed *= -1;
    }
  }

  void display() {
    noStroke();
    fill(Rgba, rGba, rgBa, rgbA);
    ellipse(x, y, r, r);
  }

  void timer() {
    int passedTime = millis() - savedTime;
    if (passedTime > totalTime) {
      xspeed = random(-2, 2);
      yspeed = random(-2, 2);
      savedTime = millis();
      int totalTime = (int)random(2500, 5000);
      r += (int)random(0,5);
      rgbA -= (int)random(2,5);
      
      if(r > 60){
        totalTime = 10000000;
        x = -1000;
        y = -1000;
        xspeed = 0;
        yspeed = 0;
        r = 0;
      }
    }
  }
}



