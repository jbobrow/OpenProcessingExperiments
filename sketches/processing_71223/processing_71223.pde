
//bacon

//--------------GOON DOCKS-----------------//
//Where all imports are imported 
PFont myFont;
PFont myFontBold;
PImage shipBottom;
PImage shipLeft;
PImage shipRight;
PImage shipTop;
PImage gameLogo;
PImage controls;
import processing.video.*;
//Movie myMovie;
import ddf.minim.*;
Minim minim;
AudioPlayer twoShips;
AudioPlayer takeAHit;
AudioPlayer fireLaser;
AudioPlayer incomingMessage;
AudioPlayer shieldsBelowTwenty;
AudioPlayer shieldBelowFifty;
//AudioPlayer themeTune;
AudioPlayer noSound;
int numberOfComms = 6;
AudioPlayer alienComms[] = new AudioPlayer[numberOfComms];
//--------------END OF GOON DOCKS-----------------//


//-------------------INTERZONE--------------------------//
//Where all the variables, integers and floats, etc live... 
//Overall Game Variables
float hit = 2;//How much shields initially decrease per hit
float shields = 80;//Size of Shields and relates to pixel width of shield rectangle
boolean hyperDestruct = true;//Stops appending and shortening the spaceShips array at the same time during movie play!! BUG
boolean soundEffects = false;
boolean[] keys;//used to make movement more fluid to keyboard presses
int gold = 0;//starting gold/baconian rashers
float centerXScreen = 1000/2;//Half the screen X
float centerYScreen = 700/2;//Half the screen Y

//Draw Game Variables
//Sky Background color
int bgColorR = 5;
int bgColorB = 240;
int bgColorG = 222;
//Where the Logo goes
int logoX = 300;
int logoY = 0;
//Planet on front screen color, width and height
int planetR = 80;
int planetB = 180;
int planetG = 9;
int planetWidth = 4000;
int planetHeight = 300;
//GAME DIFFICULTY SETTING BELOW - STARTING DIFFILCUTY < 2000 GOLD is damage of 2
// SEE "Hit" Ship CLass variables below
int easyLevel = 2000;//When gold hits the Levels
int damageEasy = 3;//Damage to Shields increases to these numbers
int mediumLevel = 4000;
int damageMedium = 4;
int hardLevel = 6000;
int damageHard = 5;
int veryHardLevel = 8000;
int damageVeryHard = 8;
//Getting hit by your ships flashes Red below
int youGotHitR = 255;
int youGotHitB = 0;
int youGotHitG = 0;
int youGotHitTransparency = 100; 
//How much Gold you get when you destroy an alien ship
int goldPerHit = 200;
//More information Text transparencey to make various texts dissapear
int dissapear = 255;
int dissapear2 = 255;
int dissapear3 = 255;


//Alien Class Variables
float rAlien = random(52,127);
float gAlien = (234);
float bAlien = random(52,127);
int numberOfAliens = 9;
//TO MAKE ALIENS BIGGER OR SMALLER SEE "float bodyYDiam" IN THE CLASS

//EvilAliens Class Variables
int numberOfEvilAliens = 5;//5 in the array, random diameters and sizes
//TO MAKE EVIL HEADS BIGGER OR SMALLER SEE "float headXDiam" in the Class

//LocalStar Class Variables
int numberOfLocalStars = 50;// 50 in the array random colors(yes American spelling makes everything easier :(  )
int numberOfBackgroundStars = 2000;//Should be in Stars Vlass Variables??????
float moveXSteering = 8;//Speed at which the Ship Class can virtually steer, increase and decrase available for manouvering
float moveYSteering = 8;//As above

//OtherShip Class Variables
int numberOfSpaceShips = 1;//number of first wave enemy ships
float otherShipSpeedMin = -3;//Changing can make the otherShips faster or slower/harder or easier
float otherShipSpeedMax = 3;
//Change difficulty easier
float otherSpeedEasy = 4;
float otherSpeedMedium = 5;
float otherSpeedHard = 6;
float otherSpeedVeryHard = 7;
//TO MAKE SHIPS BIGGER OR SMALLER SEE "float shipXDiam" in the Class

//OtherShip2 Class Variables
int numberOfSpaceShips2 = 1;//front screen example to prepare for whats to come

//Ship Class Variables
float deskR = random(254);//No longer valid?
float deskB= random(254);//No longer valid?
float deskG= random(254);//No longer valid?
float deskRMoveBy = 7;//No longer valid?
float deskBMoveBy= 13;//No longer valid?
float deskGMoveBy= 18;//No longer valid?

//Stars Class Variables
int numberOfStars = 200;

//Game Load Variables
float textScrollUp = 720;
float textScrollUpComplete = 600;

//----------------END OF INTERZONE---------------------//



//--------------------SETUP!!!!!---------------------//
void setup(){
  size(1000,700);
  //Fonts
  myFont = loadFont("UbuntuCondensed-Regular-24.vlw");
  myFontBold = loadFont("Ubuntu-Bold-28.vlw");  
  //Class Setups
  starDriveSetUp();
  starSetUp();
  evilAlienSetup();
  alienSetUp();
  shipRoom = new Ship();
  otherShipSetup();
  otherShipSetup2();
  //Movie Files
  //myMovie = new Movie(this,"CIMG1322.MOV");
  //myMovie.loop();
  //Bools for movement and music
  keys=new boolean[10];
  keys[0]=false;
  keys[1]=false;
  keys[2]=false;
  keys[3]=false;
  keys[4]=false;
  keys[5]=false;
  keys[6]=false;
  keys[7]=false;
  keys[8]=false;
  keys[9]=false;
  //Sound Files
  minim = new Minim(this);
  takeAHit = minim.loadFile("Alien_destroyed.wav");
  fireLaser = minim.loadFile("fire.wav");
  shieldsBelowTwenty = minim.loadFile("shields_below_20_percent.wav");
  shieldBelowFifty = minim.loadFile("shields_50_percent.wav");
  incomingMessage = minim.loadFile("incoming_message.wav");
  //themeTune = minim.loadFile("alien_game_theme.wav");  
  alienComms[0] = minim.loadFile("0allYourBase.wav");
  alienComms[1] = minim.loadFile("0allYourSpeciesAreSlaves.wav");
  alienComms[2] = minim.loadFile("0moreShips.wav");
  alienComms[3] = minim.loadFile("0neverWin.wav");
  alienComms[4] = minim.loadFile("0timeToDie.wav");
  alienComms[5] = minim.loadFile("0youWillDie.wav");
  //Image files
  shipBottom = loadImage("ship_bottom.jpg");
  shipLeft = loadImage("Ship_Left.jpg");
  shipRight = loadImage("ship_right.jpg");
  shipTop = loadImage("ship_top.jpg");
  gameLogo = loadImage("Revenge_logo.jpg");
  controls = loadImage("controls.jpg");
}
//--------------END OF SETUP-----------------------//

