
int R=50;
int r=50;
float cos;
float sin;
int a=75;
float theta;
float x;
float y;

void setup(){
  size (400,400);
  smooth();
  noStroke();
  background(0);
}

void draw (){
  mov();
    x=(R+r)*cos(theta)-a*cos(((R+r)/r)*theta);
    y=(R+r)*sin(theta)-a*sin(((R+r)/r)*theta);
    fill(random(x,y),max(x,y),min(x+200,y+200));
    ellipse (x,y,2,2);
  theta+=0.005;
}

void mov(){
  translate(width/2,height/2);
  rotate (radians(theta));
}

