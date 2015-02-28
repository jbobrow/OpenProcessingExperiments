
//pick four random numbers for y location of circles
float y=random(0,10);
float y1=random(0,10);
float y2=random(0,10);
float y3=random(0,10);
//pick four random numbers for x coordinate of circles
float x=10;
float x1=20;
float x2=30;
float x3=40;
//pick four random numbers for diameter of circles
float diam=10;
float diam1=20;
float diam2=30;
float diam3=40;
//pick four random numbers for speed of circles
float speed=random(1,5);
float speed1=random(1,6);
float speed2=random(1,7);
float speed3=random(1,8);

int ellipseSize=20;
int k=0;

void setup () {
  size (200,600);
  smooth();
}

void draw() {
  background(k);
  noStroke ();
  fill(255);
  //line (width/2,0,width/2,height);
  //line (0,height/2,width,height/2);
  ellipse (x, y,diam,diam);
  ellipse (x1, y1,diam1,diam1);
  ellipse (x2, y2,diam2,diam2);
  ellipse (x3, y3,diam3,diam3);

  y=y+speed;
  y1=y1+speed1;
  y2=y2+speed2;
  y3=y3+speed3;



  //if mouse is on the top half increase black, otherwise decrease black
  if (mouseY > height/2) {
    k=k+1;
  }
  else {
    k=k-1;
  }
  
  //if mouse is on the right increase black, otherwise decrease black
  if (mouseX > width/2) {
    k=k+1;
  }
  else {
    k=k-1;
  }


  k= constrain (k,10,125);
}



//when mouse is pressed 
//start circles at the top
void mousePressed() {
  y=0;
  y1=0;
  y2=0;
  y3=0;

  diam=random(5,40);
  diam1=random(10,45);
  diam2=random(10,45);
  diam3=random(5,40);

  speed=random(1,5);
  speed1=random(1,5);
  speed2=random(1,5);
  speed3=random(1,5);


  //if x coordinate of circle is less than width add random number between 0 and 200 to x
  //else if x is greater than width set to diameter
  if (x<width) {
    x=x+random(0,200);
  }
  else if (x>width) {
    x=diam;
  }

  //if x coordinate of circle1 is less than width add random number between 0 and 200 to x
  //else if x is greater than width set to diameter
  if (x1<width) {
    x1=x1+random(0,200);
  }
  else if (x1>width) {
    x1=diam1;
  } 

  //if x coordinate of circle2 is less than width add random number between 0 and 200 to x
  //else if x is greater than width set to diameter
  if (x2<width) {
    x2=x2+random(0,200);
  }
  else if (x2>width) {
    x2=diam2;
  }

  //if x coordinate of circle2 is less than width add random number between 0 and 200 to x
  //else if x is greater than  set to diameter
  if (x3<width) {
    x3=x3+random(0,200);
  }
  else if (x3>width) {
    x3=diam3;
  }
}

