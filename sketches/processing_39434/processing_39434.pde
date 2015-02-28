

/*      Title    : Game of life GenerationsX
        Synopsis : Small game with algorithm, Self replicating, can still die out.
        Author   : Michael Hawthorne
        Date     : 24/09/2011
        Version  : 1.0
        Changelog: Tidy code, fix algo, stats on screen. Generations added by colour coding, blue new born, green generation 2, red generation 3 and over.
       3rd generations or over now only get a demotion when they are meant to die, but they still die if they have more than 3 neighbours because there is more of a challenge to their kingness.
        if a spot has been red for 20 generations, that makes him a king and he can spawn a level 1 yellow spot at a random location 2 spaces from his location, means the society can self replicate
        by selected people. Regeneration zone added, outside this zone kings die and take their immediate colony with them, included filewriter for logging purposes, graphdata looks better with averages over a period of time.
        
        
*/

int births;
int deaths;
int alive;
int generation;
int rred;
int ggreen;
int yyellow;
PFont statfont;
int TempVar;
BoardManager Game = new BoardManager();
//PrintWriter ExcelGraphData;

ImageButtons Reset_Button;

void setup()
{
  size(400,450);
  background(0);
  statfont = loadFont("ArialNarrow-Bold-20.vlw"); 
  smooth();
  PImage Reset_Base = loadImage("reset.png");
  PImage Reset_Over = loadImage("resetover.png");
  PImage Reset_Pressed = loadImage("resetpressed.png");
  
  int xImage = 135;
  int yImage = 427;
  int w = 50;
  int h = 20;
  Reset_Button = new ImageButtons(xImage, yImage, w, h, Reset_Base, Reset_Over, Reset_Pressed);
  //ExcelGraphData = createWriter("ExcelGraphData.csv");
  //ExcelGraphData.print("Births" + "," + "Deaths" + "," + "Alive" + " ," + "Yellow" + " ," + "Green" + "," + "Red" + "\n");
}


void draw()
{
 
  int TempAliveValue = 0;
  background(0);
  textFont(statfont, 11);
  text("Births : ", 8,423);text(Game.getbirths(), 47,423);text("Deaths : ", 135,423);text(Game.getdeaths(), 175,423);text("Alive: ", 255,423);text(Game.getalive(), 287,423);text("Gen: ", 315,423);text(Game.getgen(), 340,423);
  //alive=0;
  stroke(255,255,200);
  strokeWeight(0.5);
  line(0,405,400,405);
  line(100,100,300,100);
  line(100,100,100,300);
  line(300,100,300,300);
  line(100,300,300,300);
  Reset_Button.update();
  Reset_Button.display();
  

  
  for(int i = 0; i < 320; i++)
  {
    for(int j = 0; j < 320; j++)
    {  
      TempVar = Game.GetBoardValue(i,j);
      
      if(Game.GetBoardValue(i,j) > 0)
      {
        TempAliveValue++;
         if(Game.checkNeighbours(i,j) < 2)
         {
             Game.SetBoardValue(i,j,0);
             Game.adddeaths(1);//Game.GetBoardValue(i,j));
         }else if(Game.checkNeighbours(i,j) == 2 || Game.checkNeighbours(i,j) == 3){
                  Game.SetBoardValue(i,j,Game.GetBoardValue(i,j) + 1);
         }else if(Game.checkNeighbours(i,j) > 3){
                   Game.SetBoardValue(i,j,0);
                   Game.adddeaths(1);
         }      
         
      }
      if(TempVar == 0)
      {
         if(Game.checkNeighbours(i,j) == 3)
         {
           Game.SetBoardValue(i,j,1);
           Game.addbirths(1);  
         }      
      }
      if(Game.GetBoardValue(i,j) > 100 && Game.GetBoardValue(i,j) <= 200 && i > 80 && i < 240 && j > 80 && j < 240)
          {
            Game.SetBoardValue(i+(int)random(-2,2),j+(int)random(-2,2),1);
            Game.addbirths(1);
          }
      if(Game.GetBoardValue(i,j) > 200)
         {
           Game.SetBoardValue(i,j,0);
         }    
    }
  }
  Game.addalive(TempAliveValue);
  int greenCT = 0, redCT = 0, yellowCT = 0;
  for(int p = 0; p < 320; p++)
  {
    for(int m = 0; m < 320; m++)
    {
      if(Game.GetFutureBoardValue(p,m) > 0 && Game.GetFutureBoardValue(p,m) <= 3)
      {
        strokeWeight(0.5);
        stroke((int)random(7,100),(int)random(7,100),(int)random(7,100));
        ellipse((p*1.25),(m*1.25), 1,1);
        yellowCT += 1;
      } else if(Game.GetFutureBoardValue(p,m) > 4 && Game.GetFutureBoardValue(p,m) <= 80)
      {
        strokeWeight(1);
        stroke(10,(int)random(200,225),10);
        ellipse((p*1.25),(m*1.25), 1, 1);
        greenCT += 1;
      } else if(Game.GetFutureBoardValue(p,m) > 80)
      {
        strokeWeight(1.2);
        stroke(255,10,10);
        ellipse((p*1.25),(m*1.25), 2, 2);
        redCT += 1;
      }
    }
  }
  Game.addredcount(redCT);
  Game.addgreencount(greenCT);
  Game.addyellowcount(yellowCT);
  strokeWeight(1.6);
  textFont(statfont, 10);
  stroke((int)random(7,30),(int)random(7,30),(int)random(7,30));
  ellipse((1*3)+4,438, 4,4);text(" : ", 13,441); text(Game.getyellowcount(), 23, 441);
  
  strokeWeight(1.2);
  stroke(10,(int)random(200,225),10);
  ellipse((10*5),438, 2.5, 2.5);
  text(" : ", 56,441); text(Game.getgreencount(), 68, 441);
  
  strokeWeight(1.5);
  stroke(255,10,10);
  ellipse((18*5)+2,438, 3.5, 3.5);
  text(" : ", 18*5+6,441); text(Game.getredcount(), 108, 441);
  
  alive+=Game.getalive();
  births+=Game.getbirths();
  deaths+=Game.getdeaths();
  rred+=Game.getredcount();
  yyellow+=Game.getyellowcount();
  ggreen+=Game.getgreencount();
  
  Game.FlipBoards();
  Game.incgen(1);
  if(Game.getgen() % 10 == 0)
  {
    //ExcelGraphData.print(births / 10 + " ," + deaths/10 + " ," + alive/10 + " ," + yyellow/10 + " ," + ggreen/10 + "," + rred/10 + "\n");
    //ExcelGraphData.flush(); 
    alive=0;
    births=0;
    deaths=0;
    rred=0;
    yyellow=0;
    ggreen=0;
  }
}