//-----------------DRAW!!!--------------------------//
void draw(){
  //----INTRODUCTION AND CONTROLS IMAGE--//
  if (keys[7]==false)
  {
    background(bgColorR,bgColorB,bgColorG);
    float r = (float) random(0,254);
    float b = (float) random(0,254);
    float g = (float) random(0,254);
    //controls image
    image(controls,0,0);
    //logo image
    image(gameLogo,logoX,logoY);
    otherShipDraw2();
    //fill for planet
    fill(planetR,planetB,planetG);
    //size for planet
    ellipse(0,height,planetWidth, planetHeight);
    evilAlienDraw();
    aliens();
    fill (0);
    text("Press 1 to Skip",width-200,20);
    strokeWeight(5);
    fill (0,0,0,dissapear3);
    textFont(myFontBold);
    text("Many years ago, an evil alien lifeforce of giant floating heads,\ncalled the Floaty Evil Head People, landed on the planet\nBaconia. Their goal was total control of the planet and\nto enslave the population. You were only 5 years old\nwhen the planet was attacked, and as your family were\ntransported off the planet, you managed to escape\nby hiding inside a large vat of cheese.\nSince then you have been saving up money, by selling\nbacon and cheese to traders, to buy a ship and go on\na personal war with the Floaty Evil Head People.\nIf you manage to destroy enough of their ships,\nand get 10000 Baconian Rashers you can buy your\npeople back and live the rest of your life in peace...",170,textScrollUp);
    textFont(myFont);
    strokeWeight(1);
    textScrollUp = textScrollUp - 0.5;
   /* if (textScrollUp >height/2)
    {
      themeTune.play();
    }
    if (textScrollUp <=height/2-30)
    {
      themeTune.pause(); 
    }*/
    if (textScrollUp <= 100)
    {
      textScrollUp = 99;
      fill(r,g,b);
      text ("Press 1 to Start - Good Luck!!",10,600);
      dissapear3 = dissapear3 -10;
      if (dissapear3 < 5)
      {
      dissapear3 = 0;
      }   
    }
  }
     //-----END OF INTRODUCTION------//
     
    //------START MAIN GAME---------//
  //Press 1 to start aka keys[7] 
  else
  {
    soundEffects = true;
    float r = (float) random(0,254);
    float b = (float) random(0,254);
    float g = (float) random(0,254);
    background(0);
    //press "h" aka keys[5] to delete all spacehsips from array and push shields to 60
    if (keys[5] == true) 
    {
      if (shields <50)
      {
        shields = 60;
      }
      starDrive(); 
      if (starArray>=45)
      {
        starArray = 0;
      }
      starArray = (int) starArray+1;
      if (spaceShips.length >0)
      {
        spaceShips = (OtherShip []) shorten(spaceShips);   
      }      
    }
    else
    {
     starDraw();
     otherShipDraw();
     //Below - getting hit by other ships
     for (int loop = 0; loop < spaceShips.length; loop++) 
     {
       if (spaceShips[loop].checkForOverlapShields(shipRoom))
       {
         //hit colors
         fill(youGotHitR,youGotHitB,youGotHitG,youGotHitTransparency);
         rect(0,0,width,height);
         shields = shields-hit;
         takeAHit.rewind();
         takeAHit.play();
       }
     }
     //Below - firing your laser consequences - Key m
     if (keys[4]==true)
     {
       for (int loop = 0; loop < spaceShips.length; loop++) 
       {
         if (spaceShips[loop].checkForOverlap(shipRoom))
         {
           spaceShips[loop] = spaceShips[spaceShips.length-1];
           spaceShips = (OtherShip []) shorten(spaceShips);
           gold = gold + goldPerHit;
         }
       }
     }
   }
   //Press ZERO to continue!!
   shipRoom.laserFrikinBeam();
   if (keys[6]==true )
   {
     hyperDestruct = false;
     //myMovie.read();
     fill(0);
     //image(myMovie, width/10,height/10,(width/10)*9,height/2*1.5 );
     //While communications are open spaceShips array starts increasing
     float randomNumber = random(1,10);
     if (spaceShips.length <=randomNumber)
     {
       OtherShip newShips = new OtherShip(random(50,900), random(300,400));
       spaceShips = (OtherShip []) append(spaceShips, newShips);   
     }
   }
   shipRoom.spaceShip();
   // MORE CONTROLS!!!
   fill(r,b,g,dissapear);
   text("When enemy ships are in the Red Cursor, press M to fire!!", 250, 60);
   text("Avoid taking enemy fire\n       In this area", 380, height/2*1.5);
   if (keys[7]==true)
   {
     dissapear = dissapear-1;
     if (dissapear <= 5)
     {
       dissapear=0; 
     }
   }
   if (keys[6]==true)
   {
     fill(r,b,g);
     text("Under Attack!! - Press 9 to continue", 300,30); 
   }
   if (keys[6]==false)
   {
     for (int loop=0; loop!=alienComms.length; loop++)
     {
       alienComms[loop].rewind();
       alienComms[loop].pause();
     }

   }
   textFont(myFont,24);
   //colors for messages
   fill(255,3,3);
   if (spaceShips.length==0)
   {
     fill(r,b,g);
     text("Incoming Communication!! - Press Zero to continue", 300, 30);
     incomingMessage.play();
   }
   fill(0);   
   text("Hostile Ships: " + spaceShips.length, 100, 30);
   text("Baconian\n Rashers", width-100,90);
   text(gold, width-100, 140);
   //GAME DIFFICULTY BELOW - MORE GOLD MORE DAMAGE TO SHIELDS
   if (gold == easyLevel)
   {
     hit=damageEasy;
   }
   if (gold == mediumLevel)
   {
     hit=damageMedium;
     otherShipSpeedMin = -otherSpeedMedium;
     otherShipSpeedMax = otherSpeedMedium;
   }
   if (gold == hardLevel)
   {
     hit=damageHard;
     otherShipSpeedMin = -otherSpeedHard;
     otherShipSpeedMax = otherSpeedHard;
   }
   if (gold == veryHardLevel)
   {
     hit=damageVeryHard;
     otherShipSpeedMin = -otherSpeedVeryHard;
     otherShipSpeedMax = otherSpeedVeryHard;
   }
   //shields
   if (shields <50 && shields >47)
   {
     shieldBelowFifty.rewind();
     shieldBelowFifty.play();
   }
   if (shields <20 && shields >17)
   {
     shieldsBelowTwenty.rewind();
     shieldsBelowTwenty.play();
   }
   //CHEAT CODE - 1 ship kill away from completing game!!!
   if (keyPressed)
   {
     if (key=='#')
     {
       gold = 9800;
     }
   }
   //--------END OF MAIN GAME------//
   //GAME OVER 
   if (shields<=0)
   {
     soundEffects = false;
     fireLaser.pause();
     incomingMessage.pause();
     if (spaceShips.length >0)
     {
       spaceShips = (OtherShip []) shorten(spaceShips);   
     }
     fill(0);
     rect(0,0,width,height);
     fill(255);
     textFont(myFontBold);
     text("GAME OVER - SORRY\nIF YOU WANT TO PLAY AGAIN PLEASE CLOSE AND RESTART\nBETTER LUCK NEXT TIME", 100,500); 
     textFont(myFont);
     evilAlienDraw();
   }
   //GAME WON
   if (gold>=10000)
   {
     shields=80;
     soundEffects = false;
     fireLaser.pause();
     incomingMessage.pause();
     if (spaceShips.length >0)
     {
       spaceShips = (OtherShip []) shorten(spaceShips);   
     }
     //reuse top details for below of planet colors and sizes
     background(bgColorR,bgColorB,bgColorG);
     fill(80,180,9);
     ellipse(0,height,4000,300);
     if (theAliens.length <=8)
     {
       rAlien =(int) random(52,127);
       gAlien =(int) (234);
       bAlien =(int) random(52,127);
       Alien newAliens = new Alien(color(rAlien,gAlien,bAlien),random(2,6),random(50,900), random(300,400));
       theAliens = (Alien []) append(theAliens, newAliens);   
     }
     aliens();
     fill(0);
     textFont(myFontBold);
     text("CONGRATULATIONS!! YOU HAVE FREED YOUR PEOPLE.\nYOU WILL FEAST HARDILY ON BACON AND CHEESE TONIGHT!!", 100,50);
     text("Game designed, coded and animated by - David Nicol\nSound Created on:\nAudacity and GeSpeak using Ubuntu by - David Nicol\nImages created on Photoshop by David Nicol\nVideo filmed on Casio Elixim ZR100 by David Nicol\nSpecial Thanks to: \nDr. John Owens\nEdinburgh Napier University\nEveryone at Processing.org\nChrisir on Processing Forums\nLaura\nMerle the Dog for being a placeholder for the video\n",100,textScrollUpComplete);
     textScrollUpComplete = textScrollUpComplete - 0.5;
     if (textScrollUpComplete <= 100)
     {
       textScrollUpComplete = 99;
     }    
   }
 }//END OF GAME
}//END OF DRAW

      
void stop(){
  minim.stop();
  super.stop();
}//END OF SOUND STOP
      
