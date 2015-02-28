
//public int upgradeInterval = int(random(3000,4000));
//int upgradeCounter = upgradeInterval-1000;
PVector vel = new PVector();
PVector loc = new PVector(30,50);
boolean playing = false;
boolean titleScreen = true;
boolean falling = true;
float score;
int lifes = 5;
PFont font;
//ArrayList upgrades = new ArrayList();
void setup()
{
  frameRate(200);
  falling = true;
  lifes = 5;
  score = 0;
  vel.x = random(1,3);
  vel.y = random(5,7);
  font = createFont("Algerian",40);
  noStroke();
  fill(0);
  textFont(font);
  size(300,400);
  background(210,110,10);
  playing = false;
  titleScreen = true;
  cursor(ARROW);
  loc.x = 30;
  loc.y = 50;  
}
void draw()
{
  background(210,110,10);
  if (titleScreen)
    text("Play Pong",40,200);
  else if (playing)
    play();
  else if (!playing&&!titleScreen)
    background(210,110,10);
}
void ellipse()
{
  noStroke();
  fill(0);
  ellipse(loc.x,loc.y,40,40);
}
void rect()
{
  noStroke();
  fill(140,70,20);
  rect(mouseX-40,height-40,80,20);
}
void update()
{
  loc.x+=vel.x;
  loc.y+=vel.y;  
}
void play()
{
  /*if (upgradeCounter <= upgradeInterval)
  {  
    upgradeCounter++;
  }
  else
  {
    upgradeCounter = 0;
    upgrades.add(new Upgrade(random(30,270)));
    for (int num = 0; num < upgrades.size(); num++)
    {
      ((Upgrade)upgrades.get(num)).fall();  
    }
  }*/
  font = loadFont("ArialMT-20.vlw");
  textFont(font);
  text("Score: " + int(score),170,30);
  text("Lifes: " + lifes,20,30);
  noCursor();
  ellipse();
  rect();
  update();
  if (get(int(loc.x),int(loc.y+20)) == color(140,70,20))
  {
    if (falling)
    {
      score+=(6*abs(vel.y));
      vel.y*=-1.02;
      if (vel.x < 0)
        vel.x = -(random(1,10));
      else if (vel.x > 0)
        vel.x = random(1,10);
      falling = false;
    }
  }
  else if (loc.y-20<=0)
  {
    vel.y*=-1;
    falling = true;
  }
  else if (loc.x-20<=0)
    vel.x*=-1;
  else if (loc.x+20>=width)
    vel.x*=-1;
  else if (loc.y-20>=height)
    if (lifes>1)
    {  
      lifes--;
      loc.x = 30;
      loc.y = 50;
      vel.x = random(1,3);
      vel.y = random(5,7);
      score-=score/2;
    }
    else
    {
      playing = false;
      titleScreen = false;
      redraw();
      delay(2000);
      setup();
    }
}
void mousePressed()
{
  if (titleScreen)
  {
    if (mouseX >= 40 && mouseY >= 170 && mouseX <= 250 && mouseY <= 200)
    {
      titleScreen = false;
      playing = true;
    }
  }
  if (!titleScreen)
  {
    if (vel.y > 0)
      vel.y+=2;
    else if (vel.y < 0)
      vel.y-=2;    
  }
}
void keyPressed()
{
  if (key == 'r')
    setup();
}

