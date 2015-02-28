
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
  
  String[] fontList = PFont.list();
  bigFont = createFont(fontList[0], 32);
  normalFont = createFont(fontList[0], 20);
  smallFont = createFont(fontList[0], 14);

  
}

void draw() 
{
   background(#1B0AC1);
   fill(#7800ff);
   stroke(#FF00D1);
   triangle(mouseX+10, 575, mouseX-10, 575, mouseX, 550);
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
  stroke(#ffff00);
  fill(#ffffff);
  
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
      line(mouseX, 550, mouseX, yCoordinates[i]);//makes the line each time the user shoots
      ellipse(xCoordinates[i], yCoordinates[i], circleDiam+15, circleDiam+15);//makes a second circle around each circle successfully shot
      xCoordinates[i] = randx();
      yCoordinates[i] = 0;
    }
  }
  
  if (hit == false)
  {
    line(mouseX, 550, mouseX, 0);
  }//end of if statement
  
}

void gameWon()
{
  if (score >= 15)
    {
      background(#1090e7);
      stroke(#1090e7);
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
      background(#A71B24);
      stroke(#3EFA35);
      textFont(bigFont);
      textAlign(CENTER);
      text("Game Over. You need a score of 15 to win. You had" +score+ ".", width/2, height/2);
      noLoop();
    }
    
  }
  
}


