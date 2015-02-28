
Snakes snake= new Snakes();
int tileXPos;
int tileYPos;
int scrollNum=0;
int scrollNumY=0;
boolean hScroll=true;
boolean hScrollL=true;
boolean vScroll=true;
boolean vScrollU=true;
int bgX, bgY; //background image x and y positions
Player Mandrill= new Player();
PImage mmmBackground;
String images[]= {"blank.gif","tree_1.gif","tree_2.gif","tree_3.gif",
  "tree_4.gif","tree_5.gif","tree_6.gif","tree_7.gif","tree_8.gif",
  "tree_9.gif","tree_10.gif","tree_11.gif","tree_12.gif","tree_13.gif",
  "tree_14.gif","tree_15.gif","tree_16.gif","tree_17.gif","tree_18.gif",
  "tree_19.gif","tree_20.gif","tree_21.gif","tree_22.gif","tree_23.gif",
  "tree_24.gif","tree_25.gif","tree_26.gif","tree_27.gif","tree_28.gif",
  "tree_29.gif","Platform1.png","platform2.png","platform3.png",
  "tree_bush.gif","rock 1.png","rock2.png","rock3.png","rock6.png",
  "bridge_1.png","bridge_2.png","bridge_3.png","banana_1.gif"}; 
TileMap map;
int tileX; //find tile position in relation to Mandrill
int tileY; //use floor() to round to neareast whole int
boolean isOnGround;
boolean isOnBridge;
boolean passable;
int bananaCount=0;
boolean bananaHit=false;
PImage blank;
int enemyPos=320;
PImage lives;
PImage banana;
PFont bananas;
PFont gameOver;
Boolean run=true;


ArrayList eatenBananas;


void setup() {
  size(850,640);
  map= new TileMap(100,20);
  frameRate(12);
  mmmBackground = loadImage("level_1_background.png");
  blank= loadImage("blank.gif");
  lives=loadImage("mandrill_lives.gif");
  banana=loadImage("banana_1.gif");
  bananas=loadFont("BlackmoorLetPlain-48.vlw");
  gameOver=loadFont("BlackmoorLetPlain-48.vlw");
  textFont(bananas);
  textFont(gameOver);
  textSize(20);
  for(int i=0;i<100;i++)
  {
    for(int j=0;j<20;j++)
    {
      int imageIndex= tile_map[j][i];
      String imageName=images[imageIndex];
      map.setTile(loadImage(imageName),j,i);
    }
  }
  // Gatta remember to initialize him
  Mandrill = new Player();
  Mandrill.loadImages();

  snake.loadImages();
  
  // Create bananas array list
  eatenBananas = new ArrayList();
 
}
 
