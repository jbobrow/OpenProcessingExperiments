
int x;//shape
int y;
int n=10;//size
int xMovement= 3;//moving
int yMovement=3;//moving
int xSpeed= 1;//left
int ySpeed= 1;//top


void setup() {
size(500, 600);
frameRate(60);
x=width/2;
y=height/2;
background(255);
}
void draw() {
 move();
 bounce();
  ball();
}

void mousePressed() { 
xMovement=xMovement+1;
yMovement=yMovement+1;
n=n+5;
if(n>=100){
n=5;
}
}

void keyPressed() {
while(mouseX<=width/2){
background (255);
 break;
  }
}

void ball() {
  ellipse(x, y, n, n);
  line(width/2, height/2, x, y);
}
void move() {
  x=x+(xMovement * xSpeed);
  y=y+(yMovement * ySpeed);
}
void bounce() { 
  if (x > width ) {
   xSpeed *= -1;
  }
  else if(x<n){
  xSpeed*=-1;
  }
  if (y > height || y < n) {
    ySpeed *= -1;
  }
else{
 fill(random(255), random(255), random(255), random(255));

}
}


