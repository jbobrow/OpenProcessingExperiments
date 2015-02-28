
void setup() {
  size(600, 600);
 float x=random (600);
 float y=random(600);
 float z=random(600);
  background(x,y,z);
}
void draw() {
  float a=random(800);
  float b=random(400);
  float c= random(200);
  stroke(255);
  if(mousePressed) {
     fill(a,b,c);
     variablerectangle(mouseX,mouseY,pmouseX,pmouseY);
  } else {
    fill(c,b,a);
    variableEllipse(mouseX,mouseY,pmouseX,pmouseY);
  }
  variabletriangle1(mouseX,mouseY,pmouseX,pmouseY);
  variabletriangle(mouseX,mouseY,pmouseX,pmouseY);
}
void variabletriangle(float x, float y, int px, int py) 
{
  float speed = abs(x-px) + abs(y-py);
  stroke(speed);
  triangle(x, y, 0, 550,0,600);
}
void variabletriangle1(float x, float y, int px, int py) 
{
  float speed = abs(x-px) + abs(y-py);
  stroke(speed);
  triangle(x, y, 550, 0,600,0);
}
void variabletriangle2(float x, float y, int px, int py) 
{
  float speed = abs(x-px) + abs(y-py);
  stroke(speed);
  triangle(x, y, 550, 600,0,0);
}
void variabletriangle3(float x, float y, int px, int py) 
{
  float speed = abs(x-px) + abs(y-py);
  stroke(speed);
  triangle(x, y, 0,600,600,0);
}

void variableEllipse(int x, int y, int px, int py) 
{
  float speed = abs(x-px) + abs(y-py);
  stroke(speed);
  ellipse(random(600), random(600),speed,speed);
}
void variablerectangle(int x, int y, int px, int py) 
{
  float speed = abs(x-px) + abs(y-py);
  stroke(speed);
 rect(random(600), random(600), speed, speed);
}

