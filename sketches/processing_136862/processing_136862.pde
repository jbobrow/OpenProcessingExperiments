
/**
    AC21010.4 Game
    Authors: Todd Harding, Will Neal, Sondai Smith, Adam Brown
     
    Description:
    Game Of Simon

**/
 


void setup() 
{
  size(640, 480);
  tileWidth = ((width/dimension) - (2 * padding));
  tileHeight = ((height/dimension) - (2 * padding));
  tiles = new ArrayList<Tile>();
  colors = new color[] {color(intensity, 0 , 0, alpha), color(0, intensity, 0, alpha), color(0, 0, intensity, alpha), color(intensity, intensity, 0, alpha)};
  flashColors = new color[] {color(255, 0, 0, alpha), color(0, 255, 0, alpha), color(0, 0, 255, alpha), color(255, 255, 0, alpha)}; 
  CreateMainMenu();
}

void draw() 
{
  ClearBG();
  switch(mode)
  {
    case MENU:
    {
      DrawMainMenu();
    }
    break;
    case GAME:
    {
      UpdateGame();
      DrawAllTiles();
      if(turnTimer > 0)
      {
        allowInput = false;
        fill(255);
        textSize(txtSize);
        text(turnTimer/1000 + 1, width/4, height/4);
      }
      else
      {
        allowInput = true;
      }
    }
    break;
  }
}

void mousePressed() 
{
  switch(mode)
  {
    case MENU:
    {
      HandleMenuInput();
    }
    break;
    case GAME:
    {
      HandleGameInput();
    }
    break;
  }
}
interface IButton
{
  void OnClick();
}

interface ICommand
{
  void Execute();
}

class Button implements IButton
{
  public boolean isMouseOver = false;
  public String text;
  public Rectangle bgGraphic;
  float xPos;
  float yPos;
  
  public ICommand command;
  
  public void OnClick()
  {
    if(command != null)
    {
      command.Execute();
    }
    else
            println("Null Command");
  }
}

class StartNewGameCommand implements ICommand
{
  void Execute()
  {
    ResetGameState();
    mode = GAME;
    println("New Game Command Executed");
  }
}
/////////////////////////////////////
// This File is evil
// and should be destroyed
// (but it won't)
/////////////////////////////////////

// Constants
final int turnTime = 3000;
final int intensity = 100;
final int startSequenceLength = 2;
// GRR Processing does not support enums
final int MENU = 0;
final int GAME = 1;
final int WIN = 2;
final int txtSize = 32;

// Variables
float tileWidth = 50;
float tileHeight = 50;
float padding = 8;
int mode = MENU;
int dimension = 2;
int currentSequenceLength = startSequenceLength;
int winSequenceLength = 10;
int alpha=255;
int turnTimer = turnTime;
int lastMillis = 0;
int delta = 0;
boolean allowInput = true;

String menuMessage = "Press New Game";

ArrayList<Tile> tiles;
ArrayList<Tile> sequence;
ArrayList<Tile> currentSequence;
ArrayList<Tile> flashSequence;
Tile currentFlashedTile;
Tile selectedTile = null;

ArrayList<Button> menuButtons;

color[] colors;
color[] flashColors;
Button newGameButton;
void CreateMainMenu()
{
  menuButtons = new ArrayList<Button>();
  newGameButton = new Button();
  newGameButton.text = "New Game";
  newGameButton.xPos = width/3 + padding;
  newGameButton.yPos = height/3 + txtSize + padding;
  Tile t = new Tile();
  t.c = GetColorIndex(0);
  t.tc = colors[t.c];
  t.position = new PVector(width/3, height/3);
  newGameButton.bgGraphic = t;
  StartNewGameCommand command = new StartNewGameCommand();
  newGameButton.command = command;
  menuButtons.add(newGameButton);
}

void ResetGameState()
{
  turnTimer = turnTime;
  CreateTiles();
  GenerateSequences();
  currentSequenceLength = startSequenceLength;
  currentFlashedTile = null;
}

void ClearBG()
{
  background(0);
}

void DrawAllTiles()
{
  for (Tile t : tiles)
  {
    DrawTile(t);
  }
}

int GetColorIndex(int i)
{
  return i % colors.length;
}

void DrawMainMenu()
{
  UpdateTime();
  textSize(txtSize);
  text(menuMessage, padding + txtSize, padding + txtSize);
  for(Button b : menuButtons)
  {
    DrawButton(b);
  }
}

void DrawButton(Button b)
{
  if(b.bgGraphic != null)
  {
    fill(b.bgGraphic.tc);
    rect(b.bgGraphic.position.x, b.bgGraphic.position.y, tileWidth, tileHeight);
  }
  if(b.text != null)
  {
    fill(255);
    textSize(txtSize);
    text(b.text, b.xPos, b.yPos);
  }
}

void CreateTiles()
{
    tiles = new ArrayList<Tile>();
  for (int y = 0; y < dimension; y++)
  {
    for (int x = 0; x < dimension; x++)
    {
      Tile t = new Tile();
      t.c = GetColorIndex(x + (y * dimension));
      t.tc = colors[t.c];
      t.position = new PVector( padding + x * (width/dimension), padding + y * (height/dimension));
      tiles.add(t);
    }
  }
}

