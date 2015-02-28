
int x1=0;
int speed1=2;
int x2=0;
int speed2=3;

void setup() {
  size(400,400);
  background(255);
}

void draw() {
  x1=x1+speed1;
  x2=x2+speed2;
  background (0);
  fill(255,240,45);
  ellipse(x1,50,10,10);
  if(x1 > 400)
  {x1=0;}
    ellipse(x2,300,100,100);
     if(x2 > 400)
  {x2=0;}}             
                
