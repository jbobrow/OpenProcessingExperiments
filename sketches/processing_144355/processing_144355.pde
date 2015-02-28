
/*  
 Konkuk University  
 SOS iDesign  
 Name: KIM Sun hyun 
 ID: 201420067
*/ 

int x = 2;
int y = 2;
int x2 = 2;
int y2 = 2;

int xSpeed = 3;
int ySpeed = 1;
int xSpeed2 = 1;
int ySpeed2 = 2;

void setup() {
  size(600, 600);
  smooth();
}

void draw() {

  x = x + xSpeed;  
  y = y + ySpeed; 
  x2 = x2 + xSpeed2;  
  y2 = y2 + ySpeed2; 

  if ((y >  height) || (y<0)) {
    ySpeed = ySpeed * -1;
  }
  if ((x >  width) || (x<0)) {
    xSpeed = xSpeed * -1;
  }
  if ((y2 >  height) || (y2<0)) {
    ySpeed2 = ySpeed2 * -1;
  }
  if ((x2 >  width) || (x2<0)) {
    xSpeed2 = xSpeed2 * -1;
  }
  //roke(y);
  noFill();
  stroke(0, 30);
  line(x, y, x2, y2);

  //quad(height,y,32,width-x,30,50,20,width-x);
  // quad(height,0,0,width-x,height,width-x,10,width);
}
