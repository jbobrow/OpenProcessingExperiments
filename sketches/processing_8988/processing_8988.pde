
//TestGame v.3_5
//
//Programming Problems: 
//Recognizing correct combos of word-parts (25% done, needs a lot of work)
//
//Concept of continuously creating platforms:
// There is a certain # of platforms on the screen 
// the program will fufill a condition stating that it will make 1 more platform (illusion: make it above the screen)
// then, shift the platforms downward
// at that point, you can remove 1 platform from the # existing (illusion: remove it below the screen)
// that will cause the program to re-fufill the intial condition regarding the # of existing platforms
// this should make the program continuously make platforms (if the downward-moving code is implemented)
//
PFont font;
PImage tigerball;
PImage tigersplat;
PImage sprite;
PImage clouds;
PImage cloudplat;
PImage title;
PImage instructions;
Player t;
ArrayList platforms;
int gamescreen = 0;
float score;
boolean aPressed, dPressed; 
boolean gameOver;
String[] partOne = {
  "bene", "bi", "tri", "chrono", //Total partOne = 6
  "male", "mono"}; 
String[] partTwo = {
  "factor", "ceps", "focal", "lingual", //Total partTwo = 6
  "logy", "phobia"};                    


void setup()
{
  size(500,750);
  frameRate(60);
  initialize();
  font = loadFont("ArialMT-32.vlw");
  textFont(font);
  tigerball = loadImage("tigerball.gif");
  tigersplat = loadImage("tigersplat.gif");
  clouds = loadImage("clouds.png");
  cloudplat = loadImage("cloud plat.png");
  title = loadImage("title.gif");
  instructions = loadImage("instructions.gif");
  t.xVel = 0;
  t.yVel = 1;
}

void initialize()
{
  t = new Player(random(width/4, width/3), (height/2)+100);
  gameOver = false;
  score = 0;
  platforms = new ArrayList();
  platforms.add(new Platform((int)random(20,150),680,100,26,0,2)); 
  platforms.add(new Platform((int)random(280,370),680,100,26,1,2)); 
  platforms.add(new Platform((int)random(20,150),450,100,26,0,3)); 
  platforms.add(new Platform((int)random(280,370),450,100,26,3,3)); 

  platforms.add(new Platform((int)random(20,150),275,100,26,4,2)); 
  platforms.add(new Platform((int)random(280,370),275,100,26,5,2)); 
  platforms.add(new Platform((int)random(20,150),100,100,26,3,3)); 
  platforms.add(new Platform((int)random(280,370),100,100,26,0,3)); 
}

void draw()
{    
  if(gamescreen == 0)
  {
    background(title);
    fill(0);
    text("Press q to start", width/4+20, height/2);
    if(keyPressed && key == 'q')
    {
      gamescreen = 1;
    }
  }

  if(gamescreen == 1)
  {
    background(instructions);
    fill(100,0,0);
    text("Now, press", width-175, height/8); 
    text("Space Bar", width-175, height/8+50);
    text("to start", width-175, height/8+100);
    if(keyPressed && key == ' ')
    {
      gamescreen = 2;
    }
  }

  if(gamescreen == 2)
  {
    background(clouds);
    for(int i=0; i<platforms.size(); i++)
    {
      t.collide((Platform)platforms.get(i)); 
      ((Platform)platforms.get(i)).display(); 
      ((Platform)platforms.get(i)).move(); 
    }
    t.move();
    t.display();
    platformsGoDown();
    makeNewPlatforms();
    removePlatforms();
    if(aPressed) 
    {
      t.xVel -= 0.05;
      t.x -= 4;
    }
    if(dPressed) 
    {
      t.xVel += 0.05;
      t.x += 4;
    }
    fill(0);
    rect(0,0, width, height/10);
    fill(200);
    text((int)score/10, 25,height/10);
    if(t.y >= height)
    {
      gameOver = true;
      println("gameover");
      gamescreen = 3;
    } 
  }

  if(gamescreen == 3)
  {
    background(0);
    text("GameOver", width/2.7, height/2);
    text("press the P key to play again", width/9, height/2 + 50);
    text("Score:" + "    " + (int)score/10, width/6, height/3);
    if(keyPressed && key == 'p')
    {
      gamescreen = 0;
      initialize();
    }
  }
}

