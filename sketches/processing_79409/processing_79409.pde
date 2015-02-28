
//Perry Phan, 4/5, Magic Eight Ball
boolean mode = false;
void setup()
{
  size(400,400);
  noLoop();
  background(0);
  String [] answers = {"outlook not so good",
  "don't count on it", 
  "my sources say no", 
  "without a doubt", 
  "reply hazy, try again", 
  "it is certain", 
  "my reply is no", 
  "as I see it yes", 
  "most likely",
  "you may rely on it",
  "can not predict now",
  "better not tell you now",
  "very doubtful", 
  "outlook good",
  "yes definitely", 
  "concentrate and ask again"};
}

void draw()
{
  if(mode == false)
  {
  smooth();
  strokeWeight(2);
  fill(27,242,204,50);
  ellipse(200,200,300,300);  
  fill(255);
  ellipse(200,110,130,100);
  noFill();
  ellipse(200,90,40,30);
  ellipse(200,125,50,40);
  }

else
{
  
  fill(0);
  ellipse(200,200,300,300);
  fill(255);
  String answers[] = {"outlook not so good",
"don't count on it",
"my sources say no",
"without a doubt",
"reply hazy, try again",
"it is certain",
"my reply is no",
"as I see it yes",
"most likely",
"you may rely on it",
"cannot predict now",
"better not tell you now",
"very doubtful",
"outlook good",
"yes definitely",
"concentrate and ask again"};
  
  textAlign(CENTER);
  text(answers[int(random(answers.length))], 200, 200);
  
}
}
void mousePressed()
{
  mode=!mode;
  redraw();
}
