
//Sarah C, CP1 16/17, Magic 8 Ball

  boolean mode; 
  String [] answers = {
    "I doubt it", "definitely not", "you don't wanna know", "I guess so", "Of course!", "better believe it!", "ask me some other time", "meh", "most likely", "yes", "sure", "i'm not sure yet", "ask someone who knows"
  };
void setup()
{
  size(500, 500);
  background(27, 242, 172);
  mode = false;
  noLoop(); 
  smooth();
}

void draw()
{
  int i = int(random(0, 13));
  fill(0);
  ellipse(250, 230, 380, 380); //ball body
  if (mode == false)
  {   
    fill(255);
    ellipse(250, 110, 170, 100); //white part w/ 8
    noFill();
    stroke(0);
    ellipse(250, 80, 50, 30);
    ellipse(250, 120, 70, 50);
    textSize(16);
    textAlign(CENTER);
    text("Ask a yes/no question,",250,300);
    text("concentrate..and click!",250,320);
  }
  if (mode == true) //answers in triangle
  {
    fill(200, 52, 255);
    triangle(150, 150, 350, 150, 250, 260);
    fill(255);
    textSize(12);
    text(answers[i], 250, 200);
    textSize(30);
    text("Not satisfied? Try again!",250,300);
  }
}

void mouseClicked()
{
  mode = !mode;
  redraw();
}