class BoardManager
{
  int MAXSIZE;
  int [][] BoardPresent;
  int [][] BoardFuture;
  int births;
  int deaths;
  int generation;
  int alive;
  int redcount;
  int greencount;
  int yellowcount;
  
  int NeighbourCount;
  

  public BoardManager()
  {
    MAXSIZE = 320;
    BoardPresent = new int [MAXSIZE][MAXSIZE];
    BoardFuture = new int [MAXSIZE][MAXSIZE];
    for(int i = 0; i < MAXSIZE; i++)
    {
      for(int j = 0; j < MAXSIZE; j++)
      {
         BoardPresent[i][j] = 0;
         BoardFuture[i][j] = 0;
      }
    }
    setRandomseed();    
  }
  ///////
  void addbirths(int a)
  {
    births += a;
  }
  int getbirths()
  {
    return births;
  }
  
  void adddeaths(int a)
  {
    deaths += a;
  }
  int getdeaths()
  {
    return deaths;
  }
  
  void incgen(int a)
  {
    generation += 1;
  }
  int getgen()
  {
    return generation;
  }
  
  void addalive(int a)
  {
    if(a == 999)
    {
      alive = 0;
    }
    else alive = a;
  }
  int getalive()
  {
    return alive;
  }
  
  
  //////
  
  //////
  
  void addredcount(int a)
  {
    redcount = a;
  }
  int getredcount()
  {
    return redcount;
  }
  void addgreencount(int a)
  {
    greencount = a;
  }
  int getgreencount()
  {
    return greencount;
  }
  void addyellowcount(int a)
  {
    yellowcount = a;
  }
  int getyellowcount()
  {
    return yellowcount;
  }
  
