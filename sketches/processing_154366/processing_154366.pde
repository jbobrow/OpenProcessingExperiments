
//Agustey Mongia
//copyright notice

float x=0;
float y=0;
float easing_value = 0.05;

void setup()
{
  size(400, 400);
  rectMode(CENTER);
  
};

void draw()
{
  background(0);
  float wd=width*.5;
  float ht=height*.5;
  float dx=mouseX-x;
  float dy=mouseY-y;
  float xnew=x+(dx*easing_value);
  float ynew=y+(dy*easing_value);
  fill(0, 0, 100);
  rect(xnew, ynew, wd*.6, ht*.6);
  fill(255, 255, 255);
  ellipse(xnew, ynew, wd*.6, ht*.6);
  fill(0, 0, 150);
  ellipse(xnew, ynew, wd*.55, ht*.55);
  fill(255, 255, 255);
  ellipse(xnew, ynew, wd*.5, ht*.5);
  fill(0, 0, 200);
  ellipse(xnew, ynew, wd*.45, ht*.45);
  fill(255, 255, 255);
  ellipse(xnew, ynew, wd*.4, ht*.4);
  fill(0, 0, 255);
  ellipse(xnew, ynew, wd*.35, ht*.35);
  fill(255, 255, 255);
  ellipse(xnew, ynew, wd*.3, ht*.3);
  fill(100, 0, 60);
  ellipse(xnew, ynew, wd*.05, ht*.05);
  x=xnew;
  y=ynew;
};


