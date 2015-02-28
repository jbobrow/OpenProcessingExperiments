
 float x,y,wd,ht,easingCoefficient;

void setup()
{
  size(400,400);
  background(175,206,255);
  x=width/2;
  y=height/2;
  wd=random(10,400);
  ht=random(10,400);
   
  easingCoefficient=.1;
   
  frameRate(35);
  smooth();
  fill(200,0,0);
}
 
void draw()
{
  fill(175,206,255,10);
  rect(0,0,400,400);

 
   
  noStroke();
  fill(22,random(20),random(250),80);
  ellipse(mouseX,mouseY,random(10,70),random(50,70));
  strokeWeight(1.5);
  stroke(255,255,255);
  line(mouseX,mouseY,random(0,400),random(0,400));
   
  
 // fill(255,255,255);
  //rect(mouseX,mouseY,10,10);
   
  //stroke(43,92,134);
  //line(mouseX,mouseY);
   
  if(keyPressed) saveFrame("HW3_processing");
}



