
//George F, CP1 (4-5)
//Magic Eight  Ball
void setup()
{
  size(200, 200);
  background(0, 255, 0);
}

String response[] = {
  "outlook not so good", 
  "don't count on it", "my sources say no", 
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
  "concentrate and ask again"
};

void draw()
{
  ball();
  button();
}

void ball()
{
  fill(0);
  ellipse(100, 100, 100, 100);
  fill(255);
  textSize(80);
  textAlign(CENTER);
  text("8", 100, 125);
}

int r=0;
int g=255;
int b=0;

void button()
{ 
  //int i=int(random(0,16));
  fill(0);
  textSize (20);
  text("SHAKE", 100, 30);
  fill(r, g, b);
  rect(50, 10, 100, 30);
  fill(0);
  textSize (20);
  text("SHAKE", 100, 30);
  if (mouseX<151 && mouseX>49 && mouseY<41 && mouseY>9)
  {
    r=255;
    g=255;
    b=255;
  }
  else
  {
    r=0;
    g=255;
    b=0;
  }
  if (mousePressed && mouseX<151 && mouseX>49 && mouseY<41 && mouseY>9)
  {
    int i=int(random(0,16));
    background(0,255,0);
    ball();
    fill(0);
    textSize (15);
    text(response[i], 100, 180);
  }
}
