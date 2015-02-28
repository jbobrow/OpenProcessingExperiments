
//Morgan D
//Computer Programming 1, Mods (13) 14-15
//User Input
//URL -> padova.webs.com/BoxGameSite.html

//This is the Box Game! (A game for two players.) The object is simple: you want to finish as many 1-by-1 boxes as possible. You do this by drawing lines between the red dots; you can change
//the number of red dots by changing the gridSize variable. I find that 6 through 10 form reasonably long games.

//The number of dots along each side of the grid.
int gridSize = 8;

//The diameter of each dot.
int diameter = 15;

//The distance between the centers of each neighboring dot.
float distance = 28;

//The starting and ending positions of each line.
int lineStartX = -30;
int lineStartY = -30;
int lineEndX;
int lineEndY;

//Whether a line has been started or not.
boolean lineStarted = false;

//Active player.
int player = 1;

//Stores whether a point has been scored by the currently active player.
boolean pointScored = false;

//The score.
int score1 = 0;
int score2 = 0;

void setup()
{
  
  size(308, 308);
  
  //Scales screen to grid size. (Activate this if you want a larger or smaller game.)
  //size(round((gridSize+3)*distance), round((gridSize+3)*distance));
  
  smooth();
  
  textAlign(CENTER);
  
  background(63);
  
  //Draws rounded square around grid.
  fill(127);
  rect(round(1.5*distance), round(1.5*distance), gridSize*distance, gridSize*distance, diameter);
  
  //Draws player indicator.
  ellipse(round((gridSize+5)*distance/4), round((gridSize+2.35)*distance), 1.75*diameter, 1.75*diameter);
  ellipse(round((3*gridSize+7)*distance/4), round((gridSize+2.35)*distance), 1.75*diameter, 1.75*diameter);
  fill(127, 0, 0);
  ellipse(round((gridSize+5)*distance/4), round((gridSize+2.35)*distance), diameter, diameter);
  
  //Draws gray gridlines.
  strokeWeight(5);
  stroke(95);
  for (int i = 0; i < gridSize; i = i+1)
  {
    line(round(2*distance), round((2+i)*distance), round((1+gridSize)*distance), round((2+i)*distance));
    line(round((2+i)*distance), round(2*distance), round((2+i)*distance), round((1+gridSize)*distance));
  }
    
  //Draws gridSize by gridSize grid of red dots.
  strokeWeight(1);
  stroke(0);
  fill(255, 0, 0);
  for (int i = 0; i < gridSize; i = i+1)
  {
    for (int j = 0; j < gridSize; j = j+1)
    {
      ellipse((j+2)*distance, (i+2)*distance, diameter, diameter);
    }
  }
  
  //Draws title.
  textSize(30);
  text("BOX GAME", round((gridSize+3)*distance/2), round(1.125*distance));
  
  //Draws reset button.
  fill(0, 255, 255);
  rect(round((gridSize+1)*distance/2), round((gridSize+1.8125)*distance), round(2*distance), round(distance), diameter/2);
  fill(0);
  textSize(12);
  text("RESET", round((gridSize+3)*distance/2), round((gridSize+2.5)*distance));
     
  //Writes the current score and surrounding box.
  stroke(0);
  fill(0, 255, 0);
  rect(0, round((gridSize+2)*distance), round(2*distance), round(.625*distance), diameter/2);
  fill(0, 0, 255);
  rect(round((gridSize+1)*distance), round((gridSize+2)*distance), round(2*distance), round(.625*distance), diameter/2);
  fill(0);
  text("GREEN:"+score1, round(distance), round((gridSize+2.5)*distance));
  text("BLUE:"+score2, round((gridSize+2)*distance), round((gridSize+2.5)*distance));
}

