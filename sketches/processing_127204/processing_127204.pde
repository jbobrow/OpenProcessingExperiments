
/*@pjs preload="apple2.png";*/

PImage img;
int i=0;
int x = 0;
int y = 0;
int eSize =5;
int xspeed = 5;
int yspeed = 3;
int flag =0;
float theta;

void setup() {
  size(450, 450);
  background(255);
  smooth();
}




void draw() { 

  translate(width/2, height/2);
  rotate(theta);


  noStroke();
  fill(0);
  ellipse(0, 0, 400, 400);


  fill(255);
  ellipse(0, 0, 120, 120);

  for (int i = 0; i < 3; i ++) {
    fill(random(100, 200), random(150, 255), 255);
    ellipse(96, 30, y/10, y/10);
    ellipse(84, 55, x/13, x/13);
    ellipse(0, -90, y/15, y/15);
    ellipse(-120, -100, x/10, x/10);
    ellipse(-60, 100, x/15, x/15);
    ellipse(-100, -80, y/30, y/30);
    ellipse(-100, 80, x/20, x/20);
    ellipse(60, -100, x/16, x/16);
    ellipse(80, 150, x/18, x/18);
    ellipse(-55, 165, x/40, x/40);
  }


  stroke(255);
  strokeWeight(3);
  noFill();
  ellipse(0, 0, x/2, x/2);

  //ellipse(0, 0, 200, 200);
  //ellipse(0, 0, 250, 250);
  //ellipse(0, 0, 300, 300);


  strokeWeight(5);
  ellipse(0, 0, y, y);
  strokeWeight(10);
  ellipse(0, 0, x+30, x+30);
  strokeWeight(3);
  ellipse(0, 0, y+45, y+45);
  noFill();
  stroke(0);
  strokeWeight(10);
  ellipse(0, 0, 420, 420);


    img =loadImage("apple2.png");
  tint(0, 255, 255);
  image(img, -47, -53, 90, 105);

  if (flag==1) {
    theta += 0.02;
    x = x + xspeed;
    y=y+yspeed;
  }
  if (x > width || x < 0) {
    xspeed = -xspeed;
  }
  if (y > height || y < 0) {
    yspeed = -yspeed;
  }
}


void mousePressed() {
  if (flag==1) {
    flag=0;
  }
  else if (flag==0) {
    flag=1;
  }
}



