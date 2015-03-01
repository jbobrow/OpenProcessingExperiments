
float r;
float g;
float b;

void setup()
{
  size(300,300);
  background(255);
}

void draw()
{
  fill(#FF056E);
  rect(0,0,30,30);
  fill(#6005FF);
  rect(30,0,30,30);
  fill(#05FF07);
  rect(60,0,30,30);
  fill(#FFDA05);
  rect(90,0,30,30);
  fill(#F50004);
  rect(120,0,30,30);
  fill(#BC1B7C);
  rect(150,0,30,30);
  fill(#00F5D2);
  rect(180,0,30,30);
  fill(#000000);
  rect(210,0,30,30);
  fill(r,g,b);
  rect(240,0,30,30);
  
  r= random(255);
  g= random(255);
  b= random(255);
  
  if(mousePressed)
  {
    line(pmouseX,pmouseY,mouseX,mouseY);
    
    if(mouseX<30 && mouseX>0 && mouseY<30)
    {
      strokeWeight(3);
      stroke(#FF056E);
    }
    if(mouseX<60 && mouseX>30 && mouseY<30)
    {
      strokeWeight(3);
      stroke(#6005FF);
    }
    if(mouseX<90 && mouseX>60 && mouseY<30)
    {
      strokeWeight(3);
      stroke(#05FF07);
    }
    if(mouseX<120 && mouseX>90 && mouseY<30)
    {
      strokeWeight(3);
      stroke(#FFDA05);
    }
    if(mouseX<150 && mouseX>120 && mouseY<30)
    {
      strokeWeight(3);
      stroke(#F50004);
    }
    if(mouseX<180 && mouseX>150 && mouseY<30)
    {
      strokeWeight(3);
      stroke(#BC1B7C);
    }
    if(mouseX<210 && mouseX>180 && mouseY<30)
    {
      strokeWeight(3);
      stroke(#00F5D2);
    }
    if(mouseX<240 && mouseX>210 && mouseY<30)
    {
      strokeWeight(3);
      stroke(#000000);
    }
    if(mouseX<270 && mouseX>240 && mouseY<30)
    {
      strokeWeight(3);
      stroke(r,g,b);
    }
  }
}
