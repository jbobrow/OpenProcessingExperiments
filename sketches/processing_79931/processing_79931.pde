
//Michael H CP.1 16-17
//Magic Eight Ball


boolean answer=false;
 String[] lines= {"Yea.. no", "dont count on it", "my sources say no", "without a doubt", "reply hazy,try again", "it is certain", "my reply is no", "as I see it yes", "most likely", "you may rely on it", "cannot predict now", "better not tell you now", "very doubtful", "outlook good", "yes difinitely", "concentrate and ask again"};
int i=0;
void setup()
{
  size(400,400);
 

  noLoop();
  
}
void draw()
{

  background(255);
  fill(0);
  ellipse(200,200,200,200);
 
  
  
  if(answer==true)
  {
    fill(255);
    ellipse(200,180,135,120);

  }
  else
  {
    fill(255);
    ellipse(200,180,135,120);
     noFill();
    ellipse(200,154,50,40);
    ellipse(200,200,64,50);
  }
   if (answer==true)
  {
    fill(0);
     i= int(random(0,15));
    text(lines[i],200,180);
    textAlign(CENTER);
  }

}
    void mousePressed()
    {
      answer=!answer;
      redraw();
    }
