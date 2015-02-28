
void setup()
{
  
  fill(0,255,0);
  size(400,400);
smooth();
textFont(createFont("SansSerif",13));
textAlign(LEFT);
}
  void draw()
 
{
fill(0);
text("Click keys to draw shapes. Click mouse button to restart", 
width/8, height/18);
text("L=line, E=circle(ellipse), R=rectangle. You can only draw lines first"
,width/32,height/11);

if(mousePressed)
{

  fill(random(0,255),random(0,255),random(0,255));
   rect(0,0,400,400);
} 
else 
{ fill(255); }
   fill(random(0,255),random(0,255),random(0,255));
  strokeWeight(3);
if(keyPressed)
{if(key == 'l' || key == 'L' );
{
  line (pmouseX, pmouseY, mouseX, mouseY); }

if(keyPressed)
  { if(key == 'r' || key == 'R')
  {noStroke();
  rect(mouseX,mouseY,20,20); } }
else
noStroke();
line(pmouseX,pmouseY,mouseX,mouseY); 


if(keyPressed)
{
  if(key == 'e' || key == 'E')
  {noStroke();
  ellipse(mouseX+10,mouseY+10,30,30);  }
}  else
line(pmouseX,pmouseY,mouseX,mouseY); 

}
}