void keyPressed(){
  if(key=='a'||key=='A')
  keys[0]=true;
  if(key=='d'||key=='D')
  keys[1]=true;
  if(key=='w'||key=='W')
  keys[2]=true;
  if(key=='s'||key=='S')
  keys[3]=true;
  if(key=='m'||key=='M')
  {
    if (soundEffects==true)
    {
      fireLaser.rewind();
      fireLaser.play();
      keys[4]=true;
    }
    else
    {
     keys[4]=true; 
    }
  }
  if(key=='h'||key=='H')
  keys[5]=true;
  if(key=='0'||key==')')
  {
    if(soundEffects==true)
    {
      keys[6]=true;
      int soundIndex = (int) random(alienComms.length);
      println(soundIndex);
      alienComms[soundIndex].rewind();
      alienComms[soundIndex].play();
      incomingMessage.rewind();
      incomingMessage.pause();
    }
    else
    {
       keys[6]=true; 
    }
  }
  if(key=='9'||key=='(')
  keys[6]=false;
  if(key=='1')
  {
  keys[7]=true;
 // themeTune.pause();
  }
  if(key=='i')
  keys[8]=true;
 //NOT WORKING BELOW  - Trying to change overall game speeds with buttons. Not working during runtime??
 /* if (key==2)
  {
    moveXSteering = moveXSteering-1;
    moveYSteering = moveXSteering-1;
    otherShipSpeedMax = otherShipSpeedMax-1;
    otherSpeedEasy = otherSpeedEasy-1;
    otherSpeedMedium = otherSpeedMedium-1;
    otherSpeedHard = otherSpeedHard-1;
    otherSpeedVeryHard = otherSpeedVeryHard-1;
  }
  if (key==5)
  {
    moveXSteering = moveXSteering+1;
    moveYSteering = moveXSteering+1;
    otherShipSpeedMax = otherShipSpeedMax+1;
    otherSpeedEasy = otherSpeedEasy+1;
    otherSpeedMedium = otherSpeedMedium+1;
    otherSpeedHard = otherSpeedHard+1;
    otherSpeedVeryHard = otherSpeedVeryHard+1;
  }*/
}//END OF KEYPRESSED

void keyReleased(){
  if(key=='a'||key=='A')
  keys[0]=false;
  if(key=='d'||key=='D')
  keys[1]=false;
  if(key=='w'||key=='W')
  keys[2]=false;
  if(key=='s'||key=='S')
  keys[3]=false;
  if(key=='m'||key=='M')
  keys[4]=false;
  if(key=='h'||key=='H')
  keys[5]=false;
  if(key=='I')
  keys[8]=false;
}//END OF KEYRELEASED
Alien theAliens[] = new Alien[numberOfAliens];

class Alien{ 
  color alienColor;
  float moveByBody;
  float bodyXCenter;
  float bodyYCenter;
  
  Alien(color tempC, float tempXSpeed, float tempXLoc, float tempYLoc) {
    alienColor = tempC;
    moveByBody = tempXSpeed;
    bodyXCenter = tempXLoc;
    bodyYCenter = tempYLoc;//200
  }
  
  //SMALLER AND BIGGER ALIENS HERE!!!!
  float bodyYDiam = random(80,120);
  float bodyXDiam = bodyYDiam/1.667;
  
  //aRL = alein ratio lines urgh
  float aRL10 = bodyYDiam/20;
  float aRL15 = bodyYDiam/13.33;
  float aRL20 = bodyYDiam/10;
  float aRL25 = bodyYDiam/8;
  float aRL30 = bodyYDiam/6.667;
  float aRL35 = bodyYDiam/5.714;
  float aRL40 = bodyYDiam/5;
  float aRL45 = bodyYDiam/4.44;
  float aRL50 = bodyYDiam/4;
  float aRL55 = bodyYDiam/3.636;
  float aRL60 = bodyYDiam/3.33;
  float aRL65 = bodyYDiam/3.077;
  float aRL70 = bodyYDiam/2.857;
  float aRL75 = bodyYDiam/2.667;
  float aRL100 = bodyYDiam/2;
  float aRL125 = bodyYDiam/1.6;
  float aRL165 = bodyYDiam/1.212;
  float aRL180 = bodyYDiam/1.11;
  float aRL200 = bodyYDiam/1;
  float aRL250 = bodyYDiam/0.8;
  float aRL270 = bodyYDiam/0.741;
  float aRL275 = bodyYDiam/0.727;
  float aRL285 = bodyYDiam/0.702;
  float aRL300 = bodyYDiam/0.667;
  float aRL310 = bodyYDiam/0.645;
  float aRL340 = bodyYDiam/0.588;
  float aRL390 = bodyYDiam/0.513;
  float aRL400 = bodyYDiam/0.5;
  float aRL450 = bodyYDiam/0.444;
  float aRL475 = bodyYDiam/0.421;
  float aRL550 = bodyYDiam/0.364;
  float aRL590 = bodyYDiam/0.339;
  float aRL600 = bodyYDiam/0.333;
  float aRL750 = bodyYDiam/0.267;
  float aRL552 = bodyYDiam/0.362;
  float aRL562 = bodyYDiam/0.356;
  float aRL572 = bodyYDiam/0.350;
  float aRL582 = bodyYDiam/0.344;
  
  float fingerTips = 100;
  float fingerTipEndsOne = 25;
  float fingerTipEndsTwo = 15;
 
  
  float bodyDeadXLow = bodyXCenter-aRL70;
  float bodyDeadXHigh = bodyXCenter+aRL70;
  float bodyDeadYLow = bodyYDiam-aRL70;
  float bodyDeadYHigh = bodyYDiam+aRL70;
  
    //Alien Arms and ArmS
  int armYStretched = 300;
  int leftYArmBody = 400; 
  int rightYArmBody = 400;
  int fingerLength = 20;
  int fingerEndPosition = armYStretched-15;
  int moveByFingers = 1;
  int moveByArms = 1;
  
  //antennae color
  int antennaeR = 255;
  int antennaeB = 0;
  int antennaeG = 0;
  
  //tummy color
  int tummyR = 230;
  int tummyB = 234;
  int tummyG = 7;
 
  
  //bellyButtonColor
  int bellyButtonR = 255;
  int bellyButtonB = 3;
  int bellyButtonG = 163;
  
