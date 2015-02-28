
size(200, 200);
background(0);
for (int x=60; x<140; x=x+25)
{
  fill(255, 140, 70, 88);
  ellipse(x, 50, 50, 50);
}                     //*ellipses.sequenciais.grandes

for (int a=-100; a<180; a=a+5)
{
  fill(255);
  ellipse(a+100, a*a/100+100, 2, 2);
}