void makeNewPlatforms()
{
  //println(platforms.size());
  if(platforms.size() == 8)
  {
    int rWord1 = (int)random(0,5);
    int rWord2 = (int)random(0,5);

    // x,y,w,h,word,modulo decider
    platforms.add(new Platform((int)random(20,150),-20,100,26, rWord1, 2));
    platforms.add(new Platform((int)random(280,350),-20,100,26, rWord2, 2));

    platforms.add(new Platform((int)random(20,150),-200,100,26, validSuffix(rWord1), 3));
    platforms.add(new Platform((int)random(300,350),-200,100,26, validSuffix(rWord2), 3)); 
  }
}

void platformsGoDown()
{
  //this function should control how the platforms move down and by how much they move down.
  float overMidpoint = height * 0.5 - t.y;
  //if TigerBall is over the midpoint of the screen
  if(overMidpoint > 0)
  {
    t.y += overMidpoint;
    for(int i=0; i<platforms.size(); i++)
    {
      //move all the platforms down by how much TigerBall is above the midpoint, creating the upward ascending illusion.
      ((Platform)platforms.get(i)).y += overMidpoint; 
    }
    score += overMidpoint;
  }
}

void removePlatforms()
{
  //for the current amount of platforms
  for(int i=platforms.size()-1; i>=0; i--) 
  {
    //if a platform is under the height of the screen
    if(((Platform)platforms.get(i)).y > height) 
    {
      platforms.remove(i);  
    }
  }
}

int validSuffix(int prefixNumber)
{
  int n = 0;
  if (prefixNumber == 0) n = 0;
  if (prefixNumber == 1) n = (int)random(1,3);
  //Because one partOne[prefixNumber] can match up with multiple partTwo word parts.
  if (prefixNumber == 2) n = (int)random(1,3); //Same
  if (prefixNumber == 3) n = (int)random(4,5); //Same
  if (prefixNumber == 4) n = 0;
  if (prefixNumber == 5) n = 3;
  return n;
}
/*
   Note:
 You can think of "validSuffix" as a translator. It takes an input,
 "prefixNumber" and gives back an output, "n".
 The input prefixNumber is the index of the chosen prefix in
 the array of all prefixes. The output n should be the index of a root
 word (from the root word array) that can combined with this prefix to
 form a valid or correct word.
 */

class Player
{
  boolean impact;
  float x, y, xVel, yVel;
  int w,h,prefixHit,timer;
  float bounceVel = 10; //Controls "bounce power"
  Player(float xi, float yi)
  {
    impact = false;
    timer = 0;
    x = xi;
    y = yi;
    w = 40;
    h = 60;
  }

  void display()
  {
    if(yVel<0) sprite = tigerball;
    else sprite = tigersplat;
    
    image(sprite,x,y,40,60);
    //ellipse(x,y,50,50);
  }

  void move()
  {
    x += xVel;
    y += yVel;
    yVel += 0.2;
    yVel = min(yVel, 4.0);

    if(keyPressed && key == 'a')
    {
      xVel -= 0.1;
      if(x < 0){
        x = width;
      } 
    }
    if(keyPressed && key == 'd')
    {
      xVel += 0.1;
      if(x > width){
        x = 0;
      } 
    }
  }

