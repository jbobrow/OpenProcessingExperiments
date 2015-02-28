
int circleX = 100;
int circleY = 100;

void setup () {
  size (1800,1200);
}
float x = 0;


void draw () {
  background (0);
  fill(255);
  ellipse(circleX,circleY,200,200);
  fill(97, 123, 247);
  ellipse(circleX, circleY-100, 20,20);
  fill(227, 113, 41);
  ellipse(circleX+600, circleY+500, 20,20);
  ellipse(circleX-50, circleY*2, 20,20);
  ellipse(circleX-40, circleY-50, 20,20);
  ellipse(circleX-60, circleY-40, 20,20);
  ellipse(circleX-30, circleY+50, 20,20);
  fill(13, 278, 30);
  ellipse(circleX+200, circleY-100, 20,20);
  ellipse(circleX+250, circleY-150, 20,20);
  ellipse(circleX+30, circleY+10, 20,20);
  fill(173, 16, 152);
  ellipse(circleX+20, circleY+350, 20,20);
  ellipse(circleX-20, circleY+250, 20,20);
  ellipse(circleX-70, circleY+100, 20,20);
  ellipse(circleX+50, circleY+200, 20,20);
  
  circleY = circleY + 2;
  circleX = circleX + 3;
}




                
                