 //alien.DISPLAY 
  void display() 
  {
    smooth();
    stroke(alienColor);    
  //ArmS   
    line(bodyXCenter,leftYArmBody,bodyXCenter-fingerTips,armYStretched);
    line(bodyXCenter,rightYArmBody,bodyXCenter+fingerTips,armYStretched);
  //Fingers Left   
    line(bodyXCenter-fingerTips,armYStretched,bodyXCenter-fingerTips - fingerLength, fingerEndPosition + fingerTipEndsOne);
    line(bodyXCenter-fingerTips,armYStretched,bodyXCenter-fingerTips - fingerLength, fingerEndPosition + fingerTipEndsTwo);
    line(bodyXCenter-fingerTips,armYStretched,bodyXCenter-fingerTips - fingerLength, fingerEndPosition + fingerTipEndsTwo);
    line(bodyXCenter-fingerTips,armYStretched,bodyXCenter-fingerTips - fingerLength, fingerEndPosition);
   //Fingers right
    line(bodyXCenter+fingerTips,armYStretched,bodyXCenter+fingerTips + fingerLength,fingerEndPosition + fingerTipEndsOne);
    line(bodyXCenter+fingerTips,armYStretched,bodyXCenter+fingerTips + fingerLength, fingerEndPosition + fingerTipEndsTwo);
    line(bodyXCenter+fingerTips,armYStretched,bodyXCenter+fingerTips + fingerLength,fingerEndPosition + fingerTipEndsTwo);
    line(bodyXCenter+fingerTips,armYStretched,bodyXCenter+fingerTips + fingerLength,fingerEndPosition);
   //Body 
    noStroke();
    fill(alienColor);//ALIEN GREEN
    stroke(0);
    ellipse(bodyXCenter,bodyYCenter,bodyXDiam,bodyYDiam);//head
    fill(antennaeR,antennaeB,antennaeG);//RED
    stroke(alienColor);//ALIEN GREEN
    line(bodyXCenter-aRL40,bodyYCenter-aRL75,bodyXCenter-aRL60,bodyYCenter-aRL180);//left antennae
    line(bodyXCenter+aRL40,bodyYCenter-aRL75,bodyXCenter+aRL60,bodyYCenter-aRL180);//left antennae
    ellipse(bodyXCenter-aRL60,bodyYCenter-aRL180,aRL10,aRL10);
    ellipse(bodyXCenter+aRL60,bodyYCenter-aRL180,aRL10,aRL10);
    line(bodyXCenter+aRL15-aRL35,bodyYCenter+aRL50,bodyXCenter+aRL15+aRL35,bodyYCenter+aRL50);//line through mouth
    fill(0);//BLACK
    ellipse(bodyXCenter-aRL35,bodyYCenter,aRL50,aRL35);//left eye
    ellipse(bodyXCenter+aRL35,bodyYCenter,aRL50,aRL35);//right eye
    ellipse(bodyXCenter,bodyYCenter+aRL50,aRL20,aRL20);//mouth
  //body
    fill(alienColor);
    stroke(0);
    ellipse(bodyXCenter,bodyYCenter+aRL250,aRL50,aRL300);
    fill(tummyR,tummyB,bellyButtonG);//TUMMY COLOUR
    ellipse(bodyXCenter,bodyYCenter+aRL250,aRL30,aRL200);
    fill(bellyButtonR,bellyButtonB,bellyButtonG);
    ellipse(bodyXCenter,bodyYCenter+aRL275,aRL10,aRL10);
  //LEGS
    stroke(alienColor);    
    line(bodyXCenter-aRL10,bodyYCenter+aRL390,bodyXCenter-aRL15,bodyYCenter+aRL550);
    line(bodyXCenter+aRL10,bodyYCenter+aRL390,bodyXCenter+aRL15,bodyYCenter+aRL550);
    line(bodyXCenter-aRL15,bodyYCenter+aRL550,bodyXCenter-aRL75,bodyYCenter+aRL552);
    line(bodyXCenter-aRL15,bodyYCenter+aRL550,bodyXCenter-aRL55,bodyYCenter+aRL572);
    line(bodyXCenter-aRL15,bodyYCenter+aRL550,bodyXCenter-aRL65,bodyYCenter+aRL562);
    line(bodyXCenter-aRL15,bodyYCenter+aRL550,bodyXCenter-aRL45,bodyYCenter+aRL582);
    line(bodyXCenter+aRL15,bodyYCenter+aRL550,bodyXCenter+aRL75,bodyYCenter+aRL552);
    line(bodyXCenter+aRL15,bodyYCenter+aRL550,bodyXCenter+aRL65,bodyYCenter+aRL562);
    line(bodyXCenter+aRL15,bodyYCenter+aRL550,bodyXCenter+aRL55,bodyYCenter+aRL572);
    line(bodyXCenter+aRL15,bodyYCenter+aRL550,bodyXCenter+aRL45,bodyYCenter+aRL582);
  }
  void drive() {
    armYStretched = armYStretched + moveByArms;
    if (armYStretched > bodyYCenter+100)
    {
      moveByArms = moveByArms * -1;
    }
    if (armYStretched < bodyYCenter-100)
    {
      moveByArms = moveByArms * -1;
    }
    fingerEndPosition = fingerEndPosition + moveByFingers;
    if (fingerEndPosition > bodyYCenter+100)
    {
      moveByFingers = moveByFingers * -1;
    }
    if (fingerEndPosition < bodyYCenter-100)
    {
      moveByFingers = moveByFingers * -1;
    }
    bodyXCenter = bodyXCenter + moveByBody;
    if (bodyXCenter >= width-aRL50)
    {
      moveByBody = moveByBody * -1;
    }
    if (bodyXCenter <= aRL50)
    {
      moveByBody = moveByBody * -1;
    }
  }
  
  boolean checkForOverlap (EvilAliens evilAliens[]){
    for (int loop=0; loop < evilAliens.length; loop++)
    {
    float laserEyesX = evilAliens[loop].laserEndX;
    float laserEyesY = evilAliens[loop].laserEndY;
    float farApart = (float)dist(bodyXCenter, bodyYCenter, laserEyesX, laserEyesY);
    //println("X " + bodyXCenter + " EyesX " + laserEyesX + " apart "  + farApart + "Y " + bodyYCenter + " EyesY " + laserEyesY);
      println(bodyXDiam/2);
      println(bodyYDiam/2);
      if (farApart < bodyYDiam/2 && farApart < bodyXDiam/2)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  
    //temp fix
    return false;
  }
    
}//End of Aliens Class

void alienSetUp(){
  int rAlien;
  int gAlien;
  int bAlien;
  
  for (int loop = 0; loop < theAliens.length; loop++) 
  {
    rAlien =(int) random(52,127);
    gAlien =(int) (234);
    bAlien =(int) random(52,127);
    theAliens [loop] = new Alien(color(rAlien,gAlien,bAlien),random(2,6),random(50,900), random(300,400));
    //Alien(color tempC, float tempXSpeed, float tempXLoc, float tempYLoc) 
  }
}

//To go to Draw
void aliens(){
   for (int loop = 0; loop < theAliens.length; loop++) 
   {
     theAliens[loop].drive();
     theAliens[loop].display();
  }
}
EvilAliens evilAliens[] = new EvilAliens[numberOfEvilAliens];

class EvilAliens{
  float headXCenter; 
  float headYCenter; 
 
  EvilAliens(float tempX, float tempY){
     headXCenter = tempX; 
     headYCenter = tempY;  
  }
  
  float translucant = 0;
  float fadeIn = 3;
  //SMALLER AND BIGGER ALIENS HERE!!!!
  float headXDiam = random(120,180); 
  float moveByBodyX = 1;
  float moveByBodyY = 1;
  float headYDiam = headXDiam;
  float lowHeadCurveXAngle = headXDiam/2.769;//57
  float lowHeadCurveYAngel = headXDiam/0.2589;//626
  float lowHeadStartX = headXDiam/2.57;//70
  float lowHeadStartY = headXDiam/3.6;//aMECLXaMECLX50

