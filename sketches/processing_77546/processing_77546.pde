
Dot[] dot = new Dot[500];

void setup(){
  size(400,400);
  colorMode(HSB,360,100,100);
  background(0);
  smooth();
  
  for(int i = 0; i < dot.length;i++){
    dot[i] = new Dot();
  }
}

void draw(){
  //background(0);
  fill(0,30);
  noStroke();
  rect(0,0,width,height);
  
  pushMatrix();
  translate(width/2,height/2);
  for(int i = 0;i <dot.length;i++){
    dot[i].display();
    dot[i].move();
  }
  popMatrix();
}
class Dot {
  float x;
  float y;
  float x_spd;
  float y_spd;
  float spd;
  float ch;
  float r;
  float t;
  float pm1, pm2;
  float theta;
  float range1;
  float range2;

  Dot() {
    theta = random(TWO_PI);
    range1 = 150;
    range2 = random(range1);
    x = range2*cos(theta);
    y = range2*sin(theta);
    spd = 1;

    pm1 = random(1);
    pm2 = random(1);
    if (pm1 > 0.5) {
      pm1 = 1;
    }
    else {
      pm1 = -1;
    }
    if (pm2 > 0.5) {
      pm2 = 1;
    }
    else {
      pm2 = -1;
    }

    x_spd = pm1 * random(spd/10, spd);
    y_spd = pm2 *random(spd/10, spd);

    t = random(TWO_PI);

    //green : 80 - 150
    //blue : 170 -260
    ch = random(360);

    r = random(1, 15);
  }

  void display() {
    for (int i = 0; i < 5;i++) {
      strokeWeight(r-(r/5*i));
      stroke(ch, 50+i*5, 100, 10*abs(sin(t)));
      point(x, y);
    }
  }

  void move() {
    x += x_spd;
    y += y_spd;
    t += 0.05;

    if (mag(x, y) > range1) {

      x_spd *= -1;


      y_spd *= -1;
    }
  }
}



