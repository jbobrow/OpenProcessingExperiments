
//String lines[]=loadStrings("magic.txt");
boolean answer=true;
int a=0;
int b=0;
int c=0;
int x=0;
int y=0;
void setup()
{
  //  println("there are " +lines.length + " lines");
  size(400, 400);
  background(255);
}
void draw()
{

  stroke(0);
  fill(0);
  ellipse(200, 175, 300, 300);

  a= int(random(255));
  b= int(random(255));
  c= int(random(255));
  fill(a, b, c);
  textSize(40);
  text("Magic 8 ball", 85, 375);
  if (answer==false)
  {

    while (y<1)
    {
      y=y+1;
      x=int(random(1, 6));
    }
    
    fill(255);
    triangle(200, 300, 305, 150, 95, 150);
    fill(255);
    
    fill(0);
    
    if (x==1)
    {
      textSize(15);
      text("Dont EVER Ask", 150, 190);
      text("That Again" , 164,210);
    }
    else if (x==2)
    {
      textSize(14);
      text("I Would Rather Die ", 140, 180);
      text("Than Answer That" ,140,196);
    }
    else if (x==3)
    {
      textSize(15);
      text("I Suppose", 165, 200);
    }
    else if (x==4)
    {
      textSize(15);
      text("I Am Sure Of It", 150, 200);
    }
    else if (x==5)
    {
      textSize(15);
      text("Answer Unclear", 150, 180);
      text(" Try Again NEVER",139,198);
    }
    textSize(17);
    fill(255);
    text("Rightclick The Mouse To Reset", 90, 120);
  }

  if (answer==true)
  {
    noFill();
    strokeWeight(15);
    stroke(255);
    ellipse(200, 110, 95, 100);
    ellipse(200, 210, 95, 100);
    textSize(14);
    fill(255);
    text("think of a question then", 126, 285);
    text("leftclick the mouse", 140, 300);
  }
}

void mousePressed()
{

  if (mouseButton==LEFT)
  {
    answer=false;
    y=0;
  }
  else if (mouseButton==RIGHT)
  {
    answer=true;
  }
}
