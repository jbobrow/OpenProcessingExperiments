
/* @pjs font="player1up.ttf"; */

Board board;

PFont font11;
PFont font22;
PFont font60;
PFont font80;

int boardWidth = 16;
int boardHeight = 10;

boolean play = false;

ArrayList<Player> players;

int PLAYER_COUNT = 5;

float SPEED = 1; 

int SOLIDS_TO_WIN = 5;
int solid_unit = 300/SOLIDS_TO_WIN;

int health_max = 5;
int HEALTH = 5;
int health_unit = 300/HEALTH;

Layer eastLayer;
Layer westLayer;

boolean isDirectResult = false;

int savedTime;
int savedAniTime;
int totalTime = 1000; // speed
int totalAniTime = totalTime;

int solidAnimationTime = 1000;

ArrayList<LevelSelect> levels;

// currentLevel: 1 - 10
LevelSelect currentLevel;

// shapeId
// 4 = Tetromino;
// 5 = Pentomino;
// 6 = Hexomino;
int shapeId = 4;

// macthColor of layer
boolean matchColor = false;

// rotation
float theta = 0.0;
float thetaStep = 0.0;

int solids = 0;
int broken = 0;

boolean showResult = false;
boolean solid = false;
boolean gamewon = false, gameover = false;

boolean isDragging = false;
PVector startDrag;

void setup() {
  size(640, 400);
  
  boardWidth = 16;
  boardHeight = 10;

  play = false;
  
  PLAYER_COUNT = 5;

  SPEED = 1; 

  SOLIDS_TO_WIN = 5;
  solid_unit = 300/SOLIDS_TO_WIN;

  health_max = 5;
  HEALTH = 5;
  health_unit = 300/HEALTH;

  isDirectResult = false;

  totalTime = 1000; // speed
  totalAniTime = totalTime;

  solidAnimationTime = 1000;

  // shapeId
  // 4 = Tetromino;
  // 5 = Pentomino;
  // 6 = Hexomino;
  shapeId = 4;

  // macthColor of layer
  matchColor = false;

  // rotation
  theta = 0.0;
  thetaStep = 0.0;

  solids = 0;
  broken = 0;

  showResult = false;
  solid = false;
  gamewon = false;
  gameover = false;

  isDragging = false;

  board = new Board(boardWidth, boardHeight, width, height);
  
  font11 = createFont("player1up.ttf", 11); //loadFont("Player1Up-11.vlw");
  font22 = createFont("player1up.ttf", 22); //loadFont("Player1Up-22.vlw");
  font60 = createFont("player1up.ttf", 60); //loadFont("Player1Up-60.vlw");
  font80 = createFont("player1up.ttf", 80); //loadFont("Player1Up-80.vlw");
  /*
  font11 = createFont("Arial", 11);
  font22 = createFont("Arial", 22);
  font60 = createFont("Arial", 60);
  font80 = createFont("Arial", 80);
  */
  
  levels = new ArrayList<LevelSelect>();
  
  for (int i = 0; i < 5; i++)
  {
    int x = (i*2*board.squareWidth());
    int y = 0;
    
    levels.add(new LevelSelect(x, y, board.squareWidth(), board.squareHeight(), i+1));
  }
  for (int i = 5; i < 10; i++)
  {
    int x = (i*2*board.squareWidth())-(5*2*board.squareWidth());
    int y = 2*board.squareHeight();
    
    levels.add(new LevelSelect(x, y, board.squareWidth(), board.squareHeight(), i+1));
  }
    
  //startGame();
}

void createWalls()
{
  int ce = color(255);
  int cw = color(255);

  int layerColorE = color(0);
  int layerColorW = color(0);
  
  if (matchColor)
  {
    layerColorE = color(90, 200, 250);
  }
  
  //eastLayer = new Layer((boardWidth/2)-2, -(boardHeight), boardWidth, boardHeight*2, layerColorE, -SPEED, 0, ce);
  //westLayer = new Layer(-(boardWidth*1.5)+2, -(boardHeight), boardWidth, boardHeight*2, layerColorW, SPEED, 0, cw);
  eastLayer = new Layer((boardWidth/2)-2, -(boardHeight), boardWidth, boardHeight*2, layerColorE, -SPEED, 0, ce);
  westLayer = new Layer(-(boardWidth*1.5)+2, -(boardHeight), boardWidth, boardHeight*2, layerColorW, SPEED, 0, cw);
  //
  // Algoritm shape
  //
  Shape shape = new Shape();
  switch (shapeId)
  {
    case 4:
      shape = new Tetromino(int(random(1, 5)), int(random(0, 5)));
      break;
      
    case 5:
      shape = new Pentomino(int(random(1, 6)), int(random(0, 5)));
      break;
      
    case 6:
      shape = new Hexomino(int(random(1, 7)), int(random(0, 5)));
      break;
  }
  
  PLAYER_COUNT = shape.playerCount;
  
  int r = (boardHeight)-((int)(shape.rows/2));
  
  // Cut shape out of west layer
  for (int i = 0; i < shape.colsBeforeSeperation; i++)
  {
    for (int j = 0; j < shape.rows; j++)
    {
      westLayer.wall[i+(westLayer.cols-shape.colsBeforeSeperation)][j+r] = !shape.filled[i][j];
    }
  }
  
  // Cut shape out of east layer
  for (int i = shape.colsBeforeSeperation; i < shape.cols; i++)
  {
    for (int j = 0; j < shape.rows; j++)
    {
      eastLayer.wall[i-shape.colsBeforeSeperation][j+r] = !shape.filled[i][j];
    }
  }
  
  eastLayer.shaper();
  westLayer.shaper();
  
  //println("level="+currentLevel.levelNo);
  //println("shapeType="+shape.shapeType);
  //println("rotationId="+shape.rotationId);
}

void setColorofPlayers()
{
  // set color of players
  int c = 0;
  for (int i = 0; i < eastLayer.cols; i++)
  {
    for (int j = 0; j < eastLayer.rows; j++)
    {
      if (!eastLayer.wall[i][j])
        c++;
    }
  }    
  
  for (int i = 0; i < c; i++)
  {
    Player p = players.get(i);
    p.c = eastLayer.c;
  }
  for (int i = c; i < players.size(); i++)
  {
    Player p = players.get(i);
    p.c = westLayer.c;
  }
}

