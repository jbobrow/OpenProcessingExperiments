
int x;
int y;
int diameter;
color center;
color rings;

int speed;
int yspeed;
int xspeed;
boolean inCircle;

void setup() {
  size(400,400);
  x=width/2;
  y=height/2;
  diameter = 50;
  center = color(255,255,0);
  rings = color(255,127,0);
  speed = 2;
  yspeed = 2;
  xspeed = 4;
  smooth();
}

void  draw(){
  background(0,0,20);
  //renderCircle(mouseX,mouseY);
  renderCircle(x,y);
   renderCircle(x/2,y/2);
    renderCircle(x/3,y/3);
      renderCircle(x/4,y/4);
      renderCircle(x/5,y/5);
  moveCircle();

  inCircle = inMainCircle(mouseX, mouseY);

  if (inCircle=true){
    center = color(225,225,0);
  }
}


void renderCircle(int _x, int _y){
  noStroke();
  fill(center);
  ellipse(_x,_y,diameter,diameter);
  noFill();
  stroke(rings);
  strokeWeight(4);
  for (int i = 0; i < 4; i++) {
    ellipse(_x,_y,diameter + 8 + i*12, diameter + 8 + i*12);
  }
}

void moveCircle(){
  x = x+xspeed;
  if (x > width){
    xspeed = -xspeed;

  }
  if (x < 0){
    xspeed = -xspeed;
  }
  y =y+yspeed;
  if (y > height)  {
    yspeed = -yspeed;
    //we will put some code in here
    //y = y+speed
  }
  if (y < 0){
    yspeed = -yspeed;
  }
}

boolean inMainCircle(int _x, int _y){
  if (dist(_x,  _y, x,y) <diameter/2) return true;
  else return false;

}



