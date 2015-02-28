
void setup (){
  size(600,600);
int r = 500;
int y = 0;
while(y<600)
{
  stroke(r,90,255);
  line(0,y,600,y);
  y= y + 1;
  r = r - 1;
}

  frameRate(50);
}

void draw(){
 fill(300,20,100);
 int r = 500;
int y = 0;
while(y<600)
{
  stroke(r,90,255);
  line(0,y,600,y);
  y= y + 1;
  r = r - 1;
}

 noStroke();
 triangle(mouseX+50,mouseY+50, 58, 500,mouseX+175,mouseY+225);
fill(50,200,225);
 noStroke();
 triangle(75, 400,mouseX+50,mouseY+50, 430, 575); 
 fill(0,200,100);
 noStroke();
 triangle(mouseX+200,mouseY+200, 200, 50,mouseX+50,mouseY+50);
}
