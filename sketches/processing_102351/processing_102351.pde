
PFont font;  // text font

int margin = 3;  // menu margin

float starX;  // starship position X
float starY = 600-margin-90-20-30;  // starship position Y

color colPanel;  
color colPanelBorder;
color colShip;
color colShipBorder;
color colControls;
color colControlsBorder;
color colStart;
color colStartBorder;
color colStop;
color colStopBorder;
color colBlaster;
color colBlasterBorder;
color colBolts;
color colEnemy01;
color colEnemy01Border;
color colDefeat;
color colVictory;
color colBackground;

float[][] blasts = new float[10][2];  // blaster bolts

float[][] enemies = new float[45][2];  // total enemy ships

int blasterIndex = 0;  // blaster bolts array index
int totalBolts = 0;  // total active bolts

int totalEnemies = 0;  // total launched enemies
int nextWave = 1; // next wave

int hits = enemies.length;  // total past enemies
int score = 0;
int lives = 3;

boolean defeat = false;
boolean victory = false;

int gameOver = 0;  // end of the game time

void setup()
{  
  colBackground = color(5, 5, 30);
  colPanel = color(150);
  colPanelBorder = color(70);
  colShip = color(160, 145, 185);
  colShipBorder = color(45, 0, 100);
  colControls = color(130,180,245);
  colControlsBorder = color(0,65,135);
  colStart = color(150,255,150);
  colStartBorder = color(10,100,10);
  colStop = color(255,150,150);
  colStopBorder = color(100,10,10);
  colBlaster = color(255,180,90);
  colBlasterBorder = color(130,70,0);
  colBolts = color(115,135,250);
  colEnemy01 = color(220,5,165);
  colEnemy01Border = color(85,5,65);
  colDefeat = color(200,0,20);
  colVictory = color(0,200,20);
  
  size(600,600);
  background(colBackground);
  ellipseMode(CENTER);
  rectMode(CENTER);
  textAlign(CENTER);
  
  font = loadFont("CourierNewPS-BoldMT-18.vlw");
  textFont(font);
  
  menu();  // control panel
  
  for (int b=0; b<10; b++)  // position blaster bolts off screen
  {
    blasts[b][1] = -10;
  }
  
  for (int e=0; e<enemies.length; e++)  // position enemy ships off screen
  {
    enemies[e][1] = 650;
  }
  
  noLoop();
}

void draw()
{
  refresh();  // refresh screen
  starship(starX);  // draw battleship at position x
  blasterBolts();  // draw blaster bolts
  if(mousePressed)  // control starship
  {
    if(mouseX>width/2-20-30 && mouseX<width/2-20 && mouseY>height-margin-60 && mouseY<height-margin-30)
    {
      starX-=3;
    }
    if(mouseX>width/2+20 && mouseX<width/2+20+30 && mouseY>height-margin-60 && mouseY<height-margin-30)
    {
      starX+=3;
    } 
  }

  if(frameCount==10)  // timer to launch enemy attacks
  {
    enemySet();  // generate enemy positions
  } 
  if(frameCount==500*nextWave+10)  // launch additional waves
  {
    enemySet();
  }
  drawEnemies();  // draw enemy starships
  
  checkHit();  // check if enemy was hit
  keepScore();  // update player score
  health();  // update player lives

  if(!defeat && !victory)  // while game not over
  {
    if (lives==0)  // if lives finished
    {
      defeat = true;
      gameOver = frameCount;  // set end of game timer
    }
    else if(hits==0)  // if all enemies were deactivated
    {
      victory = true; 
      gameOver = frameCount;  // set end of game timer
    }
  }
  
  if(frameCount==gameOver+30)  // end of game message delay
  {
    if(defeat)
    {
      textSize(40);
      fill(colDefeat);
      text("DEFEAT", width/2, height/2);
      noLoop();
    }
    if(victory)
    {
      textSize(40);
      fill(colVictory);
      text("VICTORY", width/2, height/2);
      noLoop();    
    }
  }
}

void mousePressed()  // manipulate menu buttons
{
  if(mouseX>margin+5 && mouseX<margin+85 && mouseY>height-margin-45-15 && mouseY<height-margin-45+15)
  {
    loop();  // start button
  }
  if(mouseX>width-margin-5-80 && mouseX<width-margin-5 && mouseY>height-margin-45-15 && mouseY<height-margin-45+15)
  {
    noLoop();  // stop button
  }
  if(mouseX>width/4-45 && mouseX<width/4+45 && mouseY>height-margin-60 && mouseY<height-margin-30)
  {
    loop();  // blaster button
    shoot();
  }
}

void refresh()  // method : update screen
{
  background(colBackground);
  menu();
}

void menu()  // method : draw control panel
{  
  fill(colPanel);
  stroke(colPanelBorder);
  strokeWeight(2);
  rect(width/2, height-margin-45, width-2*margin, 90);  // control panel 
  stroke(colControlsBorder);
  fill(colControls);
  rect(width/2-20-15, height-margin-45, 30, 30);  // battleship control buttons
  rect(width/2+20+15, height-margin-45, 30, 30);
  fill(colControlsBorder);
  triangle(width/2-20-3, height-margin-30-3, width/2-20-3, height-margin-60+3, width/2-20-30+3, height-margin-45);
  triangle(width/2+20+3, height-margin-30-3, width/2+20+3, height-margin-60+3, width/2+20+30-3, height-margin-45);
 
 
  startButton();
  stopButton();
  blasterButton();
}

