
import javax.swing.*; 
PImage[] database;  //Array of database images
PImage[] block1;
PImage[] block2;
PImage[] block3;
int blockSize = 128;
public PImage img1r, img2r, img3r, img1g, img2g, img3g, img1b, img2b, img3b, img1, img2, img3, 
img1rg, img2rg, img3rg, img1rb, img2rb, img3rb, img1gb, img2gb, img3gb, menu, lose, blockSelect, difficulty_select;

int bestMatch1;
int bestMatch2;

PImage img64;
int mode =0;
int[] images;
boolean[][] grid;
int score = 0;
int counter = 0;
int countLim = 120;

public block curBlock = new block(2,1);
public block[] gridBlocks = new block[25];


static int MENU, LOSE, PLAY, PAUSE, IMG1, IMG2, IMG3, R, G, B, RG, RB, GB, STATE, IMAGE_SELECT, DIFFICULTY, HARD, EASY;
int diffSetting;

int nrImages;
int numTiles;
int tileCounter;
int ssd;
int tempSSD;
int bestMatch;
int[][] tiles; // array of tiles in target

void setup(){
  
   blockSelect = loadImage("blockSelect.jpg");
   difficulty_select = loadImage("difficulty.jpg");
  
  int MENU = 0;
  int PLAY = 1;
  int LOSE = 2;
  int IMAGE_SELECT = 4;
  int DIFFICULTY = 5;
  
  int HARD = 1;
  int EASY = 3;
  
  
  //img64 = loadImage("one64");
  
  
  
  
  menu = loadImage("title.jpg");
  lose = loadImage("lose.jpg");
  
  block1 = new PImage[7];
  block1[0] = img1;
  block1[1] = img1r;
  block1[2] = img1g;
  block1[3] = img1b;
  block1[4] = img1rg;
  block1[5] = img1rb;
  block1[6] = img1gb;
  append(block1, img1);
  append(block1, img1r);
  append(block1, img1g);
  append(block1, img1b);
  append(block1, img1rg);
  append(block1, img1rb);
  append(block1, img1gb);
  
  
  block2 = new PImage[7];
  block2[0] = img2;
  block2[1] = img2r;
  block2[2] = img2g;
  block2[3] = img2b;
  block2[4] = img2rg;
  block2[5] = img2rb;
  block2[6] = img2gb;
  
  block3 = new PImage[7];
  block3[0] = img3;
  block3[1] = img3r;
  block3[2] = img3g;
  block3[3] = img3b;
  block3[4] = img3rg;
  block3[5] = img3rb;
  block3[6] = img3gb;
  
  img1 = loadImage("1.jpg");
  img1r = loadImage("1.jpg");
  img1g = loadImage("1.jpg");
  img1b = loadImage("1.jpg");
  img1rg = loadImage("1.jpg");
  img1rb = loadImage("1.jpg");
  img1gb = loadImage("1.jpg");
  
   img2 = loadImage("2.jpg");
  img2r = loadImage("2.jpg");
  img2g = loadImage("2.jpg");
  img2b = loadImage("2.jpg");
  img2rg = loadImage("2.jpg");
  img2rb = loadImage("2.jpg");
  img2gb = loadImage("2.jpg");
  
   img3 = loadImage("3.jpg");
  img3r = loadImage("3.jpg");
  img3g = loadImage("3.jpg");
  img3b = loadImage("3.jpg");
  img3rg = loadImage("3.jpg");
  img3rb = loadImage("3.jpg");
  img3gb = loadImage("3.jpg");
   
  size(640,640);
  
  for (int x = 0; x <blockSize; x++)
  {
    for (int y = 0; y <blockSize; y++)
    {
      color c = img1.get(x,y);
      float r = red(c); float b = blue(c); float g = green(c);
      
      img1r.set(x,y, color(r,0,0));
      img1g.set(x,y, color(0,g,0));
      img1b.set(x,y, color(0,0,b));
      img1rg.set(x,y, color(r,g,0));
      img1rb.set(x,y, color(r,0,b));
      img1gb.set(x,y, color(0,g,b));
    }
    
  }
  
  for (int x = 0; x <blockSize; x++)
  {
    for (int y = 0; y <blockSize; y++)
    {
      color c = img2.get(x,y);
      float r = red(c); float b = blue(c); float g = green(c);
      
      img2r.set(x,y, color(r,0,0));
      img2g.set(x,y, color(0,g,0));
      img2b.set(x,y, color(0,0,b));
      img2rg.set(x,y, color(r,g,0));
      img2rb.set(x,y, color(r,0,b));
      img2gb.set(x,y, color(0,g,b));
    }
    
  }
  
  for (int x = 0; x <blockSize; x++)
  {
    for (int y = 0; y <blockSize; y++)
    {
      color c = img3.get(x,y);
      float r = red(c); float b = blue(c); float g = green(c);
      
      img3r.set(x,y, color(r,0,0));
      img3g.set(x,y, color(0,g,0));
      img3b.set(x,y, color(0,0,b));
      img3rg.set(x,y, color(r,g,0));
      img3rb.set(x,y, color(r,0,b));
      img3gb.set(x,y, color(0,g,b));
    }
    
  }
  
  grid = new boolean[5][5];
  for(int i = 0; i < 5; i++)
  {
    for(int j = 0; j < 5; j++)
    {
      grid[i][j] = false;
    }
  }
  
 // block[] gridBlocks = new block[20];
  for(int i = 0; i< 25; i++)
  {
     gridBlocks[i] = new block(-200,0); 
     gridBlocks[i].onScreen = false;
  }
  //block curBlock = new block(3,2);
  curBlock.spawnBlock();
  
}


//img1r, img2r, img3r, img1g, img2g, img3g, img1b, img2b, img3b, img1, img2, img3, 
//img1rg, img2rg, img3rg, img1rb, img2rb, img3rb, img1gb, img2gb, img3gb;

