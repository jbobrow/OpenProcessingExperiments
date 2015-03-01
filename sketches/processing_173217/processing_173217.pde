
class NoiseWalker {

  int V = 0;
  int C = 0;
  float SIZE = random(0.001, 4);
  float time = random(0, 1000);
  PVector location = new PVector(0, 0);
  PVector velocity = new PVector(0, 0);
  PVector acceleration = new PVector(0, 0);
  PVector lastVect = new PVector(0, 0);

  NoiseWalker() {
    location.x = random(0, width);
    location.y = random(0, height);
  }

  void edges() {
    if (location.x <= 0 || location.x >= width) {
      velocity.x = -velocity.x;
    } else if (location.y <= 0 || location.y >= height) {
      velocity.y = -velocity.y;
    }
  }

  void ColorCount() {
    if (C <= 254) {
      C += 1;
    } else {
      C = 0;
    }
  }

  void render() {
    V += 1;
    time += 0.045;
    ColorCount();

    //acceleration.x += map(sin(noise(time)), 0, 1, -120, 120);
    //acceleration.y += map(noise(time), 0, 1, -120, 120);
    acceleration.limit(0.5);

    PVector mouse = new PVector(mouseX, mouseY);
    mouse.sub(location);
    //mouse.setMag(0.5);
    mouse.normalize();
    //mouse.mult(0.5);
    //mouse.setMag(1.5);
    acceleration = mouse;

    acceleration.add(mouse);
    acceleration.add(mouse);
    acceleration.add(mouse);

    //acceleration.mult(0.2);

    // Lower Magnitude in Acc makes Higher Viscocity
    acceleration.normalize();
    acceleration.mult(199);
    //acceleration.setMag(199);
    acceleration.limit(1.45);

    velocity.add(acceleration);
    velocity.add(acceleration);
    velocity.add(acceleration);
    location.add(velocity);

    location.limit(width);
    //location.limit(height);

    //edges();
    float cvalx = map(velocity.x, -60, 60, 0, 255);
    float cvaly = map(velocity.y, -60, 60, 0, 255);
    PVector test = PVector.div(velocity, cvaly);
    float testx = map(test.x, -60, 60, 0, 255);
    float testy = map(test.y, -60, 60, 0, 255);
    //fill(testx*testy/10, cvalx*cvaly/100+testy, cvalx);
    //fill(testx/1.9, cvalx*cvaly/100-testy/2, cvalx*0.9);
    colorMode(RGB);
    color blue_C = color(testx/testx*20, 100+cvaly, 255+cvalx);
    color green_C = color(100-cvaly, 155+cvaly, cvalx-20);
    color yellow_C = color(100+cvaly, 255+cvalx, testx/testx*20);
    color red_C  = color(255+cvalx, cvaly, testx/testx*20);

    if (STATE == 0) {
      fill(blue_C);
    } else if (STATE == 1) {
      fill(green_C);
    } else if (STATE == 2) {
      fill(yellow_C);
    } else if (STATE == 3) {
      fill(red_C);
    } else {
      colorMode(HSB);
      color CC = color(C, 255, 255);
      fill(CC);
    }

    //stroke(0);
    //strokeWeight(2);
    //line(location.x, location.y, lastVect.x, lastVect.y);
    //point(location.x, location.y);

    //ellipse(location.x, location.y, SIZE, SIZE);
    rect(location.x, location.y, SIZE, SIZE);

    //if (int(V) % 4 == 0) lastVect = location;
    //println(lastVect);
  }
}



int STATE = 0;
int AMT = 2100;
boolean MOTION_BLUR = true;
boolean PAUSED = false;

NoiseWalker[] noiseWalkers;

void setup() {
  noStroke();
  size(800, 800);
  noiseWalkers =  new NoiseWalker[AMT];
  for (int i=0; i < AMT; i++) {
    noiseWalkers[i] = new NoiseWalker();
  }
}

void draw() {

  if (MOTION_BLUR) {
    fill(0, 10);
  } else {
    fill(0);
  }
  rect(0, 0, width, height);

  for (int i=0; i < AMT; i++) {
    noiseWalkers[i].render();
  }

  fill(255);
  textSize(14);
  text("Click to Change Color", width-165, height-18);
}

void ChangeColorState() {
  if (STATE == 4) {
    STATE = 0;
  } else {
    STATE += 1;
  }
}

void mousePressed() {
  if (PAUSED) {
    unpause();
  } else {
    ChangeColorState();
  }
}

void unpause() {
  PAUSED = false;
  loop();
}

void pause () {
  PAUSED = true;
  noLoop();
}

void keyPressed() {
  // Motion Blur Switch
  if (keyCode == 77) {
    if (!MOTION_BLUR) {
      MOTION_BLUR = true;
    } else {
      MOTION_BLUR = false;
    }
  }
  // Pause
  if (keyCode == 80) {
    if (PAUSED) {
      unpause();
    } else {
      pause();
    }
  }
  // Color Change
  if (keyCode == 67) {
    ChangeColorState();
  }
  // Particle Count
  if (keyCode == UP) {
    AMT += 1000;
    setup();
  }
  if (keyCode == DOWN) {
    if (AMT >= 1000) {
      AMT -= 1000;
      setup();
    }
  }
}

