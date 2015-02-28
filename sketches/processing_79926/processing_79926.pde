
//Laura R., Magic 8 BAll, CP1, 14-15
String [] answers = {
  "outlook not so good", "don't count on it", "my sources say no", "without a doubt", "reply is hazy, try again", "it is certain", "my reply is no", "as I see it yes", "most likely", "you may rely on it", "cannot predict now", "better not tell you now", "very doubtful", "outlook good", "yes definitely", "concentrate and ask again"
};
boolean mode = false;
void setup()
{
  size(300, 300);
  text("", 40, 40);
  textAlign(CENTER);
  noLoop();
}

void draw()
{
  background(124, 108, 170);
  if (mode == false)
  {    
    fill(0);
    ellipse(150, 150, 150, 150);
    fill(255);
    ellipse(150, 140, 75, 75);
    noFill();
    stroke(0);
    strokeWeight(5);
    ellipse(150, 125, 20, 20);
    ellipse(150, 150, 30, 30);
    fill(255);
    textSize(12);
    text("think of a question... then click the Magic 8 Ball", 150, 250);
  }
  else if (mode == true)
  {
    noStroke();
    fill(230, 7, 234);
    triangle(150, 250, 75, 90, 225, 90);
    fill(255);
    textSize(18);
    text (answers [int(random(16))], 150, 150);
  }
}
void mousePressed ()
{

  {
    mode = !mode;
  }
  redraw();
}



