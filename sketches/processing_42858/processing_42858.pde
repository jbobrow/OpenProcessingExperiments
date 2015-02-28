
float a=3*PI/2;
float deltaA=.01;
float pathX=0;
float pathY=50;
float centerY=50;
float Y=50;
float xSpeed=.3;

void setup() {
  size(500,500);
  background(255);
  frameRate(60);
}

void draw() {
  smooth();
  
  
  pathX=pathX+xSpeed;
  pathY=centerY+Y*sin(a);
  a=a+deltaA;
  
  fill(pathY/2,0,pathX/2,255-pathY/3);
  noStroke();
  ellipse(pathX, pathY, 10,10-4*tan(a));
  if (pathX>=500) {
    xSpeed=xSpeed*-1;
    a=a+PI;
    centerY=centerY+30;
  } else if (pathX<=0) {
    xSpeed=abs(xSpeed);
    a=a-PI;
     centerY=centerY+30;
  }
  println(pathX);
}