void setLevel()
{
  switch (currentLevel.levelNo)
  {
    case 1:
      shapeId = 4;
      matchColor = false;
      thetaStep = 0.0;
      totalTime = 2000;
      break;
    
    case 2:
      shapeId = 4;
      matchColor = true;
      thetaStep = 0.0;
      totalTime = 1500;
      break;
     
    case 3:
      shapeId = 5;
      matchColor = false;
      thetaStep = 0.0;
      totalTime = 1500;
      break;
     
    case 4:
      shapeId = 5;
      matchColor = true;
      thetaStep = 0.0;
      totalTime = 1500;
      break;
     
    case 5:
      shapeId = 5;
      matchColor = false;
      thetaStep = 0.05;
      totalTime = 1000;
      break;
     
    case 6:
      shapeId = 5;
      matchColor = true;
      thetaStep = 0.05;
      totalTime = 1000;
      break;
     
    case 7:
      shapeId = 6;
      matchColor = true;
      thetaStep = 0.05;
      totalTime = 900;
      break;
     
    case 8:
      shapeId = 6;
      matchColor = true;
      thetaStep = 0.1;
      totalTime = 800;
      break;
     
    case 9:
      shapeId = 6;
      matchColor = true;
      thetaStep = 0.1;
      totalTime = 750;
      break;
     
    case 10:
      shapeId = 6;
      matchColor = true;
      thetaStep = 0.15;
      totalTime = 650;
      break; 
  }
  
  totalAniTime = totalTime;
}

public void startGame() {
  
    savedTime = millis();
    
    // Reset
    solids = 0;
    broken = 0;
    HEALTH = 5;
    theta = 0.0;
    
    // set level
    setLevel();
    
    // layers    
    createWalls();
    
    // create players    
    players = new ArrayList<Player>();
    
    int x = -1;
    int y = -floor((PLAYER_COUNT/2)/2);
    int teller = 1;
    for (int i = 0; i < PLAYER_COUNT; i++) 
    {
      x = -1 + (teller-1);
    
      if (teller > 2)
      {
        x = -1;
        y++;
        
        teller = 1;
      }
      
      players.add(new Player(x, y, 1, 1, i, color(175)));
      teller++;
      
    }

    setColorofPlayers();
    
    play = true;
}

void win()
{
  gamewon = true;
  gameover = false;
  play = false;
  currentLevel.won = true;
  currentLevel.perfectScore = (HEALTH == health_max);
}

void lose()
{
  gamewon = false;
  gameover = true;
  play = false;
  currentLevel.won = false;
  currentLevel.perfectScore = false;
}

void draw() 
{
  background(255);
  //smooth();

  if (!play)
  {
    pushMatrix();
    translate(width/2, height/2);
    
    textAlign(CENTER);
    
    fill(90, 200, 250);
    textFont(font80);
    text("SOLID", 0, -75);
    
    fill(0);
    textFont(font11);
    text("[ PROTOTYPE ]", 0, 175);
    
    popMatrix();
    
    pushMatrix();
    translate(width/2-(4.5*board.squareWidth()), height/2);
    
    for (int i = 0; i < 10; i++)
    {
      LevelSelect level = levels.get(i);
      level.overRect(mouseX-(width/2-(4.5*board.squareWidth())), mouseY-(height/2));
      level.display();
    }
    
    popMatrix();
  }
  else 
  {
    int passedTime = millis() - savedTime;

    if (!showResult)
    {
      theta += thetaStep;
    }
      
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(theta));
    
    if (isDirectResult) // Player hit space bar
    {
      totalTime = 50;
    }

    if (!showResult && passedTime > totalTime)
    {
      // layers
      eastLayer.step();
      westLayer.step();
      
      savedTime = millis(); // Save the current time to restart the timer!
    }
    
    // players
    for (int j = 0; j < players.size(); j++) 
    {
      Player player = players.get(j);
    
      PVector mouse = checkPointInRect(width/2, height/2, 40, 40, theta, mouseX, mouseY);
      
      player.overRect(board.convertToBoardX(mouse.x), board.convertToBoardY(mouse.y));
      player.drag(board.convertToBoardX(mouse.x), board.convertToBoardY(mouse.y));
      
      //player.collide(players);
    }
    
    if (showResult)
    {
      if (solid)
      {
        eastLayer.display_solid();
        westLayer.display_solid();
      }
      else
      {
        eastLayer.display_error();
        westLayer.display_error();
      }
    }
    else
    {
      eastLayer.display();
      westLayer.display();
    }
    
    for (int j = 0; j < players.size(); j++) 
    {
      Player player = players.get(j);
      if (showResult)
      {
        if (solid)
          player.display_solid();
        else
          player.display_error();
      }
      else
        player.display();
    }
 
    if (showResult)
    {
      if (solid)
      {
        fill(142, 142, 147);
        textFont(font60, 60);
        textAlign(CENTER);
        text("SOLID!", 0, -80);
      }
      else
      {
        fill(142, 142, 147);
        textFont(font60, 60);
        textAlign(CENTER);
        text("ERROR!", 0, -80);
      }
   
      if (passedTime > solidAnimationTime)
      {
        if (solids == SOLIDS_TO_WIN)
            win();
        
        if (HEALTH == 0)
            lose(); 
            
        createWalls();
        setColorofPlayers();
        
        showResult = false;
        savedTime = millis();
      }
    }
    
    popMatrix();
    
    // Check if solid
    if (!showResult)
    {
      ArrayList<Layer> layers  = new ArrayList<Layer>();
      layers.add(eastLayer);
      layers.add(westLayer);
      if ((westLayer.pos.x+westLayer.w) == eastLayer.pos.x)
      {
        if (board.solid(layers, players))
        {
          //println("solid");
          solid = true;
          solids++;
          
          if (isDirectResult && HEALTH < health_max)
            HEALTH++;
        }
        else
        {
          //println("broken");
          solid = false;
          HEALTH--;         
        }
  
        showResult = true;
        isDirectResult = false;
        totalTime = totalAniTime;
        savedTime = millis(); // Save the current time to restart the timer!
      }
    }
    
    // Health
    stroke(255, 59, 48);
    noFill();
    rect(10, 10, 300, 10);
    
    noStroke();
    fill(255, 59, 48);
    rect(10, 10, health_unit*HEALTH, 10);
    
    // Solids
    stroke(76, 217, 100);
    noFill();
    rect(330, 10, 300, 10);
    
    noStroke();
    fill(76, 217, 100);
    rect(330, 10, solid_unit*solids, 10);
  }
}

 // rx and ry are centre of rectangle. rw and rh are height and width of the rectangle.
 // rot is rotation in degrees around the centre. px and py are the point we are checking.
 PVector checkPointInRect(float rx, float ry, float rw, float rh, float rot, float px, float py)
 {
   float rotRad = radians(rot);
   float dx = px - rx;
   float dy = py - ry;
   // distance between point and centre of rectangle.
   float h1 = sqrt(dx*dx + dy*dy);
   float currA = atan2(dy, dx);
   // angle of point rotated by the rectangle amount around the centre of rectangle.
   float newA = currA - rotRad;
   // x2 and y2 are the new positions of the point when rotated to offset the rectangles orientation.
   float x2 = cos(newA) * h1;
   float y2 = sin(newA) * h1;
   
   return new PVector(x2, y2);
 }

