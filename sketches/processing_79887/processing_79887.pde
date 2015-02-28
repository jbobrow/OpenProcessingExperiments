
//Keana M., CP1, mods 4-5, Magic 8 Ball

boolean mode = true;
String[] answers = {"     yes","     no","  maybe","    yes\ndefinitely", "most likely", "  ask me\nagain later", "as I see it,\n    yes","it is certain", " the future\nlooks bright", "absolutely", " without\n a doubt"};
void setup()
{
  noLoop();
  size(500,500);
  frameRate(5);
}
void draw()
{
  background(255,255,255);
  if (mode == true)
  {
    stroke(0,0,0);
    fill(0,0,0);
    ellipse(250,250,250,250);
    fill(255,255,255);
    ellipse(250,250,100,100);
    noFill();
    strokeWeight(5);
    ellipse(250,230,30,30);
    ellipse(250,260,30,30);
  }
  else
  {
    stroke(0,0,0);
    fill(0,0,0);
    ellipse(250,250,250,250);
    fill(153,50,204);
    triangle(180,220,320,220,250,320);
    fill(255,255,255);
    int r = int(random(answers.length));
    strokeWeight(5);
    textSize(20);
    text(answers[r],210,250);
  }
}
void mouseClicked()
{
  mode = !mode;
  redraw();
  
}
