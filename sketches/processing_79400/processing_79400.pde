
int num = int(random(55));
boolean mode = false;
 
void setup()
{
  size(400, 400);
  background(113,40,62);
  smooth();
  noLoop();
}
 
void draw()
{
  String [] words = {"Ask a better question.","No doubt.", "Womp womp.", "You're REALLY asking that?", "I guess.", "Sure thing.", "Actually...Maybe","There's hope my friend.", "Whatever you want.", "Yeaup. *Trey Songz voice*", "Ask me again later.", "NO.", "Hahaha you're funny."};
  if (mode == true)
  {
   
    fill(0);
    ellipse(200, 200, 390, 390);
    fill(255);
    triangle(100, 50, 300, 50, 200, 125);
    textSize(25);
    textAlign(CENTER);
    int index = int(random(words.length));
    text (words[index],200,200);
    
  
  }
  else
  {
    noStroke();
    fill(random(0));
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
