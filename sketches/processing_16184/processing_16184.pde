
//PROJECT 6 PLAY

//FIGHT THE POWER
//DESMA 28 Interactivity 
//Stephen Ou 2010
PFont hlvtca;

int stage = 0;
boolean stageSwitch = false;
float prevM = 0.0;
float prevM2 = 0.0;
PImage startScreen, gameWon, gameLost;

float playerLocX, playerLocY;
float iniRadius = 20.0;
float playerRadius;

float hpUP = 0.0;
float hpDOWN = 0.0;

float iniSHIELD = 100.0;
float shieldUP = 0.0;
float shieldDOWN = 0.0;
float shieldHP;

float bossLocX, bossLocY;
float iniBossRadius = 200.0;
float bossRadius;

float bpUP = 0.0;
float bpDOWN = 0.0;
float march = 0.0;

float whiteBaseLocX = 88.0;
float whiteBaseLocY = 443.0;
float redBaseLocX = 184.0;
float redBaseLocY = 443.0;
float blackBaseLocX = 136.0;
float blackBaseLocY = 443.0;
float baseWidth = 48.0;
float baseHeight = 4.0;

color white = color(255);
color blood = color(196,22,22);
color black = color(0);

boolean whiteON = true;
boolean blackON = false;
boolean redON = false;

boolean whiteSHIELD = false;
boolean blackSHIELD = false;
boolean redSHIELD = true;

boolean whiteBOSS = false;
boolean blackBOSS = true;
boolean redBOSS = false;

boolean inRangeForSB = false;
boolean inRangeForKS = false;
boolean shieldBreakerON = false;
boolean killShotON = false;

boolean shieldedBOSS = true;

boolean sEFFECTIVE = false;
boolean sEMPOWERMENT = false;
boolean bEFFECTIVE = false;
boolean bEMPOWERMENT = false;

void setup()
{
  size (320,480);
  smooth();
  textAlign(CENTER);
  ellipseMode(CENTER);
  rectMode(CORNER);
  noCursor();
  
  hlvtca = loadFont("Helvetica-11.vlw");
  textFont(hlvtca);
  
  startScreen = loadImage("intro.png");
  gameWon = loadImage("gamewon.png");
  gameLost = loadImage("gamelost.png");
}

