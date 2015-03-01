
//wiping screen with switches

char state = 'a';
float easing = 0.002;
float colorChange=255;
  float circleX;
  float circleY;
  float diameter;
  int circleSpacing=80;
  float w;
  float h;

void setup(){
  size(1000,700);
  background(255);
}

void draw(){
switch(state){
  case 'a':
    fill(0);
    rect(0,0,1000,700);
    for(int i=1000; i>10; i-=30){
      for(int j=700; i>10; i-=30){
//    fill(0);
    ellipseMode(CORNERS);
    fill(colorChange, 153,255);
    colorChange=map(mouseX,0,700,0,255);
    ellipse(mouseX,0,i,j);
  }}
    break;
  case 'b':
  background(0);
  for (int i=0; i<13; i++) {
    for (int j=0; j<13; j++) {
      setCircleCoordinates(i, j);
      setDiameterRelativeToMouse();
      drawOneCircle();
    }
  }

    break;
  case 'c':
  noStroke();
  fill(0);
  ellipse(mouseX,mouseY,300,300);
  }

    if (mouseX>900 && state=='a'){
      wipe();
    }
    if(mousePressed && state=='b'){
    wipe2();
    }
  }

void wipe(){
if (state=='a'){
state='b';
}
}

void wipe2(){
if (state=='b'){
  state='c';
}
}

void setCircleCoordinates(int x, int y) {
  circleX=(.5*circleSpacing)+(x*circleSpacing);
  circleY=(.5*circleSpacing)+(y*circleSpacing);
}

void setFillRelativetoMouse() {
  stroke(2);
  int fillColor = 255 - int(dist(mouseX, mouseY, circleX, circleY));
  if (fillColor<=0){
    fillColor=0;
  }
  fill(fillColor);
  noStroke();
}

void setDiameterRelativeToMouse(){
  diameter=dist(mouseX,mouseY,circleX,circleY);
}

void drawOneCircle(){
  fill(mouseX, 255,153);
  ellipseMode(CENTER);
  ellipse(circleX,circleY,diameter,diameter);
}


