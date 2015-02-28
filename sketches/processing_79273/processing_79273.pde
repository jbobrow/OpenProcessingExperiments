
//Derek Kwong Mods 14/15
String[] answers= {
  "outlook not so good", "don't count on it", "my sources say no", "without a doubt", "reply hazy, try again", "it is certain", "my reply is no", "as I see it yes", "most likely", "you may rely on it", "cannot predict now", "better not tell you now", "very doubtful", "outlook good", " yes definitely", "concentrate and ask again"
};


boolean question=true;
void setup()
{
 smooth();
 noLoop();
  size(500, 500);
  background(255);
  
  
}
void draw()
{ 
  
  if (question==true)
  {
    fill(0);
    stroke(93, 30, 245);
    ellipse(250, 250, 400, 400);
    fill(255);
    ellipse(250, 115, 120, 100);
    strokeWeight(4);
    ellipse(250, 85, 50, 30);
    ellipse(250, 120, 60, 40);
    textSize(40);
    textAlign(CENTER);
    text("Click Me",250,350);
  }
  else if (question==false)
  { int a= int (random(0, 16));
    fill(0);
    ellipse(250, 250, 400, 400);
    fill(93, 30, 245);
    stroke(93, 30, 245);
    triangle(400, 150, 100, 150, 250, 250);
    textSize(20);
    textAlign(CENTER);
    text ( answers[a], 250, 300);
  }
}
void mousePressed()
{
question= !question;
    redraw();
  
}