void mousePressed() 
{
  if (!play)
  {
    for (int i = 0; i < 10; i++)
    {
      LevelSelect level = levels.get(i);
      level.press();
    }
  }
  else
  {
    if (players != null) 
    {
      for (int i = 0; i < players.size(); i++) 
      {
        if (!isDragging)
        {
          Player p = players.get(i);
          PVector mouse = checkPointInRect(width/2, height/2, 40, 40, theta, mouseX, mouseY);
          p.press(board.convertToBoardX(mouse.x), board.convertToBoardY(mouse.y));
          
          isDragging = p.dragging;
          startDrag = new PVector(board.convertToBoardX(mouse.x), board.convertToBoardY(mouse.y));
        }
      }
    }
  }
}

void mouseReleased() 
{
  if (players != null) 
  {
    for (int i = 0; i < players.size(); i++) {
      players.get(i).release(players, startDrag);
    }
  }
  
  isDragging = false;
}

void keyPressed() {
  if (key == ESC) {
    key = 0;
  }
  if (key == 0) {
      play = false;
  }
  
  if (key == ' ') // Space bar
  {
    isDirectResult = true && play && !showResult;
  }
}



class Board {

  int boardWidth;
  int boardHeight;
  
  int screenWidth;
  int screenHeight;
  
  Board(int boardWidth, int boardHeight, int screenWidth, int screenHeight)
  {
    this.boardWidth = boardWidth;
    this.boardHeight = boardHeight;
    
    this.screenWidth = screenWidth;
    this.screenHeight = screenHeight;
  }
  
  boolean solid(ArrayList<Layer> layers, ArrayList<Player> players)
  {
    for (int l = 0; l < layers.size(); l++)
    {
      Layer layer = layers.get(l);
      for (int i = 0; i < layer.cols; i++)
      {
        for (int j = 0; j < layer.rows; j++)
        {
          if (!layer.wall[i][j])
          {
            boolean result = false;
            
            int wx = int(layer.pos.x) + i;
            int wy = int(layer.pos.y) + j;
            
            for (int p = 0; p < players.size(); p++)
            {
               Player player = players.get(p);
               if (player.pos.x == wx && player.pos.y == wy && player.c == layer.c)
               {
                 result = true;
                 break;
               } 
            }
            
            if (!result)
              return false;
          }
        }
      }
    }
    
    return true;
  }
  
  int convertToBoardX(float x)
  {
    return floor(x/squareWidth());
  }

  int convertToBoardY(float y)
  {
    return floor(y/squareHeight());
  }
  
  int squareWidth()
  {
    return (screenWidth/boardWidth);
  }
  
  int squareHeight()
  {
    return (screenHeight/boardHeight);
  }
  
  int originBoardX()
  {
    return (boardWidth/2);
  }
  
  int originBoardY()
  {
    return (boardHeight/2);
  }
  
  int convertToCoordX(int boardX)
  {
    
    if (boardX+1 <= originBoardX())
    {
      
      return ((boardX+1) - originBoardX())-1;
    }
    else
    {
      return ((boardX+1) - originBoardX());
    }
    
  }
  
  int convertToCoordY(int boardY)
  {
    int result = 0;
    if (boardY+1 <= originBoardY())
    {
      result = originBoardY() - (boardY+1) + 1;
    }
    else
    {
      result = originBoardY() - (boardY + 1);
    }
    
    return result;
  }
  
  int convertCoordXToBoardX(int coordX)
  {
    if (coordX > 0)
    {
      return (boardWidth/2) + coordX - 1;
    }
    
    return (boardWidth/2) + coordX;
  }
  
  int convertCoordYToBoardY(int coordY)
  {
    if (coordY > 0)
      return (boardHeight/2) - coordY;
    
    return (boardHeight/2) + (-1*coordY) - 1;
  }
}
class Hexomino extends Shape {
  
