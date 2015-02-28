
//Hanson T. Magic 8 Ball CP1 16/17
boolean mode = true;
String[] answers;
PImage eightBall;
int x;
void setup()
{
  background(213);
  size(300,300);
  noLoop();
  eightBall = loadImage("magic8ball.jpg");
  answers = loadStrings("Replies.txt");
}
void draw() 
{
  if (mode) 
  {
    image(eightBall, 0, 0, 300, 300);
    fill(0,255,0);
    textAlign(CENTER);
    textSize(25);
    text("click on Me!", 60, 140, 180, 300);
  }
  else 
  {
    image(eightBall, 0, 0, 300, 300);
    fill(250,0,0);
    textSize(25);
    textAlign(CENTER);
    text(answers[x], 60, 140, 180, 300);
  }
}
 
void mousePressed() 
{
  mode = !mode;
  redraw();
  x = int(random(answers.length));
}