 //X 170 Alien Mouth and Eye Curve Lines = aMECLX the number is the first scale state where headYDiam is 170 and Y Diamis 195
  float aMECLX50 = headXDiam/3.6; //aMECLXaMECLX50
  float aMECLX40 = headXDiam/4.5; //40
  float aMECLX30 = headXDiam/6; //30
  float aMECLX32 = headXDiam/5.625; //32
  float aMECLX25 = headXDiam/7.2; //25
  float aMECLX20 = headXDiam/9; //20
  float aMECLX15 = headXDiam/12; //15
  float aMECLX10 = headXDiam/18; //10
  float aMECLX5 = headXDiam/36; //5
  float aMECLX7 = headXDiam/25.714; //7
  float aMECLX3 = headXDiam/60; //3

 //Y 195
  float aMECLY185 = headYDiam/0.973; //185
  float aMECLY155 = headYDiam/1.161; //155
  float aMECLY125 = headYDiam/1.44; //125
  float aMECLY120 = headYDiam/1.5; //120
  float aMECLY115 = headYDiam/1.565; //115
  float aMECLY112 = headYDiam/1.607; //112
  float aMECLY107 = headYDiam/1.682; //107
  float aMECLY100 = headYDiam/1.8; //100
  float aMECLY95 = headYDiam/1.895; //95
  float aMECLY85 = headYDiam/2.118; //85
  float aMECLY80 = headYDiam/2.25; //80
  float aMECLY76 = headYDiam/2.368; //76
  float aMECLY65 = headYDiam/2.769; //65
  float aMECLY52 = headYDiam/3.462; //52
  float aMECLY45 = headYDiam/4; //45
  float aMECLY40 = headYDiam/4.5; //40
  float aMECLY5 = headYDiam/36; //5
  
  //Alien Skin Color
  int alienSkinR = 255;
  int alienSkinB = 255;
  int alienSkinG = 255;

  void head(){
    smooth();
    noStroke(); 
    fill(alienSkinR, alienSkinB, alienSkinG, translucant);
    ellipse(headXCenter, headYCenter, headXDiam, headYDiam);//HEAD GLOBE
    curve(headXCenter-lowHeadCurveXAngle, headYCenter-lowHeadCurveYAngel, headXCenter-lowHeadStartX, headYCenter+lowHeadStartY, headXCenter+lowHeadStartX, headYCenter+lowHeadStartY, headXCenter+lowHeadCurveXAngle, headYCenter-lowHeadCurveYAngel);//JAW BONE
    stroke(0,0,0,25);
    noFill();
    curve(headXCenter-aMECLX40, headYCenter+aMECLY120, headXCenter-aMECLX32, headYCenter+aMECLY115, headXCenter-aMECLX15, headYCenter+aMECLY85, headXCenter, headYCenter+aMECLY5);//LINES OF LIBERTY LEFT TOP
    curve(headXCenter+aMECLX40, headYCenter+aMECLY120, headXCenter+aMECLX32, headYCenter+aMECLY115, headXCenter+aMECLX15, headYCenter+aMECLY85, headXCenter, headYCenter+aMECLY5);//LIBERTEEEE RIGTHT TOP
    curve(headXCenter-aMECLX40, headYCenter+aMECLY100, headXCenter-aMECLX32, headYCenter+aMECLY115, headXCenter-aMECLX25, headYCenter+aMECLY125, headXCenter, headYCenter+aMECLY185);//LINES OF LIBERTY LEFT BOTTOM
    curve(headXCenter+aMECLX40, headYCenter+aMECLY100, headXCenter+aMECLX32, headYCenter+aMECLY115, headXCenter+aMECLX25, headYCenter+aMECLY125, headXCenter, headYCenter+aMECLY185);//LIBERTEEEE RIGHT BOTTOM  
    stroke(0);
    fill(0);
    ellipse(headXCenter-aMECLX5, headYCenter+aMECLY80, aMECLY5, aMECLY5);//NOSTREL LEFT
    ellipse(headXCenter+aMECLX5, headYCenter+aMECLY80, aMECLY5, aMECLY5);//NOSTREL RIGHT
    triangle(headXCenter-aMECLX7, headYCenter+aMECLY80, headXCenter-aMECLX5, headYCenter+aMECLY76, headXCenter-aMECLX3, headYCenter+aMECLY80);//NOSTREL PEAK LEFT
    triangle(headXCenter+aMECLX7, headYCenter+aMECLY80, headXCenter+aMECLX5, headYCenter+aMECLY76, headXCenter+aMECLX3, headYCenter+aMECLY80);//NOSTREL PEAK RIGHT
    mouth();
    eyes();
    laserFrikinBeam();
  }

  void mouth(){
    smooth();
    fill(255,0,0);
    stroke(0);
  //Curves are nasty - (x,y control angle of attack,b,c are first point co-ords, d,e are ending coords,u,v are exit angle - sheesh
    curve(headXCenter-aMECLX40, headYCenter+aMECLY52, headXCenter-aMECLX30, headYCenter+aMECLY112, headXCenter+aMECLX30, headYCenter+aMECLY115, headXCenter+aMECLX40, headYCenter+aMECLY65);//BOTTOM LIP
    curve(headXCenter-aMECLX30, headYCenter+aMECLY107, headXCenter-aMECLX20, headYCenter+aMECLY112, headXCenter, headYCenter+aMECLY115, headXCenter, headYCenter+aMECLY155);//LEFT TOP LIP
    curve(headXCenter+aMECLX30, headYCenter+aMECLY120, headXCenter+aMECLX20, headYCenter+aMECLY115, headXCenter, headYCenter+aMECLY115, headXCenter, headYCenter+aMECLY155);//RIGHT TOP LIP
    curve(headXCenter-aMECLX40, headYCenter+aMECLY80, headXCenter-aMECLX30, headYCenter+aMECLY112, headXCenter+aMECLX30, headYCenter+aMECLY115, headXCenter+aMECLX40, headYCenter+aMECLY95);//LIP BREAK
  }

  void eyes(){
    smooth();
    fill(0);
    curve(headXCenter-aMECLX10, headYCenter+aMECLY125, headXCenter-aMECLX20, headYCenter+aMECLY45, headXCenter-aMECLX50, headYCenter+aMECLY40, headXCenter-aMECLX30, headYCenter+aMECLY80);//LEFT EYE TOP
    curve(headXCenter+aMECLX10, headYCenter+aMECLY125, headXCenter+aMECLX20, headYCenter+aMECLY45, headXCenter+aMECLX50, headYCenter+aMECLY40, headXCenter+aMECLX30, headYCenter+aMECLY80);//RIGHT EYE TOP
    curve(headXCenter-aMECLX50, headYCenter+aMECLY45, headXCenter-aMECLX20, headYCenter+aMECLY45, headXCenter-aMECLX50, headYCenter+aMECLY40, headXCenter-aMECLX30, headYCenter+aMECLY5);
    curve(headXCenter+aMECLX50, headYCenter+aMECLY45, headXCenter+aMECLX20, headYCenter+aMECLY45, headXCenter+aMECLX50, headYCenter+aMECLY40, headXCenter+aMECLX30, headYCenter+aMECLY5);
  }

