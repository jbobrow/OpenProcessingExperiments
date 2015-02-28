
//Homework 3
//Copyright William Aldrich, Pittsburgh, PA, September 5

float x,y,wd,ht;

void setup()
{
  size(400,400);
  x = 0;
  smooth();
}

void draw()
{
  stroke(0,random(255),0);
  strokeWeight(5);
  if (mousePressed){
    //background(0,0,0);
    x = 0;
    fill(random(255),random(255),random(255));
  }
  else{
    //background(x,0,0);
    x = x+.5;
  }
  ellipse(mouseX,mouseY,30,30);
  ellipse(mouseY,mouseX,30,30);
  ellipse(mouseX,mouseX,30,30);
  ellipse(mouseY,mouseY,30,30);
}


