
int card = 0;
PImage ba;
PImage bu;
PImage sk;
PImage ba2;
PImage bu2;


void setup() {
  size(500,500);
  background(255);
  smooth();
  ba = loadImage("backgr1.jpg");
  bu = loadImage("button.png");
sk = loadImage("skql.png");
ba2 = loadImage("ba2.jpg");
bu2 = loadImage("button2.png");
}

void draw() {
  if (card == 0) {
  pushMatrix();
  image(ba,0,0);
  image(bu,350,100);
  scale(0.7);
  translate(0,200);
  pot();
  popMatrix();
  }
  if ( card == 1) {
    pushMatrix();
    image(ba,0,0);
    image(bu,350,100);
    scale(0.7);
    translate(0,200);
    pot();
    trunk(150);
    popMatrix();
}else if ( card == 2) {
  pushMatrix();
  image(ba,0,0);
  image(bu,350,100);
  scale(0.7);
  translate(0,200);
  pot();
  trunk(0);
    popMatrix();
    pushMatrix();
    translate(0,-50);
    scale(0.7);
  flower(255,54,0);
  popMatrix();

}else if( card == 3) {
  pushMatrix();
  image(ba,0,0);
  image(bu,350,100);
  scale(0.7);
  translate(0,200);
  pot();
  trunk(0);
  popMatrix();
  pushMatrix();
  translate(0,-50);
  scale(0.7);
  flower(255,54,0);
  popMatrix();
  image (sk,250,100);
}
else if(card == 4){
pushMatrix();
image(ba2,0,0);
image(bu,350,100);
scale(0.7);
translate(0,200);
curv();
pot();
trunk(150);
popMatrix();
pushMatrix();
translate(120,90);
scale(0.6);
flower(152,72,72);
popMatrix();
pushMatrix();
scale(0.5);
image(sk,70,100);
popMatrix();

}else if(card == 5){
pushMatrix();
image(ba2,0,0);
image(bu,350,100);
scale(0.7);
translate(0,200);
pot();
popMatrix();
pushMatrix();
scale(0.5);
translate(100,380);
curv();
trunk(150);
popMatrix();
pushMatrix();
translate(120,290);
scale(0.6);
flower(152,72,72);
popMatrix();
}else if(card == 6){
  image(ba2,0,0);
  image(bu2,350,100);
  pushMatrix();
  scale(0.7);
translate(0,200);
pot();
popMatrix();
}
}





void mousePressed(){
if ( card == 0 ) {
float d = dist(mouseX,mouseY,389,139);
if (d < 39){
  card = 1;
} else card = 0;
}
else if ( card == 1) {
float d = dist(mouseX,mouseY,389,139);
if (d < 39){
  card = 2;
}else card = 1;
}else if ( card == 2){
float d = dist(mouseX,mouseY,389,139);
if ( d<39) {
card = 3;}
else card = 2;
}else if ( card == 3){
float d = dist(mouseX,mouseY,389,139);
if ( d<39) {
card = 4;}
else card = 3;
}else if ( card == 4){
float d = dist(mouseX,mouseY,389,139);
if ( d<39) {
card = 5;}
else card = 4;
}else if ( card == 5){
float d = dist(mouseX,mouseY,389,139);
if ( d<39) {
card = 6;}
else card = 5;
}else if ( card == 6){
float d = dist(mouseX,mouseY,389,139);
if ( d<39) {
card = 0;}
else card = 6;
}
}


void pot() {
  noStroke();
  fill(223,148,41);
  rect(130,250,240,45);
  quad(160,290,340,290,330,400,170,400);}

void trunk(int a){
  //line 0~150
  strokeWeight(10);
  stroke(180,221,34);
  strokeCap(SQUARE);
  line(250,a,250,250);
  //leaf
  translate(250,150);
  fill(180,221,34);
  rotate(PI/12);
  ellipse(-75,0,150,60);
  rotate(-PI/6);
  ellipse(75,0,150,60);
}

void flower(int a, int b, int c){
    noStroke();
  smooth();
  fill(a,b,c);
  ellipse(210,210,80,80);
  ellipse(210,290,80,80);
  ellipse(290,210,80,80);
  ellipse(290,290,80,80);
  fill(255,204,0);
  ellipse(250,250,80,80);
}

void curv(){
    strokeWeight(10);
  stroke(180,221,34);
  strokeCap(SQUARE);
  noFill();
  beginShape();
curveVertex(250,150);
curveVertex(250,150);
curveVertex(250,100);
curveVertex(300,80);
curveVertex(350,150);
curveVertex(350,150);
endShape();
}


