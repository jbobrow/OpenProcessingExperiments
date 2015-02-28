
color polar = color(247, 245, 242);
float x;
float w;
float angle = 0.0;
float speed = 0.01;
float bg;
float inc = 0.0;

PImage backg;

//bear body parts
PShape leftarm;
PShape rightarm;
PShape body;

void setup(){
  size(480, 320);
  strokeWeight(3);
  strokeCap(ROUND);
  smooth();
  
  //bear body parts
    leftarm = loadShape("leftarm.svg");
  rightarm = loadShape("rightarm.svg");
  body = loadShape("body.svg");
  
  backg = loadImage("background.gif");
}

void draw(){
  bg = map(mouseY, 0, 480, 255, 0);
  background(222, 228, bg);
  climate();
  image(backg, 0, 0);
  grass();
  bear();

}

void bear(){
  float x = map(mouseX, 0, 480, -300, 400);
  float y = map(mouseY, 0, 320, -50, 320);
  translate(x, y);
  scale(.70);
  arms(mouseY);
  body();
  shapeMode(CORNER);
  head();

  
}

void head(){
  face(mouseX, 30+mouseY, 255-mouseX);
  ears();
  nose();
  eyes();
}


void face(int r, int g, int b){
  fill(r, g, b);
  ellipse(222, 103, 159, 131);
    //big nose
beginShape();
vertex(183, 123);
bezierVertex(183, 160, 261, 160, 261, 123);
endShape();
beginShape();
vertex(183, 123);
bezierVertex(183, 78, 261, 81, 261, 123);
endShape();

}

void ears(){
  // left ear
  beginShape();
  vertex(144, 90);
  bezierVertex(148, 71, 163, 55, 184, 45);
  bezierVertex(158, 33, 111, 60, 144, 90);
  endShape();
  // right ear 
  beginShape();
  vertex(300, 87);
  bezierVertex(327, 66, 299, 29, 259, 45);
  bezierVertex(280, 53, 295, 68, 299, 87);
  endShape();

}

void nose(){

//small nose
fill(0);
beginShape();
vertex(222, 116);
bezierVertex(226, 116, 234, 108, 232, 104);
bezierVertex(230, 100, 214, 100, 212, 104);
bezierVertex(211, 108, 218, 115, 222, 116);
endShape();
}

void eyes (){
  float ew = map(mouseX, 0, 480, 1, 32);
  float eh = map(mouseY, 0, 320, 1, 25);
  ellipse(185, 101, ew, eh);
  ellipse(260, 101, ew, eh);
}


void arms (float p){
  //rotating arms
  p = map(mouseY, 0, 320, QUARTER_PI, TWO_PI);
  pushMatrix();
    translate(182, 170);
    x += .04;
    rotate(p*.75*abs(sin(x)));
    shape(leftarm,-50,0); 
  popMatrix();
  pushMatrix();
      translate(242, 203);
    x += .04;
    rotate(p*-.60*abs(sin(x)));
    shape(rightarm);
    popMatrix();
}

void body() {
  shapeMode(CENTER);
//  x = map(mouseX, 240, 480, 1, 2);
 // y = map(mouseY, 310, 320, 1, 2);
 // scale(x);
  shape(body, 157, 67);
}

void climate(){
      float c = map(mouseX, 0, 480, 95, 147);
      fill(255, 238, c, 150);
      float movement = map(mouseY, 0, 320, 0.0, 10.0);
      circlePhase(movement);
      float s = map(mouseY, 0, 320, QUARTER_PI, PI);
      circlePhase(s);
      circlePhase(s);
      angle += speed;
}

void circlePhase(float phase){
  noStroke();
  float diameter = 118 + (sin(angle+phase)*30);
        ellipse(360, 80, diameter, diameter-3);
        stroke(3);
        
}

void grass (){
   inc += 0.05;
  float angle = sin(inc) / 30.0 + sin(inc * 1.2) / 40.0;
  tail(18, 4, angle / 1.3);
  tail(33, 5, angle);
  tail(44, 7, angle / 1.3);
  tail(62, 5, angle);
  tail(88, 7, angle*2);
  tail(100, 4, angle / 1.3);
  tail(200, 5, angle);
  tail(220, 7, angle / 1.3);
  tail(230, 5, angle);
  tail(235, 7, angle*2);
  tail(276, 4, angle / 1.3);
  tail(288, 5, angle);
  tail(300, 7, angle / 1.3);
  tail(320, 5, angle);
  tail(367, 7, angle*2);
}

void tail(int x, int units, float angle) {
  pushMatrix();
  stroke(115, 70, 255, 200);
  translate(x, 306);
  for (int i = units; i > 0; i--) {
    strokeWeight(i);
    line(0, 0, 0, -8);
    translate(0, -8);
    rotate(angle);
  }
  popMatrix();
  stroke(0);
  strokeWeight(3);
}


