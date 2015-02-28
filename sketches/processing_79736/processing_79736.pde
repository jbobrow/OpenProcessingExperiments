
//Iam B.
//Computer programming 1, magic 8 ball project.
String[] answers={"Yes.","No.","It's possible.","Nope.","For sure.","Statistically improbable.","True.","Doubtful.","Stay optimistic!","Don't count on it.","That is to be expected.","False.","The logical answer is yes.","Probably not.","It is likely."};
boolean mode=false;
void setup()
{
  size(500, 500);
  textSize(20);
  noLoop();
}
void draw()
{
  int i=int(random(0,15));
  background(167, 241, 255);
  if (mode==false)
  {
    fill(0);
    ellipse(250, 250, 400, 400);
    fill(255);
    ellipse(250, 110, 200, 90);
    noFill();
    strokeWeight(5);
    ellipse(250, 120, 100, 40);
    ellipse(250, 88, 75, 25);
  }
  else
  {
    fill(0);
    ellipse(250, 250, 400, 400);
    fill(82, 20, 193);
    triangle(250, 110, 100, 310, 400, 310);
    fill(255);
    text(answers[i],135,300); 
  }
}
void mouseClicked()
{
  mode =! mode;
  redraw();
}



