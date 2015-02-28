
float circleX=0;
float circleY=0;
float circleX2=400;
float circleY2=400;
void setup() {
  size(400,400);
 
}

void draw(){
  circleX=circleX+3;
  circleY=circleY+3;
  circleX2=circleX2-3;
  circleY2=circleY2-3;
  noStroke();
  fill(random(100,255),random(100,255),random(100,255));
  
  ellipse (circleX2 % width,circleY2-70 % height,50,50);
  ellipse (circleX % width +140,circleY % height,50,50);
  ellipse (circleX2 % width,circleY2-210 % height,50,50);
  ellipse (circleX % width +280,circleY % height,50,50);
  ellipse (circleX2 % width,circleY2-350 % height,50,50);
  
  ellipse (circleX % width,circleY % height,50,50);
  ellipse (circleX2 % width,circleY2 % height+70,50,50);
  ellipse (circleX % width,circleY% height+140 ,50,50);
  ellipse (circleX2 % width,circleY2 % height+210,50,50);
  ellipse (circleX % width,circleY% height+280 ,50,50);
  ellipse (circleX2 % width,circleY2 % height+350,50,50);
  
  
}


