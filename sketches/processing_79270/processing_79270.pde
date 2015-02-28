
//Stephanie Wong mods:14-15 Magic 8 ball
boolean mode=false;
String[] answers={
  "Be not ashamed of mistakes \n and thus make them crimes",
  "Everything has its beauty \n but not everyone sees it.",
  "Forget injuries, never \n forget kindnesses.",
  "It does not matter how \n slowly you go so long as \n you do not stop.",
  "Our greatest glory is \n not in never falling, but in \n getting up every \n time we do.",
  "Respect yourself and \n others will respect you.",
  "When anger rises, think \n of the consequences.",
  "Wheresoever you go, go \n  with all your heart.",
  "To be wronged is nothing \n unless you continue \n to remember it.",
  "Better a diamond with a \n flaw than a pebble without.",
  "Faced with what is right, \n to leave it undone \n shows a lack of courage",
  "When it is obvious that the \n goals cannot be reached, \n don't adjust the goals, \n adjust the action steps.",
  "I want you to be everything \n that's you, deep at the \n center of your being.",
  "Virtue is not left to \n stand alone. He who \n practices it will \n have neighbors.",
  "The cautious seldom err",
};
void setup()
{
  size(400, 400);
  noLoop();
}
void draw()
{
  background(17, 240, 171);
  if (mode==true)
  {
    fill(0);
    ellipse(200, 200, 270, 270);
     fill(150, 17, 247);
    triangle(80,150,329,150,205,300);
    fill(255);
    textSize(15);
    text(answers[int(random(15))],150,170);
   
  }
  else
  {
    fill(0);
    ellipse(200, 200, 270, 270);
    fill(255);
    ellipse(200, 200, 130, 130);
    noFill();
    stroke(2);
    ellipse(200, 190, 50, 30);
    ellipse(200, 217, 50, 30);
  }
}
void mouseClicked()
{
  mode=!mode;
  redraw();
}
