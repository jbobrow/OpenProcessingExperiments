
int diameter = 50;

int xdistance = diameter/2;
int ydistance = diameter/2;


int xspeed = 5;
int yspeed = 10;


int ydirection = 1;
int xdirection = 1;

int points = 0;
int paddlepoints = 0;
PFont font;


void setup() {
  size(600, 600);
  background(100);
  fill(150, 109, 255);
  noStroke();
  font = loadFont("Serif-48.vlw");
  textFont(font, 50);
}

void draw() {
  background(100);
  ellipse(xdistance, ydistance, diameter, diameter);
  rectMode(CENTER);
  rect(mouseX, height-75, 200, 20);
  xdistance += xspeed*xdirection;
  ydistance += yspeed*ydirection;
  text(points, 50, 50);
  text(paddlepoints, 500, 50);
 // text ("YOU WIN", 200,300);


//point system win/lose
if(paddlepoints>=10){
  text("YOU WIN", 200,300);
}
if(points<=-2){
  text("YOU LOSE",200,300);
}


  //bottom hit
  //if (ydistance>height-diameter/2) {
  if (ydistance>height-100 && xdistance>mouseX-100 && xdistance<mouseX+100) {
    ydirection = -ydirection;
    paddlepoints ++;
  }
  else if (ydistance>height-diameter/2) {

    ydirection= -ydirection;
    points --;
  }

  //top hit
  if (ydistance<0+diameter/2) {
    ydirection=-ydirection;
  }

  //right hit
  if (xdistance>width-diameter/2) {
    xdirection = -xdirection;
  }

  //left hit
  if (xdistance<0+diameter/2) {
    xdirection=-xdirection;
    if (xdistance<=mouseX && ydistance>height-75) {
      xspeed=xspeed*-1;
    }
  }
}
