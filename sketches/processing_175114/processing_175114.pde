
ArrayList<PVector> blah;

boolean PAUSED;
float SIZE;
float angle;
float hyp;
float phi = (1+sqrt(5))/9;
float T;
float C_Cycle;

void setup() {
  size(400, 400);
  smooth();
  background(58);
  noStroke();
  mouseX = width;
  mouseY = height;
}

void ColorIterate() {
  if (C_Cycle <= 254) {
    C_Cycle += 0.35;
  } else {
    C_Cycle = 0;
  }
}

void drawSpiral() {
  ColorIterate();
  for (int i=0; i<1200; i++) {
    float mx = map(mouseX, 0, width, 35, 45);
    float my = map(mouseY, 0, height, 1, 20);
    //float x = hyp * sin(angle) / cos(angle) * 10;
    float x = hyp * tan(angle) / cos(angle) * 10;  
    float y = hyp * atan2(-angle, 2);
    float x2 = hyp * tan(angle); 
    float y2 = hyp * atan2(angle, 2);

    x /= 19;

    //x += sin(T*1000)*800-mx;
    //y += atan2(T*1000, x)*1000-mx;

    my *= cos(angle);
    SIZE = angle/10*my +40+my * noise(C_Cycle)*10;
    angle += phi * 1.8/mx+0.001;
    hyp += 1.5;

    pushMatrix();
    translate(width/2, height/2);
    rectMode(CENTER);

    //rotate(sin(angle) / cos(angle));
    rotate(sin(angle/my) / cos(angle/(hyp/2)));
    rotate(hyp*angle/1000000);
    rotate(T*4);
    //scale(0.03-mx/1000);
    //scale(0.08-mx/420+mx/2000);
    scale(0.015);

    translate(noise(T*10000)*400, noise(T*10000)*400);

    colorMode(HSB);

    strokeWeight(8);  
    //stroke(C_Cycle + 155 % 255, 255, 255);

    //fill(0, 255, 255);
    fill(C_Cycle, 255, 255);
    rectMode(CENTER);
    rect(x, y, SIZE, SIZE, 40);
    fill(C_Cycle+65 % 255, 255, 255);
    rect(x2, y2, SIZE, SIZE, 40);

    //fill(C_Cycle+105 % 255, 255, 255);
    //rect(x, y2-y, SIZE, SIZE, 40);
    //rect(tan(x2), tan(x), SIZE, SIZE, 40);

    popMatrix();
  }
}

void draw() {
  noStroke();
  fill(0, 2);
  rect(0, 0, width*2, height*2);
  float my = map(mouseY, 0, height, 0, 0.025);
  T += my;
  //T += my+0.00125;
  //T += phi;
  angle = 0;
  hyp = 0;
  drawSpiral();
}

void mousePressed() {
  if (PAUSED) {
    pause();
  } else {
    C_Cycle = random(0, 255);
  }
}

void pause () {
  if (PAUSED) {
    PAUSED = false;
    loop();
  } else {
    noLoop();
    PAUSED = true;
  }
}

void keyPressed() {
  // Pause
  if (keyCode == 80) {
    pause();
  }
}