void draw()
{
  
  if (stage == 0)
  {
    prevM = 0.0;
    prevM2 = 0.0;
    background(186, 217, 232);
    
    image(startScreen, 0,0);
    
    hpUP = 0;
    hpDOWN = 0;
    bpUP = 0;
    bpDOWN = 0;
    shieldUP = 0.0;
    shieldDOWN = 0.0;
    march = 0.0;
     
    if(mousePressed == true && stage == 0 && stageSwitch == true)
    {
      stage = 1;
      stageSwitch = false;
    }
  }
  else if (stage == 1)
  {
    background(186, 217, 232);
  
    playerLocX = mouseX;
    playerLocY = mouseY;
  
    playerRadius = iniRadius + hpUP - hpDOWN;
    shieldHP = iniSHIELD + shieldUP - shieldDOWN;
    bossRadius = iniBossRadius + bpUP - bpDOWN;
  
    //EFFECTIVENESS
  
    //SHIELD EF
    if ((whiteSHIELD == true && redON == true) || 
        (blackSHIELD == true && whiteON == true) || 
        (redSHIELD == true && blackON == true))
    {
      sEFFECTIVE = true;
      sEMPOWERMENT = false;
    }
    if ((whiteSHIELD == true && whiteON == true) ||
        (blackSHIELD == true && blackON == true) ||
        (redSHIELD == true && redON == true))
    {
      sEFFECTIVE = false;
      sEMPOWERMENT = true;
    }
    if ((whiteSHIELD == true & blackON == true) ||
        (blackSHIELD == true & redON == true) ||
        (redSHIELD == true & whiteON == true))
    {
      sEFFECTIVE = false;
      sEMPOWERMENT = false;
    }  
    //BOSS EF
    if ((whiteBOSS == true && redON == true) || 
        (blackBOSS == true && whiteON == true) || 
        (redBOSS == true && blackON == true))
    {
      bEFFECTIVE = true;
      bEMPOWERMENT = false;
    }
    if ((whiteBOSS == true && whiteON == true) ||
        (blackBOSS == true && blackON == true) ||
        (redBOSS == true && redON == true))
    {
      bEFFECTIVE = false;
      bEMPOWERMENT = true;
    }
    if ((whiteBOSS == true & blackON == true) ||
        (blackBOSS == true & redON == true) ||
        (redBOSS == true & whiteON == true))
    {
      bEFFECTIVE = false;
      bEMPOWERMENT = false;
    }  
  
    //SHIELDED BOSS
    if(shieldHP >= bossLocY+(bossRadius/2))
    {
      shieldedBOSS = true;
    }
    else
    {
      shieldedBOSS = false;
    }
     
    //BOSS COLOR CHANGE
    if (millis() -prevM >= 12500)
    {
      if (whiteBOSS == true)
      {
        whiteBOSS = false;
        if(int(random(1,1000)) >= 500)
        {
          blackBOSS = true;
          redBOSS = false;
        }
        else
        {
          blackBOSS = false;
          redBOSS = true;
        }
      }
      else if (redBOSS == true)
      {
        redBOSS = false;
        if(int(random(1,1000)) >= 500)
        {
          whiteBOSS = true;
          blackBOSS = false;
        }
        else
        {
          whiteBOSS = false;
          blackBOSS = true;
        }
      }
      else if (blackBOSS == true)
      {
        blackBOSS = false;
        if(int(random(1,1000)) >= 500)
        {
          whiteBOSS = true;
          redBOSS = false;
        }
        else
        {
          whiteBOSS = false;
          redBOSS = true;
        }
      }
      prevM = millis();
    }
    
    //BOSS BODY
    float ny = noise(millis()/310.0-7) * 10.0;
    float nym = noise(millis()/290.0+13) * 10.0;
    float nx = noise(millis()/305.0-11) * 10.0;
    float nxm = noise(millis()/295.0+17) * 10.0;
    bossLocX = width/2+nx-nxm;
    bossLocY = 0 + shieldUP/4 - shieldDOWN/4 + march +ny-nym;
    march = march + 0.065;
    bpUP = bpUP + 0.025;
    
    if (whiteBOSS == true)
    {
      fill(white);
    }
    if (redBOSS == true)
    {
      fill(blood);
    }
    if(blackBOSS == true)
    {
      fill(black);
    }
    
    
    ellipse(bossLocX, bossLocY, bossRadius, bossRadius);
    
    //BOSS DEATH
    if(bossRadius <= 0)
    {
      stage = 3;
    }
    
    //SHIELD COLOR CHANGE
    if (millis()-prevM2 >= 10000)
    {
      if (whiteSHIELD == true)
      {
        whiteSHIELD = false;
        if(int(random(1,1000)) >= 500)
        {
          blackSHIELD = true;
          redSHIELD = false;
        }
        else
        {
          blackSHIELD = false;
          redSHIELD = true;
        }
      }
      else if (redSHIELD == true)
      {
        redSHIELD = false;
        if(int(random(1,1000)) >= 500)
        {
          whiteSHIELD = true;
          blackSHIELD = false;
        }
        else
        {
          whiteSHIELD = false;
          blackSHIELD = true;
        }
      }
      else if (blackSHIELD == true)
      {
        blackSHIELD = false;
        if(int(random(1,100)) >= 50)
        {
          whiteSHIELD = true;
          redSHIELD = false;
        }
        else
        {
          whiteSHIELD = false;
          redSHIELD = true;
        }
      }
      
      prevM2 = millis();
    }
    if (whiteSHIELD == true)
    {
      fill(white, 140);
    }
    if (redSHIELD == true)
    {
      fill(blood, 140);
    }
    if(blackSHIELD == true)
    {
      fill(black, 140);
    }
    quad(0,0, width, 0, width, shieldHP, 0, shieldHP);
    
    //SHIELDBASH
    
    if (playerLocY <= shieldHP)
    {
      hpDOWN = hpDOWN + 0.5;
    }
    
    //BOSS SHIELD REGEN
    shieldUP = shieldUP + 0.25;
    if(shieldBreakerON == true && sEFFECTIVE == false && sEMPOWERMENT == false)
    {
      shieldUP = shieldUP + 0.025;
    }
  
    //RECHARGE STATIONS
    //WHITE
    fill(white);
    rect(whiteBaseLocX, whiteBaseLocY, baseWidth, baseHeight);
  
    //RED
    fill(blood);
    rect(redBaseLocX, redBaseLocY, baseWidth, baseHeight);
  
    //BLACK
    fill(black);
    rect(blackBaseLocX, blackBaseLocY, baseWidth, baseHeight);
  
    //RECHARGE TRIGGERS
  
    boolean chargeWhite = iniCharge(playerLocX, playerLocY, iniRadius, 
    whiteBaseLocX, whiteBaseLocY, baseWidth, baseHeight);
    boolean chargeRed = iniCharge(playerLocX, playerLocY, iniRadius, 
    redBaseLocX, redBaseLocY, baseWidth, baseHeight);
    boolean chargeBlack = iniCharge(playerLocX, playerLocY, iniRadius, 
    blackBaseLocX, blackBaseLocY, baseWidth, baseHeight);
  
    if (chargeWhite == true)
    {
      whiteON = true;
      redON = false;
      blackON = false;
  
      hpUP = hpUP + 0.15;
    }
    if (chargeRed == true)
    {
      whiteON = false;
      redON = true;
      blackON = false;
  
      hpUP = hpUP + 0.15;
    }
    if (chargeBlack == true)
    {
      whiteON = false;
      redON = false;
      blackON = true;
  
      hpUP = hpUP + 0.15;
    }
  
    //PLAYER
    if (whiteON == true)
    {
      fill(white);
    }
    if(redON == true)
    {
      fill(blood);
    }
    if(blackON == true)
    {
      fill(black);
    }
    noStroke();
  
    if(playerRadius >= 42)
    {
      playerRadius = 42;
    }
    if(playerRadius <= 0)
    {
      playerRadius = 0;
      stage = 2; //GAME OVER
    }
    ellipse(playerLocX, playerLocY, playerRadius, playerRadius);
    
    //LAZER RANGE
    
    if(abs(playerLocY - shieldHP) < 125)
    {
      inRangeForSB = true;
    }
    else
    {
      inRangeForSB = false;
    }
    if (abs(playerLocY - (bossLocY+(bossRadius/2))) <= (bossRadius/2+20))
    {
      inRangeForKS = true;
    }  
    else
    {
      inRangeForKS = false;
    }
    //LAZER TYPES
  
    if (inRangeForSB == true && shieldBreakerON == true && playerRadius > 0 && sEFFECTIVE == true) //EFFECTIVE SHIELD BREAKER
    {
      hpDOWN = hpDOWN + 0.1;
      shieldDOWN = shieldDOWN + 1;
      float lazerPoint = random(0,320);
      quad(mouseX-playerRadius/20,mouseY-playerRadius/20, mouseX+playerRadius/20, mouseY+playerRadius/20, lazerPoint+0.25, shieldHP, lazerPoint-0.25, shieldHP);
    }
    else if (inRangeForSB == true && shieldBreakerON == true && playerRadius > 0 && sEMPOWERMENT == true) //EMPOWERMENT SHIELD BREAKER
    {
      hpDOWN = hpDOWN + 0.55;
      shieldUP = shieldUP + 0.55;
      float lazerPoint = random(0,320);
      quad(mouseX-playerRadius/20,mouseY-playerRadius/20, mouseX+playerRadius/20, mouseY+playerRadius/20, lazerPoint+0.25, shieldHP, lazerPoint-0.25, shieldHP);
    }
    else if (inRangeForSB == true && shieldBreakerON == true && playerRadius > 0 && sEMPOWERMENT == false && sEFFECTIVE == false) //INEFFECTIVE
    {
      hpDOWN = hpDOWN + 0.1;
      float lazerPoint = random(0,320);
      quad(mouseX-playerRadius/20,mouseY-playerRadius/20, mouseX+playerRadius/20, mouseY+playerRadius/20, lazerPoint+0.25, shieldHP+25, lazerPoint-0.25, shieldHP+25);
    }
    else if (inRangeForKS == true && killShotON == true && playerRadius > 0 && bEFFECTIVE == true) //EFFECTIVE KILLSHOT
    {
      bpDOWN = bpDOWN + 0.25;
      hpDOWN = hpDOWN + 0.1;
      quad(mouseX-playerRadius/20,mouseY-playerRadius/20, mouseX+playerRadius/20, mouseY+playerRadius/20, bossLocX, bossLocY, bossLocX, bossLocY);
    }
    else if (inRangeForKS == true && killShotON == true && playerRadius > 0 && bEMPOWERMENT == true) //EMPOWERMENT ANTI-KILLSHOT
    {
      bpUP = bpUP + 0.55;
      hpDOWN = hpDOWN + 0.55;
      float lazerPoint = random(0,320);
      quad(mouseX-playerRadius/20,mouseY-playerRadius/20, mouseX+playerRadius/20, mouseY+playerRadius/20, bossLocX, bossLocY, bossLocX, bossLocY);
    }
    else if (inRangeForKS == true && killShotON == true && playerRadius > 0 && bEMPOWERMENT == false && bEFFECTIVE == false) //INEFFECTIVE
    {
      hpDOWN = hpDOWN + 0.1;
      float lazerPoint = random(0,320);
      quad(mouseX-playerRadius/20,mouseY-playerRadius/20, mouseX+playerRadius/20, mouseY+playerRadius/20, bossLocX, bossLocY, bossLocX, bossLocY);
    }
  }
  else if (stage == 2)
  {
    background(black);
    image(gameLost, 0,0);
     
    if(keyPressed == true && stage == 2)
    {
      stage = 0;
      stageSwitch = false;
    }
    fill(white);
    text("NO RANKING", width/2, height/3*2);
    
    
  }
  else if (stage == 3) //GAME WON
  {
    background(white);
    image(gameWon, 0,0);
    
    if (keyPressed == true && stage == 3)
    {
      stage = 0;
    }
    
    float score = 0 + shieldUP/4 - shieldDOWN/4 + march;
    
    
    if(score <= 335)
    {
      fill(black);
      text("RANK A+", width/2, height/3*2);
    }
    else if(score > 335 && score <= 356)
    {
      fill(black);
      text("RANK A", width/2, height/3*2);
    }
    else if(score > 356 && score <= 380)
    {
      fill(black);
      text("RANK B+", width/2, height/3*2);
    }
    else if(score > 380 && score <= 413)
    {
      fill(black);
      text("RANK B", width/2, height/3*2);
    }
    else if(score > 413 && score <= 436)
    {
      fill(black);
      text("RANK B-", width/2, height/3*2);
    }
    else if(score > 436)
    {
      fill(blood);
      text("CLOSE CALL", width/2, height/3*2);
    }
  }
  println (0 + shieldUP/4 - shieldDOWN/4 + march);
}
  

