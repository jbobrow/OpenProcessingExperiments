
int num = int(random(55));
boolean mode = false;

void setup()
{
  size(400, 400);
  background(255);
  noLoop();
}

void draw()
{
  String[] answers = {"Outlook not So Good", "Don't Count On It", "My Sources Say No", "Without A Doubt", "Reply Hazy, Try Again", "It Is Certain", "My Reply Is No", "As I See It Yes", "Most likely", "You May Rely On It", "Cannot Predict Now", "Better Not Tell You Now", "Very Doubtful", "Outlook Good", "Yes Definitely", "Concentrate and Ask Again"};
  if (mode == true)
  {
    fill(0);
    ellipse(200, 200, 350, 350);
    fill(255);
    textSize(35);
    textAlign(CENTER);
    text(answers[int(random(0,15))],200,200);
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
    strokeWeight(4);
    ellipse(200, 150, 80, 60);
    ellipse (200, 225, 120, 90);
  }
}

void mousePressed()
{
  mode = !mode;
  redraw();
}