  int checkNeighbours(int x, int y)
  {
    NeighbourCount = 0;
    int xnegitive = x-1;
    int xpositive = x+1;
    int ynegitive = y-1;
    int ypositive = y+1;
    
    if(xnegitive < 0)
    {
      xnegitive = 319;
    }
    if(xpositive > 319)
    {
      xpositive = 0;
    }   
    if(ynegitive < 0)
    {
      ynegitive = 319;
    }
    if(ypositive > 319)
    {
      ypositive = 0;
    }
   
    if(BoardPresent[xnegitive][y] > 0){NeighbourCount++;}
    if(BoardPresent[xpositive][y] > 0){NeighbourCount++;}
    if(BoardPresent[x][ypositive] > 0){NeighbourCount++;}
    if(BoardPresent[x][ynegitive] > 0){NeighbourCount++;}
    
    if(BoardPresent[xpositive][ynegitive] > 0){NeighbourCount++;}
    if(BoardPresent[xpositive][ypositive] > 0){NeighbourCount++;}
    if(BoardPresent[xnegitive][ynegitive] > 0){NeighbourCount++;}
    if(BoardPresent[xnegitive][ypositive] > 0){NeighbourCount++;}
    return NeighbourCount;
  }
  
  void SetBoardValue(int x, int y, int value)
  {
    BoardFuture[x][y] = value;
  }
  void SetPresentBoardValue(int x, int y, int value)
  {
    BoardPresent[x][y] = value;  
  }
  
  int GetBoardValue(int xi, int yi)
  {
    return BoardPresent[xi][yi];
  }
  int GetFutureBoardValue(int xi, int yi)
  {
    return BoardFuture[xi][yi];
  }
  
  void FlipBoards()
  {
    for(int i = 0; i < MAXSIZE; i++)
    {
      for(int j = 0; j < MAXSIZE; j++)
      {
         BoardPresent[i][j] = BoardFuture[i][j];
         BoardFuture[i][j] = 0;
      }
    }
  }
  
  void setRandomseed()
  {
    BoardPresent[160][160] = 60;
    BoardPresent[161][161] = 60;
    BoardPresent[(int)random(150,160)][(int)random(150,160)] = 20;
    BoardPresent[(int)random(150,160)][(int)random(150,160)] = 20;
    BoardPresent[(int)random(150,160)][(int)random(150,160)] = 50;
    BoardPresent[(int)random(150,160)][(int)random(150,160)] = 50;
    BoardPresent[(int)random(150,160)][(int)random(150,160)] = 50;
    BoardPresent[(int)random(150,160)][(int)random(150,160)] = 5;
    BoardPresent[(int)random(150,160)][(int)random(150,160)] = 20;
    BoardPresent[(int)random(150,160)][(int)random(150,160)] = 20;
    BoardPresent[(int)random(150,160)][(int)random(150,160)] = 50;
    BoardPresent[(int)random(150,160)][(int)random(150,160)] = 50;
    BoardPresent[(int)random(150,160)][(int)random(150,160)] = 50;
    BoardPresent[(int)random(150,160)][(int)random(150,160)] = 5;
    BoardPresent[(int)random(150,160)][(int)random(150,160)] = 20;
    BoardPresent[(int)random(150,160)][(int)random(150,160)] = 20;
    BoardPresent[(int)random(150,160)][(int)random(150,160)] = 50;
    
  }
  
  void reset_board()
  {
    for(int i = 0; i < MAXSIZE; i++)
    {
      for(int j = 0; j < MAXSIZE; j++)
      {
         BoardPresent[i][j] = 0;
         BoardFuture[i][j] = 0;
      }
    }
    births = 0;
    deaths = 0;
    generation = 0;
    alive = 0;
    redcount = 0;
    greencount = 0;
    yellowcount = 0;
    setRandomseed(); 
  }
    
};
//Button Class from processing website, discarded everything I didnt need, extended Board_manager and passed the instance of Game to pressed.

class Button 
{
  int x, y;    
  int w, h;
  
  boolean over = false;
  boolean pressed = false; 
  
  void pressed(BoardManager Game) {
    if(over && mousePressed) {
      pressed = true;
      Game.reset_board();
    } else {
      pressed = false;
    }
  }    
      
  boolean overRect(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
};

class ImageButtons extends Button 
{
  PImage base;
  PImage roll;
  PImage down;
  PImage currentimage;

  ImageButtons(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll, PImage idown) 
  {
    x = ix;
    y = iy;
    w = iw;
    h = ih;
    base = ibase;
    roll = iroll;
    down = idown;
    currentimage = base;
  }
  
  void update() 
  {
    over();
    pressed(Game);
    if(pressed) {
      currentimage = down;
            
    } else if (over){
      currentimage = roll;
    } else {
      currentimage = base;
    }
  }
  
  void over() 
  {
    if( overRect(x, y, w, h) ) {
      over = true;
    } else {
      over = false;
    }
  }
  
  void display() 
  {
    image(currentimage, x, y);
  }
};

