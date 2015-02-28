
//Circling Around By Jimmy Lin
//09/10/10

void setup()
{
  noStroke();
  background(255,255,255);
  size(500,500);
}

void draw()
{
  mousePressed();
  fill(255,2);
  rect(0,0,width,height);
  fill(mouseX+50,mouseY+120,255);
  ellipse(mouseX,mouseY,random(30),random(30));

 
  if(mousePressed)
  {
    fill(pmouseX,pmouseY,50);
    ellipse(pmouseX,pmouseY,random(20),random(20));
  }
}


