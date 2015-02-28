
//Jun Min Zhong, Olympic Rings, CP1, Mods 16-17
boolean ball = false;
String[] ans = {"outlook not so good", "don't count on it ", "my sources say no ", "without a doubt ", "reply hazy, try again ", "it is certain ", "my reply is no ", "as I see it yes ", "most likely ", "you may rely on it ", "cannot predict now ", "better not tell you now ", "very doubtful ", "outlook good ", "yes definitely ", "concentrate and ask again "};

void setup()
{
  background(255);
  size(1000,1000);
  noLoop();
}

void draw()
{
  if(ball==true)
  {
    background(0);
    fill(255);
    ellipse(500,500,500,500);
    fill(0);
    textSize(25);
    textAlign(CENTER);
    text(ans[int(random(15))],500,500);
    textSize(10);
    text("Re-click to Ask Again",500,550);
  }
  
  else
  {
    background(0);
    fill(255);
    ellipse(500,500,500,500);
    fill(0);
    textSize(25);
    textAlign(CENTER);
    text("Think&Ask;",500,500);
    textSize(20);
    text("CLICK*",500,550);
    textSize(50);
    text("!8?",int(random(300,700)),400);
    text("!8?",int(random(350,650)),650);
  }
}

void mousePressed()
{
  if(mouseX>250 && mouseX<750 && mouseY>250 && mouseY<750)
  {
    ball = !ball;
  }
  redraw();
}
