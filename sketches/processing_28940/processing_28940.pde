
//Sling Properties
  int slingLegPositionX = 60;
  int slingLegPositionY = 300;
  int slingWidth = 4;
  int maxSlingLength = 30;
  int slingRestLength = 13;
  int slingRestAngle = 94;
  int slingRestRate = 9;
  
  float angle;
  float slingLength;
  float slingHingeLocationX = slingLegPositionX + (slingWidth / 2);
  float slingHingeLocationY = slingLegPositionY + (slingWidth / 2);
  float displayAngle = 360;

//Projectile Properties
  int diameter = 6;
  
  float force = 0;
  float mass = random(10, 20);
  
  PVector position = new PVector(0,0);
  PVector velocity;
  PVector acceleration;

//Enviorment
  float gravity = 10;
  float groudEnergyAbsorbtion = .02;
  
  boolean grid = false;

//Game Mode
  int ammo = 3;
  int roundNumber = 0;
  int score = 0;
  int targetSize = (int)random(20, 30);
  int targetLocationX, targetLocationY;
  int timer = 0;
  
  boolean gamemode = false;
  boolean fire;
  boolean trickshot = false;
  boolean missed = false;
  boolean gameover = false;
  boolean hit = false;
  
public void setup()
{
  // Window Size
  size(1000, 400);

  // Framerate
  frameRate(60);

  // Draw Frame
  drawFrame();

  // Prints Legend - Code "borrowed" from 
  // Mr. Ferraro's 2D Motion Demo
  textSize(12);
  textAlign(LEFT);
  fill(0);
  String legend = "";
  legend += "Angle : " + (360 - (int)displayAngle);
  legend += "\nForce : " + force;
  legend += "\nMass  : " + mass;
  text(legend, 15, 350);
}

public void draw()
{
  //Changes the view of the sling
  if (mousePressed == true && mouseY < 330)
  {
    slingHingeLocationX = slingLegPositionX + (slingWidth / 2);
    slingHingeLocationY = slingLegPositionY + (slingWidth / 2);
    angle = atan2(mouseY - slingHingeLocationY, 
    mouseX - slingHingeLocationX);
    slingLength = dist(slingHingeLocationX, slingHingeLocationY, mouseX, mouseY);

    if (slingLength > maxSlingLength)
    {
      slingLength = maxSlingLength;
    }
    drawFrame();
    refreshSling();

    force = 10 * (slingLength / maxSlingLength);
  }
  else if (mousePressed == false)
  {
    restSling();
  }
  
  // Refreshs the sling and location of the projectile
  if (fire == true)
  {
    drawFrame();
    refreshSling();
    fire();
  }
  
  //Prints messages if according to the game mode
  gamemodeLegend();
  gamemode();
  messages();
}

public void drawFrame()
{
  // Backgrund
  background(135, 206, 250);

  if (grid == true)
  {
    grid();
  }

  // Grass-Ground
  fill(0, 255, 0);
  stroke(0, 255, 0);
  rect(0, 330, 1000, 400);

  // Luancher Leg(s)
  fill(100, 100, 0);
  stroke(100, 100, 0);
  rect(slingLegPositionX, slingLegPositionY, 6, 30);

  textSize(12);
  fill(255);
  rect(width - 130, 340, 80, 20);
  fill(0);
  text("Grid", width - 105, 355);
  fill(255);
  rect(width - 130, 370, 80, 20);
  fill(0);
  text("Game Mode", width - 125, 385);
}

//Prints a grid on the screen
public void grid()
{
  stroke(250);
  for (int x = 2; x < width; x = x + 15)
  {       
    line(x, 0, x, height);
  } 
  for (int y = 2; y < height; y = y + 15)
  {
    line(0, y, width, y);
  }
}

//Actions to preform when the mouse has been released
public void mouseReleased()
{
  if (mouseY < 330 && gamemode == true && ammo > 0)
  {
    mass = random(10, 25);
    position = new PVector(slingHingeLocationX, slingHingeLocationY);
    velocity = new PVector(-cos(angle) * slingLength, 
               -sin(angle) * slingLength);
    acceleration = new PVector((force / mass) * 5, 0.5);

    velocity.add(acceleration);
    position.add(velocity);
    
    hit = false;
    trickshot = false;
    missed = false;
    
    ammo--;
    fire = true;
    fire();
  }
  else if(mouseY < 330 && gamemode == false)
  {
    mass = random(10, 25);
    position = new PVector(slingHingeLocationX, slingHingeLocationY);
    velocity = new PVector(-cos(angle) * slingLength, 
               -sin(angle) * slingLength);
    acceleration = new PVector(cos(angle) * (force / mass) * 5, 0.5);

    velocity.add(acceleration);
    position.add(velocity);
    
    fire = true;
    fire();
  }

  if (mouseX > width - 130 && mouseX < width - 50 && mouseY > 340 && mouseY < 360)
  {
    if (grid == false)
    {
      grid = true;
      drawFrame();
      refreshSling();
    }
    else
    {
      grid = false;
      drawFrame();
      refreshSling();
    }
  }
  
  if (mouseX > width - 130 && mouseX < width - 50 && mouseY > 370 && mouseY < 390)
  {
    if (gamemode == false)
    {
      gamemode = true;
      ammo = 3;
      score = 0;
      roundNumber = 0;
      
      targetSize = (int)random(15, 30);
    
      targetLocationX = (int)random(0, width - targetSize);
      targetLocationY = (int)random(0, 330 - targetSize);
      
      hit = false;
      trickshot = false;
      missed = false;
      gameover = false;
    }
    else
    {
      gamemode = false;
    }
  }
}

