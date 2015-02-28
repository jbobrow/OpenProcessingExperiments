
String[] answers = {"The answer to the previous question is yes" , "The answer to the previous question is no" , "Yes", "No", "Never", "Maybe","Go to Nigel Z's WIggle Wiggle", "The answer is Mordekaiser", "Rice is the answer", "It is VERY certain", "Try again",
"Ask the question again","The answer is what you thought it to be", "Hue Hue Hue\n Ask again","Hue Hue Hue Hue Hue\nAsk again","GG IDK", "Maybe if you ask google you wouldn't be asking me","Learn Chemistry", "Always", " It has been yes from the beginning", "It has been no from the beginning",
"I am sure that it is true", " I am sure that it is false", "Ask again", "Click again", "Please don't ask that"};

boolean mode = false;
void setup()
{
  size(600, 600);
  noLoop();
}
void draw()
{
  background(255);

  if (mode == true)
  {
    fill(random(255), random(255), random(255));
    ellipse(300, 300, 300, 300);
    textAlign(CENTER);
    fill(255);
    text(answers[int(random(answers.length))] , 300, 300);
  }
  else
  {
    fill(0);
    ellipse(300, 300, 300, 300);
  }
}

void mousePressed()
{
  if (mouseX > 25 && mouseX > 75 && mouseY > 25 && mouseY < 75) {
  
  }
  redraw();
    mode =!mode;
}