void draw()
{

  switch(mode)
  {
    case 0:
    image(menu,0,0);
    fill(0,0,0);
    text("Press ENTER to begin", 200, 400);
    score = 0;
    counter = 0;
    countLim = 150;

    break;
    
    case 2:
    image(lose,0,0);
    text("score: "+score, 570, 15);
    for(int i = 0; i < 25; i++)
    {
      
        grid[gridBlocks[i].x][gridBlocks[i].y] = false;
        gridBlocks[i].onScreen = false;
        gridBlocks[i].hasRed = false;
        gridBlocks[i].hasBlue = false;
        gridBlocks[i].hasGreen = false;
        gridBlocks[i].marked = false;
    } 
  break;
  
  case 4:
  image(blockSelect,0,0);
  text("select image by pressing the numbered key", 250, 600);
  break;  
  
  case 5:
  image(difficulty_select,0,0);
  text("select difficulty by pressing the numbered key", 250, 600);
  break;  
    case 1:
  counter++;
  background(100,100,100);
  
  if(score > 5 && score <= 10)
  {
    countLim = 130;
  }
  if(score > 10 && score <= 15)
  {
    countLim = 110;
  }
  if(score > 15 && score <= 25)
  {
    countLim = 90;
  }
  if(score > 25 && score <= 40)
  {
    countLim = 70;
  }
  if(score > 40 && score <= 55)
  {
    countLim = 50;
  }
  if(score > 55)
  {
    countLim = 30;
  }
      
  if(counter >= countLim)
  {
    if(curBlock.y < 4)
       {
       if(curBlock.checkMove(1) == true)
       {
          curBlock.y += 1;
        }
        else if(curBlock.checkMove(1) == false)
       {
         for(int i = 0; i < 25; i++)
         {
           if(gridBlocks[i].onScreen == true)
           {
             if(gridBlocks[i].x == curBlock.x && gridBlocks[i].y == curBlock.y+1)
             {
               if(gridBlocks[i].picNum != curBlock.picNum)
               {
                 layBlock(curBlock);
                 counter = 0;
                 break;
               }
               if(gridBlocks[i].picNum == curBlock.picNum && gridBlocks[i].hasRed == false && curBlock.hasRed == true)
               {
                 gridBlocks[i].hasRed = true;
                 curBlock.spawnBlock();
                 counter = 0;
               }
               if(gridBlocks[i].picNum == curBlock.picNum && gridBlocks[i].hasBlue == false && curBlock.hasBlue == true)
               {
                 gridBlocks[i].hasBlue = true;
                 curBlock.spawnBlock();
                 counter = 0;
               }
               if(gridBlocks[i].picNum == curBlock.picNum && gridBlocks[i].hasGreen == false && curBlock.hasGreen == true)
               {
                 gridBlocks[i].hasGreen = true;
                 curBlock.spawnBlock();
                 counter = 0;
               }
               if(gridBlocks[i].picNum == curBlock.picNum && gridBlocks[i].hasGreen == true && curBlock.hasGreen == true)
               {
                 layBlock(curBlock);
                 counter = 0;
               }
               if(gridBlocks[i].picNum == curBlock.picNum && gridBlocks[i].hasRed == true && curBlock.hasRed == true)
               {
                 layBlock(curBlock);
                 counter = 0;
               }
               if(gridBlocks[i].picNum == curBlock.picNum && gridBlocks[i].hasBlue == true && curBlock.hasBlue == true)
               {
                 layBlock(curBlock);
                 counter = 0;
               }
             }
           }
         }
       }
     }
    else
     {
       layBlock(curBlock);
     }
      counter = 0;
  }
  
  //draw grid blocks
  for(int i = 0; i < 25; i++)
  {
    if(gridBlocks[i].onScreen == true)
    {
      if(gridBlocks[i].picNum == 1)
      {
        if(gridBlocks[i].hasRed == true && gridBlocks[i].hasBlue == false && gridBlocks[i].hasGreen == false)
        {
          image(img1r, 128*gridBlocks[i].x, 128*gridBlocks[i].y, 128, 128); 
        }
        if(gridBlocks[i].hasRed == true && gridBlocks[i].hasBlue == true && gridBlocks[i].hasGreen == false)
        {
          image(img1rb, 128*gridBlocks[i].x, 128*gridBlocks[i].y, 128, 128); 
        }
        if(gridBlocks[i].hasRed == true && gridBlocks[i].hasBlue == false && gridBlocks[i].hasGreen == true)
        {
          image(img1rg, 128*gridBlocks[i].x, 128*gridBlocks[i].y, 128, 128); 
        }
        if(gridBlocks[i].hasRed == true && gridBlocks[i].hasBlue == true && gridBlocks[i].hasGreen == true)
        {
          image(img1, 128*gridBlocks[i].x, 128*gridBlocks[i].y, 128, 128); 
        }
        if(gridBlocks[i].hasRed == false && gridBlocks[i].hasBlue == true && gridBlocks[i].hasGreen == false)
        {
          image(img1b, 128*gridBlocks[i].x, 128*gridBlocks[i].y, 128, 128); 
        }
        if(gridBlocks[i].hasRed == false && gridBlocks[i].hasBlue == false && gridBlocks[i].hasGreen == true)
        {
          image(img1g, 128*gridBlocks[i].x, 128*gridBlocks[i].y, 128, 128); 
        }
        if(gridBlocks[i].hasRed == false && gridBlocks[i].hasBlue == true && gridBlocks[i].hasGreen == true)
        {
          image(img1gb, 128*gridBlocks[i].x, 128*gridBlocks[i].y, 128, 128); 
        }
      }
      
      if(gridBlocks[i].picNum == 2)
      {
        if(gridBlocks[i].hasRed == true && gridBlocks[i].hasBlue == false && gridBlocks[i].hasGreen == false)
        {
          image(img2r, 128*gridBlocks[i].x, 128*gridBlocks[i].y, 128, 128); 
        }
        if(gridBlocks[i].hasRed == true && gridBlocks[i].hasBlue == true && gridBlocks[i].hasGreen == false)
        {
          image(img2rb, 128*gridBlocks[i].x, 128*gridBlocks[i].y, 128, 128); 
        }
        if(gridBlocks[i].hasRed == true && gridBlocks[i].hasBlue == false && gridBlocks[i].hasGreen == true)
        {
          image(img2rg, 128*gridBlocks[i].x, 128*gridBlocks[i].y, 128, 128); 
        }
        if(gridBlocks[i].hasRed == true && gridBlocks[i].hasBlue == true && gridBlocks[i].hasGreen == true)
        {
          image(img2, 128*gridBlocks[i].x, 128*gridBlocks[i].y, 128, 128); 
        }
        if(gridBlocks[i].hasRed == false && gridBlocks[i].hasBlue == true && gridBlocks[i].hasGreen == false)
        {
          image(img2b, 128*gridBlocks[i].x, 128*gridBlocks[i].y, 128, 128); 
        }
        if(gridBlocks[i].hasRed == false && gridBlocks[i].hasBlue == false && gridBlocks[i].hasGreen == true)
        {
          image(img2g, 128*gridBlocks[i].x, 128*gridBlocks[i].y, 128, 128); 
        }
        if(gridBlocks[i].hasRed == false && gridBlocks[i].hasBlue == true && gridBlocks[i].hasGreen == true)
        {
          image(img2gb, 128*gridBlocks[i].x, 128*gridBlocks[i].y, 128, 128); 
        }
      }
      
      if(gridBlocks[i].picNum == 3)
      {
        if(gridBlocks[i].hasRed == true && gridBlocks[i].hasBlue == false && gridBlocks[i].hasGreen == false)
        {
          image(img3r, 128*gridBlocks[i].x, 128*gridBlocks[i].y, 128, 128); 
        }
        if(gridBlocks[i].hasRed == true && gridBlocks[i].hasBlue == true && gridBlocks[i].hasGreen == false)
        {
          image(img3rg, 128*gridBlocks[i].x, 128*gridBlocks[i].y, 128, 128); 
        }
        if(gridBlocks[i].hasRed == true && gridBlocks[i].hasBlue == false && gridBlocks[i].hasGreen == true)
        {
          image(img3rb, 128*gridBlocks[i].x, 128*gridBlocks[i].y, 128, 128); 
        }
        if(gridBlocks[i].hasRed == true && gridBlocks[i].hasBlue == true && gridBlocks[i].hasGreen == true)
        {
          image(img3, 128*gridBlocks[i].x, 128*gridBlocks[i].y, 128, 128); 
        }
        if(gridBlocks[i].hasRed == false && gridBlocks[i].hasBlue == true && gridBlocks[i].hasGreen == false)
        {
          image(img3b, 128*gridBlocks[i].x, 128*gridBlocks[i].y, 128, 128); 
        }
        if(gridBlocks[i].hasRed == false && gridBlocks[i].hasBlue == false && gridBlocks[i].hasGreen == true)
        {
          image(img3g, 128*gridBlocks[i].x, 128*gridBlocks[i].y, 128, 128); 
        }
        if(gridBlocks[i].hasRed == false && gridBlocks[i].hasBlue == true && gridBlocks[i].hasGreen == true)
        {
          image(img3gb, 128*gridBlocks[i].x, 128*gridBlocks[i].y, 128, 128); 
        }
      }
      
    
    }
  }
  
  
  
  //image 1
  if(curBlock.picColor == 1 && curBlock.picNum == 1) // red
  {
    image(img1r, 128*curBlock.x, 128*curBlock.y, 128, 128); 
  }
  
  if(curBlock.picColor == 2 && curBlock.picNum == 1) //green
  {
    image(img1g, 128*curBlock.x, 128*curBlock.y, 128, 128);
  }
  
  if(curBlock.picColor == 3 && curBlock.picNum == 1) //blue
  {
    image(img1b, 128*curBlock.x, 128*curBlock.y, 128, 128);
  }
  //image 2
  if(curBlock.picColor == 1 && curBlock.picNum == 2) //red
  {
    image(img2r, 128*curBlock.x, 128*curBlock.y, 128, 128);
  }
  
  if(curBlock.picColor == 2 && curBlock.picNum == 2) //green
  {
    image(img2g, 128*curBlock.x, 128*curBlock.y, 128, 128);
  }
  
  if(curBlock.picColor == 3 && curBlock.picNum == 2) //blue
  {
    image(img2b, 128*curBlock.x, 128*curBlock.y, 128, 128);
  }
  //image 3
  if(curBlock.picColor == 1 && curBlock.picNum == 3) //red
  {
    image(img3r, curBlock.x * (128), curBlock.y* (128));
  }
  
  if(curBlock.picColor == 2 && curBlock.picNum == 3) //green
  {
    image(img3g, 128*curBlock.x, 128*curBlock.y, 128, 128);
  }
  
  if(curBlock.picColor == 3 && curBlock.picNum == 3) //blue
  {
    image(img3b, 128*curBlock.x, 128*curBlock.y, 128, 128);
  }
  
  
 // println(curBlock.x + "," + curBlock.y);
  //println(curBlock.picColor + "," + curBlock.picNum);
  println(curBlock.x+","+curBlock.y);
  for(int i = 0; i < 25; i++)
  {
     println(gridBlocks[i].x +","+gridBlocks[i].y+","+gridBlocks[i].onScreen);
  }
  
  
  //clear blocks
  
    for(int i = 0; i < 25; i++)
  {
    if(gridBlocks[i].onScreen == true)
    {
      if(gridBlocks[i].hasRed == true && gridBlocks[i].hasGreen == true && gridBlocks[i].hasBlue == true)
      {
        findConnections(gridBlocks[i]);
        gridBlocks[i].marked = true;
        
        
      }
      if(gridBlocks[i].marked == true)
      {
        score += 1;
        grid[gridBlocks[i].x][gridBlocks[i].y] = false;
        gridBlocks[i].onScreen = false;
        gridBlocks[i].hasRed = false;
        gridBlocks[i].hasBlue = false;
        gridBlocks[i].hasGreen = false;
        gridBlocks[i].marked = false;
      }
    }
    
    
    
    if(gridBlocks[i].onScreen == false)
    {
      gridBlocks[i].x = 0;
      gridBlocks[i].y = 0;
    }
    
  }
  
  for(int i = 0; i < 25; i++)
  {
    if(gridBlocks[i].onScreen == true)
    {
      if(gridBlocks[i].y < 4 && grid[gridBlocks[i].x][gridBlocks[i].y+1] == false)
      {
        grid[gridBlocks[i].x][gridBlocks[i].y] = false;
        grid[gridBlocks[i].x][gridBlocks[i].y+1] = true;
        gridBlocks[i].y += 1;
        
      }
      if(gridBlocks[i].y < 4 && grid[gridBlocks[i].x][gridBlocks[i].y+1] == true)
      {
        for(int j = 0; j < 25; j++)
        {
          if(gridBlocks[j].x == gridBlocks[i].x && gridBlocks[j].y == gridBlocks[i].y+1 && gridBlocks[j].picNum == gridBlocks[i].picNum)
          {
            if(gridBlocks[i].hasRed == true && gridBlocks[j].hasRed == false && gridBlocks[i].hasBlue == false && gridBlocks[j].hasBlue == true && gridBlocks[i].hasGreen == false && gridBlocks[j].hasGreen == false)
            { //red dropped on blue
              gridBlocks[j].hasRed = true;
              grid[gridBlocks[i].x][gridBlocks[i].y] = false;
              gridBlocks[i].onScreen = false;
              gridBlocks[i].hasRed = false;
              gridBlocks[i].hasBlue = false;
              gridBlocks[i].hasGreen = false;
              gridBlocks[i].marked = false;
            }
            if(gridBlocks[i].hasRed == true && gridBlocks[j].hasRed == false && gridBlocks[i].hasBlue == false && gridBlocks[j].hasBlue == false && gridBlocks[i].hasGreen == false && gridBlocks[j].hasGreen == true)
            { // red dropped on green
              gridBlocks[j].hasRed = true;
              grid[gridBlocks[i].x][gridBlocks[i].y] = false;
              gridBlocks[i].onScreen = false;
              gridBlocks[i].hasRed = false;
              gridBlocks[i].hasBlue = false;
              gridBlocks[i].hasGreen = false;
              gridBlocks[i].marked = false;
            }
            if(gridBlocks[i].hasRed == false && gridBlocks[j].hasRed == true && gridBlocks[i].hasBlue == true && gridBlocks[j].hasBlue == false && gridBlocks[i].hasGreen == false && gridBlocks[j].hasGreen == false)
            {//blue dropped on red
              gridBlocks[j].hasBlue = true;
              grid[gridBlocks[i].x][gridBlocks[i].y] = false;
              gridBlocks[i].onScreen = false;
              gridBlocks[i].hasRed = false;
              gridBlocks[i].hasBlue = false;
              gridBlocks[i].hasGreen = false;
              gridBlocks[i].marked = false;
            }
            if(gridBlocks[i].hasRed == false && gridBlocks[j].hasRed == false && gridBlocks[i].hasBlue == true && gridBlocks[j].hasBlue == false && gridBlocks[i].hasGreen == false && gridBlocks[j].hasGreen == true)
            { // blue dropped on green
              gridBlocks[j].hasBlue = true;
              grid[gridBlocks[i].x][gridBlocks[i].y] = false;
              gridBlocks[i].onScreen = false;
              gridBlocks[i].hasRed = false;
              gridBlocks[i].hasBlue = false;
              gridBlocks[i].hasGreen = false;
              gridBlocks[i].marked = false;
            }
            if(gridBlocks[i].hasRed == true && gridBlocks[j].hasRed == false && gridBlocks[i].hasBlue == false && gridBlocks[j].hasBlue == true && gridBlocks[i].hasGreen == false && gridBlocks[j].hasGreen == true)
            { //red dropped on blue/green
              gridBlocks[j].hasRed = true;
              grid[gridBlocks[i].x][gridBlocks[i].y] = false;
              gridBlocks[i].onScreen = false;
              gridBlocks[i].hasRed = false;
              gridBlocks[i].hasBlue = false;
              gridBlocks[i].hasGreen = false;
              gridBlocks[i].marked = false;
            }
            if(gridBlocks[i].hasRed == false && gridBlocks[j].hasRed == true && gridBlocks[i].hasBlue == true && gridBlocks[j].hasBlue  == false && gridBlocks[i].hasGreen == false && gridBlocks[j].hasGreen == true)
            { // blue dropped on green/red
              gridBlocks[j].hasBlue = true;
              grid[gridBlocks[i].x][gridBlocks[i].y] = false;
              gridBlocks[i].onScreen = false;
              gridBlocks[i].hasRed = false;
              gridBlocks[i].hasBlue = false;
              gridBlocks[i].hasGreen = false;
              gridBlocks[i].marked = false;
            }
            if(gridBlocks[i].hasRed == false && gridBlocks[j].hasRed == true && gridBlocks[i].hasBlue == false && gridBlocks[j].hasBlue == true && gridBlocks[i].hasGreen == false && gridBlocks[j].hasGreen == false)
            { // green dropped on red/blue
              gridBlocks[j].hasGreen = true;
              grid[gridBlocks[i].x][gridBlocks[i].y] = false;
              gridBlocks[i].onScreen = false;
              gridBlocks[i].hasRed = false;
              gridBlocks[i].hasBlue = false;
              gridBlocks[i].hasGreen = false;
              gridBlocks[i].marked = false;
            }
          }
        }
      }
    }
  }
  
  text("score: "+score, 570, 15);
  
  for(int i = 0; i < 25; i++)
  {
    if(gridBlocks[i].onScreen == true)
    {
      if(gridBlocks[i].y == 0)
      {
        mode = 2;
      }
    }
  }
  
  break;
  }
}