//Moved the sling back to its "rest" position, only works with one quadrent :(
public void restSling()
{
  if (angle < radians(slingRestAngle))
  {
    angle = radians(slingRestAngle);
  }
  else if (angle != radians(slingRestAngle))
  {
    angle = angle - radians(5);
  }

  if (slingLength < slingRestLength)
  {
    slingLength = slingRestLength;
  }
  else if (slingLength != slingRestLength)
  {
    slingLength = slingLength - slingRestRate;
  }
  drawFrame();
  refreshSling();
}

public void refreshSling()
{
  pushMatrix();
  translate(slingHingeLocationX, slingHingeLocationY);
  rotate(angle);
  fill(34, 139, 34);
  stroke(34, 139, 34);
  rect(0, -2, slingLength, 4);
  popMatrix();

  float displayAngle = degrees(angle);
  if (degrees(angle) < 0)
  {
    displayAngle = displayAngle + 360;
  }

  textSize(12);
  textAlign(LEFT);
  fill(0);
  String legend = "";
  legend += "Angle : " + (360 - (int)displayAngle);
  legend += "\nForce : " + force;
  legend += "\nMass  : " + mass;
  text(legend, 15, 350);
}

public void fire()
{
  fill(47, 79, 79);
  ellipseMode(CENTER);
  ellipse(position.x, position.y, 6, 6);

  if (velocity.x < 0.2 && velocity.x > -0.2)
  {
    velocity.x = 0;
  }

  if (position.y > 327 && abs(velocity.y) < 0.01)
  {
    position.y = 327;
    velocity.y = 0;
    velocity.x = velocity.x * 0.9;
    acceleration.y = 0;
  }
  else if (position.y > 327)
  {
    position.y = 327;
  }

  if (position.y + diameter > 327 && velocity.x == 0)
  {
    velocity.y = -velocity.y * .7;
    
    if(hit != true)
    {
      trickshot = true;
    }
  }
  else if (position.y + diameter > 327)
  {
    velocity.y = -velocity.y * .7;
    velocity.x = velocity.x - .2;
    
    if(hit != true)
    {
      trickshot = true;
    }
  }
  acceleration = new PVector(0, (gravity * 3) / frameRate);
  velocity.add(acceleration);
  position.add(velocity);
}

public void gamemodeLegend()
{
  fill(0);
  textAlign(LEFT);
  textSize(12);
  String gameinfo = "";
  gameinfo += "Game Mode : " + gamemode;
  gameinfo += "\nScore : " + score;
  gameinfo += "\nAmmo : " + ammo;
  gameinfo += "\nRound : " + roundNumber;
  text(gameinfo, 150, 350);
}

public void gamemode()
{
  if(targetSize == 0 && gamemode == true)
  {
    targetSize = (int)random(15, 30);
    
    targetLocationX = (int)random(0, width - targetSize);
    targetLocationY = (int)random(0, 330 - targetSize);
  }
  
  if(gamemode == true)
  {
    stroke(0);
    rect(targetLocationX, targetLocationY, targetSize, targetSize);
  }
  
  if(position.x > targetLocationX && position.x < targetLocationX + targetSize && 
     position.y > targetLocationY && position.y < targetLocationY + targetSize && 
     gamemode == true)
  {
    ammo = 3;
    score++;
    roundNumber++;
    
    hit = true;
    
    targetSize = (int)random(15, 30);
    targetLocationX = (int)random(0, width - targetSize);
    targetLocationY = (int)random(0, 330 - targetSize);
  }
}

public void messages()
{
  if(gamemode == true)
  {
    if(ammo == 0 && (velocity.x == 0 || position.x > width || position.x < 0))
    {
      gameover = true;
      ammo++;
    }
    
    if(gameover == true)
    {
      missed = false;
      trickshot = false;
      
      textSize(36);
      textAlign(CENTER);
      fill(255, 0 , 0);
      text("GAME OVER\nYOU LOSE", width / 2, 170);
      targetLocationX = -100;
      targetLocationY = -100;
      
      textSize(24);
      fill(220);
      rect(width * .75, 60, 150, 80);
      rect(width * .75, 190, 150, 80);
      fill(0);
      text("New Game", width * .75 + 75, 105);
      text("Exit Game \nMode", width * .75 + 75, 225);
      textSize(12);
      text("(Shoot to select)", width / 2, 230);
      
      if(position.x > width * .75 && position.x < width * .75 + 80 && 
         position.y > 60 && position.y < 140)
      {
        gamemode = true;
        ammo = 3;
        score = 0;
        roundNumber = 0;
      
        targetSize = (int)random(15, 30);
    
        targetLocationX = (int)random(0, width - targetSize);
        targetLocationY = (int)random(0, 330 - targetSize);
    
        hit = false;
        trickshot = false;
        missed = false;
        gameover = false;
      }
      
      if(position.x > width * .75 && position.x < width * .75 + 80 && 
              position.y > 190 && position.y < 270)
      {
        gamemode = false;
      } 
    }
    
    if(hit == true && trickshot == true)
    {
      missed = false;
      gameover = false;

      textSize(36);
      textAlign(CENTER);
      fill(255, 0 , 0);
      text("TRICK SHOT!", width / 2, 170);
    }
    
    if(missed == true && hit == false && trickshot == false)
    {
      trickshot = false;
      gameover = false;
      
      textSize(36);
      textAlign(CENTER);
      fill(255, 0 , 0);
      text("MISSED!", width / 2, 170);
    }
  }
  
  if(position.x > targetLocationX && gamemode == true && hit == false)
  {
    missed = true;
    trickshot = false;
    timer = 0;
  }
}



