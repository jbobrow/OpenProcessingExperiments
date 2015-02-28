
/*Project 2C Exercise
Code by Jennifer Nowack
York University: 211448347
YSDN-1006*/
//initialize variables
int a=60;
int b=100;
int c=80;

void setup(){
  size(400, 400);
  frameRate(30);
}

void draw(){
  background(b, c, a);
  fill(c, b, a);
  //draw triangle
  triangle(b,a,a,c,c,b);
  //make triangle grow by increasing integers
  if (a<500){
   a+=5;
   b+=10;
   c+=3;
  } //reset integers to origin
    else {
    a=60;
    b=100;
    c=80;
  }
}

