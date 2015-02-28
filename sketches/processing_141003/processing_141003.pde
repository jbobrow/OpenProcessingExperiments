
PImage starfield;
//PImage ship
//PImage smiles;
PFont normalFont;
PFont smallFont;
PFont bigFont;
 
int circleDiam = 12;
int score = 0;
boolean shoot = false;
 
int randx()
{
  return int(random(600));
}
 
int[] xCoordinates = {(randx()), (randx()), (randx()), (randx()), (randx())};
int[] yCoordinates = {0, 0, 0, 0, 0};
 
void setup() {
  size(600, 600);
  starfield =loadImage("starfield.png");
  //ship = loadImage("ship.png");
 // smiles = loadImage("smiles.png"); 
  String[] fontList = PFont.list();
  bigFont = createFont(fontList[0], 40);
  normalFont = createFont(fontList[0], 27);
  smallFont = createFont(fontList[0], 18);
 
   
}
 
void draw()
{
   background(255);
   image(starfield, 0, 0, width, height);
   stroke(#031DFA);
   rect(mouseX, 575, mouseX, 550);
   fill(0);
   text("Score:" + score, width/2, 56);
    
   if (shoot == true)
   {
     circleDead(mouseX);
     shoot = false;
     
   }
   circlesFalling();
   gameOver();
}
 
 
 
void mousePressed()
{
  shoot = true;
}
 
 
 
void circlesFalling()
{
  stroke(#FA0303);
  for (int i=0; i<5; i++)
  {
    ellipse(xCoordinates[i], yCoordinates[i]++, circleDiam, circleDiam);
  }
 
}
 
 
 
void circleDead(int shot)
{
  boolean hit = false;
   
  for(int i=0; i<5; i++)
  {  
    if((shot >= (xCoordinates[i]-circleDiam/2)) && shot <= (xCoordinates[i]+circleDiam/2))
    {
      hit = true;
      score++;
      strokeWeight(2);
      stroke(#FBFF40);
      fill(#FBFF40);
      line(mouseX, 550, mouseX, yCoordinates[i]);
      ellipse(xCoordinates[i], yCoordinates[i], circleDiam+15, circleDiam+15);
      xCoordinates[i] = randx();
      yCoordinates[i] = 0;
    }
  }
   
  if (hit == false)
  {
    line(mouseX, 550, mouseX, 0);
  }
   
}
 
void gameWon()
{
  if (score >= 25)
    {
      background(255);
      stroke(#0C19F5);
      textFont(bigFont);
      text("Congrats! You won!", width/2, height/2);
    }
  }
   
 
 
void gameOver()
{
  for (int i = 0; i <5 ; i++)
  {
     
    if (yCoordinates[i] == 550)
    {
      background(255);
      stroke(#EA093E);
      textFont(smallFont);
      textAlign(CENTER);
      text("Game Over. You need a score of 15 to win. You had" +score+ ".", width/2, height/2);
      noLoop();
    }
     
  }
   
}


