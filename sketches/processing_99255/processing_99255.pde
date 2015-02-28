
void setup() {
  size (500,500);
  smooth();
}

int x=0;
int speed=10;
int a=0;
void draw(){
  background (100,255,230);
  frameRate(8);
  noStroke();
  fill(150,100,100);
ellipse(x*2,250,x,x);
x=x+speed;
ellipse(500-(a*2),250,a,a);
a=a+speed;
if (x>250){
x=1;
}
if (a>250){
  a=1;
}
float r=random (500);
float y=random (500);
fill(255,255,255);
ellipse(r,500-y,30,30);
}




