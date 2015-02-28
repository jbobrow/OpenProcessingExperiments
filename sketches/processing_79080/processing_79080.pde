
String replies[] = {"affirmative", "unlikely...", "most definitely...", "negative...", "indubitably", "very doubtful", "as I see it yes", "I say no", "yes...yes", "Ahhhhh. No.", "Isn't it obvious?", "That is a good question.", "I wish I knew...", "Thats a rhetorical question.", "It all depends on you.", "Ask the person closest to you..."};
boolean Qasked = false;

void setup()
{
  size(400,400);
  noLoop(); 
  
}
void draw()
{
  
  background(44,242,227);
  fill(0);
  ellipse(200,200,300,300);
  textAlign(CENTER);
  text("Ask me question...", 200, 170);
  
  if(Qasked == false)
  {
    //ellipse(200,130,80,80);
    textSize(20);
    text("8",200,130); 
    fill(225,201,82);
    ellipse(200,90,110,60);
    noFill();
    ellipse(200,74,55,20);
    ellipse(200,98,75,30);
  }
  else
  {
    
   int i = int(random(-1,16));
   textAlign(CENTER);
   fill(255);
   text(replies[i],200,200);
  }
  
}
void mousePressed()
{
  
  if (dist(mouseX,mouseY,200,200) < 150)
  {
    Qasked = !Qasked;
    redraw();
  }
}
