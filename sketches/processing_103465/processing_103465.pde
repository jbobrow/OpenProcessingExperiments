
Wave[] waves = new Wave[4];

void setup() {
  size(800, 200);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();

  for (int i = 0; i<waves.length; i++) {
    waves[i] = new Wave(i);
  }
}

void draw() {
  background(360);

  for (int i = 0; i<waves.length; i++) {
    waves[i].display();
  }
}

class Wave {
  float hue  = random(360);
  float x = random(width);
  int ang = 40;
  float theta = random(360);

  float alp;

  Wave(int tmpNum) {
    x = tmpNum * 200 + 100;
  }

  void display() {
    noFill();
    strokeWeight(10);

    for (int i = 1; i <= 4; i++) {
      alp = 200*abs(sin(radians(10*i+theta)));

      stroke(hue, 100, 100, alp);
      arc(x, i*10+(height-70), 250-i*50, 200-i*40, radians(180+ang), radians(360-ang));
    }	

    noStroke();
    fill(hue, 100, 100, alp);
    ellipse(x, 50+(height-70), 10, 10);


    hue += 0.5;
    theta += 1;

    if (hue > 360) {
      hue = 0;
    }
  }
}



