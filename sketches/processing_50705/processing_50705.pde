
int x = 0;
int y = 0;
int framerate = 3;
int speed = 5;

int state = 0;

void setup() {
  size(200,200);
}

void draw() {
  background(0);
  
  noStroke();
  fill(random(255), random(255), random(255));
  rect(x,y,10,10);
  if (state ==0){
    x = x+speed;
    background(255,0,0);
    ellipse(100,100, 50,50);
    if(x>width-10){
      x= width -10;
      state =1;
    }
  } else if(state == 1){
    y=y+speed;
    if(y>height - 10) {
      y = height -10;
      state = 2;
    }
  } else if(state ==2) {
    x=x-speed;
    background(0,255,0);
    if(x<0){
      x=0;
      state = 3;
    }
  } else if( state ==3){
    y = y-speed;
    if(y<0){
      y=0;
      state = 0;
    }
  }
}

void mousePressed() {
    background(255);
    rectMode(CENTER);
    fill(0);
    rect(100,100,100,100);
}