void draw()
{
    bgX=constrain(bgX,0,mmmBackground.width-width);
    bgY=constrain(bgY,0,mmmBackground.height-height);
    set(-bgX,0,mmmBackground);
    image(lives,0,0);
    for(int i=0; i< map.getHeight();i++)
    {
      for(int j=0;j< map.getWidth();j++)
      {
          image(map.getTile(j,i),(32*j)-scrollNum,(32*i)-scrollNumY);
          tileXPos=(32*j)-scrollNum;
          tileYPos=(32*i)-scrollNumY;
    
      }
    }
  
    snake.display(enemyPos-scrollNum,195);
    displayBananas();
  
    tileX=floor((Mandrill.xPos+32+scrollNum)/32);
    tileY=floor((Mandrill.yPos+64+scrollNumY)/32); 
    checkKeys();
    Mandrill.update();
    Mandrill.checkState();
    if (Mandrill.dirState == "right")
    {
 
      image(Mandrill.imagesR[Mandrill.imageIndexR], Mandrill.xPos,Mandrill.yPos);
 
    } 
 
    else if (Mandrill.dirState == "left")
    {
      image(Mandrill.imagesL[Mandrill.imageIndexL], Mandrill.xPos,Mandrill.yPos);
 
    }  
  
    else if  (Mandrill.dirState == "chill")
    {
      
      if (Mandrill.chillState == "right")
      {
        image(Mandrill.imagesR[0], Mandrill.xPos,Mandrill.yPos);
      }
     
    
      if (Mandrill.chillState == "left")
      {
        image(Mandrill.imagesL[0], Mandrill.xPos,Mandrill.yPos);
      }
    }
    if (Mandrill.jumpState == "jump" || Mandrill.jumpState == "falling")
    {
      if (Mandrill.chillState == "right")
      {
      
        set(-bgX,0,mmmBackground);
        for(int i=0; i< map.getHeight();i++)
        {
          for(int j=0;j< map.getWidth();j++)
          {
            image(map.getTile(j,i),(32*j)-scrollNum,(32*i)-scrollNumY);
            tileXPos=(32*j)-scrollNum;
            tileYPos=(32*i)-scrollNumY;
           }
        }
        snake.display(enemyPos-scrollNum,195);
        image(lives,0,0);
        displayBananas();
        image(Mandrill.imagesR[5], Mandrill.xPos,Mandrill.yPos);
      }
     
    
      if (Mandrill.chillState == "left")
      {
      
        set(-bgX,0,mmmBackground);
        for(int i=0; i< map.getHeight();i++)
        {
          for(int j=0;j< map.getWidth();j++)
          {
            image(map.getTile(j,i),(32*j)-scrollNum,(32*i)-scrollNumY);
            tileXPos=(32*j)-scrollNum;
            tileYPos=(32*i)-scrollNumY;
           }
        }
        image(lives,0,0);
        snake.display(enemyPos-scrollNum,195);
        displayBananas();
        image(Mandrill.imagesL[5], Mandrill.xPos,Mandrill.yPos);
      }
   
    }
  
    if(tileXPos <= 516) hScroll = false; 
    else hScroll = true; 
  
    if(tileXPos >=3200) hScrollL=false;
    else hScrollL=true;
    if(tileYPos>=734) vScroll=false;
    else vScroll=true;
    if(tileYPos <=410) vScrollU=false;
    else vScrollU=true;
  
    if(tile_map[tileY][tileX]==30 ||tile_map[tileY][tileX]==31 || 
         tile_map[tileY][tileX]==32)
     isOnGround=true;
    else
    {
      isOnGround=false;
    }  
   if(tile_map[tileY][tileX]==38 || tile_map[tileY][tileX]==39 ||
     tile_map[tileY][tileX]==40)
     isOnBridge=true;
   else
     isOnBridge=false;
   
   if(tile_map[tileY][tileX]==35 || tile_map[tileY][tileX]==34 ||
     tile_map[tileY][tileX]==36 || tile_map[tileY][tileX]==37)
     passable=false;
   else
     passable=true;
 
   if(tile_map[tileY][tileX]==41)
   {
     // Create a weird array index
     String arrayIndex = tileY + "," + tileX;

     // We have this on file boolean
     Boolean wehavethis = false;
  
     for (int i = eatenBananas.size()-1; i >= 0; i--) 
     { 
       //println((String)eatenBananas.get(i));
     
        if(eatenBananas.get(i).equals(arrayIndex))
        {
          wehavethis = true;
          println("WE GOT HERE!!!!!!");
        } 
     } 
   
     println("-----");
   
     if(wehavethis == false)
     {
        map.setTile(blank,tileY,tileX);
        //println(tileY + "," + tileX);
   
        bananaCount+=1;
        
        // Add bananas to eaten bananas list
        eatenBananas.add(arrayIndex);
     }
   
   if(tileY>20)
     gameOver();
   
 }
}

void displayBananas()
{
    image(banana,0,65);
    text(bananaCount,50,100); 
}

void gameOver()
{
  fill(0,102,153,51);
  text("GAME OVER",width/2,height/2);
  
}

 
void checkKeys()
{
  if (keyPressed)
  {
    if (keyCode == RIGHT) 
    {
        if(hScroll == false)
        {
          scrollNum-=0;
        }
        else
        {
          if(Mandrill.xPos>width/2)
          {
            scrollNum+=14;
            
            bgX++;
          }
        }
        Mandrill.dirState="right";
       if(isOnGround==false && Mandrill.jumpState!="jump")
         Mandrill.jumpState="falling";
    }  
 
    if (keyCode == LEFT)
    {
      if(hScrollL==false)
      {
        scrollNum+=0;
      }
      else
      {
        if(Mandrill.xPos<100)
        {
          scrollNum-=14;
          bgX--;
        }
      }
      Mandrill.dirState="left";
      if(isOnGround==false && Mandrill.jumpState!="jump")
        Mandrill.jumpState="falling";
    }
     
    if (keyCode == UP && Mandrill.jumpState == "none")
    {
      Mandrill.jumpState = "jump";
    }  
     
  }
  else
  {
    Mandrill.dirState = "chill";
  }

  
  
}

