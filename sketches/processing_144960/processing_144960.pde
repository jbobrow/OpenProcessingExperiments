
 // Konkuk University
 // Department of Dynamic Media
 // SOS iDesign
 // Name: Eunjin Park
 // ID: 201420079

int x = 0;
int y = 0;
 int xSpeed = 5;
 int ySpeed = 5;
void setup() {
  size(600,600);
  smooth();
}
void draw() {
  //background(255);
   x = x + xSpeed;
   y = y + ySpeed;
  if ((x > width) || (x < 0)) {
    xSpeed = xSpeed * -1;
  }
    if ((y > height) || (y < 0)) {
    ySpeed = ySpeed * -1;
  }
  stroke(0);
  fill(x,0,y,100);
  quad(x,y,width-x,0,600,height-y,width-x,width-x);
  fill(y,0,x,100);
  quad(x,600,0,height-y,x,height-y,x,x);
}

