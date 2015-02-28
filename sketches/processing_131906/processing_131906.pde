
size(400,400);
background(202,225,255);

int a = 199;
int b = 201;

if ((a > 200)||(b < 200))
{
  ellipse(200,200,200,200);
}
else
{
  noStroke();
  fill(205,50,120);
  ellipse(200,180,180,180);
  strokeWeight(6);
  noFill();
  stroke(255);
  ellipse(200,180,150,150);
  noStroke();
  fill(205,50,120);
  quad(205,100,205,175,289,175,249,110);
}

if ((a<200)&&(b>200))
{
  strokeWeight(6);
  stroke(255);
  strokeCap(SQUARE);
  line(276,177,220,177);
  line(200,220,200,130);
  line(197,220,220,220);
}
else
{
  rect(12,30,40,309);
}

if((a<200)||(b<200))
{
  noStroke();
  fill(255);
  ellipse(170,145,25,25);
}

