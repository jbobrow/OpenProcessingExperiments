
//Eric T. Computer Programming 1 Mods 4-5
boolean mode=false;
String words[]={"yes","no","I think yes","sure","i don't know", "you tell me", "stop asking me", "go away","stop talking to me","I'm hella hungry","of course not","come back later"};
void setup()
{
  size(400,400);
  noLoop();
  frameRate(15);
}
void draw()
{
  int i = int(random(0,12));
  background(63,111,60);
  fill(0);
  ellipse(200,200,300,300);
  fill(255);
  ellipse(200,105,150,110);
  stroke(0);
  strokeWeight(5);
  ellipse(200,75,50,30);
  ellipse(200,75+40,70,50);
  if(mode==true)
  {
    stroke(0);
    textAlign(CENTER);
    textSize(25);
    text(words[i], 200,240);
  }
  else if(mode==false)
  {
    textAlign(CENTER);
    textSize(15);
    text("ask a yes/no question, then click",200,230);
  }
}
void mouseClicked()
{
  mode=!mode;
  redraw();
}
