
//woohun joo
//assignment 2
//LEFT & RIGHT KEY = MOVEMENT
//MOUSE CLICK = BLINKING

//sun
float sux = 530;
float suy = 80;
int sunWH = 100;

//bottom
float bx = 0;
float by = 240;
int bottomWidth = 640;
int bottomHeight = 120;

//body
float x = 320;    
float y = 160;
int bodyWidth = 60;
int bodyHeight = 170;

//mountain
float mtx = 40;
float mty = 200;

//top tie
float ttx = 307;    
float tty = 42;  

//eyes
float ex = 307;
float ey = 92;
int eyeWidth = 7;
int eyeHeight = 7;

//mouth
float mx = 320; 
float my = 110;
int mouthWidth = 30;
int mouthHeight = 13;

//teeth
float tx = 315; 
float ty = 105;
int teethWidth = 2;
int teethHeight = 5;

//arms
float ax = 225;
float ay = 135;
float fx = 234;
float fy = 131;
int armWidth = 70;
int armHeight = 10;
int fingerWidth = 3;
int fingerHeight = 4;

//legs
float lx = 300;
float ly = 240;

//shoes
float sx = 300;
float sy = 290;
int shoeWidth = 20;
int shoeHeight = 10;

//---------------------------------------------
void setup() {
  size(640, 360);
  background(0, 173, 239);
  smooth();
}

//---------------------------------------------
void draw() {
  
  if (keyPressed&& (key ==CODED)){
    if (keyCode == LEFT) {
        background(0, 173, 239);
        x--;
        mtx--;
        ttx--;
        ex--;
        mx--;
        tx--;
        ax--;
        lx--;
        fx--;
        sx--;
    } else if (keyCode ==RIGHT){
        background(0, 173, 239);
        x++;
        mtx++;
        ttx++;
        ex++;
        mx++;
        tx++;
        ax++;
        lx++;
        fx++;
        sx++;
    }
  }

  //sun
  noStroke();
  fill(240, 90, 65);
  ellipse(sux, suy, sunWH, sunWH);

  //bottom
  noStroke();
  fill(204, 168, 65);
  rect(bx, by, bottomWidth, bottomHeight);
  
  //bottomLine1
  stroke(234, 208, 40);
  strokeCap(SQUARE);
  strokeWeight(1);
  for(int i = 10; i < 640; i += 10){
    line(i, 240, i + i/2, 640);
  };
  
  //bottomLine2
  stroke(234, 208, 40);
  strokeCap(SQUARE);
  strokeWeight(1);
  for(float i = 240; i < 360; i = i + i*0.04){
    line(0, i, 640, i);
  };
  
  //mountain
  noStroke();
  fill(19, 69, 69);
  
  for (int j = 80; j < 700; j += 160) {
    triangle(j, 160, j+80, 240, j-80, 240);
  }
  
  fill(18, 61, 55);
  for (int i = 20; i < 700; i += 160) {
    triangle(i, 160, i+80, 240, i-80, 240);

  }

  //body
  stroke(219, 219, 219);
  rectMode(CENTER);
  strokeWeight(8);
  strokeJoin(ROUND);
  fill(117, 137, 50);
  rect(x, y, bodyWidth, bodyHeight);
  

  
  //top tie
  fill(219, 219, 219);
  noStroke();
  beginShape();
  vertex(ttx, tty);
  vertex(ttx+8, tty+7);
  vertex(ttx+16, tty);
  vertex(ttx+22, tty+7);
  vertex(ttx+30, tty);
  vertex(ttx+22, tty+30);
  vertex(ttx+8, tty+30);
  endShape();

  //eyes
  fill(255);
  ellipse(ex, ey, eyeWidth, eyeHeight); //L
  ellipse(ex+27, ey, eyeWidth, eyeHeight); //R
  
  if (mousePressed) {
    eyeHeight = 2; 
    mouthHeight = 5;
    teethHeight = 0;
  } else {
    eyeHeight = 7;
    mouthHeight = 13;
    teethHeight = 5;
  }
  
  //mouth
  rect(mx, my, mouthWidth, mouthHeight);

  fill(117, 137, 50);
  rect(mx, my-6, mouthWidth-10, mouthHeight-6);
  
  //teeth
  fill(255);
  rect(tx, ty, teethWidth, teethHeight);
  rect(tx+5, ty, teethWidth, teethHeight);
  rect(tx+10, ty, teethWidth, teethHeight);
 
  //legs
  fill(117, 137, 50);
  quad(lx, ly, lx+10, ly, lx+10, ly+50, lx, ly+50);
  quad(lx+30, ly, lx+40, ly, lx+40, ly+50, lx+30, ly+50);
  //quad(lx, ly, lx+12, ly, lx+8, ly+50, lx+4, ly+50);
  //quad(lx+28, ly, lx+40, ly, lx+36, ly+50, lx+32, ly+50);
  
  //shoes
  rectMode(CORNER);
  fill(219, 219, 219);
  rect(sx, sy, shoeWidth, shoeHeight);
  rect(sx+30, sy, shoeWidth, shoeHeight);

  //arm
  fill(117, 137, 50);
  rect(ax, ay, armWidth, armHeight);
  rect(ax+120, ay, armWidth, armHeight);
  rect(fx, fy, fingerWidth, fingerHeight);
  rect(fx+167, fy, fingerWidth, fingerHeight);
}
