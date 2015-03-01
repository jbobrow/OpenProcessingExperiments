
boolean b= false;
float x,y,a,d,r,g,p;

void setup()
{
  size(400,400);
  background(0);
}
void draw()
{
  if(b==true)
  {
    fill(#10DE25);
  ellipse(100,100,100,100);
  fill(#DE1A10);
  ellipse(280,280,100,100);
}
else
{
  frameRate(10);
  fill(r,g,p);
    ellipse(x,y,a,d);
    x= random(width);
    y= random(height);
    a= random(15,70);
    d= random(15,70);
    r= random(150);
    g= random(200);
    p= random(255);
}
 fill(#D407F0);
  stroke(255);
  rect(150,330,100,70);
}
void mousePressed()
{
  if(mouseX>150 && mouseX<250 && mouseY>330 && mouseY<400);
  {
    b = !b;
    background(0);
    fill(#D407F0);
    rect(150,330,100,70);
  }
}
