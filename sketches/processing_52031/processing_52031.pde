
int x=5, xdirection = 2,y=150; //left or right

void setup(){
  size(500,400);
  smooth();
}


void draw(){
  background(255);
  x= x+xdirection;
  if (x>400 ||x<0){
    xdirection*=-1;
  }
  //Draw Monster Head
  strokeWeight(3);
  noFill();
  rect(x,y, 120,100);
  line(x,y,x-60,y-40);
  line(x+120,y,x+60,y-40);
  //Face
  rect(x+30,y+50,-20,-30);
  rect(x+80,y+50,-20,-30);
  ellipse(x+48,y+80,15,25);
  //Body
  triangle(x+60,y+100,x-60,y+150,x+120,y+180);
  triangle(x,y+160,x,y+240,x+40,y+170);
}
