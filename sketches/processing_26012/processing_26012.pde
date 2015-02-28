
int X = 51;
int changeX = 10;

int X2 = 81;
int changeX2 = 20;

int X3 = 81;
int changeX3 = 5;

int X4 = 20;
int changeX4 = 25;

int X5 = 300;
int changeX5 = 15;

int Y = 200;
int changeY = 5;

int bob = 20;
int dan = 100;

void setup() {
  size (400, 400);
  smooth();
  frameRate(15);
}

void draw() {
  background(#31CFD3);
  fill (random(30, 201));
  stroke (#FFFFFF, 0);
  ellipse(X, mouseY , mouseX, mouseX);
  X += changeX;
  if ( X >= 350 || X <= 50) {
   changeX *= -1; 
   // PRINT COMMAND: println("out of bounds");
  }
  
  fill (#9157DE);
  stroke (#FFFFFF, 0);
  ellipse(X2, 200 , 50, 50);
  X2 += changeX2;
  if ( X2 >= 350 || X2 <= 80) {
   changeX2 *= -1; 
   // PRINT COMMAND: println("out of bounds");
  } 
  
  
  fill (random(10,209),random(10,132),random(10,169));
  ellipse(mouseX,mouseY,100,100);
  X3+=changeX3;
  if(X3>400 || X3<50) {
    changeX3*=-1;
  }

 fill (#ABED6E);
  stroke (#FFFFFF, 0);
  ellipse(X4, 150 , 30, 30);
  X4 += changeX4;
  if ( X4 >= 350 || X4 <= 5) {
   changeX4 *= -1; 
  } 
  
 fill (#ED6EAE);
  stroke (#FFFFFF, 0);
  ellipse(X5, 300 , 30, 30);
  X5 += changeX5;
  if ( X5 >= 380 || X5 <= 30) {
   changeX5 *= -1; 
  } 

}


