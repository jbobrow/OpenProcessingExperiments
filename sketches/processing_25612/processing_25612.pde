
//Physics!
//Velocity of X and Y
float vy = 0;
float vx = 0;
float x = 500;
float y = 500;
float friction = -.6;
float gravity = .10;
boolean MovingLeft;
boolean MovingRight;
boolean Jumping;
boolean Ground;

void setup(){
  size(800,800);
  smooth();
}

void draw(){
  //Gravity remains a positive number.
  vy += gravity;
  //Both of these are constantly affected by gravity.
  //vx += -.01;//wind
  x += vx;
  y += vy;
  if(y>height){
    y = height;
    vy *=friction;
  }

  //The player!
  ellipse(x,y,random(15),random(15));
  fill(0,159,255);
  noStroke();
  
//Program Borders
  if (x>width){
    x = width;
    vx=-vx;
  }
  if (x<0){
    x=0;
    vx = -vx;
  }
  if (y>height){
    y=0;
    vy *=friction;
  }
if (y<0){
  y=0;
  vy *=friction;
}
}

//Keyboard Controls
void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT){
    vx += 1;
    }
  }
if (key == CODED){
  if (keyCode == LEFT){
    vx += -1;
  }
}
if (key == CODED){
  if (keyCode == UP){
    vy += -5;
  }
}
if (key == CODED){
  if (keyCode == DOWN){
    fill(random(255),random(255),random(255));
  }
}
}


