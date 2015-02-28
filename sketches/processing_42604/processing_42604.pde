
//weiyuhli
// practice of bouncing ball
//color of ball changes when bumps the boundary
//color of background changes by the position of ball
//ball increase speed when bumps the boundary

float x, y, w, h, b, c1, c2, c3, g1, g2, g3;
float sizx=10;
float sizy=10;
float speed=15;
void setup() {
  size(400, 300);

  x=random(width);
  y=random(height);
  w = random(10);
  h = random(10);
  ellipse(x, y, sizx, sizy);
}

void draw() {
  //set speed
  frameRate(speed);
  if (speed>=200) {
    speed=15  ;
  }
  //set background
  // g1=mouseX/2+50;
  // g2=mouseY/2+50;
  g1=x;
  g2=y;
  g3=(g1+g2)/2;
  background(g1, g2, g3,150);

  //想做出撞到邊界擠壓效果但失敗
  // if (x==width-sizx/2 || x==0+sizx/2) {
  // sizx=sizx/3;
  // sizy=sizy*3;
  //  }
  // if (y==height-sizy/2 || y==0+sizy/2) {
  //sizx=sizx*3;
  //sizy=sizy/3;
  //  }


  //set ball movement
  noStroke();
  if (x>=width-sizx/2) {
    w=-w;
    c1=random(255);
    c2=random(255);
    c3=random(255);
    //sizx=sizx+5;
    //sizy=sizy+5;
    speed=speed+3;
  }
  if (x<=0+sizx/2) {
    w=-w;
    c1=random(255);
    c2=random(255);
    c3=random(255);
    // sizx=sizx-5;
    //sizy=sizy-5;
    speed=speed+3;
  }

  if (y>=height-sizy/2 ) {
    h=-h;
    c1=random(255);
    c2=random(255);
    c3=random(255);
    //sizx=sizx+5;
    //sizy=sizy+5;
    speed=speed+3;
  }
  if (y<=0+sizy/2 ) {
    h=-h;
    c1=random(255);
    c2=random(255);
    c3=random(255);
    //sizx=sizx-5;
    //sizy=sizy-5;
    speed=speed+3;
  }



  fill(c1, c2, c3);
  x=x+w;
  y=y+h;
  //sizx
  ellipse(x, y, sizx, sizy);
}



void keyPressed() {
  saveFrame("bouncing ball 1.jpg");
}