void keyReleased()
{
  if(keyCode == '1')
   {
     
     if(mode == 4)
     {
       for(int i = 0; i < 7; i ++)
       {
         block1[i] = loadImage("1.jpg");
         
       }
       img1 = loadImage("1.jpg");
      img1r = loadImage("1.jpg");
      img1g = loadImage("1.jpg");
      img1b = loadImage("1.jpg");
      img1rg = loadImage("1.jpg");
      img1rb = loadImage("1.jpg");
      img1gb = loadImage("1.jpg");
       for (int x = 0; x <blockSize; x++)
      {
        for (int y = 0; y <blockSize; y++)
        {
          color c = img1.get(x,y);
          float r = red(c); float b = blue(c); float g = green(c);
          
          img1r.set(x,y, color(r,0,0));
          img1g.set(x,y, color(0,g,0));
          img1b.set(x,y, color(0,0,b));
          img1rg.set(x,y, color(r,g,0));
          img1rb.set(x,y, color(r,0,b));
          img1gb.set(x,y, color(0,g,b));
        }
        
      }
       img64 = loadImage("one64.jpg");
       mode = 5;
       //break;
     }
     if(mode == 5)
     {
       diffSetting = 3;
       determineBlocks(img1, diffSetting);
       img2 = database[bestMatch1];
        img2r = database[bestMatch1];
        img2g = database[bestMatch1];
        img2b = database[bestMatch1];
        img2rg = database[bestMatch1];
        img2rb = database[bestMatch1];
        img2gb = database[bestMatch1];
       for (int x = 0; x <blockSize; x++)
      {
        for (int y = 0; y <blockSize; y++)
        {
          color c = img1.get(x,y);
          float r = red(c); float b = blue(c); float g = green(c);
          
          img2r.set(x,y, color(r,0,0));
          img2g.set(x,y, color(0,g,0));
          img2b.set(x,y, color(0,0,b));
          img2rg.set(x,y, color(r,g,0));
          img2rb.set(x,y, color(r,0,b));
          img2gb.set(x,y, color(0,g,b));
        }
        
      }
      
      img3 = database[bestMatch2];
        img3r = database[bestMatch2];
        img3g = database[bestMatch2];
        img3b = database[bestMatch2];
        img3rg = database[bestMatch2];
        img3rb = database[bestMatch2];
        img3gb = database[bestMatch2];
       for (int x = 0; x <blockSize; x++)
      {
        for (int y = 0; y <blockSize; y++)
        {
          color c = img1.get(x,y);
          float r = red(c); float b = blue(c); float g = green(c);
          
          img3r.set(x,y, color(r,0,0));
          img3g.set(x,y, color(0,g,0));
          img3b.set(x,y, color(0,0,b));
          img3rg.set(x,y, color(r,g,0));
          img3rb.set(x,y, color(r,0,b));
          img3gb.set(x,y, color(0,g,b));
        }
        
      }
       
       mode = 1;
     }
   }
   if(keyCode == '2')
   {
     if(mode == 4)
     {
       for(int i = 0; i < 7; i ++)
       {
         block1[i] = loadImage("2.jpg");
         
       }
        img1 = loadImage("2.jpg");
      img1r = loadImage("2.jpg");
       img1g = loadImage("2.jpg");
       img1b = loadImage("2.jpg");
       img1rg = loadImage("2.jpg");
       img1rb = loadImage("2.jpg");
       img1gb = loadImage("2.jpg");
       for (int x = 0; x <blockSize; x++)
  {
    for (int y = 0; y <blockSize; y++)
    {
      color c = img1.get(x,y);
      float r = red(c); float b = blue(c); float g = green(c);
      
      img1r.set(x,y, color(r,0,0));
      img1g.set(x,y, color(0,g,0));
      img1b.set(x,y, color(0,0,b));
      img1rg.set(x,y, color(r,g,0));
      img1rb.set(x,y, color(r,0,b));
      img1gb.set(x,y, color(0,g,b));
    }
    
  }
       img64 = loadImage("two64.jpg");
       mode = 5;
       //break;
     }
     if(mode == 5)
     {
       diffSetting = 1;
       
       determineBlocks(img1, diffSetting);
       img2 = database[bestMatch1];
        img2r = database[bestMatch1];
        img2g = database[bestMatch1];
        img2b = database[bestMatch1];
        img2rg = database[bestMatch1];
        img2rb = database[bestMatch1];
        img2gb = database[bestMatch1];
       for (int x = 0; x <blockSize; x++)
      {
        for (int y = 0; y <blockSize; y++)
        {
          color c = img1.get(x,y);
          float r = red(c); float b = blue(c); float g = green(c);
          
          img2r.set(x,y, color(r,0,0));
          img2g.set(x,y, color(0,g,0));
          img2b.set(x,y, color(0,0,b));
          img2rg.set(x,y, color(r,g,0));
          img2rb.set(x,y, color(r,0,b));
          img2gb.set(x,y, color(0,g,b));
        }
        
      }
      
      img3 = database[bestMatch2];
        img3r = database[bestMatch2];
        img3g = database[bestMatch2];
        img3b = database[bestMatch2];
        img3rg = database[bestMatch2];
        img3rb = database[bestMatch2];
        img3gb = database[bestMatch2];
       for (int x = 0; x <blockSize; x++)
      {
        for (int y = 0; y <blockSize; y++)
        {
          color c = img1.get(x,y);
          float r = red(c); float b = blue(c); float g = green(c);
          
          img3r.set(x,y, color(r,0,0));
          img3g.set(x,y, color(0,g,0));
          img3b.set(x,y, color(0,0,b));
          img3rg.set(x,y, color(r,g,0));
          img3rb.set(x,y, color(r,0,b));
          img3gb.set(x,y, color(0,g,b));
        }
        
      }
       
       mode = 1;
     }
   }
   if(keyCode == '3')
   {
     if(mode == 4)
     {
       for(int i = 0; i < 7; i ++)
       {
         block1[i] = loadImage("3.jpg");
         
       }
        img1 = loadImage("3.jpg");
       img1r = loadImage("3.jpg");
       img1g = loadImage("3.jpg");
       img1b = loadImage("3.jpg");
       img1rg = loadImage("3.jpg");
       img1rb = loadImage("3.jpg");
       img1gb = loadImage("3.jpg");
       for (int x = 0; x <blockSize; x++)
  {
    for (int y = 0; y <blockSize; y++)
    {
      color c = img1.get(x,y);
      float r = red(c); float b = blue(c); float g = green(c);
      
      img1r.set(x,y, color(r,0,0));
      img1g.set(x,y, color(0,g,0));
      img1b.set(x,y, color(0,0,b));
      img1rg.set(x,y, color(r,g,0));
      img1rb.set(x,y, color(r,0,b));
      img1gb.set(x,y, color(0,g,b));
    }
    
  }
       img64 = loadImage("three64.jpg");
       mode = 5;
     }
   }
   if(keyCode == '4')
   {
     if(mode == 4)
     {
       for(int i = 0; i < 7; i ++)
       {
         block1[i] = loadImage("4.jpg");
         
       }
       img1 = loadImage("4.jpg");
      img1r = loadImage("4.jpg");
      img1g = loadImage("4.jpg");
      img1b = loadImage("4.jpg");
      img1rg = loadImage("4.jpg");
      img1rb = loadImage("4.jpg");
      img1gb = loadImage("4.jpg");
       for (int x = 0; x <blockSize; x++)
  {
    for (int y = 0; y <blockSize; y++)
    {
      color c = img1.get(x,y);
      float r = red(c); float b = blue(c); float g = green(c);
      
      img1r.set(x,y, color(r,0,0));
      img1g.set(x,y, color(0,g,0));
      img1b.set(x,y, color(0,0,b));
      img1rg.set(x,y, color(r,g,0));
      img1rb.set(x,y, color(r,0,b));
      img1gb.set(x,y, color(0,g,b));
    }
    
  }
       img64 = loadImage("four64.jpg");
       mode = 5;
     }
   }
   if(keyCode == '5')
   {
     if(mode == 4)
     {
       for(int i = 0; i < 7; i ++)
       {
         block1[i] = loadImage("5.jpg");
         
       }
        img1 = loadImage("5.jpg");
       img1r = loadImage("5.jpg");
       img1g = loadImage("5.jpg");
       img1b = loadImage("5.jpg");
       img1rg = loadImage("5.jpg");
       img1rb = loadImage("5.jpg");
       img1gb = loadImage("5.jpg");
       for (int x = 0; x <blockSize; x++)
  {
    for (int y = 0; y <blockSize; y++)
    {
      color c = img1.get(x,y);
      float r = red(c); float b = blue(c); float g = green(c);
      
      img1r.set(x,y, color(r,0,0));
      img1g.set(x,y, color(0,g,0));
      img1b.set(x,y, color(0,0,b));
      img1rg.set(x,y, color(r,g,0));
      img1rb.set(x,y, color(r,0,b));
      img1gb.set(x,y, color(0,g,b));
    }
    
  }
       img64 = loadImage("five64.jpg");
       mode = 5;
     }
   }
   if(keyCode == '6')
   {
     if(mode == 4)
     {
       for(int i = 0; i < 7; i ++)
       {
         block1[i] = loadImage("6.jpg");
         
       }
        img1 = loadImage("6.jpg");
       img1r = loadImage("6.jpg");
       img1g = loadImage("6.jpg");
       img1b = loadImage("6.jpg");
       img1rg = loadImage("6.jpg");
       img1rb = loadImage("6.jpg");
       img1gb = loadImage("6.jpg");
       for (int x = 0; x <blockSize; x++)
      {
        for (int y = 0; y <blockSize; y++)
        {
          color c = img1.get(x,y);
          float r = red(c); float b = blue(c); float g = green(c);
          
          img1r.set(x,y, color(r,0,0));
          img1g.set(x,y, color(0,g,0));
          img1b.set(x,y, color(0,0,b));
          img1rg.set(x,y, color(r,g,0));
          img1rb.set(x,y, color(r,0,b));
          img1gb.set(x,y, color(0,g,b));
        }
        
      }
       img64 = loadImage("six64.jpg");
       mode = 5;
     }
   }
}

