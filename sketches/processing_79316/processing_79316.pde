
//Dominique A., Eight Ball, CP1, Mod 16-17

boolean mode = false;
String[] answers = {"For sure", "If you say so", "Do you believe it?", "Think carefully and try again", "No one said anything was going to happen", "Yep", "Nope", "Erm...come back in 20 minutes and try again", "Yep yep yep", "Some good luck will come your way", "Crazy ideas there"};
void setup()
{
  size(400,400);
  smooth();
  noLoop();
}
void draw()
{
  background(96,127,237);
  if(mode == true)
  {
    fill(0);
    ellipse(200,200,350,350);
    fill(225);
    ellipse(200,100,150,100);
    noFill();
    stroke(0);
    strokeWeight(5);
    ellipse(200,150,150,150);
    stroke(225);
    ellipse(200,200,30,35);
    ellipse(200,250,50,60);
    fill(66,76,250);
    triangle(150,125,200,85,250,125);
    fill(3,232,255);
    textSize(18);
    textAlign(CENTER);
    text(answers[(int(random(0,11)))],200,200);
  }
  else
  {
    fill(0);
    ellipse(200,200,350,350);
    fill(225);
    ellipse(200,100,150,100);
    noFill();
    stroke(0);
    strokeWeight(5);
    ellipse(200,150,150,150);
    stroke(225);
    ellipse(200,200,30,35);
    ellipse(200,250,50,60);
    fill(66,76,250);
    triangle(150,125,200,85,250,125);
  }
}
void mouseClicked()
{
  mode = !mode;
  redraw();
}
