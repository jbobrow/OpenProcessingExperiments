
int i=0;
int x=100,y= 200;
int x_speed = 2;
int y_speed = 2;
void setup() {
size(640,480);
stroke(200);
}


void draw() {
  background(0);
  i+=1;
  println(i);
  rect(x,y,50,20);
  x= x+x_speed;
  if ((x > width) || ( x <= 0 ))
  x_speed = -x_speed;
  y=y+y_speed;
  if((y > height) || ( y<=0))
  y_speed = -y_speed;
}