  void laserFrikinBeam(){
    smooth();
    stroke(laserR,laserB,laserG);
    strokeWeight(4);
   // line(headXCenter-aMECLX20-12, headYCenter+aMECLY45-5,mouseX,mouseY);
    //line(headXCenter+aMECLX20+12, headYCenter+aMECLY45-5,mouseX,mouseY);  
    line(headXCenter-aMECLX20-12, headYCenter+aMECLY45-5,laserEndX,laserEndY);
    line(headXCenter+aMECLX20+12, headYCenter+aMECLY45-5,laserEndX,laserEndY);
    strokeWeight(1);
  }

/* line(headXCenter-aMECLX20-12, headYCenter+aMECLY45-5,laserLeftEndX,laserLeftEndY);
   line(headXCenter+aMECLX20+12, headYCenter+aMECLY45-5,laserRightEndX,laserRightEndY);*/

  int laserMove = 1;
  float laserR = (0);
  float laserB = (187);
  float laserG = (252);
  float laserEndX = (headXCenter-aMECLX20);
  float laserEndY = (headYCenter+aMECLY45);


  void driveLaser() {
    float laserMoveX = random(-15, 15);
    float laserMoveY = random(-15, 15);
    laserEndX = laserEndX + laserMoveX;
    laserEndY = laserEndY + laserMoveY;
    laserEndX = laserEndX + laserMoveX;
    laserEndY = laserEndY + laserMoveY;
    if (laserEndX > width || laserEndX < 0 || laserEndY > height || laserEndY < 0) 
    {
      laserEndX = (headXCenter-aMECLX20);
      laserEndY = (headYCenter+aMECLY45);
    }
  }
  
  void evilMove() {
     headXCenter = headXCenter + moveByBodyX;
     headYCenter = headYCenter + moveByBodyY;
     if (headXCenter < 50 || headXCenter > 950)
     {
       moveByBodyX = moveByBodyX *-1;
     }   
     if ( headYCenter < 50 || headYCenter > 250) 
     {
       moveByBodyY = moveByBodyY *-1;
     }
  }

  void fadeIn() {
    translucant = translucant + fadeIn;
    if (translucant == 254)
    {
     translucant = 255;
    }
  }
}

void evilAlienSetup() {
  for (int loop = 0; loop < evilAliens.length; loop++)
  {
   evilAliens [loop] = new EvilAliens(random(100,900),random(100,200)); 
  }
}

int alienArray = int(0);

void evilAlienDraw() {
  evilAliens[alienArray].head();
  evilAliens[alienArray].driveLaser(); 
  evilAliens[alienArray].evilMove();
  evilAliens[alienArray].fadeIn();
}
LocalStar star[] = new LocalStar[numberOfLocalStars];  

BackgroundStars backStars[] = new BackgroundStars[numberOfBackgroundStars];

class BackgroundStars{
  float randomXPoints;
  float randomYPoints;

  BackgroundStars(float tempXloc, float tempYLoc){
    randomXPoints = tempXloc;
    randomYPoints = tempYLoc;
  }
  
  void display(){
    stroke(255);
    fill(255);
    point(randomXPoints,randomYPoints);
    if (randomXPoints <= 0)
    {
      randomXPoints = width-3;
    }
    if (randomXPoints >=width)
    {
      randomXPoints = 3; 
    }
    if (randomYPoints <=0)
    {
      randomYPoints = height-3;
    }
    if (randomYPoints >=height)
    {
      randomYPoints = 3;
    }  
    if (keys[1]==true)
    {
      randomXPoints = randomXPoints - moveXSteering;
    }
    if(keys[0]==true)
    { 
      randomXPoints = randomXPoints + moveXSteering;
    }
    
    if (keys[8]==false)
    {
      if(keys[2]==true)
      { 
        randomYPoints = randomYPoints - moveYSteering;
      }
      if(keys[3]==true)
      { 
        randomYPoints = randomYPoints + moveYSteering;
      }
    }
    if (keys[8]==true)
    {
      if(keys[2]==true)
      { 
        randomYPoints = randomYPoints + moveYSteering;
      }
      if(keys[3]==true)
      { 
        randomYPoints = randomYPoints - moveYSteering;
      }
    }
  }
}//END OF BACKGROUND STARS CLASS

 
class LocalStar{
  int starColor;
  
  LocalStar(color tempCol){
    starColor = tempCol;
  }
  //LocalStar variables
  int starDiam = 10;
  float localStarXCenter = centerXScreen;
  float localStarYCenter = centerYScreen;

  void display(){
    noStroke();
    fill (starColor);
    ellipse(localStarXCenter, localStarYCenter, starDiam, starDiam);
    if (starDiam < 200) 
    {
      starDiam = starDiam + 20;
    }  
    else 
    {
      if (localStarXCenter <= 0-starDiam)
      {
        localStarXCenter = width+starDiam-20;
      }
      if (localStarXCenter >=width+starDiam)
      {
        localStarXCenter = 20-starDiam; 
      }
      if (localStarYCenter <=0-starDiam)
      {
        localStarYCenter = height+starDiam-20;
      }
      if (localStarYCenter >=height+starDiam)
      {
        localStarYCenter = 20-starDiam;
      }
      if (keys[1]==true)
      {
        localStarXCenter = localStarXCenter - moveXSteering;
      }
      if(keys[0]==true)
      { 
        localStarXCenter = localStarXCenter + moveXSteering;
      }
      if (keys[8]==false)
      {
        if(keys[2]==true)
        { 
          localStarYCenter = localStarYCenter - moveYSteering;
        }
        if(keys[3]==true)
        { 
          localStarYCenter = localStarYCenter + moveYSteering;
        }
      }
      if (keys[8]==true)
      {
        if(keys[2]==true)
        { 
          localStarYCenter = localStarYCenter + moveYSteering;
        }
        if(keys[3]==true)
        { 
          localStarYCenter = localStarYCenter - moveYSteering;
        }
      }
    }
  }//END OF DISPLAY
}//END OF LOCALSTAR CLASS


void starSetUp () {
  for (int loop = 0; loop < backStars.length; loop++)
  {
    backStars[loop] = new BackgroundStars(random(width),random(height));
  }
  int r;
  int b;
  int g;
  for (int loop = 0; loop < star.length; loop++)
  {
    r = (int) random(0,255);
    b = (int) random(0,255);
    g = (int) random(0.255);
    star[loop] = new LocalStar(color(r,b,g));
  }
}//END OF STARSETUP

int starArray = int(0);

void starDraw() {
  for (int loop = 0; loop < backStars.length; loop++) 
  {
    backStars[loop].display();
  }
  star[starArray].display();
}//END OF STAR DRAW
OtherShip spaceShips[] = new OtherShip[numberOfSpaceShips];  

class OtherShip{
  float shipXLoc;
  float shipYLoc;
  float torpedoX;
  float torpedoY;
  float shipXDiam = 30;
  float shipYDiam = shipXDiam;
  float laserXEnd = (float) random(-10,10);
  float laserYEnd = (float) random(-10,10);
  float torpedoXDiam = 10;
  float torpedoYDiam = 10;

  OtherShip(float tempXloc, float tempYLoc){
    shipXLoc = tempXloc;
    shipYLoc = tempYLoc;
    torpedoX = tempXloc;
    torpedoY = tempYLoc;
  }
  //Random speed NOT outgoing manouvering of Ship (but could to be nasty/add upgrades to Ship)
  float shipYMove = (float) random(otherShipSpeedMin,otherShipSpeedMax);
  float shipXMove = (float) random(otherShipSpeedMin,otherShipSpeedMax);
 
