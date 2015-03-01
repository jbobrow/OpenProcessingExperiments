
float H = 260;
float S = 0;
float B = 80;
//float cbkgd = 10;
float cdir = 0.7;

float x=200;
float y=200;
float x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17, x18, x19, x20, x21, x22, x23, x24;
float y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11, y12, y13, y14, y15, y16, y17, y18, y19, y20, y21, y22, y23, y24;
float speed = 2;
float speedX = 0;
float speedY = 0;
int directionX;
int directionY;

void setup() {
  size(400, 400);
  colorMode(HSB, 360, 100, 100, 1.0);
  smooth();
  x1=x-105;
  y1=y2=y5=y6=y9=y10=y13=y14=y17=y18=y21=y22=y;
  x2=x+105;
  x3=x4=x7=x8=x11=x12=x15=x16=x19=x20=x23=x24=x;
  y3=y-105;
  y4=y+105;
  x5=x-90;
  x6=x+90;
  y7=y-90;
  y8=y+90;
  x9=x-75;
  x10=x+75;
  y11=y-75;
  y12=y+75;
  x13=x-60;
  x14=x+60;
  y15=y-60;
  y16=y+60;
  x17=x-45;
  x18=x+45;
  y19=y-45;
  y20=y+45;
  x21=x-30;
  x22=x+30;
  y23=y-30;
  y24=y+30;
}

void draw() {
  background(0);

  //Flower petals
  stroke(0);
  strokeWeight(4);

  //Layer6, 2r=210
  fill(H, S, B);
  ellipse(x1, y1, 210, 210);
  ellipse(x2, y2, 210, 210);
  fill(H, S, B);
  ellipse(x3, y3, 210, 210);
  ellipse(x4, y4, 210, 210);

  //Layer5, 2r=180
  fill(H, S+10, B);
  ellipse(x5, y5, 180, 180);
  ellipse(x6, y6, 180, 180);
  fill(H, S+10, B);
  ellipse(x7, y7, 180, 180);
  ellipse(x8, y8, 180, 180);

  //Layer4, 2r=150
  fill(H, S+20, B);
  ellipse(x9, y9, 150, 150);
  ellipse(x10, y10, 150, 150);
  fill(H, S+20, B);
  ellipse(x11, y11, 150, 150);
  ellipse(x12, y12, 150, 150);

  //Layer3, 2r=120
  fill(H, S+30, B);
  ellipse(x13, y13, 120, 120);
  ellipse(x14, y14, 120, 120);
  fill(H, S+30, B);
  ellipse(x15, y15, 120, 120);
  ellipse(x16, y16, 120, 120);

  //Layer2, 2r=90
  fill(H, S+40, B);
  ellipse(x17, y17, 90, 90);
  ellipse(x18, y18, 90, 90);
  fill(H, S+40, B);
  ellipse(x19, y19, 90, 90);
  ellipse(x20, y20, 90, 90);

  //Layer1, 2r=60
  fill(H, S+50, B);
  ellipse(x21, y21, 60, 60);
  ellipse(x22, y22, 60, 60);
  fill(H, S+50, B);
  ellipse(x23, y23, 60, 60);
  ellipse(x24, y24, 60, 60);

  // //Fixed dot
  // strokeWeight(3);
  // fill(255);
  // ellipse(250,250,30,30);
  // strokeWeight(2);
  // //quad(300,285,315,300,300,315,285,300);

  // //  strokeWeight(2);
  //   fill(0);
  //   smooth();
  //   ellipse(250,250,18,18);

  x1-=speed;
  x2+=speed;
  y3-=speed;
  y4+=speed;
  x5-=speed;
  x6+=speed;
  y7-=speed;
  y8+=speed;
  x9-=speed;
  x10+=speed;
  y11-=speed;
  y12+=speed;
  x13-=speed;
  x14+=speed;
  y15-=speed;
  y16+=speed;
  x17-=speed;
  x18+=speed;
  y19-=speed;
  y20+=speed;
  x21-=speed;
  x22+=speed;
  y23-=speed;
  y24+=speed;

  S = S + cdir;
  

  if ((x1-speed < 50) || (x1 - speed > 350)) {
    speed = speed * -1;
  }

  if (S > 100 || S < 0) {
    cdir *= -1;
  }

  // if (mousePressed == true) {
  //   speed = 3;
  // }

  // Add the current speed to the x location.
}


