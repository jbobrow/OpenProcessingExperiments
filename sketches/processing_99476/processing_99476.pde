
float powerO, powerT; // moce rzutów
float pozYB = 20, pozYBT = 40; // odsunięcie pasków z info od góry
float xB, yB ; // pozycja kulki 1
float xBT, yBT; // poz. kulki 2

float mx, mxT; // do ustalenia pozycji przycisków 

int s= 15, d =30; // size

String textButtonO = "BALL_1: ";
String textButtonT = "BALL_2: ";

float vx = 0, vxT=0;
float vy = 0, vyT=0;


float sprezyna = 0.05;
float grawitacja = 0.2;

float tarcieX = -0.4;
float tarcieY = -0.7;


float nx, ny;
float sda=0,dda=0, qda=0, qdd=0; // zmienne do ruchów człowieka 
void setup() {
  size(900, 500);
  background(#2B2B2B);
  smooth();
  xB = 80;
  yB = height-80;
  xBT = width-80;
  yBT = height -80;
  mxT = mx = width - 130;
  powerO = int(mx)- width + 130;
  powerT = int(mxT)- width + 130;
  vx = powerO/10;
  vy = powerO/10;

}


void draw() {
  background(#2B2B2B);
  buttonOne();
  buttonTwo();
  manOne();
  manTwo();
  
  collide(0, xB, xBT, yB, yBT);
  ballOne();
  display(xB, yB,255);

  collide(1, xBT, xB, yBT, yB);
  ballTwo();
  display(xBT, yBT,0);

}



void mousePressed() {
  xB = 80 ;
  yB = height -80;
  xBT = width -80;
  yBT = height -80;
  powerO = (mx)- width + 130;
  powerT = (mxT)- width + 130;
  
  vx = powerO*0.1;
  vy = -powerO*0.15;
  
  vxT = -powerT*0.1;
  vyT = -powerT*0.15;
  
  qda=qdd=dda=sda=0;
  
}
void manOne(){
  float as= constrain(height - 80-sda,height -80-powerO,height );
  float ad= constrain(80+dda, 80,80+(powerO*0.3));
  sda+=5;
  dda+=5;
  pushStyle();
  noFill();
  stroke(#26ade4);
  strokeWeight(5);
  line(30, height-80,30, height-150);
  beginShape();
  vertex(10, height-10);
  vertex(30, height-80);
  vertex(80, height-10);
  endShape();
  beginShape();
  vertex(20, height-80);
  vertex(10, height-100);
  vertex(30, height-150);
  vertex(ad, as);
  endShape();
  fill(#26ade4);
  ellipse(30,height-170,30,30);
  popStyle();
}

void manTwo(){
  float as= constrain(height - 80-qda,height -80-powerT,height );
  float ad= constrain(width-80-qdd, width-80-(powerT*0.3),width-80);
  qda+=5;
  qdd+=5;
  pushStyle();
  noFill();
  stroke(#e48b26);
  strokeWeight(5);
  line(width-30, height-80,width-30, height-150);
  beginShape();
  vertex(width-10, height-10);
  vertex(width-30, height-80);
  vertex(width-50, height-10);
  endShape();
  beginShape();
  vertex(width-20,height-80);
  vertex(width-10, height-100);
  vertex(width-30, height-150);
  vertex(ad, as);
  endShape();
  fill(#e48b26);
  ellipse(width-30,height-170,30,30);
  popStyle();
}
void ballOne() {
    vy += grawitacja;
    xB += vx;
    yB += vy;   
    if (xB + d/2 > width) {
      xB = width - d/2;
      vx *= tarcieX;
    }
    else if (xB - d/2 < 0) {
      xB = d/2;
      vx *= tarcieX;
    }
    if (yB + d/2 > height) {
      yB = height - d/2;
      vy *= tarcieY;
    } 
    else if (yB - d/2 < 0) {
      yB = d/2;
      vy *= tarcieY;
    }
  
}

void ballTwo() {
    vyT += grawitacja;
    xBT += vxT;
    yBT += vyT;    
    if (xBT + d/2 > width) {
      xBT = width - d/2;
      vxT *= tarcieX;
    }
    else if (xBT - d/2 < 0) {
      xBT = d/2;
      vxT *= tarcieX;
    }
    if (yBT + d/2 > height) {
      yBT = height - d/2;
      vyT *= tarcieY;
    } 
    else if (yBT - d/2 < 0) {
      yBT = d/2;
      vyT *= tarcieY;
    }
}



void collide(int id, float x1, float x2, float y1, float y2) {
  float dx = x2 - x1;
  float dy = y2 - y1;
  float distance = sqrt(dx*dx + dy*dy);
  float minDist = 3*(d/2);
  if (distance < minDist) { 
    float angle = atan2(dy, dx);
    float targetX = x1 + cos(angle) * minDist;
    float targetY = y1 + sin(angle) * minDist;
    float ax = (targetX - x2) * sprezyna;
    float ay = (targetY - y2) * sprezyna;
    if (id==0) {
      vx -= ax;
      vy -= ay;
      vxT += ax;
      vyT += ay;
    }
    else {
      vx += ax;
      vy += ay;
      vxT -= ax;
      vyT -= ay;
    }
  }
}

void display(float x, float y,int a) {
  pushStyle();
  noStroke();
  //stroke(#44c9ff);
  //strokeWeight(random(10,15));
  fill(255, random(200, 250),a , random(200, 255));
  ellipse(x, y, d, d);
  popStyle();
}



void buttonOne() {
  text(textButtonO, width - 220, pozYB);
  text(int(mx)-width + 130, width - 170, pozYB);

  stroke(#CF0072);
  strokeWeight(2);
  line(width - 130, pozYB-5, width - 30, pozYB-5 );
  pushStyle();
  noStroke();
  fill(#85004B);
  rectMode(CENTER);
  rect(mx, pozYB-5, s+10, s);
  if (dist(mx, pozYB-5, mouseX, mouseY) < s && mousePressed) {
    mx= constrain(mouseX, width - 130, width -30);

    powerO = int(mx)- width + 130;
    pushStyle();
    noStroke();
    fill(#CD0074);
    rect(mx, pozYB-5, s+15, s+5);
    popStyle();
  }
  popStyle();
}
void buttonTwo() {
  text(textButtonT, width - 220, pozYBT);
  text(int(mxT)- width + 130, width - 170, pozYBT);
  stroke(#CF0072);
  strokeWeight(2);
  line(width - 130, pozYBT-5, width - 30, pozYBT-5 );

  pushStyle();
  noStroke();
  fill(#85004B);
  rectMode(CENTER);
  rect(mxT, pozYBT-5, s+10, s);
  if (dist(mxT, pozYBT-5, mouseX, mouseY) < s && mousePressed) {
    mxT= constrain(mouseX, width - 130, width -30);
    powerT = int(mxT)- width + 130;
    pushStyle();
    noStroke();
    fill(#CD0074);
    rect(mxT, pozYBT-5, s+15, s+5);
    popStyle();
  }
  popStyle();
}