void keyPressed()
{
  if(keyCode == ENTER)
   {
     if(mode == 0)
     {
       mode = 1;
       curBlock.spawnBlock();
     }
     if(mode == 2)
     {
       mode = 0;
     }
     /*if(mode == 4)
     {
       mode = 5;
     }*/
   }
   
   
   
  if (key == CODED){
    
    if(keyCode == RIGHT)
   {
     if(curBlock.x < 4)
     {
       if(curBlock.checkMove(3) == true)
       {
         curBlock.x += 1;
       }
       else if(curBlock.checkMove(3) == false)
       {
         for(int i = 0; i < 25; i++)
         {
           if(gridBlocks[i].onScreen == true)
           {
             if(gridBlocks[i].x == curBlock.x +1 && gridBlocks[i].y == curBlock.y)
             {
               if(gridBlocks[i].picNum == curBlock.picNum && gridBlocks[i].hasRed == false && curBlock.hasRed == true)
               {
                 gridBlocks[i].hasRed = true;
                 curBlock.spawnBlock();
                 counter = 0;
                 break;
               }
               if(gridBlocks[i].picNum == curBlock.picNum && gridBlocks[i].hasBlue == false && curBlock.hasBlue == true)
               {
                 gridBlocks[i].hasBlue = true;
                 curBlock.spawnBlock();
                 counter = 0;
                 break;
               }
               if(gridBlocks[i].picNum == curBlock.picNum && gridBlocks[i].hasGreen == false && curBlock.hasGreen == true)
               {
                 gridBlocks[i].hasGreen = true;
                 curBlock.spawnBlock();
                 counter = 0;
                 break;
               }
             }
           }
         }
       }
     }
   } 
   if(keyCode == LEFT)
   {
     if(curBlock.x > 0)
     {
       if(curBlock.checkMove(2) == true)
       {
         
         curBlock.x -= 1;
       }
       else if(curBlock.checkMove(2) == false)
       {
         for(int i = 0; i < 25; i++)
         {
           if(gridBlocks[i].onScreen == true)
           {
             if(gridBlocks[i].x == curBlock.x -1 && gridBlocks[i].y == curBlock.y)
             {
               if(gridBlocks[i].picNum == curBlock.picNum && gridBlocks[i].hasRed == false && curBlock.hasRed == true)
               {
                 gridBlocks[i].hasRed = true;
                 curBlock.spawnBlock();
                 counter = 0;
                 break;
               }
               if(gridBlocks[i].picNum == curBlock.picNum && gridBlocks[i].hasBlue == false && curBlock.hasBlue == true)
               {
                 gridBlocks[i].hasBlue = true;
                 curBlock.spawnBlock();
                 counter = 0;
                 break;
               }
               if(gridBlocks[i].picNum == curBlock.picNum && gridBlocks[i].hasGreen == false && curBlock.hasGreen == true)
               {
                 gridBlocks[i].hasGreen = true;
                 curBlock.spawnBlock();
                 counter = 0;
                 break;
               }
             }
           }
         }
       }
     }
   } 
   
   if(keyCode == DOWN)
   {
     if(curBlock.y < 4)
       {
       if(curBlock.checkMove(1) == true)
       {
          curBlock.y += 1;
          counter = 0;
        }
        else if(curBlock.checkMove(1) == false)
       {
         for(int i = 0; i < 25; i++)
         {
           if(gridBlocks[i].onScreen == true)
           {
             if(gridBlocks[i].x == curBlock.x && gridBlocks[i].y == curBlock.y+1)
             {
               if(gridBlocks[i].picNum == curBlock.picNum && gridBlocks[i].hasRed == false && curBlock.hasRed == true)
               {
                 gridBlocks[i].hasRed = true;
                 curBlock.spawnBlock();
                 counter = 0;
                 break;
               }
               if(gridBlocks[i].picNum == curBlock.picNum && gridBlocks[i].hasBlue == false && curBlock.hasBlue == true)
               {
                 gridBlocks[i].hasBlue = true;
                 curBlock.spawnBlock();
                 counter = 0;
                 break;
               }
               if(gridBlocks[i].picNum == curBlock.picNum && gridBlocks[i].hasGreen == false && curBlock.hasGreen == true)
               {
                 gridBlocks[i].hasGreen = true;
                 curBlock.spawnBlock();
                 counter = 0;
                 break;
               }
               if(gridBlocks[i].picNum != curBlock.picNum)
               {
                 layBlock(curBlock);
                 counter = 0;
                 break;
               }
               if(gridBlocks[i].picNum == curBlock.picNum && gridBlocks[i].hasGreen == true && curBlock.hasGreen == true)
               {
                 layBlock(curBlock);
                 counter = 0;
                 break;
               }
               if(gridBlocks[i].picNum == curBlock.picNum && gridBlocks[i].hasRed == true && curBlock.hasRed == true)
               {
                 layBlock(curBlock);
                 counter = 0;
                 break;
               }
               if(gridBlocks[i].picNum == curBlock.picNum && gridBlocks[i].hasBlue == true && curBlock.hasBlue == true)
               {
                 layBlock(curBlock);
                 counter = 0;
                 break;
               }
             }
           }
         }
       }
       
     }
     else
     {
       layBlock(curBlock);
     }

   } 
   
   if(keyCode == UP)
   {
     //curBlock.spawnBlock();
   } 
   
  }
  /*if(keyCode == ENTER)
   {
     layBlock(curBlock);
     println("yelp");
   }*/
}

