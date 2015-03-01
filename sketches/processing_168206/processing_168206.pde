
void setup()
{
  size(500,500);
  background(0);
  translate(250,250);
  ellipseMode(CENTER);
  rectMode(CENTER);
  noStroke();
   
  fill(255);
  ellipse(0,0,490,490);
  
  fill(100);
  ellipse(0,0,460,460);
 
}

void draw()
{
 translate(width/2,height/2);
  
  rotate(radians(second()*20));
  pushMatrix();
  fill(255);
  rect(-80,-50,20,120);
  rect(-120,-50,20,120);
  rect(-160,-50,20,120);
  popMatrix();
  
  rotate(radians(second()*20));
  fill(0);
  rect(-80,-50,20,120);
  rect(-120,-50,20,120);
  rect(-160,-50,20,120);
  
}
