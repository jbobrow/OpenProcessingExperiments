
//AlanC Magic8Ball
int num = int(random(55));
boolean mode = false;
 
void setup()
{
  size(400, 400);
  background(15,105,160);
  noLoop();
}
 
void draw()
{
  String[] answers = {"NO", "YES", "MAYBE", "WITHOUT A DOUBT", "HELL NO!!", "I DONT KNOW", "AS IS SEE IT YES", "MOST LIKELY", "PROBABLY NO", "CANNOT TELL YOU NOW", "VERY DOUBTFUL", "HELL YEAH", "ASK AGAIN"};
  if (mode == true)
  {
    fill(0);
    ellipse(200, 200, 350, 350);
    fill(255);
    textSize(15);
    textAlign(CENTER);
    text(answers[int(random(0,12))],200,200);
    num = int(random(55));
  }
  else
  {
    noStroke();
    fill(0);
    ellipse(200, 200, 370, 370);
    fill(255);
    ellipse(200, 200, 200, 200);
    stroke(0);
    strokeWeight(10);
    ellipse(200, 150, 80, 60);
    ellipse (200, 225, 120, 90);
  }
}
 
void mousePressed()
{
  mode = !mode;
  redraw();
}
