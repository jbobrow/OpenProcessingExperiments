
size(500,500);
background(173,216,230);
ellipseMode(CENTER);
for (float i=31.25; i<500; i=i+62.5)
{
 if(i<437.5)
 {
  ellipse(i,70,25,25);
 }
 else {
 ellipse(i,55,25,25);  
 }
}
for (float y=67.5; y<500; y += 2.5)
  {
  if(y<82.5)
  {
    stroke(255);
    line(437.5, y, 468.75, y);
  }
  if(y>82.5)
  if(y<200)
  {
    stroke(0);
    line(31.25, y, 468.75, y);
  }
  if(y>200)
  if(y<317.5)
  {
    stroke(255);
    line(31.25+62.5,y,468.75-62.5,y);
  }
  if(y>317.5)
  if(y<435)
  {
    stroke(0);
    line(31.25+(62.5*2),y,468.75-(62.5*2),y);
  }
  if(y>435)
  {
    stroke(255);
    line(31.25+(62.5*3),y,468.75-(62.5*3),y);
  }}
