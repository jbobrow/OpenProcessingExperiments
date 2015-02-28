
PImage bg1;
PImage bg2;
PImage bg3;
int i = 0;
long lastTime = 0;
int toggleX = 0;
int toggleY = 0;
boolean toggle1btn = false;
boolean toggle2btn = false;
boolean toggle3btn = false;
boolean toggle1state = true;
boolean toggle2state = true;
boolean toggle3state = true;

long timer = -3000;
long timing = 3000;
float t = 0;
float incre = +0.1;
int bgNum = 0;

//for clock
int w = 50;
int h = 50;
int index = 0;



//for knob 
boolean dragging = false;
boolean dragging2 = false;

float knobx1 = 95;
float knoby1 = 360;
float knobr1 = 20;
float knobx2 = 155;
float knoby2 = 360;
float knobr2 = 20;

float angle = 0;
float offsetAngle = 0;
float angle2 = 0;
float offsetAngle2 = 0;

int a=0;
int b=0;
int a2=0;
int b2=0;



void setup(){

  size(900, 700);
  bg1 = loadImage("bg1.jpg");
  bg2 = loadImage("bg2.jpg");
  bg3 = loadImage("bg3.jpg");
  lastTime = millis();
  smooth();
  noStroke();
  rect(250,0,900,700); //second box for drawing
  
}

