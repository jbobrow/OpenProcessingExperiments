
//Adam Oaks

void setup(){
  size(400,400);
  frameRate(75);
}

int x=50;
int y=50;
int r=10;

void draw(){
  background(146,192,0);
  fill(25,25,y);
  rectMode(CENTER);
  translate(width/2,height/2);
  rotate(r);
  rect(width/2,height/2,x,y);
  x++;
 y++;
 r++;
}

