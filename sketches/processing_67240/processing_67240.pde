
int oldrot = 0;
int arcSize = 100;

void setup() {
  size(800, 800);
  colorMode(RGB, 1);
  background(1);
  smooth();

  for (int x=0; x<=width; x+=arcSize/2) {
    for (int y=0; y<=height; y+=arcSize/2) {
      int rot = int(random(4)) * 90;
      oldrot = rot;
      if (rot != oldrot) {
        drawArc(x, y, rot);
      } 
      else {
        rot = int(random(4)) * 90;
        drawArc(x, y, rot);
      }
    }
  }
}

int randomColor() {
  float prob = int(random(100));

  if (prob<1) {
    return(color(1, 0, 0));
  }
  if (prob<10) {
    return(color(.9));
  } 
  if (prob<80) {
    return(color(1));
  } 
  else {
    return(color(0));
  }
}

void drawArc(int xpos, int ypos, int rot) {
  noStroke();
  int c = randomColor();
  fill(c);

  switch(rot) {
  case 90:
    pushMatrix();
    translate(xpos+(arcSize/2), ypos);
    rotate(radians(90));
    //fill(255,0,0);
    arc(0, 0, arcSize, arcSize, 0, PI/2);
    popMatrix();
    break;
  case 180:
    pushMatrix();
    translate(xpos+(arcSize/2), ypos+(arcSize/2));
    rotate(radians(180));
    //fill(255,0,0);
    arc(0, 0, arcSize, arcSize, 0, PI/2);
    popMatrix();
    break;
  case 270:
    pushMatrix();
    translate(xpos, ypos+(arcSize/2));
    rotate(radians(270));
    //fill(255,0,0);
    arc(0, 0, arcSize, arcSize, 0, PI/2);
    popMatrix();
    break;
  default: 
    pushMatrix();
    translate(xpos, ypos);
    rotate(radians(rot));
    arc(0, 0, arcSize, arcSize, 0, PI/2);
    popMatrix();
    break;
  }
}

void reset() {
  setup();
  draw();
}

void keyPressed() {
  if (key=='r') reset();
  if (key=='q') exit();
}

void mousePressed() {
  reset();
}

void draw() {
}
