
//Kate Easton
//z3290017
//Lesson Two Project

int y = 0;
int w = 20; //starting x point of rect
int h = 20; //starting y point of rect
int speed = 1;

void setup(){
  size(200,200);
}

void draw(){
  background(255);
  stroke(0);
  for(int y=0; y<height; y+=20) {
    line(0,y,width,y);
  }
 { fill(180,60,35);
  ellipse(100,100,w,h);
  
  w = w +speed; //determing the variable and speed of the rect

if ((w > 100) || (w<0))  
speed = speed * -1;
 }

fill(260-mouseX,50-mouseX,mouseX+130);
rect(100,130,60,60);
}

void mousePressed(){
  frameRate(20);
  fill(200,130,40);
  ellipse(40,120,40,40);
}