int[][]tile_map={
   {0,0,0,0,0,0,0,0,0,0,0,0,1,2,3,4,5,0,
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
   2,3,4,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,0,0
   },
   {0,0,0,0,0,0,0,0,0,0,0,0,6,7,8,9,10,0,
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,7,
   8,9,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0
   },
   {0,0,0,0,0,0,0,0,0,0,0,0,11,12,13,14,
   15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,11,12,13,14,15,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,31,31,31,31,0,0,0,
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0
   },
   {0,0,0,0,0,0,0,0,0,0,0,0,16,17,18,19,
   20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,16,17,18,19,20,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,33,0,0,
   0,0,0,0,0,31,31,31,35,35,35,35,33,0,
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0
   },
   {0,0,0,0,0,0,0,0,0,0,0,0,0,0,21,22,0,
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,21,22,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,0,30,31,32,0,0,0,0,
   30,31,31,31,31,31,31,31,31,31,32,0,0,
   0,0,0,0,0,0,0,0,0,0,33,33,0,0,0,0,0,
   0,0
   },
   {0,0,0,0,0,0,0,0,0,0,0,0,0,23,24,25,0,
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,41,41,41,0,
   23,24,25,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,31,0,34,36,37,0,0,0,0,34,
   35,35,35,35,35,35,35,35,35,37,0,0,0,
   0,0,0,0,0,0,0,0,31,31,31,31,31,31,31,
   31,32,0
   },
   {0,0,0,0,0,0,0,33,33,0,0,33,0,26,27,28,
   29,33,0,0,0,41,41,0,0,0,0,0,0,0,0,0,0,0,
   0,0,26,27,28,29,33,0,0,0,0,0,0,0,33,33,
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   34,35,35,35,35,35,35,35,37,0,0,0,0,0,0,
   0,0,0,0,0,0,35,35,35,35,35,35,35,35,37,
   0
   },
   {0,30,31,31,31,31,31,31,31,31,31,31,31,
   31,31,31,31,31,32,0,0,0,0,0,30,31,31,
   31,31,31,31,31,31,31,31,31,31,31,31,31,
   31,31,31,31,31,31,31,31,31,31,31,31,41,
   41,41,0,31,31,32,0,0,0,0,0,0,0,0,0,0,0,
   34,35,35,35,36,36,37,0,0,0,0,0,0,0,0,
   0,33,33,0,0,35,35,35,35,35,35,35,37,0,
   0
   },
   {0,34,35,35,35,35,35,35,35,35,35,35,35,
   35,35,35,35,35,37,0,0,0,0,0,34,35,35,
   35,35,35,35,35,35,35,35,35,35,35,35,35,
   35,35,35,35,35,35,35,35,35,35,35,35,0,
   0,0,0,35,35,37,0,30,31,32,0,0,0,0,0,0,
   0,0,36,36,36,0,0,0,0,0,0,0,0,0,0,31,
   31,31,31,31,31,31,31,32,36,36,36,36,0,
   0,0
   },
   {0,0,34,35,35,35,35,35,35,35,35,35,35,
   35,35,35,35,37,0,0,0,30,32,0,0,34,35,
   35,35,35,35,35,35,35,35,35,35,35,35,
   35,35,35,35,35,35,35,35,35,35,35,35,
   35,31,31,31,31,35,37,0,0,35,35,35,32,
   0,0,0,0,0,0,0,41,0,41,0,41,0,0,0,0,0,0,
   0,0,35,35,35,35,35,35,35,35,37,0,0,
   0,0,0,0,0
   },
   {0,0,0,34,36,36,36,35,35,35,36,36,36,
   36,36,36,37,0,0,0,0,36,36,0,0,0,34,
   35,35,35,35,35,35,35,35,35,35,35,35,
   35,35,35,35,35,35,35,35,35,35,35,35,
   35,35,35,35,35,37,0,0,0,35,35,35,35,
   31,32,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0,0,0,33,35,35,35,35,35,35,35,37,
   0,0,0,0,0,0,0,0
   },
   {0,0,0,0,0,0,0,36,36,36,0,0,0,0,0,0,0,
   33,0,0,0,0,0,0,41,0,0,34,36,34,35,35,
   35,35,35,35,35,35,35,35,35,35,35,35,
   35,35,35,35,35,35,35,35,35,35,35,37,
   0,0,0,0,34,35,35,35,35,35,31,31,31,
   31,38,39,39,39,39,40,31,31,31,31,31,31,31,
   31,32,36,35,35,36,36,36,0,0,0,0,0,0,
   0,0,0
   },
   {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,30,
   31,32,0,0,0,41,41,41,0,0,0,0,34,36,36,36,
   36,36,36,36,36,36,36,36,36,36,36,36,
   36,36,36,36,36,36,36,36,37,0,0,0,0,0,
   0,34,35,35,35,35,35,35,35,35,0,0,0,0,
   0,0,34,35,35,35,35,35,35,35,37,0,36,
   36,0,0,0,0,0,0,0,0,0,0,0,0
   },
   {0,0,0,0,0,0,0,0,0,0,0,0,0,0,41,0,0,36,
   36,36,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,36,36,35,35,35,35,35,
   36,0,0,0,0,0,0,0,34,35,35,35,35,
   35,37,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
   },
   {0,0,0,0,0,0,0,0,0,0,0,0,0,0,41,0,0,0,
   0,0,0,0,30,31,31,32,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,0,0,0,0,34,36,36,36,
   37,0,0,0,0,0,0,0,0,0,36,36,36,36,
   36,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
   },
   {0,0,0,0,0,0,0,0,0,0,0,0,0,41,41,41,0,0,
   0,0,0,0,35,35,35,35,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,0,0,0,0
   },
   {0,0,0,0,0,0,0,0,0,0,0,33,33,0,0,0,0,
   0,0,33,30,31,35,35,35,35,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,0,0,0,0,0,0
   },
   {0,0,0,0,0,0,0,0,0,0,30,31,31,31,31,
   31,31,31,31,31,31,31,31,31,31,31,31,
   32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0
   },
   {0,0,0,0,0,0,0,0,0,0,34,35,35,35,35,
   35,35,35,35,35,35,35,35,35,35,35,35,
   37,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0
   },
   {0,0,0,0,0,0,0,0,0,0,0,34,35,35,35,
   35,35,35,35,35,35,35,35,35,35,35,37,
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0
   } 
   };

