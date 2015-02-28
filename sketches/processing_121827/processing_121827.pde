

int count = 10; // tracks how many targets should be in each level
int targets_gathered = 0; // tracks how many targets have been gathered
float active_page = 0; // controls which page is desplayed
Object player = new Object();
Target[] pill = new Target[100];
Indicator ring = new Indicator();
int current_level = 1; // tracks current level

void setup()
{
  size(700,700);
  
  
  for(int i = 0; i < count; i += 1)
  {
     pill[i] = new Target();
  }
  
}

void draw()
{
  background(40);
  update();
  
  if (active_page == 2)
  {
    for (int i = 0; i < count; i += 1)
    {
      pill[i].render();
      pill[i].update();
    }
    
    
    if(player.destroyed == false)
    {
      player.render();
    }
    player.update();
    
    if(ring.active == true)
    {
      ring.render();
      ring.update();
    }
  }
  
  
  
}

// player controls
void keyReleased()
{
  if (key == CODED)
  {
    if (active_page == 2)
    {
      if (keyCode == UP)
      {
        player.direction.x = 0;
        player.direction.y = player.speed * -1;
        if (player.speed_limited == false)
        {
        player.speed += .1;
        }
      }
      if (keyCode == DOWN)
      {
        player.direction.x = 0;
        player.direction.y = player.speed;
        if (player.speed_limited == false)
        {
          player.speed += .1;
        }
      }
      if (keyCode == RIGHT)
      {
        player.direction.x = player.speed;
        player.direction.y = 0;
        if (player.speed_limited == false)
        {
          player.speed += .1;
        }
      }
      if (keyCode == LEFT)
      {
        player.direction.x = player.speed * -1;
        player.direction.y = 0;
        if (player.speed_limited == false)
        {
          player.speed += .1;
        }
      }
    }
  }
  if (key == ENTER)
    {
      
      if (active_page == 1)
      {
        active_page = 2;
      }
      if (active_page == 0)
      {
        active_page = 1;
      }
      if (active_page == 3)
      {
        active_page = 1;
      }
    }
}

// Creates the player controlled object
class Object
{
  PVector location = new PVector (350,350); 
  PVector direction = new PVector (0,0);
  float speed = 2;
  boolean destroyed = false;
  color ringColor = color(255);
  boolean shielded = false;
  boolean speed_limited = false;
  float bonusTimer = 300;
  
  // draws the player controlled object
  void render()
  {
      pushMatrix();
      ellipseMode(CENTER);
      fill(ringColor);
      stroke(0);
      strokeWeight(4);
      ellipse(location.x,location.y,32,32);
      fill(0);
      noStroke();
      ellipse(location.x,location.y,15,15);
      popMatrix();
     
      location.add(direction);   
  }
  
  // updates the information of the player controlled object
  void update()
  {
    location.add(direction); 
    
    
    
    // caps the max speed of the player
    if (speed > 5.7)
    {
      speed = 5.7;
    }
    
    // destroys the player object if it completely outside the room
    if (location.x - 30 > width || location.x + 30 < 0 || location.y - 30 > height || location.y + 30 < 0)
    {
      this.destroyed = true;
      count = 10;
      current_level = 1;
      active_page = 3;
    }
    // resets the position of the player object when its destroyed to the center of the room
    if (this.destroyed == true)
    {
      this.destroyed = false;
      this.direction.x = 0;
      this.direction.y = 0;
      this.location.x = 350;
      this.location.y = 350;
      this.speed = 2;
      this.speed_limited = false;
      ring.active = false;
      
      // resets the targets when the player is destroyed
      for (int i = 0; i < count; i += 1)
      {
        pill[i] = new Target(); 
        targets_gathered = 0;
      }
    }
    // removes the 'shielded' buff when its timer runs out
    if (bonusTimer == 0)
    {
      shielded = false;
      speed_limited = false;
      ringColor = color(255);
      
    }
    // changes the color of the player to indicate 'shielded' buff is active and applies the appropriate effects
    if (shielded == true)
    {
      
      bonusTimer -= 1;
      if (location.x + 20 > width)
      {
        direction.x = direction.x * -1;
      }
      if (location.x - 20 < 0)
      {
        direction.x = direction.x * -1;
      }
       if (location.y + 20 > height)
      {
        direction.y = direction.y * -1;
      }
      if (location.y - 20 < 0)
      {
        direction.y = direction.y * -1;
      }
    } 
    
    if (speed_limited == true)
    {
      bonusTimer -=1;
    }
  }
}

