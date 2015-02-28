
//Justin L., EightBall, Mods 16/17 CP1

void setup()
{
  size(500, 500);
  noLoop();
  textAlign(CENTER);
}

void draw()
{
  background(255);
  ballAnimation();
}
boolean fortune = false;
void ballAnimation()
{
  String[] answers = {
    "ehhh....Not too sure about that", "don't look too good, know waht i mean?", "my sources say no", "sure, why not", "Only if the Gods are with you", "lol idk", "my reply is no", "it is as stated in the prophecy", "Most likely", "you may rely on it", "well what do you think", "think about it.", "Uh, yeah. I don't really care.", "LOL", "I quit", "I'm on break don't bother me", "does it look like I know the answer?"
  };
  if (fortune == true)
  {
    println("t");
    int i = int(random(answers.length));
    //Black Portion of the 8 Ball
    fill(0);
    ellipse(250, 250-30, 300, 300);
    smooth();
    fill(44, 55, 66);
    ellipse(250, 155-30, 135, 75);
    fill(255);
    textSize(10);
    stroke(44, 55, 66);
    text(answers[i], 250, 250);
  }
  else
  {
    println("f");
    //Black Portion of the 8 Ball
    fill(0);
    ellipse(250, 250-30, 300, 300);
    smooth();
    //White Portion of the 8 Ball
    fill(255);
    ellipse(250, 155-30, 135, 75);
    //number 8
    ellipse(250, 140-30, 45, 30);
    ellipse(250, 170-30, 60, 40);
    stroke(254, 56, 82);
    fill(40,50,60);
    textSize(15);
    text("Think of a yes/no question and then click on the ball for an answer", 250, 450);
  }
}
void mouseClicked()
{
  fortune = !fortune;
  redraw();
}
