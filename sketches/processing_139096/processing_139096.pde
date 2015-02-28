
// Tap to battle
// V.0.2
// Agostinho Monteiro
// 09-March-2014

// Global Variables
public PFont font;

public int AState = 0;
public int GameCounter, ACounter;

public int A, L, AScore, LScore;



// Setup
void setup()
  {
     size(600,400);
     noStroke();
     smooth();
     
     font = loadFont("ArialMT-48.vlw");
  }

// Program
void draw()
  {
    background(0);
     Menu(); 
    // TapToBattle();
  }
  
// State Menu
void Menu()
  {
     switch(AState)
       {
          case 0: TapToBattle(); break;
          case 1: Counter(); break;
          case 2: GamePlay(); break;
          case 3: ShowScore(); break;  
       }
  } 

// Tap to battle (New Game Screen)
 void TapToBattle()
  {
    textFont(font, 120);
    fill(#00FF1B);
    text("T2B", (width/2) - 120, height/3);
    
    textFont(font, 48);
    fill(#0319FF);
    text("Tap to Battle", 150 , height/2);  
    
    textFont(font, 24);
    fill(#0ECDE0,35);
    text("Press [t]o battle", (width/2) -100, 250);
    
    textFont(font, 32);
    fill(#FF0009,25);
    text("[A] Player 1", 50, 350);
       
    fill(#000EFF,25);
    text("[L] Player 2", 340, 350);
    
    if(keyPressed && key == 't')
      {
        AState = 1;
      }
  }

// Counter for New Game
void Counter()
  {
    int Aux; 
    
    ACounter++;
    Aux = 100 - ACounter;
    
    if(Aux <= 0)
    {
      Aux = 0;
      ACounter = 0;
      A = 0;
      L = 0;
      AState = 2;
    }
   
    
       
    textFont(font, 220);
    fill(#0319FF);
    text(Aux, (width/2) -100, (height/2) + 55);
    
    
   
  }

// The Battle (New Game)
void GamePlay()
  {
    int Score1, Score2, Aux, i;
        
    Score1 = A;
    Score2 = L; 
    
    GameCounter++;
    Aux = 1000 - GameCounter;
  
   
    textFont(font, 60);
    fill(#12E9FF,50);
    text(Aux, (width/2) -50, (height/2));
    
  //  fill(0);
  //  quad(340,0,600,0,600,400,340,400);
     
    
    if(Aux <= 0)
    {
      Aux = 0;
      GameCounter = 0;
      AScore = Score1;
      LScore = Score2;
      AState = 3;
    }

    textFont(font, 120);
    fill(#00FF1B);
    text("T2B", (width/2) - 120, height/4);
    
        
    textFont(font, 28);
    fill(#0319FF);
    text("Tap to Battle", 200 , height/3);  
    
    
    textFont(font, 32);
    fill(#FF0009);
    text("[A] Player 1", 50, 350);
       
    fill(#000EFF);
    text("[L] Player 2", 340, 350);
    
    textFont(font, 32 + (Score1/2));
    fill(#FF0009);
    text(Score1, 100, 300);
    
    textFont(font, 32 + (Score2/2));   
    fill(#000EFF);
    text(Score2, 400, 300);
  }
  
void ShowScore()
  {
    int Aux;
    
 if(LScore == AScore)
   {
        textFont(font, 32);
        fill(#FFF300);
        text("Draw!", 230, 300);
   }
   else
   {
      if(LScore > AScore)
        {
          Aux = 300;
        }
       else
        {
          Aux = 0;
        };
    
        textFont(font, 32);
        fill(#FFF300);
        text("Winner!", 70 + Aux, 300);
    
    }
    
    textFont(font, 120);
    fill(#00FF1B);
    text("T2B", (width/2) - 120, height/4);
    
        
    textFont(font, 28);
    fill(#0319FF);
    text("Tap to Battle", 200 , height/3);  
    
    
    textFont(font, 32);
    fill(#FF0009);
    text("[A] Player 1", 50, 250);
       
    fill(#000EFF);
    text("[L] Player 2", 340, 250);
    
    textFont(font, 32 + AScore/2);
    fill(#FF0009);
    text(AScore, 130, 200);
    
    textFont(font, 32 + LScore/2);   
    fill(#000EFF);
    text(LScore, 400, 200);
    

    
    textFont(font, 24);
    fill(#0ECDE0,25);
    text("Press [Y]", (width/2) -40, 350);
    
    if(keyPressed && key == 'y')
      {
        AState = 0;
      }
    
  }

void keyReleased()
    {
      switch(key)
      {
        case 'a': A = A + 1; break;
        case 'l': L = L + 1; break;
      }
    }