  Hexomino(int shapeType, int rotationId)
  {
    playerCount = 6;
    this.shapeType = shapeType;
    this.rotationId = rotationId;
    
    switch (shapeType)
    {
      case 1:
        
        if (rotationId == 0 || rotationId == 4)
        {
          cols = 3;
          rows = 4;
          
          setShape(cols, rows);
            
          filled[0][0] = false;
          filled[1][0] = true;
          filled[2][0] = true;
          
          filled[0][1] = true;
          filled[1][1] = true;
          filled[2][1] = false;
          
          filled[0][2] = false;
          filled[1][2] = true;
          filled[2][2] = false;
          
          filled[0][3] = false;
          filled[1][3] = true;
          filled[2][3] = false;
          
          colsBeforeSeperation = int(random(1, 3));
          
          break;
        }
        if (rotationId == 1)
        {
          cols = 4;
          rows = 3;
          
          setShape(cols, rows);
            
          filled[0][0] = false;
          filled[1][0] = false;
          filled[2][0] = true;
          filled[3][0] = false;
          
          filled[0][1] = true;
          filled[1][1] = true;
          filled[2][1] = true;
          filled[3][1] = true;
          
          filled[0][2] = false;
          filled[1][2] = false;
          filled[2][2] = false;
          filled[3][2] = true;
          
          colsBeforeSeperation = 3; //int(random(1, 3));
          
          break;
        }
        if (rotationId == 2)
        {
          cols = 3;
          rows = 4;
          
          setShape(cols, rows);
            
          filled[0][0] = false;
          filled[1][0] = true;
          filled[2][0] = false;
          
          filled[0][1] = false;
          filled[1][1] = true;
          filled[2][1] = false;
          
          filled[0][2] = false;
          filled[1][2] = true;
          filled[2][2] = true;
          
          filled[0][3] = true;
          filled[1][3] = true;
          filled[2][3] = false;
          
          colsBeforeSeperation = int(random(1, 3));
          
          break;
        }
        if (rotationId == 3)
        {
          cols = 4;
          rows = 3;
          
          setShape(cols, rows);
            
          filled[0][0] = true;
          filled[1][0] = false;
          filled[2][0] = false;
          filled[3][0] = false;
          
          filled[0][1] = true;
          filled[1][1] = true;
          filled[2][1] = true;
          filled[3][1] = true;
          
          filled[0][2] = false;
          filled[1][2] = true;
          filled[2][2] = false;
          filled[3][2] = false;
          
          colsBeforeSeperation = 1;
          
          break;
        }
        
      case 2:
        
        if (rotationId == 0 || rotationId == 4)
        {
          cols = 3;
          rows = 3;
          
          setShape(cols, rows);
            
          filled[0][0] = true;
          filled[1][0] = true;
          filled[2][0] = true;
          
          filled[0][1] = false;
          filled[1][1] = true;
          filled[2][1] = true;
          
          filled[0][2] = false;
          filled[1][2] = true;
          filled[2][2] = false;
          
          colsBeforeSeperation = int(random(1, 3));
          
          break;
        }
        if (rotationId == 1)
        {
          cols = 3;
          rows = 3;
          
          setShape(cols, rows);
            
          filled[0][0] = false;
          filled[1][0] = false;
          filled[2][0] = true;
          
          filled[0][1] = true;
          filled[1][1] = true;
          filled[2][1] = true;
          
          filled[0][2] = false;
          filled[1][2] = true;
          filled[2][2] = true;
          
          colsBeforeSeperation = int(random(1, 3));
          
          break;
        }
        if (rotationId == 2)
        {
          cols = 3;
          rows = 3;
          
          setShape(cols, rows);
            
          filled[0][0] = false;
          filled[1][0] = true;
          filled[2][0] = false;
          
          filled[0][1] = true;
          filled[1][1] = true;
          filled[2][1] = false;
          
          filled[0][2] = true;
          filled[1][2] = true;
          filled[2][2] = true;
          
          colsBeforeSeperation = int(random(1, 3));
          
          break;
        }
        if (rotationId == 3)
        {
          cols = 3;
          rows = 3;
          
          setShape(cols, rows);
            
          filled[0][0] = true;
          filled[1][0] = true;
          filled[2][0] = false;
          
          filled[0][1] = true;
          filled[1][1] = true;
          filled[2][1] = true;
          
          filled[0][2] = true;
          filled[1][2] = false;
          filled[2][2] = false;
          
          colsBeforeSeperation = 1;
          
          break;
        }
      
      case 3:
      
        if (rotationId == 0 || rotationId == 4)
        {
          cols = 3;
          rows = 4;
          
          setShape(cols, rows);
            
          filled[0][0] = false;
          filled[1][0] = false;
          filled[2][0] = true;
          
          filled[0][1] = false;
          filled[1][1] = true;
          filled[2][1] = true;
          
          filled[0][2] = true;
          filled[1][2] = true;
          filled[2][2] = false;
          
          filled[0][3] = false;
          filled[1][3] = true;
          filled[2][3] = false;
          
          colsBeforeSeperation = 2;//int(random(1, 3));
          
          break;
        }
        if (rotationId == 1)
        {
          cols = 4;
          rows = 3;
          
          setShape(cols, rows);
              
          filled[0][0] = false;
          filled[1][0] = true;
          filled[2][0] = false;
          filled[3][0] = false;
          
          filled[0][1] = true;
          filled[1][1] = true;
          filled[2][1] = true;
          filled[3][1] = false;
          
          filled[0][2] = false;
          filled[1][2] = false;
          filled[2][2] = true;
          filled[3][2] = true;
          
          colsBeforeSeperation = 2;
          
          break;
        }
        if (rotationId == 2)
        {
          cols = 3;
          rows = 4;
          
          setShape(cols, rows);
            
          filled[0][0] = false;
          filled[1][0] = true;
          filled[2][0] = false;
          
          filled[0][1] = false;
          filled[1][1] = true;
          filled[2][1] = true;
          
          filled[0][2] = true;
          filled[1][2] = true;
          filled[2][2] = false;
          
          filled[0][3] = true;
          filled[1][3] = false;
          filled[2][3] = false;
          
          colsBeforeSeperation = 1;
          
          break;
        }
        if (rotationId == 3)
        {
          cols = 4;
          rows = 3;
          
          setShape(cols, rows);
              
          filled[0][0] = true;
          filled[1][0] = true;
          filled[2][0] = false;
          filled[3][0] = false;
          
          filled[0][1] = false;
          filled[1][1] = true;
          filled[2][1] = true;
          filled[3][1] = true;
          
          filled[0][2] = false;
          filled[1][2] = false;
          filled[2][2] = true;
          filled[3][2] = false;
          
          colsBeforeSeperation = 2;
          
          break;
        }
    
      case 4:
        
        cols = 3;
        rows = 3;
        
        setShape(cols, rows);
        
        if (rotationId == 0 || rotationId == 1 || rotationId == 4)
        {
          filled[0][0] = true;
          filled[1][0] = true;
          filled[2][0] = true;
        
          filled[0][1] = false;
          filled[1][1] = true;
          filled[2][1] = false;
          
          filled[0][2] = false;
          filled[1][2] = true;
          filled[2][2] = true;
        }
        else
        {
          filled[0][0] = true;
          filled[1][0] = true;
          filled[2][0] = false;
        
          filled[0][1] = false;
          filled[1][1] = true;
          filled[2][1] = false;
          
          filled[0][2] = true;
          filled[1][2] = true;
          filled[2][2] = true;
        }
        
        colsBeforeSeperation = int(random(1, 3));
        
        break;
        
      case 5:
      
        if (rotationId == 0 || rotationId == 4)
        {
          cols = 3;
          rows = 4;
          
          setShape(cols, rows);
            
          filled[0][0] = false;
          filled[1][0] = true;
          filled[2][0] = true;
          
          filled[0][1] = true;
          filled[1][1] = true;
          filled[2][1] = false;
          
          filled[0][2] = true;
          filled[1][2] = false;
          filled[2][2] = false;
          
          filled[0][3] = true;
          filled[1][3] = false;
          filled[2][3] = false;
          
          colsBeforeSeperation = 1;
          
          break;
        }
        if (rotationId == 1)
        {
          cols = 4;
          rows = 3;
          
          setShape(cols, rows);
              
          filled[0][0] = true;
          filled[1][0] = true;
          filled[2][0] = true;
          filled[3][0] = false;
          
          filled[0][1] = false;
          filled[1][1] = false;
          filled[2][1] = true;
          filled[3][1] = true;
          
          filled[0][2] = false;
          filled[1][2] = false;
          filled[2][2] = false;
          filled[3][2] = true;
          
          colsBeforeSeperation = 3;
          
          break;
        }
        if (rotationId == 2)
        {
          cols = 3;
          rows = 4;
          
          setShape(cols, rows);
            
          filled[0][0] = false;
          filled[1][0] = false;
          filled[2][0] = true;
          
          filled[0][1] = false;
          filled[1][1] = false;
          filled[2][1] = true;
          
          filled[0][2] = false;
          filled[1][2] = true;
          filled[2][2] = true;
          
          filled[0][3] = true;
          filled[1][3] = true;
          filled[2][3] = false;
          
          colsBeforeSeperation = 2;
          
          break;
        }
        if (rotationId == 3)
        {
          cols = 4;
          rows = 3;
          
          setShape(cols, rows);
              
          filled[0][0] = true;
          filled[1][0] = false;
          filled[2][0] = false;
          filled[3][0] = false;
          
          filled[0][1] = true;
          filled[1][1] = true;
          filled[2][1] = false;
          filled[3][1] = false;
          
          filled[0][2] = false;
          filled[1][2] = true;
          filled[2][2] = true;
          filled[3][2] = true;
          
          colsBeforeSeperation = 1;
          
          break;
        }
    
      case 6:
      
        cols = 2;
        rows = 4;
        
        setShape(cols, rows);
        
        if (rotationId == 0 || rotationId == 1 || rotationId == 4)
        {
          filled[0][0] = false;
          filled[1][0] = true;
        
          filled[0][1] = true;
          filled[1][1] = true;
          
          filled[0][2] = true;
          filled[1][2] = false;
          
          filled[0][3] = true;
          filled[1][3] = true;
        }
        else
        {
          filled[0][0] = true;
          filled[1][0] = true;
        
          filled[0][1] = false;
          filled[1][1] = true;
          
          filled[0][2] = true;
          filled[1][2] = true;
          
          filled[0][3] = true;
          filled[1][3] = false;
        }
        
        colsBeforeSeperation = 1;
        
        break;
    }
  }

}
class Layer {
  