public class block
{
  int x;
  int y;
  int picColor;
  int picNum;
  boolean curBlock = false;
  boolean canMoveLeft= false;
  boolean canMoveRight= false;
  boolean canMoveDown= false;
  boolean hasRed= false;
  boolean hasBlue= false;
  boolean hasGreen= false;
  boolean marked = false;
  PImage pic;
  int r1;
  int r2;
  boolean onScreen = false;
  
  
  block(int x1, int y1)
  {
      x = x1;
      y = y1;
      //picColor = 1;
     // picNum = 3;
  }
  
  void spawnBlock()
  {
    x = 2;
    y = 0;
    curBlock = true;
    onScreen = true;
    hasRed = false;
    hasBlue = false;
    hasGreen = false;
    //picColor = 1;
    //picNum = 2;
    r1 = (int)random(3);
    r2 = (int)random(3);
    if (r1 == 0)
    {
      picColor = 1;
      hasRed = true;
    }
    if (r1 == 1)
    {
      picColor = 2;
      hasGreen = true;
    }
    if (r1 == 2)
    {
      picColor = 3;
      hasBlue = true;
    }
    
    if (r2 == 0)
    {
      picNum = 1;
    }
    if (r2 == 1)
    {
      picNum = 2;
    }
    if (r2 == 2)
    {
      picNum = 3;
    }
  
    curBlock = true;
    
  
  
  }
  
