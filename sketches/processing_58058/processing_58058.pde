
// Created by Emily Chang
// ARCH 2503 Digital Media, Department of Architecture, Cornell AAP

int x= 10;
int y= 10;
int dir=1;
float speed=0.5;
void setup() {
  size(600, 600); 
  noCursor();
  smooth();
}

void draw () {


  fill(0, 0, mouseX); //blue
  noStroke();
  rect(0, 0, x, 300); 


  noStroke();

  fill(255, 255, 0); //yellow

  rect(0, 300, 600, 50);

  fill(mouseX); //lightgray

  rect(x, 0, y, 50);
  rect(x, 50, y, 50);
  rect(x, 100, y, 50);

  rect(x, 200, y, 50);
  rect(x, 250, y, 50);
  rect(x, 300, y, 50);
  rect(x, 350, y, 50);
  rect(x, 400, y, 50);
  rect(x, 450, y, 50);
  rect(x, 500, y, 50);
  rect(x, 550, y, 50);

  rect(0, 350, x, 50);
  rect(0, 400, x, 50);
  rect(0, 450, x, 50);
  fill(mouseX, 0, 0);//red
  rect(x, 150, y, 50);
  rect(0, 500, x, 50);
  fill(mouseX); //white
  rect(0, 550, x, 50);
  fill(0); //black
  rect(x+y, 0, 600-x-y, 300);

  fill(mouseY);
  rect(x+y, 350, 600-x-y, 250);



  stroke(255);
  strokeWeight(5);
  noFill();
  rect(0, 0, 600, 600);
  strokeWeight(10);
  line(x, 0, x, 600);
  line(x+y, 0, x+y, 600);
  line(0, 300, 600, 300);
  line(0, 350, 600, 350);
  strokeWeight(5);
  line(x, 50, x+y, 50);
  line(x, 100, x+y, 100);
  line(x, 150, x+y, 150);
  line(x, 200, x+y, 200);
  line(x, 250, x+y, 250);
  line(x, 400, x+y, 400);
  line(x, 450, x+y, 450);
  line(x, 500, x+y, 500);
  line(x, 550, x+y, 550);

  line(0, 400, x, 400);
  line(0, 450, x, 450);
  line(0, 500, x, 500);
  line(0, 550, x, 550);

  x += dir;
  y += dir;

  x += speed*dir;
  if (x>550||x<0) {
    dir=dir*-1;
  }
  y += speed*dir;
  if (x<10) {
    dir=dir*-1;
  }
  if (y<0) {
    dir=dir*-1;
  }
}


