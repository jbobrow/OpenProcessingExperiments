
//Kat's Paint Program
Brush brush1;
Brush brush2;
Brush brush3;
Brush brush4;

Paint paint1;
Paint paint2;
Paint paint3;
Paint paint4;
Paint paint5;
Paint paint6;
Paint paint7;
Paint paint8;
Paint paint9;
Paint paint10;
Paint paint11;
Paint paint12;

boolean button = false;
int x ;
int y ;
int w ;
int h ;
int currentColor ;
float oldX;
float oldY;
color redC= color(255, 0, 0);
color greenC= color(0, 255, 0);
color blueC= color(0, 0, 255);
color yellow= color(247, 240, 0);
color orange= color(247, 112, 0);
color violet= color(110, 0, 220);
color blueGreen= color(0, 200, 200);
color yellowGreen= color(157, 250, 0);
color pink= color(200, 28, 97);
color yellowOrange= color(255, 159, 3);
color white= color(255);
color black= color(0);
int strokeSize= 5;
int strokeColor= color(255, 255, 255);


void setup() {
  size (1200, 1000);
  background(255);
  smooth();
  brush1 = new Brush(1, color(50));
  brush2 = new Brush(2, color(100));
  brush3 = new Brush(3, color(150));
  brush4 = new Brush(4, color(200));

  paint1 = new Paint(1, color(0));
  paint2 = new Paint(2, color(255));
  paint3 = new Paint(3, pink);
  paint4 = new Paint(4, violet);
  paint5 = new Paint(5, blueC);
  paint6 = new Paint(6, blueGreen);
  paint7 = new Paint(7, greenC);
  paint8 = new Paint(8, yellowGreen);
  paint9 = new Paint(9, yellow);
  paint10 = new Paint(10, yellowOrange);
  paint11 = new Paint(11, orange);
  paint12 = new Paint(12, redC);
  paintProgram();
}

void draw() {

  stroke(currentColor);


  basicDraw();
  colorPallete();
  brushPallete();
  if (mousePressed) {
        if (mouseY > 5 && mouseY < 35) {
          if (mouseX >1135 && mouseX < 1195) {
            exit();
          }
        }
      }
}

void paintProgram() {

  rectMode(CORNER);
  stroke(0);
  fill(200);
  rect(0, 0, 1200, 1000);
  stroke(0);
  fill(160);
  rect(100, 100, 1090, 890);
  stroke(0);
  fill(255);
  rect(110, 110, 1070, 870);
  stroke(0);
  fill(160);
  rect(0, 0, width, 45);
  fill(230);
  rect(0, 0, width, 40);
  fill(160, 0, 0, 155);
  strokeWeight(2);
  rect(1135, 5, 60, 30);
  stroke (255);
  strokeWeight(3);
  line(1155, 12, 1175, 27);
  line(1155, 27, 1175, 12);
  textSize(27);
  fill(0);
  text("Untitled - Microsoft Paint", 30, 30);
}
void brushPallete() {
  brush1.display();
  brush2.display();
  brush3.display();
  brush4.display();
}
void colorPallete() {
  paint1.display();
  paint2.display();
  paint3.display();
  paint4.display();
  paint5.display();
  paint6.display();
  paint7.display();
  paint8.display();
  paint9.display();
  paint10.display();
  paint11.display();
  paint12.display();
}

void drawRectangle() {
  colorChanging();
  if (mousePressed) {
    fill(currentColor);
    rectMode(CENTER);
    rect(mouseX, mouseY, 50, 50);
  }
}
void drawCircle() {
  colorChanging();
  if (mousePressed) {
    fill(currentColor);
    rectMode(CENTER);
    ellipse(mouseX, mouseY, 50, 50);
  }

  oldX=mouseX;
  oldY=mouseY;
}

void basicDraw() {
  colorChanging();
  if (mousePressed) {
    strokeWeight (strokeSize);
    line(mouseX, mouseY, oldX, oldY);
  }

  oldX=mouseX;
  oldY=mouseY;
}
void colorChanging() {
  if (mousePressed) {
    if (mouseY > 60 && mouseY < 90) {
      if (mouseX >120 && mouseX < 150) {
        currentColor=(redC);
      }
      if (mouseX >150 && mouseX < 180) {
        currentColor=(orange);
      }
      if (mouseX >180 && mouseX < 210) {
        currentColor=(yellowOrange);
      }
      if (mouseX >210 && mouseX < 240) {
        currentColor=(yellow);
      }
      if (mouseX >240 && mouseX < 270) {
        currentColor=(yellowGreen);
      }
      if (mouseX >270 && mouseX < 300) {
        currentColor=(greenC);
      }
      if (mouseX >300 && mouseX < 330) {
        currentColor=(blueGreen);
      }
      if (mouseX >330 && mouseX < 360) {
        currentColor=(blueC);
      }
      if (mouseX >360 && mouseX < 390) {
        currentColor=(violet);
      }
      if (mouseX >390 && mouseX < 420) {
        currentColor=(pink);
      }
      if (mouseX >420 && mouseX < 450) {
        currentColor=(white);
      }
      if (mouseX >450 && mouseX < 480) {
        currentColor=(black);
      }
      
    }
  }
}
void keyPressed() {
  if (key== '=') strokeSize++;
  if (key== '-') strokeSize--;
  if (key== 'r') strokeColor=color(255, 0, 0);
  if (key== 'g') strokeColor=color(0, 255, 0);
  if (key== 'b') strokeColor=color(0, 0, 255);
  if (key== '`') fill(255); 
  rect(110, 110, 1070, 870);
  if (key== 'q') drawRectangle();
  if (key== 'w') drawCircle();
}

class Brush {
  color c;
  int ypos;
 Brush(int _ypos, color _c) {
c=_c;
ypos=_ypos;
  }
  void display(){
    stroke(0);
    strokeWeight (2);
    fill(c);
    rect(20,150+(ypos*50)-30,50,50);
  }
}
class Paint {
  color c;
  int xpos;
  Paint(int _xpos, color _c) {
c=_c;
xpos=_xpos;
  }
  void display(){
    stroke(0);
    strokeWeight (2);
    fill(c);
    rect(width-720-(xpos*30),60,30,30);
  }
}