void mousePressed()
{
  
  //This confirms that the player has clicked a valid space - a red dot.
  if (get(mouseX, mouseY) == color(255, 0, 0))
  {
   
    //This is the protocol for finishing a line; condition one confirms that a line has been started, condition two confirms that the points clicked are adjacent, and  condition three
    //confirms that the player is not redrawing a line.
    if (lineStarted == true
    && abs(lineStartX-round(mouseX/distance)*distance)+abs(lineStartY-round(mouseY/distance)*distance) == distance
    && get(round(lineStartX+round(mouseX/distance)*distance)/2,round(lineStartY+round(mouseY/distance)*distance)/2) != color(0))
    {
      
      //This stores the location of the center of the dot clicked.
      lineEndX = round(round(mouseX/distance)*distance);
      lineEndY = round(round(mouseY/distance)*distance);
      
      //This draws the line.
      stroke(0);
      strokeWeight(5);
      line(lineStartX, lineStartY, lineEndX, lineEndY);
      
      //This is here for scorekeeping. (P1)
      if (player == 1)
      {
        
        //Makes sure that all colored squares are green.
        fill(0, 255, 0);
        
        //                                                                               _ _
        //Case 1: Vertical line. In this case, two completions arer possible: This one->|_|_|<-And this one. (The line drawn is in the center.)
        if (lineStartX == lineEndX)
        {
          
          //This one checks the left square's edges for blackness.
          if (get(round(lineStartX-distance/2), lineStartY) == color(0)
          && get(round(lineStartX-distance/2), lineEndY) == color(0)
          && get(round(lineStartX-distance), (lineStartY+lineEndY)/2) == color(0))
          {
            
            //This increases the active player's score.
            score1 = score1+1;
            
            //Since players get a move when they gain a point, this needs to be stored.
            pointScored = true;
            
            //This colors the completed square; because rect() is based off of the initial corner, this determines it.
            if (lineStartY < lineEndY)
            {
              rect(round(lineStartX-distance), lineStartY, distance, distance);
            }
            else
            {
              rect(round(lineStartX-distance), lineEndY, distance, distance);
            }
          }
          
          //This checks the other square's edges.
          if (get(round(lineStartX+distance/2), lineStartY) == color(0)
          && get(round(lineStartX+distance/2), lineEndY) == color(0)
          && get(round(lineStartX+distance), (lineStartY+lineEndY)/2) == color(0))
          {
            
            //This increases active player's score.
            score1 = score1+1;
            
            //Since players get a move when they gain a point, this needs to be stored.
            pointScored = true;
            
            //This colors the completed square; because rect() is based off of the initial corner, this determines it.
            if (lineStartY < lineEndY)
            {
              rect(lineStartX, lineStartY, distance, distance);
            }
            else
            {
              rect(lineStartX, lineEndY, distance, distance);
            }
          }
        }
        
        //                                                                                _
        //                                                                     This one->|_|
        //Case 2: Horizontal line. In this case, two completions are possible:           |_|<-And this one. (The line drawn is in the center.)
        if (lineStartY == lineEndY)
        {
          
          //This one checks the top square's edges for blackness.
          if (get(lineStartX, round(lineStartY-distance/2)) == color(0)
          && get(lineEndX, round(lineStartY-distance/2)) == color(0)
          && get((lineStartX+lineEndX)/2, round(lineStartY-distance)) == color(0))
          {
            
            //This increases the active player's score.
            score1 = score1+1;
            
            //Since players get a move when they gain a point, this needs to be stored.
            pointScored = true;
            
            //This colors the completed square; because rect() is based off of the initial corner, this determines it.
            if (lineStartX < lineEndX)
            {
              rect(lineStartX, round(lineStartY-distance), distance, distance);
            }
            else
            {
              rect(lineEndX, round(lineStartY-distance), distance, distance);
            }
          }
          
          //This one checks the bottom square's edges for blackness.
          if (get(lineStartX, round(lineStartY+distance/2)) == color(0)
          && get(lineEndX, round(lineStartY+distance/2)) == color(0)
          && get((lineStartX+lineEndX)/2, round(lineStartY+distance)) == color(0))
          {
            
            //This increases the active player's score.
            score1 = score1+1;
            
            //Since players get a move when they gain a point, this needs to be stored.
            pointScored = true;
            
            //This colors the completed square; because rect() is based off of the initial corner, this determines it.
            if (lineStartX < lineEndX)
            {            
              rect(lineStartX, lineStartY, distance, distance);
            }
            else
            {
              rect(lineEndX, lineStartY, distance, distance);
            }
          }
        }
      }
      
      //This is here for scorekeeping. (P2)
      else
      {
        
        //Makes sure that all colored squares are blue.
        fill(0, 0, 255);
        
        //                                                                               _ _
        //Case 1: Vertical line. In this case, two completions arer possible: This one->|_|_|<-And this one. (The line drawn is in the center.)
        if (lineStartX == lineEndX)
        {
          
          //This one checks the left square's edges for blackness.
          if (get(round(lineStartX-distance/2), lineStartY) == color(0)
          && get(round(lineStartX-distance/2), lineEndY) == color(0)
          && get(round(lineStartX-distance), (lineStartY+lineEndY)/2) == color(0))
          {
            
            //This increases the active player's score.
            score2 = score2+1;
            
            //Since players get a move when they gain a point, this needs to be stored.
            pointScored = true;
            
            //This colors the completed square; because rect() is based off of the initial corner, this determines it.
            if (lineStartY < lineEndY)
            {
              rect(round(lineStartX-distance), lineStartY, distance, distance);
            }
            else
            {
              rect(round(lineStartX-distance), lineEndY, distance, distance);
            }
          }
          
          //This checks the other square's edges.
          if (get(round(lineStartX+distance/2), lineStartY) == color(0)
          && get(round(lineStartX+distance/2), lineEndY) == color(0)
          && get(round(lineStartX+distance), (lineStartY+lineEndY)/2) == color(0))
          {
            
            //This increases active player's score.
            score2 = score2+1;
            
            //Since players get a move when they gain a point, this needs to be stored.
            pointScored = true;
            
            //This colors the completed square; because rect() is based off of the initial corner, this determines it.
            if (lineStartY < lineEndY)
            {
              rect(lineStartX, lineStartY, distance, distance);
            }
            else
            {
              rect(lineStartX, lineEndY, distance, distance);
            }
          }
        }
        
        //                                                                                _
        //                                                                     This one->|_|
        //Case 2: Horizontal line. In this case, two completions are possible:           |_|<-And this one. (The line drawn is in the center.)
        if (lineStartY == lineEndY)
        {
          
          //This one checks the top square's edges for blackness.
          if (get(lineStartX, round(lineStartY-distance/2)) == color(0)
          && get(lineEndX, round(lineStartY-distance/2)) == color(0)
          && get((lineStartX+lineEndX)/2, round(lineStartY-distance)) == color(0))
          {
            
            //This increases the active player's score.
            score2 = score2+1;
            
            //Since players get a move when they gain a point, this needs to be stored.
            pointScored = true;
            
            //This colors the completed square; because rect() is based off of the initial corner, this determines it.
            if (lineStartX < lineEndX)
            {
              rect(lineStartX, round(lineStartY-distance), distance, distance);
            }
            else
            {
              rect(lineEndX, round(lineStartY-distance), distance, distance);
            }
          }
          
          //This one checks the bottom square's edges for blackness.
          if (get(lineStartX, round(lineStartY+distance/2)) == color(0)
          && get(lineEndX, round(lineStartY+distance/2)) == color(0)
          && get((lineStartX+lineEndX)/2, round(lineStartY+distance)) == color(0))
          {
            
            //This increases the active player's score.
            score2 = score2+1;
            
            //Since players get a move when they gain a point, this needs to be stored.
            pointScored = true;
            
            //This colors the completed square; because rect() is based off of the initial corner, this determines it.
            if (lineStartX < lineEndX)
            {            
              rect(lineStartX, lineStartY, distance, distance);
            }
            else
            {
              rect(lineEndX, lineStartY, distance, distance);
            }
          }
        }
      }
      
      //This redraws the grid so the dots don't get covered.
      strokeWeight(1);
      fill(255, 0, 0);
      for (int i = 0; i < gridSize; i = i+1)
      {
        for (int j = 0; j < gridSize; j = j+1)
        {
          ellipse((j+2)*distance, (i+2)*distance, diameter, diameter);
        }
      }
      
      //This changes the active player if they have not scored a point.
      if (pointScored == false)
      {
        
        //These toggle the indicators.
        fill(127);
        if (player == 1)
        {
          ellipse(round((gridSize+5)*distance/4), round((gridSize+2.35)*distance), 1.75*diameter, 1.75*diameter);
          fill(127, 0, 0);
          ellipse(round((3*gridSize+7)*distance/4), round((gridSize+2.35)*distance), diameter, diameter);
        }
        if (player == 2)
        {
          ellipse(round((3*gridSize+7)*distance/4), round((gridSize+2.35)*distance), 1.75*diameter, 1.75*diameter);
          fill(127, 0, 0);
          ellipse(round((gridSize+5)*distance/4), round((gridSize+2.35)*distance), diameter, diameter);
        }
        
        //This toggles the active player.
        player = (player%2)+1;
      }
      
      //Resets pointScored for next line.
      pointScored = false;
      
      lineStarted = false;
    }
    
    //This is the protocol for starting a line. The advantage of
    //this coming second is that, if the player so wishes, they
    //can reset their starting point.
    else
    {
      
      //This recolors the currently colored dot in case the
      //player is changing their start.
      stroke(0);
      fill(255, 0, 0);
      ellipse(lineStartX, lineStartY, diameter, diameter);
            
      //This stores the center of the point clicked.
      lineStartX = round(round(mouseX/distance)*distance);
      lineStartY = round(round(mouseY/distance)*distance);
      
      //This colors the starting dot so the player knows what
      //their current dot is.
      fill(127, 0, 0);
      ellipse(lineStartX, lineStartY, diameter, diameter);
      
      lineStarted = true;
    }
  }
  
  //This is the reset protocol. Resets all variables to initial values, redraws gridlines and grid.
  if (get(mouseX, mouseY) == color(0, 255, 255)
  || ((mouseX > round((gridSize+1.25)*distance/2) && mouseX < round((gridSize+4.75)*distance/2))
    && (mouseY > round((gridSize+1.8125)*distance) && mouseY < round((gridSize+2.8125)*distance))))
  {
    lineStartX = -30;
    lineStartY = -30;
        
    lineStarted = false;
    
    player = 1;
    
    pointScored = false;
    
    score1 = 0;
    score2 = 0;
    
    //Draws rounded square around grid.
    fill(127);
    rect(round(1.5*distance), round(1.5*distance), gridSize*distance, gridSize*distance, diameter);
    
    //Draws player indicator.
    ellipse(round((gridSize+5)*distance/4), round((gridSize+2.35)*distance), 1.75*diameter, 1.75*diameter);
    ellipse(round((3*gridSize+7)*distance/4), round((gridSize+2.35)*distance), 1.75*diameter, 1.75*diameter);
    fill(127, 0, 0);
    ellipse(round((gridSize+5)*distance/4), round((gridSize+2.35)*distance), diameter, diameter);
    
    //Draws gray gridlines.
    strokeWeight(5);
    stroke(95);
    for (int i = 0; i < gridSize; i = i+1)
    {
      line(round(2*distance), round((2+i)*distance), round((1+gridSize)*distance), round((2+i)*distance));
      line(round((2+i)*distance), round(2*distance), round((2+i)*distance), round((1+gridSize)*distance));
    }
    
    //Draws gridSize by gridSize grid of red dots.
    strokeWeight(1);
    stroke(0);
    fill(255, 0, 0);
    for (int i = 0; i < gridSize; i = i+1)
    {
      for (int j = 0; j < gridSize; j = j+1)
      {
        ellipse((j+2)*distance, (i+2)*distance, diameter, diameter);
      }
    }
  }
  
  //Covers up the previous score.
  stroke(0);
  fill(0, 255, 0);
  rect(0, round((gridSize+2)*distance), round(2*distance), round(.625*distance), diameter/2);
  fill(0, 0, 255);
  rect(round((gridSize+1)*distance), round((gridSize+2)*distance), round(2*distance), round(.625*distance), diameter/2);
  
  //Writes the current score.
  fill(0);
  text("GREEN:"+score1, round(distance), round((gridSize+2.5)*distance));
  text("BLUE:"+score2, round((gridSize+2)*distance), round((gridSize+2.5)*distance));
}
