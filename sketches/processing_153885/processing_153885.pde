
int hexr = 50;
float hexh = 150;
int sides = 6;
float flipX = radians(90);



void setup(){
size(800, 600, P3D);
frameRate(30);
stroke(0,20);
rotateX(radians(45));



}

void draw(){
  //background(0);
  fill(50,10);
  rect(0,0,width,height);
  translate(-50, 300,-200+mouseY/3);
  float dirY = (mouseY / float(height) - 0.5) * 2;
  float dirX = (mouseX / float(width) - 0.5) * 2;
  directionalLight(mouseY, mouseY-20, 0, -dirX, -dirY, -1); 

  
    rotateX(radians(mouseY/3));
    drawPolyStone(hexr, hexr, hexh, sides);
    for (int i = 0; i <= hexr*5; i+=hexr*1.5){
      frameRate(20);
      dance();
      translate(hexr*1.5,hexr-7,0);
      drawPolyStone(hexr, hexr, hexh, sides);
      
    }
    translate(-hexr*2,hexr*2-13);
    for (int i = 0; i <= hexr*7; i+=hexr*1.5){
       frameRate(10);
     dance();
      translate(hexr*1.5,hexr-7,0);
      drawPolyStone(hexr, hexr, hexh, sides);
     
    }
    translate(-hexr,hexr*6.5-2);
    for (int i = 0; i <= hexr*8; i+=hexr*1.5){
      frameRate(50);
      dance();
      translate(hexr*1.5,hexr-7,0);
      drawPolyStone(hexr, hexr, hexh, sides);
      
    }
    translate(-hexr*3-hexr*2,hexr*5+10);
    for (int i = 0; i <= hexr*6; i+=hexr*1.5){
      frameRate(30);
      translate(hexr*1.5,hexr-7,0);
      dance();
      drawPolyStone(hexr, hexr, hexh, sides);
    }
    translate(-hexr*19,hexr*7-13);
    for (int i = 0; i <= hexr*10; i+=hexr*1.5){
      frameRate(20);
     dance();
      translate(hexr*1.5,hexr-7,0);
      drawPolyStone(hexr, hexr, hexh, sides);
    }
    translate(-hexr*10,hexr*4-13);
    for (int i = 0; i <= hexr*10; i+=hexr*1.5){
      frameRate(10);
     dance();
      translate(hexr*1.5,hexr-7,0);
      drawPolyStone(hexr, hexr, hexh, sides);
    }
}

void dance(){
  if (mousePressed == true){
        hexh = random(400);
        fill(random(100,255),random(0,200));
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

