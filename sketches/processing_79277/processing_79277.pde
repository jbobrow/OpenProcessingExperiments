
String [] answers = 
{
  "Eat some oranges", 
  "Don't count on it", 
  "My sources say no ", 
  "Without a doubt ", 
  "Maybe ", 
  "It is certain ", 
  "My reply is no ", 
  "As I see it, yes ", 
  "Most likely ", 
  "You may rely on it ", 
  "It will happen if you believe", 
  "Trololololol ", 
  "Very doubtful ", 
  "Outlook good  ", 
  "Yes definitely ", 
  "If you try harder"
};
boolean magic = false ;
void setup()
{
  size(250, 250);
  background(200, 150, 0);
  noLoop();
  smooth();
}
void draw()
{

  if (magic == true)
  {
    background(200, 150, 0);
    fill(0);
    ellipse(125, 125, 200, 200);
    fill(255);
    textSize(13);
    textAlign(CENTER);
    text(answers[int(random(16))], 125, 125);
  }
  else
  {
    noStroke();
    fill(0);
    ellipse(125, 125, 200, 200);
    fill(255);
    ellipse(125,58,80,50);
    noFill();
    stroke(0);
    ellipse(125,45,35,15);
    ellipse(125,65,50,25);
    fill(0,255,255);
    textAlign(CENTER);
    textSize(13);
    text("Look into the ball and ask a question", 125, 235);
    text("Click for an answer!",125,125);
  }
}

void mousePressed()
{
  magic =! magic;
  redraw();
}