class Target 
{
 float radius = 7;
 float X = int(random(50,width - 50) + int(random(0,30)));
 float Y = int(random(50,height - 50) + int(random(0,30)));
 boolean gathered = false;
 int bonus = int(random(0,21));
 color ringColor = color(255);
 
  
  void render()
  {
    if (bonus >= 19)
    {
      ringColor = color(3,175,252);
    }
    if (bonus <= 3)
    {
      ringColor = color(0,255,18);
    }
    if (this.gathered == false)
    {
      pushMatrix();
      ellipseMode(CENTER);
      fill(255);
      stroke(255);
      strokeWeight(1);
      ellipse(X,Y,15,15);
      fill(ringColor);
      strokeWeight(2);
      stroke(0);
      ellipse(X,Y,9,9);
      popMatrix();
    }
  }
  
  void update()
  {
    if (this.gathered == false)
    {
      if (player.location.x < (X + 12) && player.location.x > (X - 12) && player.location.y < (Y + 12) && player.location.y > (Y - 12))
      {
         gathered = true;
         targets_gathered += 1;
         ring.X = this.X;
         ring.Y = this.Y;
         ring.R = 15;
         ring.S = 255;
         ring.active = true;
         if (bonus >= 19)
         {
           player.shielded = true;
           player.ringColor = color(3,175,252);
           player.bonusTimer = 300;
         }
         if (bonus <= 3)
         {
           player.speed_limited = true;
           player.ringColor = color(0,255,18);
           player.bonusTimer = 300;
         }
         
      }
    }
  }
}

class Indicator
{
  float X;
  float Y;
  float R = 15;
  float S = 255;
  boolean active = false;
  
  void render()
  {
    pushMatrix();
    noFill();
    stroke(S);
    strokeWeight(1);
    ellipse(X,Y,R,R);
    popMatrix();
  }
  void update()
  {
    R += 10;
    if (S >= 45)
    {
      S -= 5;
    }
    if (S <= 40)
    {
      active = false;
    }
  }
}
void update() // checks the status of a level and updates it accordingly
{
  if (active_page == 0)
  {
    background(255);
    pushMatrix();
    textSize(60);
    fill(0);
    text("Velocity", 225, 150);
    textSize(30);
    text("Goal:",45,200);
    text("Rules:",45,275);
    text("Controls:",45,445);
    text("Press Enter to Play!",45,550);
    textSize(17);
    text("- Use the Collector to gather all targets while managing its increasing velocity.", 45,235);
    text("- If the Collector escapes the room the game is over.", 45,300);
    text("- Colored targets give the Collector temporary effects when collected.",45,325);
    text("  (Blue): The Collector will bounce when it hits a wall.", 45,350);
    text("  (Green): The Collectors velocity won't increase when changing directions.",45,375);
    text("- The Collectors velocity increases every time it changes direction.",45,400);
    text("- Use the arrow keys to move the Collector.",45,470);
    popMatrix();
  }
  
  if (active_page == 1)
  {
    background(255);
    pushMatrix();
    textSize(60);
    fill(0);
    text("Level  " + current_level, 245,300);
    textSize(20);
    text("(" + count + "  Targets)",285,330);
    popMatrix();
  }
  if (active_page == 2)
  {
    pushMatrix();
    textSize(20);
    fill(200);
    text("Velocity = " + player.speed,35,35);
    popMatrix();
    if (targets_gathered == count)
    {
      if (count <= 95)
      {
        count += 5;
        current_level += 1;
        active_page = 1;
      }
      for(int i = 0; i < count; i += 1)
      {
         pill[i] = new Target();
      }
      
      targets_gathered = 0;
      player.direction.x = 0;
      player.direction.y = 0;
      player.location.x = 350;
      player.location.y = 350;
      player.speed = 2;
      player.bonusTimer = 0;
      ring.active = false;
      
    }
  }
  if (active_page == 3)
  {
    background(255);
    pushMatrix();
    textSize(40);
    fill(0);
    text("Velocity has become Infinite!", 75,300);
    textSize(20);
    text("(press Enter to restart)",235,335);
    popMatrix();
  }
}



