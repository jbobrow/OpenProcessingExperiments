
float x, y, wd, ht;
color col;
int score;
PImage woody;
PImage zombie1;
PImage zombie2;
PImage zombie3;
PImage zombie4; 
float timer = 30;

PImage loser;
PImage winner;

int gamestate = 0;
int PLAY_STATE = 0;
int WIN_STATE = 1;
int LOSE_STATE = 2;

 
void setup()
{
  size(600, 600);
  x = width*0.5;
  y = height*0.5;
  wd = width*0.1;
  ht = height*0.1;
  score = 30;
  col = color(random(255), random(255), random(255));
  frameRate(24);
  woody = requestImage ("woods.jpg");
  zombie1 = requestImage ("zombiea.png");
  zombie2 = requestImage ("zombieb.png");
  zombie3 = requestImage ("zombiec.png");
  zombie4 = requestImage ("zombied.png"); 
  loser = requestImage ("lose2.png");
  winner = requestImage ("wins2.jpg");
}
 
void draw()
{
  timer = timer - (1.0/30.0);
  image(woody, 0, 0, width, height);
  fill(255, 0, 0);
  textSize(40);
  text("Kills:" + score, 50, 50);
  text ("Timer:" + (int) timer , 50, 85);
  noStroke();
  fill(col);
  image (zombie3, x, y, wd, ht);
  fill(255, 255, 255, 70);
  strokeWeight(2);
  stroke(0, 0, 0);
  ellipse(mouseX, mouseY, wd*10, ht*10);
  line(mouseX - wd*5, mouseY, mouseX - wd*0.5, mouseY);
  line(mouseX + wd*5, mouseY, mouseX + wd*0.5, mouseY);
  line(mouseX, mouseY - ht*5, mouseX, mouseY - ht*0.5);
  line(mouseX, mouseY + ht*5, mouseX, mouseY + ht*0.5);
  stroke(255, 0, 0);
  strokeWeight(2);
  line(mouseX - wd*0.3, mouseY, mouseX + wd*0.3, mouseY);
  line(mouseX, mouseY - ht*0.3, mouseX, mouseY + ht*0.3);
//game states
    if (timer < 0)
    {
      if (score <= 0)
      {
        gamestate = WIN_STATE;
      }
      else if (timer < 0 && score > 0)
      {
        gamestate = LOSE_STATE;
      }
   
  if (gamestate == LOSE_STATE)
  {
      image(loser, 0, 0, width, height);
      textAlign(CENTER);
      text("YOU ARE DEAD", 0, 0, width, 100);
  }
  if (gamestate == WIN_STATE)
  {
      image(winner, 0, 0, width, height);
      textAlign(CENTER);
      text("YOU HAVE SURVIVED!", 0, 0, width, 255);
  }
}
}

 
void mousePressed()
{
   double xdis = abs(mouseX - x);
   double ydis = abs(mouseY - y);
   if (xdis < wd && ydis < ht && score > 1)
      {
        fill(255, 174, 0);
        noStroke();
        rect(0, 0, width, height);
        col = color(random(255), random(255), random(255));
        textSize(50);
        fill(255, 255, 255);
        text("NICE SHOT", width*0.15, height*0.5);
        score = score - 1;
      }
}
 
void mouseReleased()
{
  x = random(width);
  y = random(height);
}
 
void keyPressed()
{
  if (key == CODED)
    if (keyCode == UP)
    {
      y = y - 45;
    }
    else if (keyCode == DOWN)
    {
      y = y + 45;
    }
    else if (keyCode == LEFT)
    {
      x = x - 45;
    }
    else if (keyCode == RIGHT)
    {
      x = x + 45;
    }
}



