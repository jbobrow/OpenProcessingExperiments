
float a=random(.5, 4.5);
int b=round(a);
float c=random(.5, 4.5);
int d=round(c);
float xup=0;
float ydown=0;
float yup=400;
float xdown=400;
float t=0;

void setup() {
  size(400, 400);
  smooth();
  PFont font;
  font=loadFont("CalifornianFB-Reg-60.vlw");
  textFont(font);
  }

void uno() {
  if(t>60) {
    xup=xup;
  }
  else{
  xup++;
  }
  textSize(60);
  if(d==1) {
    fill(#FFC125);
  }
  if(d==2) {
    fill(#CDC8B1);
  }
  if(d==3) {
    fill(#D1EEEE);
  }
  if(d==4) {
    fill(#AEEEEE);
  }
  if(b==1) {
    text("love", xup, height/2);
  }
  if(b==2) {
    text("like", xup, height/2);
  }
  if(b==3) {
    text("a", xup, height/2);
  }
  if(b==4) {
    text("sunset", xup, height/2);
  }
}

void dos() {
  if(t>40) {
    ydown=ydown;
  }
  else{
  ydown++;
  }
  textSize(60);
  textAlign(CENTER);
  if(d==2) {
    fill(#FFC125);
  }
  if(d==3) {
    fill(#CDC8B1);
  }
  if(d==4) {
    fill(#D1EEEE);
  }
  if(d==1) {
    fill(#AEEEEE);
  }
  if(b==2) {
    text("love", width/2, ydown);
  }
  if(b==3) {
    text("like", width/2, ydown);
  }
  if(b==4) {
    text("a", width/2, ydown);
  }
  if(b==1) {
    text("sunset", width/2, ydown);
  }
}

void tres() {
  if(t>20) {
    yup=yup;
  }
  else{
  yup--;
  }
  textSize(60);
  textAlign(CENTER);
  if(d==3) {
    fill(#FFC125);
  }
  if(d==4) {
    fill(#CDC8B1);
  }
  if(d==1) {
    fill(#D1EEEE);
  }
  if(d==2) {
    fill(#AEEEEE);
  }
  if(b==3) {
    text("love", width/2, yup);
  }
  if(b==4) {
    text("like", width/2, yup);
  }
  if(b==1) {
    text("a", width/2, yup);
  }
  if(b==2) {
    text("sunset", width/2, yup);
  }
}

void cuatro() {
  if(t>0){
    xdown=xdown;
  }
  else {
  xdown--;
  }
  textSize(60);
  if(d==4) {
    fill(#FFC125);
  }
  if(d==1) {
    fill(#CDC8B1);
  }
  if(d==2) {
    fill(#D1EEEE);
  }
  if(d==3) {
    fill(#AEEEEE);
  }
  if(b==4) {
    text("love", xdown, height/2);
  }
  if(b==1) {
    text("like", xdown, height/2);
  }
  if(b==2) {
    text("a", xdown, height/2);
  }
  if(b==3) {
    text("sunset", xdown, height/2);
  }
}

void cinco() {
  PImage s;
  s=loadImage("sunset5.jpg");
  tint(255, 255, 255, 120);
  if(mouseButton==RIGHT) {
  background(255);
  image(s, 0, 0, width, height);
  fill(255);
  stroke(255);
  rect(0, 50, width, 50);
  rect(0, 150, width, 50);
  rect(0, 250, width, 50);
  rect(0, 350, width, 50);
  textSize(30);
  text("love", 105, 50);
  text("like", 155, 150);
  text("a", 205, 250);
  text("sunset", 255, 350);
}}

void clicks() {
  if((mouseButton==LEFT)&&(xup>110)) {
    t=t+1;
  }
}

void draw() {
   if(xup>width+25){
    xup=0;
    ydown=0;
    yup=400;
    xdown=400;
  }
  background(2*xup+50);
  uno();
  dos();
  tres();
  cuatro();
  cinco();
  clicks();
}