  void collide(Platform platform)
  {

    //checking for rectangle collision
    if(x         < platform.x + platform.w && 
      x + w     > platform.x              && 
      y+h/2+h/4 < platform.y + platform.h && 
      y + h     > platform.y)
    { 
      if (yVel > 0)
      { 
        // for bouncing 
        yVel = -bounceVel;

        /*
          if(prvNum != -10){
         if(pltFrm.myPart%2 == 1){
         if(prvNum==0 && pltFrm.Rword==0) println("Beneceps?");
         }
         }
         */

        /*
          println("My previous number was "+prvNum);
         println("My current number is "+pltFrm.Rword);
         println("=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=");
         println("The previous word I stepped on: "+partOne[prvNum]);
         println("The word I just recently stepped on: "+partTwo[pltFrm.Rword]);
         println("or");
         println("The previous word I stepped on: "+partTwo[prvNum]);
         println("The word I just recently stepped on: "+partOne[pltFrm.Rword]);
         println("=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=");
         println();
         */

        if(platform.myPart ==2)
        {
          prefixHit = platform.Rword;
          println("The 1st wordpart I touch is " + platform.Rword + "[" + partOne[platform.Rword] + "]" + " in the partOne string.");
        }
        
        if(platform.myPart==3)
        {
         int suffixHit = platform.Rword;
         println("The 2nd wordpart I touch is " + platform.Rword + "[" + partTwo[platform.Rword] + "]" +  " in the partTwo string.");
         
         if(prefixHit == 0)
         {
           if(suffixHit == 0)
           {
            println("I made " + "[" + partOne[prefixHit] + partTwo[suffixHit] + "]");
            //word: benefactor
           }
           else
           {
            gamescreen = 3;
            println("THIS IS NOT A WORD!!");
           }
         }
         
         if(prefixHit == 1) 
         {
           if(suffixHit == 1)
           { 
             println("I made " + "[" + partOne[prefixHit] + partTwo[suffixHit] + "]");
             //word: biceps
           } 
           else if(suffixHit == 2)
           {
             println("I made " + "[" + partOne[prefixHit] + partTwo[suffixHit] + "]");
             //word: bifocal
           }
           else if(suffixHit == 3)
           {
             println("I made " + "[" + partOne[prefixHit] + partTwo[suffixHit] + "]");
             //word: bilingual
           }
           else
           {
            gamescreen = 3;
             println("THIS IS NOT A WORD!!");
           }
         }      
         
         if(prefixHit == 2)
         {
           if(suffixHit == 1)
           {
             println("I made " + "[" + partOne[prefixHit] + partTwo[suffixHit] + "]");
             //word: triceps
           }
           else if(suffixHit == 2)
           {
             println("I made " + "[" + partOne[prefixHit] + partTwo[suffixHit] + "]");
             //word: trifocal
           }
           else if(suffixHit == 3)
           {
             println("I made " + "[" + partOne[prefixHit] + partTwo[suffixHit] + "]");
             //word: trilingual
           }
           else
           {
             gamescreen = 3;
              println("THIS IS NOT A WORD!!");
           }
         }
         
         if(prefixHit == 3)
         {
           if(suffixHit == 4)
           {
             println("I made " + "[" + partOne[prefixHit] + partTwo[suffixHit] + "]");
             //word: chronology
           }
           else if(suffixHit == 5)
           {
             println("I made " + "[" + partOne[prefixHit] + partTwo[suffixHit] + "]");
             //word: chronophobia
           }
           else
           {
            gamescreen = 3;
            println("THIS IS NOT A WORD!!");
           }
         }
         
         if(prefixHit == 4)
         {
           if(suffixHit == 0)
           {
             println("I made " + "[" + partOne[prefixHit] + partTwo[suffixHit] + "]");
             //word: malefactor
           }
           else
           {
            gamescreen = 3;
            println("THIS IS NOT A WORD!!");
           }
         }

         if(prefixHit == 5)
         {
           if(suffixHit == 3)
           {
             println("I made " + "[" + partOne[prefixHit] + partTwo[suffixHit] + "]");
             //word: monolingual
           }
           else if(suffixHit == 5)
           {
             println("I made " + "[" + partOne[prefixHit] + partTwo[suffixHit] + "]");
             //word: monophobia
           }
           else
           {
            gamescreen = 3;
            println("THIS IS NOT A WORD!!");
           }
         }   
        }
      }  
    }
  }
}

class Platform
{
  float x, y, w, h;
  int Rword;
  int xVel, yVel;
  int myPart;

  Platform(int xi, int yi, int wi, int hi, int word, int part)
  {
    x = xi;
    y = yi;
    w = wi;
    h = hi;
    Rword = word;
    myPart = part;
  }

  void display()
  {
    rect(x,y,w,h);
    image(cloudplat,x-5,y-5,125,35);
    fill(0);
    if(myPart % 2 == 0) text(partOne[Rword], x+10,y+24);
    else if(myPart % 2 == 1) text(partTwo[Rword], x+10,y+24);
  }

  void move()
  {
    x += xVel; 
    y += yVel; 
    if(x < 0){
      x = width;
    }
    if(x > width){
      x = 0;
    }
  }
}


void keyPressed() 
{ 
  if (keyCode == LEFT) aPressed = true; 
  if (keyCode == RIGHT) dPressed = true; 
}

void keyReleased() 
{ 
  if (keyCode == LEFT) aPressed = false;  
  if (keyCode == RIGHT) dPressed = false; 
} 


/*
(0,0)benefactor

(1,1)biceps
(1,2)bifocal
(1,3)bilingual

(2,1)triceps
(2,2)trifocal
(2,3)trilingual

(3,4)chronology
(3,5)chronophobia

(4,0)malefactor

(5,3)monolingual
(5,5)monophobia
*/

//Total # of words possible: 12