  boolean checkMove(int dir)
  {
    if(dir == 1) // down
    {
      if(y+1 < 5)
      {
        if(grid[x][y+1] == false)
        {
          return true; 
        }
      }

    }
    if(dir == 2) // left
    {
      if(x-1 > -1)
      {
          if(grid[x-1][y] == false)
        {
          return true; 
        }
      }
      /*else
      {
        return false;
      }*/
    }
    if(dir == 3) // right
    {
      if(x+1 < 5)
      {
        if(grid[x+1][y] == false)
        {
          return true; 
        }
      }
    }
   return false; 
  } 
}

void layBlock(block b)
{
  if(b.curBlock == true)
  {
    grid[b.x][b.y] = true;
    for(int i = 0; i < 25; i++)
    {
      if(gridBlocks[i].onScreen == false)
      {
        gridBlocks[i].x = b.x;
        gridBlocks[i].y = b.y;
        gridBlocks[i].picNum = b.picNum;
        gridBlocks[i].onScreen = true;
        gridBlocks[i].curBlock = false;
        if(b.picColor == 1)
        {
          gridBlocks[i].hasRed = true;
        }
        if(b.picColor == 2)
        {
          gridBlocks[i].hasGreen = true;
        }
        if(b.picColor == 3)
        {
          gridBlocks[i].hasBlue = true;
        }
        break;

      }
      
    }
    curBlock.spawnBlock();
    counter = 0;
  }
}

