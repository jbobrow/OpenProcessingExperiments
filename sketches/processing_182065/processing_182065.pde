
size(400,400);
background(255,192,203);
noStroke();
fill(160,82,45);
for(int i=0;i<400;i=i+20)
{
  if(i<200)
  {
    ellipse(i+10,30,19,19);
    ellipse(i+10,80,19,19);
    ellipse(i+10,130,19,19);
  }
  else {
    ellipse(i+10,350,19,19);
    ellipse(i+10,300,19,19);
    ellipse(i+10,250,19,19);
  }
}
fill(255,255,224);
for(int i=0;i<400;i=i+20)
{
  if(i<200)
  {
    triangle(i,30,i+20,30,i+10,60);
    triangle(i,80,i+20,80,i+10,110);
    triangle(i,130,i+20,130,i+10,160);
  }
  else {
    triangle(i,350,i+20,350,i+10,380);
    triangle(i,300,i+20,300,i+10,330);
    triangle(i,250,i+20,250,i+10,280);
  }
}
fill(240,255,240);
for(int i=0;i<400;i=i+20)
{
  if(i<200)
  {
    rect(i,350,20,20);
    rect(i,300,20,20);
    rect(i,250,20,20);
    ellipse(i+10,350,20,20);
    ellipse(i+10,300,20,20);
    ellipse(i+10,300,20,20);
  }
  else {
    rect(i,30,20,20);
    rect(i,80,20,20);
    rect(i,130,20,20);
    ellipse(i+10,30,20,20);
    ellipse(i+10,80,20,20);
    ellipse(i+10,130,20,20);
  }
}
stroke(255,255,224);
strokeWeight(4);
for(int i=0;i<400;i=i+20)
{
  if(i<200)
  {
    line(i+10,370,i+10,378);
    line(i+10,320,i+10,328);
    line(i+10,270,i+10,278);
  }
  else {
    line(i+10,50,i+10,58);
    line(i+10,100,i+10,108);
    line(i+10,150,i+10,158);
  }
}
noStroke();
fill(255,255,255);
ellipse(170,220,80,80);
ellipse(150,260,40,20);
ellipse(170,260,40,30);
ellipse(190,260,40,20);
ellipse(160,280,10,10);
ellipse(185,290,10,10);
ellipse(165,310,10,10);
fill(255,255,224);
triangle(0,200,150,240,150,160);
ellipse(325,200,100,100);
fill(0);
ellipse(310,185,20,25);
ellipse(340,185,20,25);
ellipse(325,225,50,30);
fill(255,255,224);
rect(300,225,50,17);
