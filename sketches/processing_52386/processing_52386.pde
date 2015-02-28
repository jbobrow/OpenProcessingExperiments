
int circleX = 0;
int circleY = 0;
int sqX = 0;
int sqY = 0;

void setup(){
  size (600,600); 
  background(255,0,51);
  ellipseMode (CENTER);
}

void draw (){
  noStroke();
  fill (circleX/5, circleY/2, circleX-100);
  ellipse (width/2, height/2, circleX, circleY);
  if (circleX>900){
    circleX=0;
  }
 if (circleY>900){
    circleY=0;
  }
  noStroke();
  fill (sqX+10, sqY-10, circleX-100);
  rect (0, height/2, sqX, sqY);
  if (sqX >600){
    sqX=0;
  }
circleX = circleX+1;
circleY = circleY+1;
sqX = sqX+1;
sqY = sqY+1;
}
  

