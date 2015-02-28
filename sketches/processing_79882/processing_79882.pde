
int c = color(255);
int num=0;
int x = 180;
int y = 220;
boolean mouseReleased = false;
boolean mode = false;
String answers [] = {"outlook not so good",
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


void setup()
{
  size(400, 400);
  background(0);


}
void draw()
{
  
  if (mode==false)
  {
  
     background(0);
     stroke(0);
     smooth();
    fill(57, 2, 227);
    ellipse(200, 200, 200, 200);
    fill(c);
    stroke(43, 5, 160);
    strokeWeight(1.5);
    ellipse(200, 135, 100, 50);
    stroke(0);
    noFill();
    ellipse(200, 123.5, 30, 15);
    ellipse(200, 120+20, 45, 20);
    stroke(255);
    if (mouseReleased==true)
    {
     textAlign(CENTER);
     textSize(20);
    text(answers[num], 50, 350, 300, 200);
    }
  }
  else
  {
     background(0);
     stroke(0);
   fill(57, 2, 227);
  ellipse(random(180, 220), random(180, 220), 200, 200);
  fill(0);
  ellipse(random(180, 220), random(125, 155), 100, 50);
  }
}

void mousePressed()
{
  if (mouseX > 150 && mouseX < 250 && mouseY > (135-25) && mouseY < (135+25))
  {
    c = color(0);
  mode=true;
  }
}
void mouseReleased()
{
  mouseReleased = true;
  c = 255;
  num= int(random(answers.length));
  mode=false;   
}

