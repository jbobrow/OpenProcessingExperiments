
size(800,400);
background(255,157,6);
int a=10;
int b=20;
int x=800;
if ((a>5) && (b<30))
{
  noFill();
  ellipse(400,200,100,100);
  fill(0);
  ellipse(400,200,90,90);
  rect(500,150,20,100);
  triangle(520,150,530,200,520,250);
  strokeWeight(3);
  stroke(250);
  line(507,225,510,180);
 fill(250);
  strokeWeight(1);
  ellipse(520,222,4,4);
  line(520,222,0,222);
  ellipse(520,214,4,4);
  line(520,214,0,214);
  ellipse(520,206,4,4);
  line(520,206,0,206);
  ellipse(520,198,4,4);
  line(520,198,0,198);
  ellipse(520,190,4,4);
  line(520,190,0,190);
  ellipse(520,182,4,4);
  line(520,182,0,182);
}
else
{
  noFill();
  ellipse(x-400,200,100,100);
  fill(0);
  ellipse(x-400,200,90,90);
  rect(x-500,150,-20,100);
  triangle(x-520,150,x-530,200,x-520,250);
  strokeWeight(3);
  stroke(250);
  line(x-507,225,x-510,180);
 fill(250);
  strokeWeight(1);
  ellipse(x-520,222,4,4);
  line(x-520,222,x,222);
  ellipse(x-520,214,4,4);
  line(x-520,214,x,214);
  ellipse(x-520,206,4,4);
  line(x-520,206,x,206);
  ellipse(x-520,198,4,4);
  line(x-520,198,x,198);
  ellipse(x-520,190,4,4);
  line(x-520,190,x,190);
  ellipse(x-520,182,4,4);
  line(x-520,182,x,182);
}
