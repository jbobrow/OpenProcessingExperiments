
int a=0;
int b=0;
int c=0;
int x=0;
int var=0;
boolean click=false;
 
void setup()
{
  size(500, 500);
}
void draw()
{
  if (click==false)
  {
    background(255);
    eight();
    textAlign(CENTER);
    fill(a, b, c);
    textSize(26);
    text("Magic 8", 250, 465);
    textSize(16);
    text("Ask a question and left click the mouse", 250, 485);
    a=int (random(256));
    b=int (random(256));
    c=int (random(256));
  }
  if (click==true)
  {
    background(255);
    answer();
    textAlign(CENTER);
    fill(a, b, c);
    textSize(26);
    text("Right Click to Return to the Eight", 250, 475);
    a=int (random(256));
    b=int (random(256));
    c=int (random(256));
  }
}
void eight()
{
  strokeWeight(3);
  stroke(0);
  fill(0);
  ellipse(250, 200, 300, 300);
  //eight bg
  stroke(255);
  fill(255);
  ellipse(250, 110, 150, 100);
  //eight
  stroke(0);
  fill(255);
  ellipse(250, 80, 75, 25);
  ellipse(250, 110, 100, 50);
}
void answer()
{
  strokeWeight(3);
  stroke(0);
  fill(0);
  ellipse(250, 200, 300, 300);
  stroke(60, 90, 170);
  fill(60, 90, 170);
  triangle(150, 140, 350, 140, 250, 300);
  while(var<1)
  {
    var++;
    x=int(random(0, 17));
  }
  fill(0,0,0,125);
  textSize(11);
  if (x==0)
  {
    textAlign(CENTER);
    text("you will never know :)", 250, 185);
    }
  if (x==1)
  {
    textAlign(CENTER);
    text("outcome not so good", 250, 185);
    }
    if (x==2)
    {
      textAlign(CENTER);
      text("don't count on it", 250, 185);
      }
 
    if (x==3)
    {
      textAlign(CENTER);
      text("my sources say no!", 250, 185);
      } 
      if (x==4)
      {
        textAlign(CENTER);
      text("without a doubt", 250, 185);
      } 
    if (x==5)
    {
      textAlign(CENTER);
      text("reply hazy, try again", 250, 185);
      } 
      if (x==6)
      {
        textAlign(CENTER);
      text("it is certain", 250, 185);
      } 
    if (x==7)
    {
      textAlign(CENTER);
      text("my reply is no", 250, 185);
      } 
      if (x==8)
      {
        textAlign(CENTER);
      text("as I see it yes", 250, 185);
      } 
    if (x==9)
    {
      textAlign(CENTER);
      text("most likely", 250, 185);
      }
      if (x==10)
      {
        textAlign(CENTER);
      text("you may rely on it", 250, 185);
      }   
    if (x==11)
    {
      textAlign(CENTER);
      text("cannot predict now", 250, 185);
      }
      if (x==12)
      {
        textAlign(CENTER);
      text("better not tell you now", 250, 185);
      }   
    if (x==13)
    {
      textAlign(CENTER);
      text("very doubtful", 250, 185);
      }   
      if (x==14)
      {
        textAlign(CENTER);
      text("outlook good", 250, 185);
      }   
    if (x==15)
    {
      textAlign(CENTER);
      text("yes definitely", 250, 185);
      }   
      if (x==16)
      {
        textAlign(CENTER);
      text("concentrate and ask again", 250, 185);
      }
  }
  void mousePressed()
  {
    if (mouseButton==LEFT)
    {
      click=true;
      var=0;
    }
    else if (mouseButton==RIGHT)
    {
      click=false;
    }
  }
