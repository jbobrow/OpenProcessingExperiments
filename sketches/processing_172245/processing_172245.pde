
int count;
 
void setup() 
{ 
  background(214,255,252);
  size(700, 300);
  
  rectMode(CENTER);
  int count = 10;
}
 
void draw() 
{
  //background(214,255,252);
  stroke(0, random(255), random(255), 30);
  noFill();
  
  count += 2;
if(count == 100)
  {
  count= 10;
  }
  
  
  if(mousePressed == true) 
  { 
    stroke(0, random(255), random(255), 80);
    ellipse(mouseX, mouseY, count, count);  
  }
  else 
  {
    rect(mouseX, mouseY, count, count);    
  }
}