  int cols;
  int rows;
  boolean[][] wall;
  
  PVector pos;
  int w;
  int h;
  
  int c;
  int cg;
  
  int index;
  
  PVector vel;
  PVector velVertex;
  
  ArrayList<PVector> vertices;
  
  Layer(float x_, float y_, int w_, int h_, int c_, float dirx_, int index_, int cg_) {
    
    index = index_;
    
    pos = new PVector(x_, y_);
    w = w_;
    h = h_;
    
    c = c_;
    cg = cg_;
    
    cols = w;
    rows = h;
    wall = new boolean[cols][rows];
    for (int i = 0; i < cols; i++)
    {
      for (int j = 0; j < rows; j++)
      {
        wall[i][j] = true;
      }
    }
    
    vel = new PVector(dirx_, 0);
    velVertex = new PVector(dirx_*board.squareWidth(), 0);

  }
  
  void shaper()
  {
    vertices = new ArrayList<PVector>();

    if (vel.x > 0)
    {
      addVertex(new PVector(pos.x*board.squareWidth(), pos.y*board.squareHeight()));
      addVertex(new PVector((pos.x+cols)*board.squareWidth(), pos.y*board.squareHeight()));
    
      for (int j = 0; j < rows; j++)
      {
        for (int i = cols-1; i >= 0; i--)
        {
          if (!wall[i][j])
          {
            int x = int(pos.x) + i;
            int y = int(pos.y) + j;

            boolean hasTopWall = wall[i][j-1];
          
            if (hasTopWall)
            {
              addVertex(new PVector((x+1) * board.squareWidth(), y * board.squareHeight()));
              addVertex(new PVector(x * board.squareWidth(), y * board.squareHeight()));
            }
          }
        }
        
        for (int i = 0; i < cols; i++)
        {
          if (!wall[i][j])
          {
            int x = int(pos.x) + i;
            int y = int(pos.y) + j;

            boolean hasBottomWall = wall[i][j+1];
          
            if (hasBottomWall)
            {
              addVertex(new PVector(x * board.squareWidth(), (y+1) * board.squareHeight()));
              addVertex(new PVector((x+1) * board.squareWidth(), (y+1) * board.squareHeight()));
            }
          }
        }
      }
      
      addVertex(new PVector((pos.x+cols)*board.squareWidth(), (pos.y+rows)*board.squareHeight()));
      addVertex(new PVector(pos.x*board.squareWidth(), (pos.y+rows)*board.squareHeight()));
    }
    else
    {
      addVertex(new PVector((pos.x+cols)*board.squareWidth(), pos.y*board.squareHeight()));
      addVertex(new PVector(pos.x*board.squareWidth(), pos.y*board.squareHeight()));

      for (int j = 0; j < rows; j++)
      {
        for (int i = 0; i < cols; i++)
        {
          if (!wall[i][j])
          {
            int x = int(pos.x) + i;
            int y = int(pos.y) + j;

            boolean hasTopWall = wall[i][j-1];
            
            if (hasTopWall)
            {
              addVertex(new PVector(x * board.squareWidth(), y * board.squareHeight()));
              addVertex(new PVector((x+1) * board.squareWidth(), y * board.squareHeight()));
            }
          }
        }
        
        for (int i = cols-1; i >= 0; i--)
        {
          if (!wall[i][j])
          {
            int x = int(pos.x) + i;
            int y = int(pos.y) + j;

            boolean hasBottomWall = wall[i][j+1];
            
            if (hasBottomWall)
            {
              addVertex(new PVector((x+1) * board.squareWidth(), (y+1) * board.squareHeight()));
              addVertex(new PVector(x * board.squareWidth(), (y+1) * board.squareHeight()));
            }
          }
        }
      }
      
      addVertex(new PVector(pos.x*board.squareWidth(), (pos.y+rows)*board.squareHeight()));
      addVertex(new PVector((pos.x+cols)*board.squareWidth(), (pos.y+rows)*board.squareHeight()));
    }
  }
  
  void step() {
    pos.add(vel);

    for (int i = 0; i < vertices.size(); i++)
    {
      PVector v = vertices.get(i);
      v.add(velVertex);
    }
  }
  
  void addVertex(PVector v)
  {
    if (!vertices.contains(v))
      vertices.add(v);
  }
  
  void display() {
    
    stroke(c);
    fill(255);
    beginShape();
    for (int i = 0; i < vertices.size(); i++)
    {
      PVector v = vertices.get(i);
      vertex(v.x, v.y);
    }
    endShape(CLOSE);
  }
  
  void display_solid() {
    
    stroke(76, 217, 100);
    fill(255);
    beginShape();
    for (int i = 0; i < vertices.size(); i++)
    {
      PVector v = vertices.get(i);
      vertex(v.x, v.y);
    }
    endShape(CLOSE);
  }
  
  void display_error() {
    
    stroke(255, 59, 48);
    fill(255);
    beginShape();
    for (int i = 0; i < vertices.size(); i++)
    {
      PVector v = vertices.get(i);
      vertex(v.x, v.y);
    }
    endShape(CLOSE);
  }

}
class LevelSelect {

  int w, h;
  PVector pos;
  int levelNo;
  boolean perfectScore;
  boolean won;
  