/*void mergeFallenBlocks(block b)
{
  block temp = new block(-200, 0);
  for(int i = 0; i < 25; i++)
  {
    if(gridBlocks[i].x == b.x && gridBlocks[i].y == b.y+1)
    {
      temp = gridBlocks[i];
    }
  }
  if(temp.hasRed != b.hasRed && b
  
}*/
  
  void findConnections(block b)
  {
    for(int i = 0; i < 25; i++)
    {
      if(b.x > 0 && b.x < 4)
      {
        if(gridBlocks[i].picNum == b.picNum)
        {
          if((gridBlocks[i].x == b.x +1 && gridBlocks[i].y == b.y) || (gridBlocks[i].x == b.x -1 && gridBlocks[i].y == b.y))
          {
            gridBlocks[i].marked = true;
          }
          if((gridBlocks[i].y == b.y +1 && gridBlocks[i].x == b.x)|| (gridBlocks[i].y == b.y -1 && gridBlocks[i].x == b.x))
          {
            gridBlocks[i].marked = true;
          }
          if((gridBlocks[i].y == b.y +1 && gridBlocks[i].x == b.x+1)|| (gridBlocks[i].y == b.y -1 && gridBlocks[i].x == b.x+1))
          {
            gridBlocks[i].marked = true;
          }
          if((gridBlocks[i].y == b.y -1 && gridBlocks[i].x == b.x-1)|| (gridBlocks[i].y == b.y +1 && gridBlocks[i].x == b.x-1))
          {
            gridBlocks[i].marked = true;
          }
        }
      }
      if(b.x == 0)
      {
        if(gridBlocks[i].picNum == b.picNum)
        {
          if(gridBlocks[i].x == b.x +1)
          {
            gridBlocks[i].marked = true;
          }
          if(gridBlocks[i].y == b.y +1 || gridBlocks[i].y == b.y -1)
          {
            gridBlocks[i].marked = true;
          }
        }
      }
      if(b.x == 4)
      {
        if(gridBlocks[i].picNum == b.picNum)
        {
          if(gridBlocks[i].x == b.x -1)
          {
            gridBlocks[i].marked = true;
          }
          if(gridBlocks[i].y == b.y +1 || gridBlocks[i].y == b.y -1)
          {
            gridBlocks[i].marked = true;
          }
        }
      }
    }
  }
  
  void determineBlocks(PImage img, int diff)
  {
    bestMatch1 = 0;
    bestMatch2 = 0;
    int tempSSD = 0;
    int ssd1 = MAX_INT;
    int ssd2 = 0;
    for(int i = 0; i < nrImages; i ++) // for every tile in inventory
    {
      tempSSD = 0;
    
      for(int x = 0; x < 64; x++) //for every pixel in target tile
      {
        for(int y = 0; y < 64; y++)
        {
          color c = img.get(x,y); // find color values
          float r = red(c); float b = blue(c); float g = green(c);
          
          color c2 = database[i].get(x,y); // find the color values of that tile
          float r2 = red(c2); float b2 = blue(c2); float g2 = green(c2);
          
          tempSSD += (sq(r - r2) + sq(b - b2) + sq(g - g2)); // find the squared difference  
        }
        if(diff == HARD)
        {
          if(tempSSD < ssd1) // if the tile is a better match
          {
            bestMatch = i; // set tile to new target
            ssd1 = tempSSD;
            //println(tempSSD);
          }
          bestMatch1 = bestMatch;
          for(int j = 0; j < nrImages; j ++) // for every tile in inventory
          {
            tempSSD = 0;
          
            for(int x2 = 0; x2 < 64; x2++) //for every pixel in target tile
            {
              for(int y2 = 0; y2 < 64; y2++)
              {
                color c = img.get(x2,y2); // find color values
                float r = red(c); float b = blue(c); float g = green(c);
                
                color c2 = database[i].get(x2,y2); // find the color values of that tile
                float r2 = red(c2); float b2 = blue(c2); float g2 = green(c2);
                
                tempSSD += (sq(r - r2) + sq(b - b2) + sq(g - g2)); // find the squared difference  
              }
            }
            if(tempSSD < ssd1 && tempSSD != bestMatch) // if the tile is a better match
          {
            bestMatch2 = j; // set tile to new target
            ssd1 = tempSSD;
            //println(tempSSD);
          }
          
         }
         bestMatch2 = bestMatch;
      }
      
      if(diff == EASY)
        {
          if(tempSSD > ssd2) // if the tile is a better match
          {
            bestMatch = i; // set tile to new target
            ssd2 = tempSSD;
            //println(tempSSD);
          }
          bestMatch1 = bestMatch;
          for(int j = 0; j < nrImages; j ++) // for every tile in inventory
          {
            tempSSD = 0;
          
            for(int x2 = 0; x2 < 64; x2++) //for every pixel in target tile
            {
              for(int y2 = 0; y2 < 64; y2++)
              {
                color c = img.get(x2,y2); // find color values
                float r = red(c); float b = blue(c); float g = green(c);
                
                color c2 = database[i].get(x2,y2); // find the color values of that tile
                float r2 = red(c2); float b2 = blue(c2); float g2 = green(c2);
                
                tempSSD += (sq(r - r2) + sq(b - b2) + sq(g - g2)); // find the squared difference  
              }
            }
            if(tempSSD > ssd2 && tempSSD != bestMatch) // if the tile is a better match
          {
            bestMatch2 = j; // set tile to new target
            ssd2 = tempSSD;
            //println(tempSSD);
          }
          
         }
         bestMatch2 = bestMatch;
      }
      
      
    }
      
  }
  }