void draw(){

//  if(millis() - timer > 3000) {
//    //if(millis() - lastTime > 300){
//    t += incre;
//    if(t > 255) {
//      t = 255;
//      incre *= -1;
//      timer = millis();
//    } else if(t < 50) {
//      t = 50;
//      incre *= -1;
//      bgNum++;
//      if(bgNum > 2) bgNum = 0;
//      timer = millis();
//    }
//    //lastTime = millis();
//    //}
//  }
//  
//  tint(255, t);
//  switch(bgNum) {
//    case 0: image(bg1, 0, 0); break;
//    case 1: image(bg2, 0, 0); break;
//    case 2: image(bg3, 0, 0); break;
//  }
//  tint(255, 0);
  
  image(bg2,0,0);
  fill(255);
  noStroke();
  rect(50,50,150,600);    //first box for ui
  
  //toggle button
  
  toggleX = 0;
  toggleY = 0;
  
  textSize(18); 
  fill(180);
  text("ON/OFF", 90, 190);
  
  fill(230);
  ellipseMode(CORNER);
  ellipse(105 + toggleX,200 + toggleY,20,20);
  rect(115 + toggleX,200 + toggleY,20,20);
  ellipse(125 + toggleX,200 + toggleY,20,20);
  stroke(220);
  strokeWeight(1);
  fill(255);
  ellipse(109 + toggleX, 202 + toggleY,16,16);
  
  if(toggle1btn){
    fill(150,200,255);
  ellipseMode(CORNER);
  ellipse(105 + toggleX,200 + toggleY,20,20);
  ellipse(125 + toggleX,200 + toggleY,20,20);
  rect(115 + toggleX,200 + toggleY,20,20);
  noStroke();
  rect(114 + toggleX,201 + toggleY,22,18);
  stroke(220);
  strokeWeight(1);
  fill(255);
  ellipse(109 + toggleX + 18, 202 + toggleY,15,15);
  }
  
  //toggle button end
  
  
    //toggle2 button
    
    textSize(10); 
  fill(180);
  text("RANDOM", 74, 435);
  
  toggleX = -30;
  toggleY = 200;
  
  fill(230);
  ellipseMode(CORNER);
  ellipse(105 + toggleX,200 + toggleY,20,20);
  rect(115 + toggleX,200 + toggleY,20,20);
  ellipse(125 + toggleX,200 + toggleY,20,20);
  stroke(220);
  strokeWeight(1);
  fill(255);
  ellipse(109 + toggleX, 202 + toggleY,16,16);
  
  if(toggle2btn){
    fill(236,174,117);
  ellipseMode(CORNER);
  ellipse(105 + toggleX,200 + toggleY,20,20);
  ellipse(125 + toggleX,200 + toggleY,20,20);
  rect(115 + toggleX,200 + toggleY,20,20);
  noStroke();
  rect(114 + toggleX,201 + toggleY,22,18);
  stroke(220);
  strokeWeight(1);
  fill(255);
  ellipse(109 + toggleX + 18, 202 + toggleY,15,15);
  }
  
  //toggle2 button end
  
    //toggle3 button
    
    textSize(10); 
  fill(180);
  text("RANDOM", 134, 435);
  
  toggleX = 30;
  toggleY = 200;
  
  fill(230);
  ellipseMode(CORNER);
  ellipse(105 + toggleX,200 + toggleY,20,20);
  rect(115 + toggleX,200 + toggleY,20,20);
  ellipse(125 + toggleX,200 + toggleY,20,20);
  stroke(220);
  strokeWeight(1);
  fill(255);
  ellipse(109 + toggleX, 202 + toggleY,16,16);
  
  if(toggle3btn){
    fill(236,174,117);
  ellipseMode(CORNER);
  ellipse(105 + toggleX,200 + toggleY,20,20);
  ellipse(125 + toggleX,200 + toggleY,20,20);
  rect(115 + toggleX,200 + toggleY,20,20);
  noStroke();
  rect(114 + toggleX,201 + toggleY,22,18);
  stroke(220);
  strokeWeight(1);
  fill(255);
  ellipse(109 + toggleX + 18, 202 + toggleY,15,15);
  }
  
  //toggle3 button end
  
  
//knob 1

  if (dragging){
    float dx1 = mouseX - knobx1;
    float dy1 = mouseY - knoby1;
    float mouseAngle = atan2(dy1,dx1);
    angle = mouseAngle - offsetAngle;
    a = int(map(angle,-PI,PI,0,7));
  }
  if (dragging){
    fill(100,200,220);
  }
  else{
    fill(240);
  }
  pushMatrix();
  translate(knobx1,knoby1);
  rotate(PI/4*a);
  ellipseMode(CENTER);
  ellipse(0,0,knobr1*2,knobr1*2);
  stroke(30);
  strokeWeight(3);
  line(0,0,knobr1-8,0);
  popMatrix();
  
  
//knob 2

  if (dragging2){
    float dx2 = mouseX - knobx2;
    float dy2 = mouseY - knoby2;
    float mouseAngle2 = atan2(dy2,dx2);
    angle2 = mouseAngle2 - offsetAngle2;
    b = int(map(angle2,-PI,PI,0,7));
  }
  if (dragging2){
    fill(100,200,220);
  }
  else{
    fill(240);
  }
  pushMatrix();
  translate(knobx2,knoby2);
  rotate(PI/4*b);
  noStroke();
  ellipseMode(CENTER);
  ellipse(0,0,knobr2*2,knobr2*2);
  stroke(30);
  strokeWeight(3);
  line(0,0,knobr2-2,0);
  popMatrix();  
  
//clock drawing

if(toggle1btn){

  int x1 = w*index+250;
  int x2 = x1+w +250;
  int y1 = 650;
  int y2 = 700;
  int hourHand = a;
  int minuteHand = b;
  if(toggle2btn){
  hourHand = int(random(7));
  }
  if(toggle3btn){
  minuteHand = int(random(7));
  }
  
  
  fill(245);
  stroke(220);
  strokeWeight(2);
  ellipseMode(CORNER);
  ellipse(x1, y1,48,48);
  
  pushMatrix();            //an hour hand
    stroke(30);
    strokeWeight(3);
    translate(x1 +25,y1 +25);
    rotate(PI/4 * hourHand);
    line(0,0,15,0);
  popMatrix();
  
  pushMatrix();            //a minute hand
    stroke(30);
    strokeWeight(3);
    translate(x1 +25,y1 +25);
    rotate(PI/4 * minuteHand);
    line(0,0,22,0);
  popMatrix();
  
  index++;
  
  if (index == width/w){
    PImage p = get(250, h, width, 700);
//    background(255);
    set(250,0,p);
    index = 0;
    }
  }
}

void mousePressed(){
  if (mouseX > 115 && mouseX < 135 && mouseY >200 && mouseY <220){
    toggle1btn = toggle1state;
    toggle1state = !toggle1state;
  }
  
  if (mouseX > 115-30 && mouseX < 135-30 && mouseY >200+200 && mouseY <220+200){
    toggle2btn = toggle2state;
    toggle2state = !toggle2state;
  }
  
  if (mouseX > 115+30 && mouseX < 135+30 && mouseY >200+200 && mouseY <220+200){
    toggle3btn = toggle3state;
    toggle3state = !toggle3state;
  }
  if(dist(mouseX,mouseY,knobx1,knoby1)<knobr1){
    dragging = true;
    float dx1 = mouseX - knobx1;
    float dy1 = mouseY - knoby1;
    offsetAngle = atan2(dy1,dx1) - angle;
  }
  if(dist(mouseX,mouseY,knobx2,knoby2)<knobr2){
    dragging2 = true;
    float dx2 = mouseX - knobx2;
    float dy2 = mouseY - knoby2;
    offsetAngle2 = atan2(dy2,dx2) - angle2;
  }
}

void mouseReleased(){
  dragging = false;
  dragging2 = false;
}


