
int x,y;
y=0;
x=1;

void setup() {  
  size(250, 250);
  background(255);  
}

void draw() {   
background (0);
  if (y==0) {x++;} else {x--;}
  if (x==height) {y=1;}
  if (x==0) {y=0;}
  stroke(100,100,100);
  ellipse(width/2, x,x/2,sqrt(x));  
}
