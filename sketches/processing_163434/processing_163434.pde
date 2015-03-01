
int x=0;
int y=0;
int my= 4;
int mx=4;
//my= how much moving on y axis
//mx= how much moving on x axis
int P2Y = 200;

int p1Score=0;
int p2Score=0;


void setup() {
  size (600, 400);
}

void draw () {
  drawBackground();
  fill(0);
  ellipse(x, y, 10, 10);
  x+= mx;
  y+= my;
  if (y>height|| y<0) {
    my *= -1;
  }

  if(x>width){
   mx *= -1;
    x=width/2;
    y = height/2;
    p1Score+=1; 
  }
  if(x<0){
   mx *= -1;
    x=width/2;
    y = height/2;
    p2Score+=1; 
  }
  paddle( 40, mouseY);
  paddle(560, P2Y);

  if ( abs(x-40)<10 && abs(y-mouseY)<20 ) {
    mx= abs(mx);
  }
  if (abs(x-560)<10 && abs(y-P2Y)<20) {
    mx= -abs(mx);
  }
}

//the soft egg goes to sleep

void keyPressed() {
  if (key == 'w') {
    P2Y -= 1;
  }
  if (key == 's') {
    P2Y += 1;
  }
}

void paddle(int x, int y) {
  fill(0,200,0);
  rectMode(CENTER);
  rect(x, y, 10, 40);
}

void drawBackground() {
  background(0,0,200);
  line(0, 60, width, 60);
  line(0, height-60, width, height-60);
  fill(0,200,0);
  ellipse(width/2, height/2, 100, 100);
  fill(0,0,200);
  ellipse(width/2, height/2, 60, 60);
  line(width/2 - 50, height/2, width/2 - 15, height/2);
  line(width/2 + 50, height/2, width/2 + 15, height/2);
  fill(0);
  stroke(0,200,0);
  strokeWeight(4);
  textSize(20); text(p1Score,width*.25,height*.10); text(p2Score,width*.75,height*.10);
}

