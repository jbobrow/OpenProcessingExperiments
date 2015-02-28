
PImage img1;
PImage img2;
Grid g1;   
int counter = 0;
int delayer;


void setup() {
  size(1000, 750);
  img1 = loadImage ("human_01.png");
  img2 = loadImage ("street_fighter.jpg");
  background(0);
  g1 = new Grid ();
}


void draw() {
   if (delayer == 10) {
     delayer = 0;
    background(0);
    g1.replaceImage();
    g1.display();
    counter +=1;
    if (counter > 23)
    counter = 0;
    }
  delayer+=1;
}

  
  

class Grid {
  int cSize;
  int nRows, nCols;
  char[][] letters;
  
  Grid() {
    cSize = 20;
    nRows = width/cSize;
    nCols = height/cSize;
    letters = new char[nRows][nCols];
    
  }
  void replaceImage() {
  initLetters();  
  switch (counter) {
  case 0: 
  img1 = loadImage ("human_01.png");
  img2 = loadImage ("street_fighter.jpg");
  break;
  case 1: 
  img1 = loadImage ("human_01.png");
  img2 = loadImage ("street_fighter.jpg");
  break;
  case 2: 
  img1 = loadImage ("human_01.png");
  img2 = loadImage ("mario.jpg");
  break;
  case 3: 
  img1 = loadImage ("human_01.png");
  img2 = loadImage ("mario.jpg");
  break;
  case 4:
  img1 = loadImage ("money.jpg");
  img2 = loadImage ("mario.jpg");
  break;
  case 5:
  img1 = loadImage ("money.jpg");
  img2 = loadImage ("mario.jpg");
  break;
  case 6:
  img1 = loadImage ("money.jpg");
  img2 = loadImage ("hamburger.jpg");
  break;
  case 7:
  img1 = loadImage ("money.jpg");
  img2 = loadImage ("hamburger.jpg");
  break;
  case 8:
  img1 = loadImage ("human_02.jpg");
  img2 = loadImage ("hamburger.jpg");
  break;
  case 9:
  img1 = loadImage ("human_02.jpg");
  img2 = loadImage ("hamburger.jpg");
  break;
  case 10:
  img1 = loadImage ("human_02.jpg");
  img2 = loadImage ("blue.jpg");
  break;
  case 11:
  img1 = loadImage ("human_02.jpg");
  img2 = loadImage ("blue.jpg");
  break;
  case 12:
  img1 = loadImage ("food.jpg");
  img2 = loadImage ("blue.jpg");
  break;
  case 13:
  img1 = loadImage ("food.jpg");
  img2 = loadImage ("blue.jpg");
  break;
  case 14:
  img1 = loadImage ("food.jpg");
  img2 = loadImage ("coin.jpg");
  break;
  case 15:
  img1 = loadImage ("food.jpg");
  img2 = loadImage ("coin.jpg");
  break;
  case 16:
  img1 = loadImage ("human_01.png");
  img2 = loadImage ("coin.jpg");
  break;
  case 17:
  img1 = loadImage ("human_01.png");
  img2 = loadImage ("coin.jpg");
  break;
  case 18:
  img1 = loadImage ("human_01.png");
  img2 = loadImage ("t.jpg");
  break;
  case 19:
  img1 = loadImage ("human_01.png");
  img2 = loadImage ("t.jpg");
  break;
  case 20:
  img1 = loadImage ("cycling.jpg");
  img2 = loadImage ("t.jpg");
  break;
  case 21:
  img1 = loadImage ("cycling.jpg");
  img2 = loadImage ("t.jpg");
  break;
  case 22:
  img1 = loadImage ("cycling.jpg");
  img2 = loadImage ("street_fighter.jpg");
  break;
  case 23:
  img1 = loadImage ("cycling.jpg");
  img2 = loadImage ("street_fighter.jpg");
  break;
  }
 }
  
  void initLetters()
  {
    for (int i = 0; i < nRows; i++)
    {
      for (int j = 0; j < nCols; j++)
      {
        if (random(100)>50) {
          letters[i][j]='1';
      
          
        }else{ 
          letters[i][j]='2';
     
      }
    }
  }
  }
  
  void display() {
    for (int i = 0; i < nRows; i++)
    {
      for (int j = 0; j < nCols; j++)
      {
        stroke(0);
        fill(255);
        if (letters[i][j]=='1')
          image(img1.get(i*cSize, j*cSize, cSize, cSize), i*cSize, j*cSize);
        else 
          image(img2.get(i*cSize, j*cSize, cSize, cSize), i*cSize, j*cSize);
      }
    }
  }
} // class