void UpdateTime()
{
  turnTimer -= delta;
  delta = millis() - lastMillis;
  lastMillis = millis();
}

void DrawTile(Tile t)
{
  fill(t.tc);
  rect(t.position.x, t.position.y, tileWidth, tileHeight);
}

void UpdateFlashSequence()
{
  if(currentFlashedTile != null && currentFlashedTile.isFlashed == false) //<>//
  {
    currentFlashedTile = null;
  }
  
  if(!flashSequence.isEmpty() && currentFlashedTile == null && turnTimer <= 0)
  {
    currentFlashedTile = flashSequence.get(0);
    currentFlashedTile.flash();
    flashSequence.remove(currentFlashedTile);
  }
}

void UpdateGame()
{
  UpdateFlashSequence();
  UpdateTime();
  for(Tile t : tiles)
  {
    t.update();
    if(isOverTile(t))
    {
      t.isMouseOver = true;
    }
    else
    {
      t.isMouseOver = false;
    }
  }
}

void UpdateMenu()
{
  for(Button b : menuButtons)
  {
    if(isOverTile(b.bgGraphic))
    {
      b.bgGraphic.isMouseOver = true;
    }
    else
    {
      b.bgGraphic.isMouseOver = false;
    }
  }
}

boolean isOverTile(Rectangle tile)
{
  return isOver(tile.position.x, tile.position.y, mouseX, mouseY, tileWidth, tileHeight);
}

boolean isOver(float x, float y, float mx, float my, float _width, float _height)
{
  if(mx >= x && mx <= x + _width &&
    my >= y && my <= y + _height)
    return true;
   else
     return false;
}

void HandleMenuInput()
{
  for(Button b : menuButtons)
  {
    if(isOverTile(b.bgGraphic))
    {
      b.OnClick();
    }
  }
}

void HandleGameInput()
{
  if(allowInput)
  {
    if(!currentSequence.isEmpty())
    {
      for(Tile t : tiles)
      {
        if(isOverTile(t))
        {
          t.OnClick();
        }
      }
      if(isOverTile(currentSequence.get(0)))
      {
        CorrectTilePressed();
      }
      else
      {
        println("wrong");
        IncorrectTilePressed();
      }
    }
    else
    {
      println("sequence is empty");
    }
  }
}

void CorrectTilePressed()
{
  println("correct");
  currentSequence.remove(currentSequence.get(0));
  if(currentSequence.isEmpty())
  {
    currentSequenceLength++;
    if(currentSequenceLength == winSequenceLength)
    {
      menuMessage = "You Win";
      mode = MENU;
    }
    else
    {
      turnTimer = turnTime;
      IterateSequence();
    }
  }
}

void IncorrectTilePressed()
{
    //GenerateSequences();
    menuMessage = "You Lose";
    turnTimer = turnTime;
    mode = MENU;
}

void ResetCurrentSequence()
{
  currentSequence = CopyTileArray(sequence);
}

ArrayList<Tile> CopyTileArray(ArrayList<Tile> src)
{
  ArrayList<Tile> dst;
  dst = new ArrayList<Tile>();
  for(Tile t : src)
  {
    dst.add(t);
  }
  return dst;
}

void GenerateSequences()
{
  currentSequenceLength = startSequenceLength;
  sequence = new ArrayList<Tile>();
  flashSequence = new ArrayList<Tile>();
  currentSequence = new ArrayList<Tile>();
  print("Sequence: ");
  for(int i = 0; i < currentSequenceLength; i++)
  {
    int index = (int)random(dimension * dimension);
    sequence.add(tiles.get(index));
    flashSequence.add(tiles.get(index));
    currentSequence.add(tiles.get(index));
    print(index + 1 + " ");
  }
}

void IterateSequence()
{
  int index = (int)random(dimension * dimension);
  sequence.add(tiles.get(index));
  print(index + 1 + " ");
  currentSequence = new ArrayList<Tile>();
  flashSequence = new ArrayList<Tile>();
  for(Tile t : sequence)
  {
    currentSequence.add(t);
    flashSequence.add(t);
  }
}
class Rectangle
{
  final private float flashTimePerFrame = 0.025f;
  final private float flashTime = 1.0f;
  public PVector position;
  int c;
  boolean isMouseOver = false;
  boolean isFlashed = false;
  color tc;
  private float flashTimer = 0;
  
  public void flash()
  {
    flashTimer = flashTime;
    isFlashed = true;
  }
  
  public void update()
  {
    if(isFlashed && flashTimer > 0)
    {
      tc = lerpColor(colors[c], flashColors[c], flashTimer * 1.0f);
      flashTimer -= flashTimePerFrame;
    }
    else
    {
      isFlashed = false;
      tc = colors[c];
    }
  }
}

class Tile extends Rectangle
{
  void OnClick()
  {
    flash();
  }
}


