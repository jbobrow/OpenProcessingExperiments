
float x, y, angle, rad;
boolean pressed = false;

void setup() {
  size(600, 600);
  background(200, 100, 0);
  noStroke();
  smooth();
  frameRate(24);
  text("created by ChristianGeick 2011", width-200, height-50);
}

void draw() {
  if(!pressed && mousePressed) {
    pressed = true;
  }
  
  if(pressed) {
  fill(100, 100, 0, 100);
  rect(0, 0, width, height);
  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount/5);

  for (int ang=0; ang<360; ang+=5) {
    angle = radians(ang);
    rad = 10 + noise(frameCount+random(5))*10;
    x = (rad*cos(angle));
    y = (rad*sin(angle));
    fill(255, 100);
    ellipse(x, y, 1, 1);
  }
  for (int ang=0; ang<360; ang+=5) {
    angle = radians(ang);
    rad = noise(frameCount+random(10))*30;
    x = (rad*cos(angle));
    y = (rad*sin(angle));
    fill(255, 100);
    ellipse(x, y, 2, 2);
  }
  for (int ang=0; ang<360; ang+=5) {
    angle = radians(ang);
    rad = 20 + noise(frameCount+random(5))*20;
    x = (rad*cos(angle));
    y = (rad*sin(angle));
    fill(255, 75);
    ellipse(x, y, 1, 1);
  }
  for (int ang=0; ang<360; ang+=15) {
    angle = radians(ang);
    rad = 40 + noise(frameCount+random(5))*5;
    x = (rad*cos(angle));
    y = (rad*sin(angle));
    fill(255, 100);
    ellipse(x, y, 1, 1);
  }
  for (int ang=0; ang<360; ang+=5) {
    angle = radians(ang);
    rad = 150 + noise(frameCount+random(5))*50;
    x = (rad*cos(angle));
    y = (rad*sin(angle));
    fill(255, 100);
    ellipse(x, y, 5, 5);
  }
  for (int ang=0; ang<360; ang+=5) {
    angle = radians(ang);
    rad = 50 + noise(-frameCount-random(5))*5;
    x = (rad*cos(angle));
    y = (rad*sin(angle));
    fill(255, 75);
    ellipse(x, y, 2, 2);
  }
  for (int ang=0; ang<360; ang+=8) {
    angle = radians(ang);
    rad = 70 + noise(-frameCount-random(5))*5;
    x = (rad*cos(angle));
    y = (rad*sin(angle));
    fill(255, 45);
    ellipse(x, y, 2, 2);
  }
  for (int ang=0; ang<360; ang+=7) {
    angle = radians(ang);
      rad = 45 + noise(-frameCount-random(5))*25;
      x = (rad*cos(angle));
      y = (rad*sin(angle));
      fill(255, 75);
      ellipse(x, y, 2, 2);
    }
    for (int ang=0; ang<360; ang+=5) {
      angle = radians(ang);
      rad = 100 + noise(-frameCount-random(5))*200;
      x = (rad*cos(angle));
      y = (rad*sin(angle));
      fill(255, 100);
      ellipse(x, y, 2, 2);
    }
    for (int ang=0; ang<360; ang+=5) {
      angle = radians(ang);
      rad = 60 + noise(-frameCount+random(5))*100;
      x = (rad*cos(angle));
      y = (rad*sin(angle));
      fill(255, 100);
      ellipse(x, y, 3, 3);
    }
    for (int ang=0; ang<360; ang+=10) {
      angle = radians(ang);
      rad = 195 + noise(-frameCount+random(3))*10;
      x = (rad*cos(angle));
      y = (rad*sin(angle));
      fill(255, 100);
      ellipse(x, y, 2, 2);
    }
    for (int ang=0; ang<360; ang+=2) {
      angle = radians(ang);
      rad = 145 + noise(-frameCount+random(3))*5;
      x = (rad*cos(angle));
      y = (rad*sin(angle));
      fill(255, 125);
      ellipse(x, y, 1, 1);
    }
  
    popMatrix();
  }
}


