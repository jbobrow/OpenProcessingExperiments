
int hexr = 50;
float hexh = 150;
int sides = 6;
float flipX = radians(90);
color[] colors = {#E2442B,#FECC35,#B6221A,#692C19,#FFBC78,#FFBC78,#E3731C,#965C4A,#D07A00,#94100B,#94100B,#271718,#712D14};



void setup(){
size(800, 500, P3D);
frameRate(15);
stroke(0,50);
rotateX(radians(45));





}

void draw(){
  translate(width/2, height/3,-200);
  background(255);
    rotateY(radians(mouseX));
    drawPolyStone(hexr, hexr, hexh, sides);
    for (int i = 0; i <= hexr*5; i+=hexr*1.5){
      dance();
      translate(hexr*1.5,hexr-7,0);
      drawPolyStone(hexr, hexr, hexh, sides);
    }
    translate(-width-hexr*2,hexr*2-13);
    for (int i = 0; i <= hexr*7; i+=hexr*1.5){
     dance();
      translate(hexr*1.5,hexr-7,0);
      drawPolyStone(hexr, hexr, hexh, sides);
    }
    translate(-width+hexr,hexr*3.5-2);
    for (int i = 0; i <= hexr*5; i+=hexr*1.5){
      dance();
      translate(hexr*1.5,hexr-7,0);
      drawPolyStone(hexr, hexr, hexh, sides);
    }
    translate(-width-hexr*2,hexr*5+10);
    for (int i = 0; i <= hexr*5; i+=hexr*1.5){
      translate(hexr*1.5,hexr-7,0);
      dance();
      drawPolyStone(hexr, hexr, hexh, sides);
    }
}

void dance(){
  if (mousePressed == true){
        hexh = random(400);
        fill(colors[int(random(colors.length))]);
     }
  }

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

void drawPolyStone(float topRadius, float bottomRadius, float tall, int sides) {
  float angle = 0;
  float angleIncrement = TWO_PI / sides;
  //rotateX(flipX);
  polygon(0,0,hexr,sides); 
  rotateX(flipX);
  beginShape(QUAD_STRIP);
 
  for (int i = 0; i < sides + 1; ++i) {
    vertex(topRadius*cos(angle), 0, topRadius*sin(angle));
    vertex(bottomRadius*cos(angle), tall, bottomRadius*sin(angle));
    angle += angleIncrement;
  }
  endShape();
    //end
      rotateX(flipX);
      translate(0,0,-hexh);
      polygon(0,0,hexr,sides); 
    endShape();
  }