  void display(){
    fill(157,143,143);
    noStroke();
    ellipse(shipXLoc, shipYLoc, shipXDiam+5, shipYDiam);
    float r = random(0,254);
    float b = random(0,254);
    float g = random(0,254);
    fill(r,b,g);
    ellipse(shipXLoc, shipYLoc, shipXDiam+20,shipYDiam-25);
    shipYLoc = shipYLoc + shipYMove;
    shipXLoc = shipXLoc + shipXMove;
  //Creating turning cirles for OtherShips. If they hit the below refreshed random numbers they change direction
    float shipRandXLocLow = (float) random(550, 1700);
    float shipRandYLocLow = (float) random(400, 1400);
    float shipRandXLocHigh = (float) random(-700, 450);
    float shipRandYLocHigh = (float) random(-700, 300);
   //Telling OtherShips what to do, change direction, if they hit the above turning cicle coordinates
    if (shipYLoc >= shipRandYLocHigh)
    {
      shipYMove = shipYMove *-1; 
    }
    if (shipYLoc <=shipRandYLocLow)
    {
      shipYMove = shipYMove *-1; 
    }
    if (shipXLoc >= shipRandXLocHigh)
    {
      shipXMove = shipXMove *-1; 
    }
    if (shipXLoc <=shipRandXLocLow)
    {
      shipXMove = shipXMove *-1; 
    }
  //Creating virtual 360 arena. OtherShips should stick close in perpsective/distance to the LocalStar
    if (shipXLoc <= -200)
    {
      shipXLoc = width+150;
    }
    if (shipXLoc >= width+200)
    {
      shipXLoc = -150;
    }
    if (shipYLoc <= -200)
    {
      shipYLoc = height+150;
    }
    if (shipYLoc >= height+200)
    {
      shipYLoc = -200;
    }
   //Creating Ship manouvering so that when you steer the Ship, the OtherShip move with the background and are not static
    if (keys[1]==true)
    {
      shipXLoc = shipXLoc - moveXSteering;
    }
    if(keys[0]==true)
    { 
      shipXLoc = shipXLoc + moveXSteering;
    }
    
    if (keys[8]==false)
      {
        if(keys[2]==true)
        { 
          shipYLoc = shipYLoc - moveYSteering;
        }
        if(keys[3]==true)
        { 
          shipYLoc = shipYLoc + moveYSteering;
        }
      }
    
    if (keys[8]==true)
      {    
        if(keys[2]==true)
        {   
          shipYLoc = shipYLoc + moveYSteering;
        }
        if(keys[3]==true)
        { 
          shipYLoc = shipYLoc - moveYSteering;
        }
      }
    
    
    
   // Creating laser from OtherShip to fire at Ship
    float laserR = random(0,254);
    float laserB = random(0,254);
    float laserG = random(0,254);
    fill(laserR,laserB,laserG);
    ellipse(torpedoX, torpedoY, torpedoXDiam,torpedoXDiam);
    torpedoX = torpedoX + laserXEnd;
    torpedoY = torpedoY + laserYEnd;
    torpedoXDiam = torpedoXDiam + 1;
    torpedoYDiam = torpedoYDiam + 1;
   //Creating Ship manouvering so that when you steer the Ship, the OtherShip move with the background and are not static
    if (keys[1]==true)
    {
      torpedoX = torpedoX - moveXSteering;
    }
    if(keys[0]==true)
    { 
      torpedoX = torpedoX + moveXSteering;
    }
    
    if (keys[8]==false)
    {  
      if(keys[2]==true)
      { 
        torpedoY = torpedoY - moveYSteering;
      }
      if(keys[3])
      { 
        torpedoY = torpedoY + moveYSteering;
      }
    }
    
    if (keys[8]==true)
    {    
      if(keys[2]==true)
      { 
        torpedoY = torpedoY + moveYSteering;
      }
      if(keys[3])
      { 
        torpedoY = torpedoY - moveYSteering;
      }
    }
    if (torpedoX >= width || torpedoX <=0 || torpedoXDiam >=70)
    {
      torpedoX = shipXLoc;
      torpedoY = shipYLoc;
      torpedoXDiam = 10;
      torpedoYDiam = 10;
    }
  }//END OF DISPLAY
 //Creating destruction of otherships. If the Ship laser comes within 20 pixels, the othership returns true...
  boolean checkForOverlap(Ship shipRoom)
  {
    float laserX = shipRoom.laserEndX;
    float laserY = shipRoom.laserEndY;
    float farApart = (float)dist(shipXLoc,shipYLoc, laserX, laserY);
    if (farApart <20)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  boolean checkForOverlapShields(Ship shipRoom)
  {
    float hitAreaX = shipRoom.screenXCenter;
    float hitAreaY = shipRoom.screenYBottom;
    float farApart = (float)dist(torpedoX,torpedoY, hitAreaX, hitAreaY);
    if (farApart <40)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
}//END OF OTHERSHIP CLASS

//Send to setup()
void otherShipSetup(){
  for (int loop = 0; loop < spaceShips.length; loop++) 
  {
    spaceShips [loop] = new OtherShip(random(50,900), random(300,400));
  }
}//END OF OTHERSHIP SETUP

//Send to draw
void otherShipDraw(){
   for (int loop = 0; loop < spaceShips.length; loop++) 
   {
     spaceShips[loop].display();
   }   
}//END OF OTHERSHIP DRAW
//Creating for front screen to advise on what to do from user feedback

OtherShip2 spaceShips2[] = new OtherShip2[numberOfSpaceShips2];  

class OtherShip2{
  float shipXLoc;
  float shipYLoc;
  float torpedoX;
  float torpedoY;
  float shipXDiam = 30;
  float shipYDiam = 30;
  float laserXEnd = (float) random(-2,2);
  float laserYEnd = (float) random(-2,2);
  float torpedoXDiam = 10;
  float torpedoYDiam = 10;

  OtherShip2(float tempXloc, float tempYLoc){
    shipXLoc = tempXloc;
    shipYLoc = tempYLoc;
    torpedoX = tempXloc;
    torpedoY = tempYLoc;
  }
  //Randomd speed NOT outgoing manouvering of Ship (but could to be nasty/add upgrades to Ship)
  float shipYMove = (float) random(-8,8);
  float shipXMove = (float) random(-8,8);
 
  void display(){
    fill(157,143,143);
    noStroke();
    ellipse(shipXLoc, shipYLoc, shipXDiam+5, shipYDiam);
    float r = random(0,254);
    float b = random(0,254);
    float g = random(0,254);
    fill(r,b,g);
    ellipse(shipXLoc, shipYLoc, shipXDiam+20,shipYDiam-25);
    fill(0,0,0,dissapear2);
    stroke(0,0,0,dissapear2);
    line(180,290,shipXLoc-20,shipYLoc);
    noStroke();
    textFont(myFont);
    text("Destroy these ships\nwith your laser (m key)",5,300);
    shipYLoc = shipYLoc + shipYMove;
    shipXLoc = shipXLoc + shipXMove;
  //Creating turning cirles for OtherShips. If they hit the below refreshed random numbers they change direction
    float shipRandXLocLow = (float) random(550, 1700);
    float shipRandYLocLow = (float) random(400, 1400);
    float shipRandXLocHigh = (float) random(-700, 450);
    float shipRandYLocHigh = (float) random(-700, 300);
   //Telling OtherShips what to do, change direction, if they hit the above turning cicle coordinates
    if (shipYLoc >= shipRandYLocHigh)
    {
      shipYMove = shipYMove *-1; 
    }
    if (shipYLoc <=shipRandYLocLow)
    {
      shipYMove = shipYMove *-1; 
    }
    if (shipXLoc >= shipRandXLocHigh)
    {
      shipXMove = shipXMove *-1; 
    }
    if (shipXLoc <=shipRandXLocLow)
    {
      shipXMove = shipXMove *-1; 
    }
  //Creating virtual 360 arena. OtherShips should stick close in perpsective/distance to the LocalStar
    if (shipXLoc <= 0)
    {
      shipXLoc = width-20;
    }
    if (shipXLoc >= width)
    {
      shipXLoc = 20;
    }
    if (shipYLoc <= 0)
    {
      shipYLoc = height-220;
    }
    if (shipYLoc >= height-200)
    {
      shipYLoc = 20;
    }
   
    
   // Creating laser from OtherShip to fire at Ship
    float laserR = random(0,254);
    float laserB = random(0,254);
    float laserG = random(0,254);
    fill(0,0,0,dissapear2);
    stroke(0,0,0,dissapear2);
    line(180,390,torpedoX,torpedoY);
    noStroke();
    fill(laserR,laserB,laserG);
    ellipse(torpedoX, torpedoY, torpedoXDiam,torpedoXDiam);
    fill(0,0,0,dissapear2);
    text("Don't let their weapons hit you\nIn the center bottom\nof your view screen.",5,400);
    dissapear2 = dissapear2-1;
    if (dissapear2<5)
    {
     dissapear2 = 0; 
    }
    torpedoX = torpedoX + laserXEnd;
    torpedoY = torpedoY + laserYEnd;
    torpedoXDiam = torpedoXDiam + 1;
    torpedoYDiam = torpedoYDiam + 1;
   //Creating Ship manouvering so that when you steer the Ship, the OtherShip move with the background and are not static
   
    if (torpedoX >= width || torpedoX <=0 || torpedoXDiam >=70)
    {
      torpedoX = shipXLoc;
      torpedoY = shipYLoc;
      torpedoXDiam = 10;
      torpedoYDiam = 10;
    }
  }//END OF DISPLAY
}//END OF OTHERSHIP2 CLASS

//Send to setup()
void otherShipSetup2(){
  for (int loop = 0; loop < spaceShips2.length; loop++) 
  {
    spaceShips2 [loop] = new OtherShip2(random(50,900), random(300,400));
  }
}//END OF OTHERSHIP SETUP

//Send to draw
void otherShipDraw2(){
   for (int loop = 0; loop < spaceShips2.length; loop++) 
   {
     spaceShips2[loop].display();
   }   
}//END OF OTHERSHIP DRAW
Ship shipRoom;

class Ship{
  float screenXCenter = width/2;
  float screenXLeft = width/10;
  float screenYTop = height/10;
  float screenXRight = screenXLeft*9;
  float screenYBottom = height/2*1.5;
  float buttonXStart = screenXLeft+5;
  float buttonYStart = screenYBottom+5;
  float screenShiftStable = 50;
  float screenShift100 = 0;
  float screenShift126 = 126;
  float laserEndX = width/2;
  float laserEndY = height/2;
  //ROOM COLOUR!!!!!
  int roomR = 157;
  int roomB = 156;
  int roomG = 129;
  
  void spaceShip() {
    float r = (float) random(0,254);
    float b = (float) random(0,254);
    float g = (float) random(0,254);
    fill(roomR,roomB,roomG);
    noStroke();
    rect(0,0,screenXLeft,height);//left wall
    image(shipLeft,0,0);
    rect(0,0,width,screenYTop); //top wall
    image(shipTop,0,0);
    rect(screenXRight,0,width,height); //right wall
    image(shipRight,screenXRight,0);
    rect(0,screenYBottom,width,height);//bottom wall
    image(shipBottom,0,screenYBottom);
  //Drawing room skeleton
    stroke(0);
    line(screenXLeft,screenYBottom,screenXLeft,screenYBottom+screenShift100);//left line bottom from screen
    line(screenXRight,screenYBottom,screenXRight,screenYBottom+screenShift100);//left line bottom from screen
    //line(screenXLeft,screenYBottom+screenShift100,screenXRight,screenYBottom+screenShift100);//line to connect the above
    line(screenXLeft,screenYBottom+screenShift100,0,height);//Bottom Left floor line to outside
    line(screenXRight,screenYBottom+screenShift100,width,height);//Bottom Right floor line to outside
    line(screenXLeft,screenYTop,0,0);//Top Right ceiling line to outside
    line(screenXRight,screenYTop,width,0);//Top Right ceiling line to outside
    fill(roomR,roomB,roomG);
    //Shields
    fill(0);
    if (shields >21 && shields<50)
    {
     fill(205,206,0); 
    }
    if (shields >0 && shields<21)
    {
     fill(r,b,g); 
    }
    text("Shields", screenXRight+10, screenYTop+110);
    fill(0,187,252);
    rect(screenXRight+10, screenYTop+120, shields, 10);
  }
  void laserFrikinBeam(){
    smooth();
    float laserR = (0);
    float laserB = (187);
    float laserG = (252);
    stroke(laserR,laserB,laserG);
    strokeWeight(4);
    if(keys[4]==true)
    {
      line(screenXLeft, screenYBottom,laserEndX, laserEndY);
      line(screenXRight, screenYBottom,laserEndX,laserEndY);
    }      
    strokeWeight(1);
    stroke(255,0,0);
    line (laserEndX-10,laserEndY,laserEndX+10,laserEndY);
    line (laserEndX, laserEndY-10, laserEndX, laserEndY+10);
  }
}//END OF SHip class
Stars theStars[] = new Stars[numberOfStars];

class Stars{
  float xpos = width/2;
  float ypos = height/2-80;
  float starsColour;
  float xspeed;
  float yspeed; 
  Stars(float tempC, float tempXspeed, float tempYspeed) {
    starsColour = tempC;
    xspeed = tempXspeed;
    yspeed = tempYspeed;
  }
  
 // STARS DISPLAY
  void display() {
    stroke(255);
   //Below tells star drive, when at the center to be a circle, when further out to be a line, the size of the line is dependent on the xSpeed
    if (xpos > width/2 + 60 || xpos < width/2 - 60 || ypos > (height/2-80) + 60 || ypos < (height/2-80) - 60) 
    {
      line(xpos,ypos, xpos-(xspeed*3), ypos-(yspeed*3));
    } 
    else
    {
      line (xpos, ypos, xpos, ypos);
    }
  }//END OF DISPLAY
  
 //STARS DRIVE
  void drive() {
    xpos = xpos + xspeed;
    ypos = ypos + yspeed;   
   //Below tells stars that when they hit the outside of the screen on X and Y co-ords, to start from the center again
    if (xpos > width || xpos == width || xpos < 0 || xpos == 0 && ypos > height || ypos == width || ypos < 0 || ypos == 0) 
    {
      xpos = width/2;
      ypos = height/2-80;
    }
  }//END OF DRIVE
}//END OF STARS CLASS
  
//ADD STARS TO THE ARRAY
void starDriveSetUp(){
  int rStars;
  int bStars;
  int gStars;
  for (int loop = 0; loop < theStars.length; loop++) 
  {
    rStars = (int) random(255);
    bStars = (int) random(255);
    gStars = (int) random(255);
    theStars [loop] = new Stars(color(rStars,bStars,gStars),random(-15,15),random(-15,15));
 //Meteor(color tempC, float tempXpos, float tempYpos, float tempXspeed, float tempYspeed) 
  }
}//END OF STARDRIVE SETUP

void starDrive() {
  for (int loop = 0; loop < theStars.length; loop++) 
  {
    theStars[loop].display();
    theStars[loop].drive();
  }
}//END OF STAR DRIVE


