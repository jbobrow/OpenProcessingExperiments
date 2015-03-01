
//Jack Lance jlance
//Copyright
void setup(){
  size(400,400);
  
}
void draw()
{
  background(255);
  float x=mouseX;
  float y=mouseY;
  float h=height*.1 + mouseY*.2;
  float w=width*.1 + mouseX*.2;
  fill(30,160,59);
  ellipse(x,y,w*3,h*4);
  fill(1,40,198);
  ellipse(x,y,w*2,h*2);
  fill(150,50,75);
  rectMode(CENTER);
  rect(x,y,w,h);
  strokeWeight(10);
  stroke(200,0,0);
  point(x,y);
  strokeWeight(1);
}














