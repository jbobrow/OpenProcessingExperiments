
//Global variables
Button b; //Red
Button o; //Blue
Button i; //Black
Button y; //Yellow
Button g; //Green
color lineColor = color(0);

int boardX = 50;
int boardY= 0;
int boardHeight=500;
int boardWidth=600;
int ButtonX= 50;
int ButtonY= 50;

void setup() {
  b = new Button(25, 25, color(255,0,0));
  o = new Button(25,70, color(0,0,255));
  i = new Button(25, 120, color(0));
  y = new Button(25, 170, color(255,255,0));
  g = new Button(25, 220, color(0,255,0));
  size(600,600);
  background(255);
}

void draw() {
  fill(0);
  noStroke();
  rectMode(CENTER);
  rect(25, 600, 50, 1200);
  rect(575, 600, 50, 1200);
  b.draw();
  o.draw();
  i.draw();
  y.draw();
  g.draw();
  if (mousePressed) {
  stroke(lineColor);
  line(pmouseX,pmouseY,mouseX,mouseY);
  }
}

void keyPressed() {
  if(key==CODED) {
    if (keyCode==UP) {
      strokeWeight(10);
    }
    if (keyCode==DOWN) {
      strokeWeight(30);
    }
    if (keyCode==LEFT) {
      strokeWeight(50);
    }
    if (keyCode==RIGHT) {
      strokeWeight(70);
    }
  }
  if (key=='c') {
    background(255);
  }
}

void mousePressed() {
      if (b.isPressed()) {
            lineColor=color(255,0,0);
       }
       if (o.isPressed()) {
             lineColor=color(0,0,255);
       }
       if (i.isPressed()) {
           lineColor=color(0);
           
       }
       if (y.isPressed()) {
           lineColor=color(255,255,0);
           
       }
       if (g.isPressed()) {
           lineColor=color(0,255,0);
       }
}
