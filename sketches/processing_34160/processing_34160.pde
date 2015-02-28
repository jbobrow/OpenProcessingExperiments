

float xPos;
float yPos;
float ballSize;
float ballRadius;
int r;
int g;
int b;
float Xspeed;
float Yspeed;
float Xdirection;
float Ydirection;
boolean isMoving;
int opacity;
PImage inter;

void setup () {
  noStroke();
  ellipseMode(CENTER);
  size(600, 763);
  background(255);
  xPos=100;
  yPos=100;
  ballSize=10;
  ballRadius=ballSize/2;
  r=75;
  g=100;
  b=150;
  Xspeed=10;
  Yspeed=2;
  Xdirection=1;
  Ydirection=1;
  isMoving=true;
  opacity=100;
  inter = loadImage("inter.png");
  image(inter, 20, 600);
}

void draw () {
  stroke(1);
line(0,610,610,610);
noStroke();
  if (isMoving) {
    fill (r, g, b, opacity);
    ellipse(xPos, yPos, ballSize, ballSize);
    xPos+=(Xspeed*Xdirection);
    yPos+=(Yspeed*Ydirection);
  }

  if (xPos+ballRadius>=width) {
    Xdirection=-1;
  }
  if (xPos-ballRadius<=0) {
    Xdirection=1;
  }
  if (yPos+ballRadius>=(588-ballRadius)) {
    Ydirection=-1;
  }
  if (yPos-ballRadius<=0) {
    Ydirection=1;
  }
}

void mouseReleased () {
  Xdirection*=-1;
}

void keyPressed () {
  //if press spacebar
  if (key==' ') {
    isMoving=!isMoving;
    if (!isMoving) {
      //      g+=2;
      //      b++; 
      //      r+=20;
      b++;
      g++;
    }
  }

  if (key=='-') {
    if (Yspeed>0) {
      ballSize--;
    }
  }
  if (key=='=') {
    ballSize++;
  } 

  if (key==CODED) {
    if (keyCode==UP) {
      Yspeed++;
    }
    if (keyCode==DOWN) {
      if (Yspeed>0) {
        Yspeed--;
      }
    }

    if (keyCode==RIGHT) {
      Xspeed++;
    }

    if (keyCode==LEFT) {
      if (Xspeed>0) {
        Xspeed--;
      }
    }
  }
}