  boolean rollover;
  
  LevelSelect(int posX_, int posY_, int w_, int h_, int level_)
  {
    pos = new PVector(posX_, posY_);
    
    w = w_;
    h = h_;
    
    levelNo = level_;
    perfectScore = false;
    won = false;
    rollover = false;
  }
  
  void display()
  {
    if (won)
    {
      stroke(76, 217, 100);
      if (perfectScore)
        fill(76, 217, 100);
      else
        fill(255);
    }
    else if (rollover)
    {
      stroke(90, 200, 250);
      fill(255);
    }
    else
    {
      stroke(0);
      fill(255);
    }
    
    rect(pos.x, pos.y, w, h);
    
    if (won)
    {
      if (perfectScore)
        fill(255);
      else
        fill(76, 217, 100);
    }
    else
      fill(0);
    
    textFont(font22);
    text(str(levelNo), pos.x + 20, pos.y + 30); 
  }
  
  void press() {
    if (rollover) {
      currentLevel = this;
      startGame();
    }
  }
  
  void overRect(float mx, float my) 
  {
    if (mx >= pos.x && mx <= int(pos.x)+w && 
        my >= pos.y && my <= int(pos.y)+h) {
      rollover = true;
    } else {
      rollover = false;
    }
  }
  
  void rollover(float mx, float my) 
  {
    /*
    if (mx >= pos.x && mx <= int(pos.x)+w && 
        my >= pos.y && my <= int(pos.y)+h) {
      rollover = true;
    } else {
      rollover = false;
    }
    */
    rollover = false;
  }

  
}
class Pentomino extends Shape {
  
  Pentomino(int shapeType, int rotationId)
  {
    playerCount = 5;
    this.shapeType = shapeType;
    this.rotationId = rotationId;
    
    switch (shapeType)
    {
      case 1:
        if (rotationId == 0 || rotationId == 4)
        {
          cols = 3;
          rows = 3;
          
          setShape(cols, rows);
            
          filled[0][0] = false;
          filled[1][0] = true;
          filled[2][0] = true;
          
          filled[0][1] = true;
          filled[1][1] = true;
          filled[2][1] = false;
          
          filled[0][2] = false;
          filled[1][2] = true;
          filled[2][2] = false;
          
          colsBeforeSeperation = int(random(1, 3));
          
          break;
        }
        if (rotationId == 1)
        {
          cols = 3;
          rows = 3;
          
          setShape(cols, rows);
            
          filled[0][0] = false;
          filled[1][0] = true;
          filled[2][0] = false;
          
          filled[0][1] = true;
          filled[1][1] = true;
          filled[2][1] = true;
          
          filled[0][2] = false;
          filled[1][2] = false;
          filled[2][2] = true;
          
          colsBeforeSeperation = 2;
          
          break;
        }
        if (rotationId == 2)
        {
          cols = 3;
          rows = 3;
          
          setShape(cols, rows);
            
          filled[0][0] = false;
          filled[1][0] = true;
          filled[2][0] = false;
          
          filled[0][1] = false;
          filled[1][1] = true;
          filled[2][1] = true;
          
          filled[0][2] = true;
          filled[1][2] = true;
          filled[2][2] = false;
          
          colsBeforeSeperation = int(random(1, 3));
          
          break;
        }
        if (rotationId == 3)
        {
          cols = 3;
          rows = 3;
          
          setShape(cols, rows);
            
          filled[0][0] = true;
          filled[1][0] = false;
          filled[2][0] = false;
          
          filled[0][1] = true;
          filled[1][1] = true;
          filled[2][1] = true;
          
          filled[0][2] = false;
          filled[1][2] = true;
          filled[2][2] = false;
          
          colsBeforeSeperation = 1;
          
          break;
        }
      
      case 2:
        
        if (rotationId == 0 || rotationId == 4)
        {
          cols = 3;
          rows = 3;
          
          setShape(cols, rows);
            
          filled[0][0] = false;
          filled[1][0] = false;
          filled[2][0] = true;
          
          filled[0][1] = false;
          filled[1][1] = true;
          filled[2][1] = true;
          
          filled[0][2] = true;
          filled[1][2] = true;
          filled[2][2] = false;
          
          colsBeforeSeperation = 2;
          
          break;
        }
        if (rotationId == 1)
        {
          cols = 3;
          rows = 3;
          
          setShape(cols, rows);
            
          filled[0][0] = true;
          filled[1][0] = false;
          filled[2][0] = false;
          
          filled[0][1] = true;
          filled[1][1] = true;
          filled[2][1] = false;
          
          filled[0][2] = false;
          filled[1][2] = true;
          filled[2][2] = true;
          
          colsBeforeSeperation = 1;
          
          break;
        }
        if (rotationId == 2)
        {
          cols = 3;
          rows = 3;
          
          setShape(cols, rows);
            
          filled[0][0] = false;
          filled[1][0] = true;
          filled[2][0] = true;
          
          filled[0][1] = true;
          filled[1][1] = true;
          filled[2][1] = false;
          
          filled[0][2] = true;
          filled[1][2] = false;
          filled[2][2] = false;
          
          colsBeforeSeperation = 1; //int(random(1, 3));
          
          break;
        }
        if (rotationId == 3)
        {
          cols = 3;
          rows = 3;
          
          setShape(cols, rows);
            
          filled[0][0] = true;
          filled[1][0] = true;
          filled[2][0] = false;
          
          filled[0][1] = false;
          filled[1][1] = true;
          filled[2][1] = true;
          
          filled[0][2] = false;
          filled[1][2] = false;
          filled[2][2] = true;
          
          colsBeforeSeperation = 2;
          
          break;
        }
      
      case 3:
        
        if (rotationId == 0 || rotationId == 4)
        {
          cols = 2;
          rows = 3;
          
          setShape(cols, rows);
            
          filled[0][0] = true;
          filled[1][0] = true;
          
          filled[0][1] = true;
          filled[1][1] = true;
          
          filled[0][2] = true;
          filled[1][2] = false;
          
          colsBeforeSeperation = 1;
          
          break;
        }
        if (rotationId == 1)
        {
          cols = 3;
          rows = 2;
          
          setShape(cols, rows);
            
          filled[0][0] = true;
          filled[1][0] = true;
          filled[2][0] = true;
          
          filled[0][1] = false;
          filled[1][1] = true;
          filled[2][1] = true;
          
          colsBeforeSeperation = int(random(1, 3));
          
          break;
        }
        if (rotationId == 2)
        {
          cols = 2;
          rows = 3;
          
          setShape(cols, rows);
            
          filled[0][0] = false;
          filled[1][0] = true;
          
          filled[0][1] = true;
          filled[1][1] = true;
          
          filled[0][2] = true;
          filled[1][2] = true;
          
          colsBeforeSeperation = 1;
          
          break;
        }
        if (rotationId == 3)
        {
          cols = 3;
          rows = 2;
          
          setShape(cols, rows);
            
          filled[0][0] = true;
          filled[1][0] = true;
          filled[2][0] = false;
          
          filled[0][1] = true;
          filled[1][1] = true;
          filled[2][1] = true;
          
          colsBeforeSeperation = int(random(1, 3));
          
          break;
        }
        
      case 4:
        
        if (rotationId == 0 || rotationId == 4)
        {
          cols = 3;
          rows = 3;
          
          setShape(cols, rows);
            
          filled[0][0] = false;
          filled[1][0] = false;
          filled[2][0] = true;
          
          filled[0][1] = false;
          filled[1][1] = false;
          filled[2][1] = true;
          
          filled[0][2] = true;
          filled[1][2] = true;
          filled[2][2] = true;
          
          colsBeforeSeperation = 2;
          
          break;
        }
        if (rotationId == 1)
        {
          cols = 3;
          rows = 3;
          
          setShape(cols, rows);
            
          filled[0][0] = true;
          filled[1][0] = false;
          filled[2][0] = false;
          
          filled[0][1] = true;
          filled[1][1] = false;
          filled[2][1] = false;
          
          filled[0][2] = true;
          filled[1][2] = true;
          filled[2][2] = true;
          
          colsBeforeSeperation = 1;
          
          break;
        }
        if (rotationId == 2)
        {
          cols = 3;
          rows = 3;
          
          setShape(cols, rows);
            
          filled[0][0] = true;
          filled[1][0] = true;
          filled[2][0] = true;
          
          filled[0][1] = true;
          filled[1][1] = false;
          filled[2][1] = false;
          
          filled[0][2] = true;
          filled[1][2] = false;
          filled[2][2] = false;
          
          colsBeforeSeperation = 1;
          
          break;
        }
        if (rotationId == 3)
        {
          cols = 3;
          rows = 3;
          
          setShape(cols, rows);
            
          filled[0][0] = true;
          filled[1][0] = true;
          filled[2][0] = true;
          
          filled[0][1] = false;
          filled[1][1] = false;
          filled[2][1] = true;
          
          filled[0][2] = false;
          filled[1][2] = false;
          filled[2][2] = true;
          
          colsBeforeSeperation = 2;
          
          break;
        }
    
      case 5:
        
        cols = 2;
        rows = 3;
        
        setShape(cols, rows);
          
        filled[0][0] = true;
        filled[1][0] = true;
        
        if (rotationId == 0 || rotationId == 1 || rotationId == 4)
        {
          filled[0][1] = true;
          filled[1][1] = false;
        }
        else
        {
          filled[0][1] = false;
          filled[1][1] = true;
        }
        
        filled[0][2] = true;
        filled[1][2] = true;
        
        colsBeforeSeperation = 1;
        
        break;
    }
  }

}
class Player {
  
