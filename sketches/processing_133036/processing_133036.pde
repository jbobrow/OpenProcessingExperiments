
void setup()
{
  size(500,500);
  smooth();
  background(255);
  noFill();
  
  int dotinthemiddleX = 250;
  int dotinthemiddleY = 250;
  int circleradius = 200;
  int width = 200;
  int height = 90;
}

void draw()
{
  int dotinthemiddleX = 250;
  int dotinthemiddleY = 250;
  int circleradius = 200;
  ellipse(dotinthemiddleX,dotinthemiddleY,circleradius, circleradius);   
  ellipse(dotinthemiddleX,dotinthemiddleY,circleradius/4,circleradius/4);
  ellipse(dotinthemiddleX,dotinthemiddleY - 90,circleradius/20,circleradius/20);

  int width = 200;
  int height = 90;
  ellipse(dotinthemiddleX,dotinthemiddleY,width,height);

  translate(dotinthemiddleX,dotinthemiddleY);
  rotate(PI/3);
  ellipse(0,0,width,height);
  
  rotate(PI/3);
  ellipse(0,0,width,height);

}

