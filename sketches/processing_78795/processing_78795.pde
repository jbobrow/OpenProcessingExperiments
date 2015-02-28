
//Michelle Z, CP1 4-5, Magic Eight Ball

int num = int(random(55));
boolean mode = false;

void setup()
{
  size(400, 400);
  background(0, 255, 255);
  smooth();
  noLoop();
}

void draw()
{
  String answers [] = loadStrings("answers.txt");
  if (mode == true)
  {
    fill(0);
    ellipse(200, 200, 390, 390);
    fill(255);
    triangle(100, 50, 300, 50, 200, 125);
    textSize(25);
    textAlign(CENTER);
    text(answers[num], 50, 175, 300, 200);
    num = int(random(55));
  }
  else
  {
    noStroke();
    fill(0);
    ellipse(200, 200, 390, 390);
    fill(255);
    ellipse(200, 60, 175, 90);
    stroke(0);
    strokeWeight(10);
    noFill();
    ellipse(200, 40, 50, 25);
    ellipse(200, 72, 75, 40);
    strokeWeight(1);
  }
}

void mousePressed()
{
  mode = !mode;
  redraw();
}