  int w, h;
  int wa, ha;
  
  PVector pos;
  PVector origin;
  PVector offset;
  
  int cols;
  int rows;
  boolean[][] wall;
  
  boolean rollover = false;
  boolean dragging = false;
  
  int c = 0;
  
  int id;
  
  PVector d;
  
  Player(int posX_, int posY_, int w_, int h_, int id_, int c_) {
    
    rollover = false;
    dragging = false;
    
    c = 0;
    
    id = id_;
    
    w = w_;
    h = h_;
    
    wa = w_;
    ha = h_;
    
    c = c_;
    
    pos = new PVector(posX_, posY_);
    origin = new PVector(posX_, posY_);
    
    // Blocks
    cols = w;
    rows = h;
    wall = new boolean[cols][rows];
    
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        wall[i][j] = true;
      }
    }
    
    offset = new PVector(0, 0);
    
    d = new PVector(pos.x, pos.y);
  }
  
  void press(int mx, int my) {
    PVector m = new PVector(mx, my);
    if (m.x == pos.x && m.y == pos.y) {
      dragging = true;
      // If so, keep track of relative location of click to corner of rectangle
      /*
      offset.x = pos.x - m.x;
      offset.y = pos.y - m.y;
      */
    }
  }

  void overRect(int mx, int my) {
    PVector m = new PVector(mx, my);
    if (m.x == pos.x && m.y == pos.y) {
      rollover = true;
    } else {
      rollover = false;
      //dragging = false;
    }
  }
  
  void drag(int mx, int my) 
  {
    PVector m = new PVector(mx, my);
    if (dragging) 
    {  
      // previous location
      origin = new PVector(pos.x, pos.y);
    
      pos.x = m.x;// + offset.x;
      pos.y = m.y;// + offset.y;
    }
  }
  
  void release(ArrayList<Player> players, PVector startDrag) {

    if (dragging)
    {
      for (int i = 0; i < players.size(); i++)
      {
        Player p = players.get(i);
        if (p != this)
        {
          if (p.pos.x == pos.x && p.pos.y == pos.y)
          {
            // swap posistion
            p.pos.x = startDrag.x;
            p.pos.y = startDrag.y;
          }
        }
      }
    }
    
    dragging = false;
  }
  
  boolean overlapWithLayer(Layer layer)
  {
    for (int i = 0; i < layer.cols; i++)
    {
      for (int j = 0; j < layer.rows; j++)
      {
        if (layer.wall[i][j])
        {
          if (pos.x == (layer.pos.x + i) && pos.y == (layer.pos.y + j))
          {
            return true;
          }
        }
      }
    }
    
    return false;
  }
  
  void display() {
    
    // overlap
    boolean isOverlap = overlapWithLayer(eastLayer) || overlapWithLayer(westLayer);
    
    stroke(255);
    if (isOverlap)
    {
      fill(255, 59, 48);
    }
    else
    {
      fill(c);
    }

    for (int i = 0; i < cols; i++)
    {
      for (int j = 0; j < rows; j++)
      {
        int x = int(pos.x) + i;
        int y = int(pos.y) + j;
        if (wall[i][j])
        {
          rect(x*board.squareWidth(), y*board.squareHeight(), board.squareWidth(), board.squareHeight());
          
          if (rollover)
          {
            stroke(255);
            noFill();
            rect(x*board.squareWidth()+5, y*board.squareHeight()+5, board.squareWidth()-10, board.squareHeight()-10);
          }
        }
      }
    }
  }
  
  void display_solid() {
    
    stroke(76, 217, 100);
    fill(255);

    for (int i = 0; i < cols; i++)
    {
      for (int j = 0; j < rows; j++)
      {
        int x = int(pos.x) + i;
        int y = int(pos.y) + j;
        if (wall[i][j])
          rect(x*board.squareWidth(), y*board.squareHeight(), board.squareWidth(), board.squareHeight());
      }
    }
  }
  
  void display_error() {
    
    // overlap
    boolean isOverlap = overlapWithLayer(eastLayer) || overlapWithLayer(westLayer);
    
    if (isOverlap)
    {
      stroke(255, 59, 48);
      fill(255, 59, 48, 100);
    }
    else
    {
      stroke(255, 59, 48);
      fill(255);
    }

    for (int i = 0; i < cols; i++)
    {
      for (int j = 0; j < rows; j++)
      {
        int x = int(pos.x) + i;
        int y = int(pos.y) + j;
        if (wall[i][j])
          rect(x*board.squareWidth(), y*board.squareHeight(), board.squareWidth(), board.squareHeight());
      }
    }
  }
}
class Shape {
  