boolean iniCharge(
float circleX, 
float circleY, 
float radius,
float rectangleX,
float rectangleY,
float rectangleWidth,
float rectangleHeight)
{
  float circleDistanceX = abs(circleX - rectangleX - rectangleWidth/2);
  float circleDistanceY = abs(circleY - rectangleY - rectangleHeight/2);

  if (circleDistanceX > (rectangleWidth/2 + radius)) { 
    return false;
  }
  if (circleDistanceY > (rectangleHeight/2 + radius)) { 
    return false;
  }

  if (circleDistanceX <= (rectangleWidth/2)) { 
    return true;
  } 
  if (circleDistanceY <= (rectangleHeight/2)) { 
    return true;
  }

  float cornerDistance_sq = pow(circleDistanceX - rectangleWidth/2, 2) +
    pow(circleDistanceY - rectangleHeight/2, 2);

  return (cornerDistance_sq <= pow(radius,2));
}

void mousePressed()
{ 
  stageSwitch = true;
  
  if(shieldedBOSS == true && inRangeForSB == true)
  {
    shieldBreakerON = true;
    killShotON = false;
  }
  else if (shieldedBOSS == false && inRangeForKS == true)
  {
    killShotON = true;
    shieldBreakerON = false;
  }
}

void mouseReleased()
{
  
  shieldBreakerON = false;
  killShotON = false;
}




