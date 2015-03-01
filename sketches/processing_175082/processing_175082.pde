
ArrayList<PVector> blah;

float SIZE;
float angle;
float hyp;
float phi = (1+sqrt(5))/9;
float modifier = 0.001;
boolean PAUSED;
int XSpeed;
int MOD_NUM;

void setup() {
  size(400, 400);
  smooth();
  background(58);
  noStroke();
  fill(255, 155, 0);
  modifier = 0.001;
  XSpeed = 11;
  PAUSED = false;
  MOD_NUM = 2;
  mouseX = width;
  mouseY = height;
}

void drawSpiral() {

  int ALPHA = 170 * int(noise(angle)*100);

  for (int i=0; i<1500; i++) {
    if (i % MOD_NUM == 0) {
      fill(0, ALPHA);
      // modifier = -modifier;
    } else {
      float mx = map(mouseX, 0, width, 0, 255);
      float my = map(mouseY, 0, height, 0, 255);
      float n = noise(angle)*255 % 255;
      colorMode(HSB);
      fill(mx, 255-my, 255, ALPHA);
    }
    float x = hyp * sin(angle) / noise(modifier/angle);  
    float y = hyp * cos(angle) / noise(modifier/angle);
    SIZE = angle/40;
    angle += phi + modifier;
    if (angle >= 360) {
      angle = 0;
    } else {
      hyp += 0.2 - modifier/2;
    }
    pushMatrix();
    translate(width/2, height/2);
    rectMode(CENTER);
    ellipse(x, y, SIZE, SIZE);
    popMatrix();
  }
}

void draw() {
  if (!PAUSED) {
    modifier += 0.00001/phi;
    modifier += map(mouseY, 0, height, -0.0001*XSpeed, 0.0001*XSpeed);
    fill(0, 12);
    rect(0, 0, width*2, height*2);
  }

  angle = 0;
  hyp = 10;
  drawSpiral();

  //filter(BLUR, 1);
  //drawSpiral();
}

void mousePressed() {
  pause();
/*
  if (PAUSED) {
    pause();
  } else {
    setup();
  }
  */
}

void pause () {
  if (PAUSED) {
    PAUSED = false;
    //loop();
  } else {
    //noLoop();
    PAUSED = true;
  }
}

void keyPressed() {
  // Pause
  if (keyCode == 80) {
    pause();
  }
  if (keyCode == DOWN) {
    if (XSpeed > 1) {
      XSpeed -= 10;
    }
    println(XSpeed);
  }
  if (keyCode == UP) {
    XSpeed += 10;
  }
  if (keyCode == RIGHT) {
    MOD_NUM += 1;
  }
  if (keyCode == LEFT) {
    if (MOD_NUM > 2) {
      MOD_NUM -= 1;
    }
  }
  if(keyCode == 82) {
    setup();
  }
}