  int playerCount = 0;
  int shapeType;
  int rotationId;
  
  // rotation
  int degrees_0 = 0;
  int degrees_90 = 1;
  int degrees_180 = 2;
  int degrees_270 = 3;
  int degrees_360 = 4;
  
  int cols;
  int rows;
  
  boolean[][] filled;
  
  int colsBeforeSeperation = 0;
  
  Shape() {
    degrees_0 = 0;
    degrees_90 = 1;
    degrees_180 = 2;
    degrees_270 = 3;
    degrees_360 = 4;
  
    playerCount = 0;
    colsBeforeSeperation = 0;
  }
  
  void setShape(int cols, int rows) {
    
    filled = new boolean[cols][rows];
    
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        filled[i][j] = false;
      }
    }
    
  }

}
class Tetromino extends Shape {

  // kind of shapes
  int TETROMINO_O = 1;
  int TETROMINO_Z = 2;
  int TETROMINO_T = 3;
  int TETROMINO_L = 4;
  
  Tetromino(int shapeType, int rotationId) 
  {
    TETROMINO_O = 1;
    TETROMINO_Z = 2;
    TETROMINO_T = 3;
    TETROMINO_L = 4;
  
    playerCount = 4;
    this.shapeType = shapeType;
    this.rotationId = rotationId;
    
    switch (shapeType) {
      case 1:
        cols = 2;
        rows = 2;
        
        setShape(cols, rows);
          
        filled[0][0] = true;
        filled[1][0] = true;
        filled[0][1] = true;
        filled[1][1] = true;
        
        colsBeforeSeperation = 1;//int(random(0, 2));
        
        break;
      case 2:
        if (rotationId == degrees_0 || rotationId == degrees_180 || rotationId == degrees_360)
        {
          cols = 3;
          rows = 2;
          
          setShape(cols, rows);
          
          filled[0][0] = true;
          filled[1][0] = true;
          filled[2][0] = false;
          filled[0][1] = false;
          filled[1][1] = true;
          filled[2][1] = true;
          
          colsBeforeSeperation = int(random(1, 3));
        }
        if (rotationId == degrees_90 || rotationId == degrees_270)
        {
          cols = 2;
          rows = 3;
          
          setShape(cols, rows);
          
          filled[0][0] = false;
          filled[1][0] = true;
          filled[0][1] = true;
          filled[1][1] = true;
          filled[0][2] = true;
          filled[1][2] = false;
          
          colsBeforeSeperation = 1;
        }
        
        break;
      case 3:
        if (rotationId == degrees_0 || rotationId == degrees_360)
        {
          cols = 3;
          rows = 2;
          
          setShape(cols, rows);
          
          filled[0][0] = false;
          filled[1][0] = true;
          filled[2][0] = false;
          filled[0][1] = true;
          filled[1][1] = true;
          filled[2][1] = true;
          
          colsBeforeSeperation = int(random(1, 3));
        }
        if (rotationId == degrees_90)
        {
          cols = 2;
          rows = 3;
          
          setShape(cols, rows);
          
          filled[0][0] = true;
          filled[1][0] = false;
          filled[0][1] = true;
          filled[1][1] = true;
          filled[0][2] = true;
          filled[1][2] = false;
          
          colsBeforeSeperation = 1; //int(random(0, 2));
        }
        if (rotationId == degrees_180)
        {
          cols = 3;
          rows = 2;
          
          setShape(cols, rows);
          
          filled[0][0] = true;
          filled[1][0] = true;
          filled[2][0] = true;
          filled[0][1] = false;
          filled[1][1] = true;
          filled[2][1] = false;
          
          colsBeforeSeperation = int(random(1, 3));
        }
        if (rotationId == degrees_270)
        {
          cols = 2;
          rows = 3;
          
          setShape(cols, rows);
          
          filled[0][0] = false;
          filled[1][0] = true;
          filled[0][1] = true;
          filled[1][1] = true;
          filled[0][2] = false;
          filled[1][2] = true;
          
          colsBeforeSeperation = 1; //int(random(1, 3));
        }
        break;
      case 4:
        if (rotationId == degrees_0 || rotationId == degrees_360)
        {
          cols = 2;
          rows = 3;
          
          setShape(cols, rows);
          
          filled[0][0] = true;
          filled[1][0] = false;
          filled[0][1] = true;
          filled[1][1] = false;
          filled[0][2] = true;
          filled[1][2] = true;
          
          colsBeforeSeperation = 1; //int(random(0, 2));
        }
        if (rotationId == degrees_90)
        {
          cols = 3;
          rows = 2;
          
          setShape(cols, rows);
          
          filled[0][0] = true;
          filled[1][0] = true;
          filled[2][0] = true;
          filled[0][1] = true;
          filled[1][1] = false;
          filled[2][1] = false;
          
          colsBeforeSeperation = 1; //int(random(0, 2));
        }
        if (rotationId == degrees_180)
        {
          cols = 2;
          rows = 3;
          
          setShape(cols, rows);
          
          filled[0][0] = true;
          filled[1][1] = true;
          filled[0][2] = false;
          filled[1][0] = true;
          filled[0][1] = false;
          filled[1][2] = true;
          
          colsBeforeSeperation = int(random(1, 3));
        }
        if (rotationId == degrees_270)
        {
          cols = 3;
          rows = 2;
          
          setShape(cols, rows);
          
          filled[0][0] = false;
          filled[1][0] = false;
          filled[2][0] = true;
          filled[0][1] = true;
          filled[1][1] = true;
          filled[2][1] = true;
          
          colsBeforeSeperation = 2; //int(random(2, 4));
        }
        break;
    }
    
  }
  
  void setShape(int cols, int rows) {
    
    filled = new boolean[cols][rows];
    
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        filled[i][j] = false;
      }
    }
    
  }

}


