
boolean mode=false;
String magic[]={"Yea", "Maybe", "You Wish", "If You're a unicorn", "When Cows Fly","Of Course","HUEHUEHUE","Definitely","Never","Probably", "Ask Something Else","Ask Truong","Go Away","Guaranteed"};
void setup()
{
  size(500, 500);
  noLoop();
}
void draw() 
{
  background(61, 156, 156);
  if (mode==true)
  {
    fill(0);
    ellipse(250,250,300,300);
    fill(255);
    triangle(175,170,325,170,250,225);
    fill(255);
    textSize(30);
    textAlign(CENTER);
    int choice=int(random(magic.length));
    text(magic[choice],250,300);
  }
else
{
  fill(0);
  ellipse(250, 250, 300, 300);
  fill(255);
  ellipse(250, 150, 125, 75);
  noFill();
  ellipse(250, 135, 53, 20);
  ellipse(250, 160, 75, 30);
}
}
void mouseClicked()
{
  
    mode=!mode;
    redraw();
}