void startButton()  // method : draw start button
{
  strokeWeight(2);
  stroke(colStartBorder);
  fill(colStart);
  rect(margin+5+40,height-margin-45,80,30);
  fill(colStartBorder);
  text("START", margin+5+40, height-margin-40);
}

void stopButton()  // method : draw stop button
{
  strokeWeight(2);
  stroke(colStopBorder);
  fill(colStop);
  rect(width-margin-5-40,height-margin-45,80,30);
  fill(colStopBorder);
  text("STOP", width-margin-5-40, height-margin-40);
}

void blasterButton()  // method : draw blaster button
{
  strokeWeight(2);
  stroke(colBlasterBorder);
  fill(colBlaster);
  rect(width/4,height-margin-45,90,30);
  fill(colBlasterBorder);
  text("BLASTER", width/4, height-margin-40);
}

void starship(float x)  // method : draw starship at position x
{
  stroke(colShipBorder);
  fill(colShip);
  beginShape();
  vertex(x,height-margin-90-20-30);
  vertex(x-10,height-margin-90-20+5);
  vertex(x,height-margin-90-20);
  vertex(x+10,height-margin-90-20+5);
  endShape(CLOSE);
}

void shoot()  // mathod : generate blaster bolts
{
  if(totalBolts<10)  // if ammo limit not reached
  {
    blasts[blasterIndex][0] = starX;  // generate bolt at starship position
    blasts[blasterIndex][1] = starY;
    blasterIndex++;  // update array index
    totalBolts++;  // decrement available ammo
  }
  if(blasterIndex==10)  // array index loop back
  {
    blasterIndex = 0;
  }
}

void blasterBolts()  // method : draw blaster bolts
{  
  for(int i=0; i<blasts.length; i++)
  { 
    stroke(colBolts);
    fill(colBolts);
    ellipse(blasts[i][0], blasts[i][1], 4, 6);
  }
  for(int j=0; j<blasts.length; j++)
  {
    blasts[j][1]-=4;  // blaster bolt speed
    if(blasts[j][1]<0 && blasts[j][1]>-10)  // if blaster bolt reached end of screen
    {
      totalBolts--;  // increment available ammo
      blasts[j][1] = -10;  // position inactive bolt off screen
    }
  }
}

void enemySet()  // method : generate wave of enemy ships
{
  float rX;
  float rY;
  if(totalEnemies<=enemies.length-nextWave)  // if total enemies already generate are fewer than the total
  {                                          // enemies for the game plus the next wave
    for(int n=totalEnemies; n<totalEnemies+nextWave; n++)  // next wave only
    {
      boolean unique = false;
      while(!unique)
      {
        rX = random(20, 580);
        rY = random(-1, 1)*30;
        unique = true;
        for(int m=0; m<=n; m++)
        {
          if(abs(enemies[m][0]-rX)<35 && abs(enemies[m][1]-rY)<25)  // if current wave contains a ship at
          {                                                         // similar position
            unique = false;
          }
        }
        enemies[n][0] = rX;
        enemies[n][1] = rY; 
      }
    }
    totalEnemies+=nextWave;  // update the number of generated ships
  }
  nextWave++;  // increment the number of enemies for the next wave
}

void drawEnemies()  // draw enemy starships on screen
{
  stroke(colEnemy01Border);
  fill(colEnemy01);
  for(int n=0; n<totalEnemies; n++)  // total generated enemies
  {
    if(enemies[n][1]!=650)  // if ship not off screen
    {
      triangle(enemies[n][0], enemies[n][1], enemies[n][0]-15, enemies[n][1]-20, enemies[n][0]+15, enemies[n][1]-20);
      enemies[n][1]+=0.25;  // enemy ship speed
      if(enemies[n][1]>=height-margin-100 && enemies[n][1]<650)  // if enemy ship reaches end of screen
      {
        enemies[n][1] = 650;  // move ship off screen
        lives--;  // decrement lives
        hits--;  // decrement active ships
      }
    }
  }
}

void checkHit()  // method : check if blaster bolt hit enemy ship
{
  for(int c=0; c<10; c++)  // check all bolts
  {
    for (int d=0; d<totalEnemies; d++)  // check all enemy ships
    {
      if(abs(blasts[c][0]-enemies[d][0])<20 && abs(blasts[c][1]-enemies[d][1])<3)  // if positions coincide
      {
        blasts[c][1] = -10;  // move bolt off screen
        totalBolts--;  // increment available ammo
        enemies[d][1] = 650;  // move enemy ship off screen
        score += 1;  // increment score
        hits--;  // decrement active ships
      }
    }
  }
}

void keepScore()  // method : update player score
{
  fill(255,255,0);
  text("SCORE : " + score, 70, 30);
}

void health()  // method : update player lives
{
  stroke(colShipBorder);
  fill(colShip);
  for(int l=lives; l>0; l--)  // number of figures drawn depends on lives count
  {
    beginShape();
    vertex(width-10-30*l, 40-30);
    vertex(width-10-30*l-10, 40+5);
    vertex(width-10-30*l, 40);
    vertex(width-10-30*l+10, 40+5);
    endShape(CLOSE);  
  }
}
