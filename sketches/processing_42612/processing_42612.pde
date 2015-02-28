
int x=0;
int speedX=2;
int y=0;
int speedy=3;
int x1=5;
int speedX1=1;
int y1=5;
int speedy1=2;
float d=20;
float d1=20;
int colour=0;
void setup () {
  size (400, 400);
  smooth();
}
void draw() {
  background(200);
  fill(colour);
  ellipse(x, y, 40, 40);
  ellipse(x1, y1, 40, 40);


  if (x>=width || x<0) {
    speedX= speedX*-1;
  }
  if (y>=height || y<0) {
    speedy= speedy*-1;
  }


  if (x1>=width || x1<0) {
    speedX1= speedX1*-1;
  }
  if (y1>=height || y1<0) {
    speedy1= speedy1*-1;
  }

 if (d1>20 && d1<30) {
    speedy1= speedy1*-2;
    speedX1= speedX1*-2;
  }
  
   if (d>20 && d<30) {
    speedy= speedy*-2;
    speedX= speedX*-2;
   }
   
  d=dist(mouseX, mouseY, x, y);
  d1=dist(mouseX, mouseY, x1, y1);

  x=x+speedX;
  y=y+speedy;

  x1=x1+speedX1;
  y1=y1+speedy1;
  
}
                
