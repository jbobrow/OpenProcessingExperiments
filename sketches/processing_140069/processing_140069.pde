


int MENU_STATE_00 = 0;
int MENU_STATE_01 = 1;

//int MENU_STATE = 0;
//int MENU_STATE = 0;
int PLAY_STATE = 2;
int GAMEOVER_STATE = 3;
int WIN_STATE = 4;

int BABBY_COUNT = 1;

int the_gameState = MENU_STATE_00;
BabbySpider[] the_babbySpiders = new BabbySpider[BABBY_COUNT];
Spider the_spider;
float the_ground;
PImage the_grass;
float the_screenShakeTimer = 0;
PFont the_font;
boolean the_doOnce = true;
PImage the_keyboardImage;
float the_transitionTimer = 2;

void setup() 
{
  size(800, 600);
  frameRate(30);
  the_ground = height-35;
  the_grass = requestImage("grass.png");
  the_font = createFont("Amatic SC Regular", 32);
  the_keyboardImage = requestImage("keyboard.png");
  //gameStart();
}

void gameStart()
{
  the_transitionTimer = 2;
  the_gameState = PLAY_STATE;
  stroke(255, 100);
  the_spider = new Spider();
}

void draw() {
  //println(frameRate);

  
  if (the_gameState == MENU_STATE_00)
  {
    drawGradient(0, width, 0, height, 120);
    textFont(the_font);
    textAlign(CENTER, CENTER);
    textSize(128);
    fill(#3a0e05);
    text("I AM THE DEATH", width/2 + random(-5, 5), height/2 + random(-5, 5));
    textSize(64);
    text("@devonsoft", width/2 + random(-5, 5), height/2 + random(-5, 5) + 100);
  }
  else if (the_gameState == MENU_STATE_01)
  {
    drawGradient(0, width, 0, height, 255);
    if (the_keyboardImage.width > 0)
    imageMode(CORNER);
    image(the_keyboardImage, 0, 0, width, height);
  }
  else if (the_gameState == PLAY_STATE)
  {
    if (the_doOnce)
    {
      gameStart();
      the_doOnce = false;
    }
    
    drawGradient(0, width, 0, height, 255);
  
    the_spider.draw();
    
    int deadBabbyCount = 0;
    for (int i = the_babbySpiders.length-1; i >= 0 && !the_spider.buttExploding; i--)
    {
      the_babbySpiders[i].draw();
      if (the_babbySpiders[i].isDead)
        deadBabbyCount += 1;
    }
    if (deadBabbyCount >= BABBY_COUNT)
    {
      the_gameState = WIN_STATE;
      
      if (BABBY_COUNT < 7)
        BABBY_COUNT += 2;
      else if (BABBY_COUNT >= 7)
        BABBY_COUNT *= 2;
      the_babbySpiders = new BabbySpider[BABBY_COUNT];
    }
    else
    {
      
      for (int i = 0; i < the_babbySpiders.length && !the_spider.buttExploding; i++)
      {
        boolean isFeeding = false;
        boolean isHit = false;
        BabbySpider babby = the_babbySpiders[i];
        for (int j = 0; j < the_spider.m_legs.length; j++)
        {
          Leg leg = the_spider.m_legs[j];
          
          boolean isOverlapping = false;
          if (!leg.m_isReaching && !babby.isStabbed && (babby.y >= the_ground || babby.carriedSegment == null)) 
            isOverlapping = leg.isOverlappingTipSegment(babby);
 
          /*if (!isOverlapping && the_spider.tipCount == 1 && !babby.isStabbed && dist(babby.x, babby.y, leg.m_segments[2].m_x, leg.m_segments[2].m_y) < babby.radius * 3)
          {
            isOverlapping = true;
          }
                   else
            println("not dist" + frameCount);*/
            
          if (isOverlapping)
          {
            if (leg.m_dx != 0)
            { 
              isHit = true;
              babby.speed = 20;
              babby.x += leg.m_dx;
              if (leg.m_dx > 0)
                babby.direction.x = 1;
              else if (leg.m_dx < 0)
                babby.direction.x = -1;
            }
            else if (babby.speed <= babby.normalSpeed ||  the_spider.tipCount == 1)
            {
              isFeeding = true;
              
              if (babby.isClimbing)
              {
                babby.stabLeg = null;
                babby.isClimbing = false;
              }
              if (babby.carriedSegment == null && dist(babby.x, babby.y, leg.m_segments[2].m_x, leg.m_segments[2].m_y) < babby.radius)
              { 
                leg.shouldRemoveHealth = true;
 
                //leg.health -= 0.02;
              }
                
              babby.stabLeg = leg;
                
              if (leg.health <= 0)
              {
                 babby.stabLeg = null;
                isFeeding = false;
                the_screenShakeTimer = 1.0;
                if (leg.stabbedBabby != null)
                {
                  leg.stabbedBabby.isDead = true;
                }
                
                babby.carriedSegment = leg.getTipSegment();
                leg.getTipSegment().isBeingCarried = true;
                leg.getTipSegment().m_angle = -HALF_PI;
              }
            }
          }
          else if (leg.m_isReaching && leg.stabbedBabby == null && leg.getTipSegment().isBeingCarried == false)
          {
            isOverlapping = dist(leg.m_tipX, leg.m_tipY, babby.x, babby.y) < babby.radius * 2;
            if (isOverlapping)
            {
              babby.isStabbed = true;
              babby.isClimbing = false;
              if (babby.carriedSegment != null)
              {
                babby.carriedSegment.isBeingCarried = false;
              }
              babby.stabLeg = leg;
              leg.stabbedBabby = babby;
            }
          }
           else if (the_spider.tipCount == 1 && !babby.isFeeding && !babby.isStabbed)
          {
            if (!leg.isBeingCarried())
            {
              float distSQ = (leg.m_tipX - babby.x) * (leg.m_tipX - babby.x);
              if (distSQ < babby.speed * babby.speed)
              {
                babby.isClimbing = true;
                babby.stabLeg = leg;
              }
            }
          }
        }
        babby.isFeeding = isFeeding;
        if (isHit)
          babby.isFeeding = false; 
      }
    }
    
    imageMode(CORNER);
    if (the_grass.width > 0)
    {
      float h =  (float)width / (float)the_grass.width * the_grass.height;
      image(the_grass, 0, height - h + 8, width, h);
    }
    
        imageMode(CENTER);
        pushMatrix();
        translate(the_spider.x, the_spider.y);
        scale(0.5, 0.5);
        if (the_spider.mandible.startFrame == 1)
          the_spider.mandible.draw();
        popMatrix();
    
    the_screenShakeTimer -= 1 / 30.0;
    if (the_screenShakeTimer > 0)
    {
      imageMode(CENTER);
      float offset = 20 * the_screenShakeTimer;
      image(get(), width/2 +random(-offset, offset), height/2+random(-offset, offset));
    }
  }
  else if (the_gameState == GAMEOVER_STATE)
  {
    the_transitionTimer -= 1 / 30.0;
    if (the_transitionTimer > 0)
    {
      drawGradient(0, width, 0, height, 10);
    }
    else
    {
      drawGradient(0, width, 0, height, 120);
      textFont(the_font);
      textAlign(CENTER, CENTER);
      textSize(80);
      fill(#3a0e05);
      
      text("THE CHILD BECOMES THE PARENT.", width/2 + random(-5, 5), height/2 + random(-5, 5));  
    }
  }
  else if (the_gameState == WIN_STATE)
  {
    the_transitionTimer -= 1 / 30.0;
    if (the_transitionTimer > 0)
    {
      drawGradient(0, width, 0, height, 10);
    }
    else
    {
      drawGradient(0, width, 0, height, 120);
      textFont(the_font);
      textAlign(CENTER, CENTER);
      textSize(80);
      fill(#3a0e05);
      text("YOU CAN BREED AGAIN.", width/2 + random(-5, 5), height/2 + random(-5, 5));  
     }
  }
}

void mouseReleased()
{
  if (the_gameState < PLAY_STATE)
  {
    the_gameState++;
  }
  else if (the_gameState > PLAY_STATE && the_transitionTimer <= 0)
  {
    the_gameState = PLAY_STATE;
    the_doOnce = true;
  }
}

void keyPressed()
{
  if (the_gameState < PLAY_STATE)
  {
    return;
  }
  else if (the_gameState > PLAY_STATE)
  {
    return;
  }
  
  if (key == 't' || key == 'T')
    the_spider.m_legs[0].pressButton(0);
  else if (key == 'f' || key == 'F')
    the_spider.m_legs[0].pressButton(1); 
  else if (key == 'v' || key == 'V')
    the_spider.m_legs[0].pressButton(2);
    
  else if (key == 'y' || key == 'Y')
    the_spider.m_legs[1].pressButton(0);
  else if (key == 'j' || key == 'J')
    the_spider.m_legs[1].pressButton(1);
  else if (key == 'n' || key == 'N')
    the_spider.m_legs[1].pressButton(2);
    
  else if (key == 'u' || key == 'U')
    the_spider.m_legs[2].pressButton(0);
  else if (key == 'k' || key == 'K')
    the_spider.m_legs[2].pressButton(1);
  else if (key == 'm' || key == 'M')
    the_spider.m_legs[2].pressButton(2);
    
  else if (key == 'r' || key == 'R')
    the_spider.m_legs[3].pressButton(0);
  else if (key == 'd' || key == 'D')
    the_spider.m_legs[3].pressButton(1);
  else if (key == 'c' || key == 'C')
    the_spider.m_legs[3].pressButton(2);
    
  else if (key == 'i' || key == 'I')
    the_spider.m_legs[4].pressButton(0);
  else if (key == 'l' || key == 'L')
    the_spider.m_legs[4].pressButton(1);
  else if (key == ',' || key == '<')
    the_spider.m_legs[4].pressButton(2);
    
  else if (key == 'e' || key == 'E')
    the_spider.m_legs[5].pressButton(0);
  else if (key == 's' || key == 'S')
    the_spider.m_legs[5].pressButton(1);
  else if (key == 'x' || key == 'X')
    the_spider.m_legs[5].pressButton(2);
    
  else if (key == 'o' || key == 'O')
    the_spider.m_legs[6].pressButton(0);
  else if (key == ';' || key == ':')
    the_spider.m_legs[6].pressButton(1);
  else if (key == '.' || key == '>')
    the_spider.m_legs[6].pressButton(2);
    
  else if (key == 'w' || key == 'W')
    the_spider.m_legs[7].pressButton(0);
  else if (key == 'a' || key == 'A')
    the_spider.m_legs[7].pressButton(1);
  else if (key == 'z' || key == 'Z')
    the_spider.m_legs[7].pressButton(2);

}

void keyReleased()
{
  if (the_gameState < PLAY_STATE)
  {
    the_gameState++;
    return;
  }
  else if (the_gameState > PLAY_STATE && the_transitionTimer <= 0)
  {
    the_gameState = PLAY_STATE;
    the_doOnce = true;
    return;
  }
  
  if (key == 't' || key == 'T')
    the_spider.m_legs[0].m_buttons[0] = 0;
  else if (key == 'f' || key == 'F')
    the_spider.m_legs[0].m_buttons[1]  = 0;
  else if (key == 'v' || key == 'V')
  {
    the_spider.m_legs[0].m_buttons[2]  = 0;
    the_spider.m_legs[0].m_isReaching = false;
  } 
    
  else if (key == 'y' || key == 'Y')
    the_spider.m_legs[1].m_buttons[0] = 0;
  else if (key == 'j' || key == 'J')
    the_spider.m_legs[1].m_buttons[1]  = 0;
  else if (key == 'n' || key == 'N')
  {
    the_spider.m_legs[1].m_buttons[2]  = 0;
        the_spider.m_legs[1].m_isReaching = false;
  } 

  else if (key == 'u' || key == 'U')
    the_spider.m_legs[2].m_buttons[0] = 0;
  else if (key == 'k' || key == 'K')
    the_spider.m_legs[2].m_buttons[1]  = 0;
  else if (key == 'm' || key == 'M')
  {
    the_spider.m_legs[2].m_buttons[2]  = 0;
        the_spider.m_legs[2].m_isReaching = false;
  } 

  else if (key == 'r' || key == 'R')
    the_spider.m_legs[3].m_buttons[0] = 0;
  else if (key == 'd' || key == 'D')
    the_spider.m_legs[3].m_buttons[1]  = 0;
  else if (key == 'c' || key == 'C')
  {
    the_spider.m_legs[3].m_buttons[2]  = 0;
        the_spider.m_legs[3].m_isReaching = false;
  }
  
  else if (key == 'i' || key == 'I')
    the_spider.m_legs[4].m_buttons[0] = 0;
  else if (key == 'l' || key == 'L')
    the_spider.m_legs[4].m_buttons[1] = 0;
  else if (key == ',' || key == '<')
  {
    the_spider.m_legs[4].m_buttons[2]  = 0;
        the_spider.m_legs[4].m_isReaching = false;
  }
  
  else if (key == 'e' || key == 'E')
    the_spider.m_legs[5].m_buttons[0] = 0;
  else if (key == 's' || key == 'S')
    the_spider.m_legs[5].m_buttons[1] = 0;
  else if (key == 'x' || key == 'X')
  {
    the_spider.m_legs[5].m_buttons[2]  = 0;
        the_spider.m_legs[5].m_isReaching = false;
  }
    
  else if (key == 'o' || key == 'O')
    the_spider.m_legs[6].m_buttons[0] = 0;
  else if (key == ';' || key == ':')
    the_spider.m_legs[6].m_buttons[1] = 0;
  else if (key == '.' || key == '>')
  {
    the_spider.m_legs[6].m_buttons[2]  = 0;
        the_spider.m_legs[6].m_isReaching = false;
  }
  
  else if (key == 'w' || key == 'W')
    the_spider.m_legs[7].m_buttons[0] = 0;
  else if (key == 'a' || key == 'A')
    the_spider.m_legs[7].m_buttons[1] = 0;
  else if (key == 'z' || key == 'Z')
  {
    the_spider.m_legs[7].m_buttons[2]  = 0;
        the_spider.m_legs[7].m_isReaching = false;
  }


}

void drawGradient(int left, int right, int top, int bottom, int alpha)
{
  strokeWeight(16);
  int r, g, b;
  for (int i = top; i < bottom; i += 16)
  {
    float percent = (float)i / (float)height;
    percent *= 75;
    r = 245 + (int)percent;
    r = constrain(r, 0, 255);
    g = 143 + (int)percent;
    b = 143 + (int)percent;
    stroke(r, g, b, alpha);
    line(left,i,right,i);
  }
}
class AnimatedSprite
{
  int frameRow;
  int frameColumn;
  int frameWidth;
  int frameHeight;
  int startFrame;
  int endFrame;
  float currentFrame;
  boolean loop = true;
  float frameSpeed = 12.0;
  PImage spriteSheet;
  PImage img;
  
  AnimatedSprite(String filename, int widthOfOneFrame, int heightOfOneFrame)
  {
    this.spriteSheet = requestImage(filename);
    this.frameWidth = widthOfOneFrame;
    this.frameHeight = heightOfOneFrame;
  }
  
  void setAnimation(int start, int end, boolean looping)
  {
    if (start != this.startFrame || end != this.endFrame)
    {
      this.startFrame = start;
      this.endFrame = end;
      this.currentFrame = this.startFrame;
    }  
      
    this.loop = looping;
  }
  
  void draw()
  {
    if (this.spriteSheet.width <= 0)
    {
      return;
    }
    
    // Increment currentFrame by the frameRate related to current fps)
    this.currentFrame += (this.frameSpeed / frameRate);
    if ((int)this.currentFrame > this.endFrame)
    {
      if (this.loop == true)
      {
        this.currentFrame = this.startFrame;
      }
      else
      {
        this.currentFrame = this.endFrame;
      }
    }
    
    int colCount = this.spriteSheet.width / this.frameWidth;
    this.frameColumn = (int)this.currentFrame ;
    if (colCount > 0)
    {
      this.frameColumn =(int)((int)this.currentFrame % colCount);
      this.frameRow = (int)(this.currentFrame / colCount);
    }
    this.img = this.spriteSheet.get(
      this.frameColumn * this.frameWidth, 
      this.frameRow * this.frameHeight, 
      this.frameWidth, 
      this.frameHeight);
      
    image(this.img, 0, 0, frameWidth, frameHeight);
  }
  
}
class BabbySpider
{
  float x = random(50, height - 50);
  float y = height - 50;
  PVector direction = new PVector(1, 0);
  PVector velocity;
  float speed = 4;
  float normalSpeed = 4;
  float radius = 15;
  AnimatedSprite sprite;
  
  // states
  boolean isSpawning = true;
  boolean isFeeding = false;
  boolean isThrowing = false;
  boolean isStabbed = false;
  boolean isClimbing = false;
  boolean isDead = false;
  
  LegSegment carriedSegment;
  Leg stabLeg;
  ParticleSystem blood;
  float health = 1.0;
  
  BabbySpider()//float xx, float yy)
  {
    x = the_spider.x;
    y = the_spider.y - 150;
    blood = new ParticleSystem(new PVector(width/2,50));
    if (random(1) > 0.5)
      velocity = new PVector(random(-8,-4),random(-4,0));
    else
      velocity = new PVector(random(4,8),random(-4,0));
    normalSpeed = random(3, 8);
    sprite = new AnimatedSprite("babby.png", 100 , 72);
    sprite.setAnimation(0,3,true);
    //sprite.frameSpeed =8;
  }
  
  void draw()
  {         
    if (isDead || isSpawning)
    { 
      if (y >= the_ground - radius)
      {
        y = the_ground - radius;
        speed = normalSpeed;
        isSpawning = false;
      }
      else
      {
        velocity.y += 0.08;
        x += velocity.x;
        y += velocity.y;
      }    
    }
    else if (isClimbing)
    {
      if (stabLeg != null)
      {
        PVector tempDirection = new PVector();
        tempDirection.x = stabLeg.m_segments[2].m_x - x;
        tempDirection.y = stabLeg.m_segments[2].m_y - y;
        
        strokeWeight(2);
        stroke(192, 224, 192, 192);
        line(x, y, stabLeg.m_segments[2].m_x, stabLeg.m_segments[2].m_y);
        
        float magnitude = tempDirection.mag();
        
        if (abs(tempDirection.x) > 200)
        {
          isClimbing = false;
        }
        else
        {
          tempDirection.div(magnitude);
          y += tempDirection.y * speed;
          x += tempDirection.x * speed;
        }
        
        /*blood.origin = new PVector(x,y);
        if (dist(x, y, the_spider.x, the_spider.y + 50) < radius * 3)
        {
          blood.addParticle();
          health -= 0.005;
        }          
        blood.run();*/
        
        velocity.y = 0;
      }
    }
    else if (isStabbed)
    {
      if (stabLeg != null)
      {
        x = stabLeg.m_tipX;
        y = stabLeg.m_tipY;
        
        blood.origin = new PVector(x,y);
        if (dist(x, y, the_spider.x, the_spider.y + 50) < radius * 3)
        {
          the_spider.mandible.setAnimation(1,3,true);
          blood.addParticle();
          health -= 0.02;
        }
        else
           the_spider.mandible.setAnimation(0,0,true);
        
      }
    }
    else if (isThrowing)
    {
      if (carriedSegment != null)
      {
        carriedSegment.m_y -= speed;
        if (carriedSegment.m_y < (the_spider.y + carriedSegment.m_length))
        {
          carriedSegment.m_isDripping = true;
          carriedSegment.m_dripY = carriedSegment.m_y -carriedSegment.m_length;
          carriedSegment = null;
          isThrowing = false;
          the_spider.tipCount -= 1;
          if (the_spider.tipCount <= 0)
            the_gameState = GAMEOVER_STATE;
        }
      }
    }
    else if (isFeeding)
    {
      if (carriedSegment == null)
      {
       PVector tempDirection = new PVector();
        tempDirection.x = stabLeg.m_segments[2].m_x - x;
        tempDirection.y = stabLeg.m_segments[2].m_y - y;
        float magnitude = tempDirection.mag();
        

        {
          tempDirection.div(magnitude);
          y += tempDirection.y * speed;
          x += tempDirection.x * speed;
        }      
      }
      speed = normalSpeed;
    }
    else
    {
      velocity.x = direction.x * speed;
      x += velocity.x;
      if (speed > normalSpeed)
        speed *= 0.9;
        
      if (carriedSegment != null)
      {
        carriedSegment.m_x = x;
        carriedSegment.m_y = y;
        
        float distSQ = (width/2 - x) * (width/2 - x);
        if (distSQ < random(4, 1000))
          isThrowing = true;
      }
      
      if (y < the_ground - radius)
      {
        velocity.y += 0.04;
        y += velocity.y;
      }
      else
        y = the_ground - radius;
      
      if (x > width - radius)
      {
        direction.x = -direction.x;
        x = width - radius;
      }
      else if (x < radius)
      {
        direction.x = -direction.x;
        x = radius;         
      }
    }
    
    if (isDead)
      sprite.setAnimation(4,4,false);
      
    noStroke();
    pushMatrix();
    translate(x, y);
    if (velocity.x < 0)
      scale(-1, 1);
    scale(radius * 2 / 72 , radius * 2 / 72);
    sprite.draw();
    //ellipse(x, y, radius * 2, radius * 2);
    //stroke(20);
    popMatrix();
    
    if (!isDead && health <= 0)
    {
      if (stabLeg != null)
        stabLeg.stabbedBabby = null;
      isDead = true;
      velocity = new PVector(random(-1,1),random(-1,0));
  
            the_spider.mandible.setAnimation(0,0,true);
    }
           blood.run();
  }
}
class Leg
{
  int m_segmentCount = 3;
  LegSegment[] m_segments = new LegSegment[m_segmentCount];
  int m_buttons[] = new int[m_segmentCount];
  boolean m_isLeft = true;
  boolean m_isReaching = false;
  boolean shouldRemoveHealth = false;
  float m_dx;
  float m_tipX;
  float m_tipY;
  float m_targetX;
  float m_targetY;
  float health = 1.0;
  BabbySpider stabbedBabby = null;
  
  Leg(float startX, float startY, float startAngle, float startLength, float parentY)
  { 
    //float offset = (startLength / 80);
    float heightChange = height - 360;
    float offset = ((parentY - heightChange) / (startY - heightChange));

    if (startAngle > HALF_PI)
    {
      m_segments[0] = new LegSegment(startAngle, -QUARTER_PI, QUARTER_PI, startX, startY, startLength, 0);
      m_segments[1] = new LegSegment(-QUARTER_PI* offset, -QUARTER_PI * offset,0, startLength * offset, 1);
      m_segments[2] = new LegSegment(-QUARTER_PI* offset, -QUARTER_PI * offset,0, startLength * offset, 2);
      m_isLeft = true;
    }
    else
    {
      m_segments[0] = new LegSegment(startAngle, -QUARTER_PI, QUARTER_PI, startX, startY, startLength, 0);
      m_segments[1] = new LegSegment(QUARTER_PI* offset, 0,QUARTER_PI * offset, startLength * offset, 1);  
      m_segments[2] = new LegSegment(QUARTER_PI* offset, 0,QUARTER_PI * offset, startLength * offset, 2);
      m_isLeft = false;
    }
  
    for (int i = 1; i < m_segments.length; i++)
    {
      m_segments[i].m_prev = m_segments[i-1];
      m_segments[i].m_angle = m_segments[i-1].m_angle+m_segments[i].m_startAngle;
    }   
  }
  
  void draw()
  {   
    
    stroke(0);

    //m_segments[m_segments.length-1].m_targetX = mouseX;
    //m_segments[m_segments.length-1].m_targetY = mouseY;
    
    if (m_buttons[1] != 0)
    {
          //println("x " + m_segments[1].m_x);
      //println("y " + m_segments[1].m_y);
    }
    
    if (!m_isReaching)
    {
      for(int i=0; i < m_segments.length; i++) 
        m_segments[i].calculateAngle();
    }

    for(int i=0; i < m_segments.length; i++) 
      m_segments[i].calculatePosition();

    for (int i = 0; i < m_segments.length; i++)
    {
      if (shouldRemoveHealth && i == 2)
      {
        health -= 0.04;
        shouldRemoveHealth = false;
        
        if (frameCount % 2 == 0)
          m_segments[i].m_img.filter(INVERT);
        m_segments[i].draw(m_isLeft);
       
        if (frameCount % 2 == 0)
          m_segments[i].m_img.filter(INVERT);
      }
      else
      {
      if (!m_segments[i].isBeingCarried)
        m_segments[i].draw(m_isLeft);
      }        

    }
    
    for(int i=0; i < m_buttons.length; i++)
    {
      if (m_buttons[i] == 1)
        m_buttons[i] = 2;
    }
    
    LegSegment tip = getTipSegment();
    float tx = tip.m_x + cos(tip.m_angle) * tip.m_length;
    float ty = tip.m_y + sin(tip.m_angle) * tip.m_length;
    m_dx = tx - m_tipX;
    m_tipY = ty;
    m_tipX = tx;
  }
  
  void reach(int i)
  {
    if (i == m_segments.length-1)
    {
      if (m_buttons[2] == 1 
        && m_buttons[1] == 2 && m_buttons[0] == 2)
      {
        m_isReaching = true;
        m_targetX = m_tipX;
        m_targetY = m_tipY + 20;  
      }
      m_segments[i].m_targetX = m_targetX;
      m_targetY = m_targetY + 50;
      m_segments[i].m_targetY = m_targetY;    
    }
    
    if (m_isReaching)
    {      
      //println(ty);
      if (m_tipY < the_ground)
        m_segments[i].reach();
      else
      {
        m_isReaching = false;
      }
    }
  }
  
  void curlUp(int i)
  {
    if (m_isReaching)
      return;
      
    if (m_isLeft)
      m_segments[i].curl((i+1) * 0.2);
    else
      m_segments[i].curl((i+1) * -0.2);
  }
        
  void curlDown(int i)
  {
    if (m_isReaching)
      return;
      
    if (m_isLeft)
      m_segments[i].curl((i+1) * -0.2);
    else
      m_segments[i].curl((i+1) * 0.2);
  }
  
  void pressButton(int i)
  {
    if (m_buttons[i] == 0)
      m_buttons[i] = 1;
  }
  
  boolean isOverlappingTipSegment(BabbySpider b)
  {
    if (getTipSegment().isBeingCarried)
      return false;
      
    return getTipSegment().isCircleOverlapping(b.x, b.y, b.radius);
  }
  
  boolean isBeingCarried()
  {
    return getTipSegment().isBeingCarried;
  }
  
  LegSegment getTipSegment()
  {
    return m_segments[m_segments.length-1];
  }
}
class LegSegment
{
  float m_x;
  float m_y;
  float m_dy;
  float m_dx;
  float m_targetX;
  float m_targetY;
  float m_angle;
  float m_startAngle;
  float m_minAngle;
  float m_maxAngle;
  float m_length = 80;
  boolean m_isReaching = false;
  LegSegment m_prev;
  boolean isBeingCarried = false;
  PImage m_img;
  boolean m_isDripping = false;
  float m_dripY;
  
  
  LegSegment(float startAngle, float minAngle, float maxAngle, float xx, float yy, float seglength, int index)
  {
    m_x = xx;
    m_y = yy;
    m_startAngle = startAngle;
    m_angle = startAngle;
    m_minAngle = minAngle;
    m_maxAngle = maxAngle;
    m_length = seglength;
    m_img = requestImage("leg" + index + ".png");
  }
  
  LegSegment(float angleOffset, float minAngle, float maxAngle, float seglength, int index)
  {
    m_startAngle = angleOffset;
    m_angle = angleOffset;
    m_minAngle = minAngle;
    m_maxAngle = maxAngle;
    m_length = seglength;
    m_img = requestImage("leg" + index + ".png");
  }
  
  void draw(boolean isLeft) 
  { 
    if (m_isDripping)
    {
      m_y += the_spider.buttOffset;
      if (m_dripY < the_ground)
      {
        m_dripY += 2;
      }
        stroke(255, 255, 255, 192);
        strokeWeight(random(5, 15));
        line(m_x, m_y - m_length, m_x, m_dripY);
    }
    
    imageMode(CENTER);
    pushMatrix();
    translate(m_x + cos(m_angle) * (m_length * 0.5), m_y + sin(m_angle) * (m_length * 0.5));
    rotate(m_angle);
    if (isLeft)
      scale(1, -1);
    if (m_img.width > 0)
      image(m_img,0, 0, m_length * 1.12, 20);
    //line(0, 0, m_length, 0);
    popMatrix();
  }
  
  void calculatePosition() 
  {

    if (m_prev != null && !isBeingCarried)
    {    
      m_x = m_prev.m_x + cos(m_prev.m_angle) * m_prev.m_length;
      m_y = m_prev.m_y + sin(m_prev.m_angle) * m_prev.m_length; 
    }
  }
  
  void calculateAngle() 
  {
    if (isBeingCarried)
      return;
      
    if (m_prev != null) 
    {
      m_angle = constrain(m_angle, m_prev.m_angle+m_startAngle+m_minAngle, m_prev.m_angle+m_startAngle+m_maxAngle);
    }
    else
      m_angle = constrain(m_angle, m_startAngle+m_minAngle, m_startAngle+m_maxAngle);
  }
  
  void setStabTarget(float xx, float yy)
  {
    m_targetX = xx;
    m_targetY = yy;
  }
  
  boolean isCircleOverlapping(float cx, float cy, float cr)
  {
    float x2 = m_x + cos(m_angle) * m_length;
    float y2 = m_y + sin(m_angle) * m_length; 
    return circleLineIntersect(m_x, m_y, x2, y2, cx, cy, cr);
  }
  
  void reach()
  {
    float dx = m_targetX - m_x;
    float dy = m_targetY - m_y;
    m_angle = atan2(dy, dx);  
    
    if (m_prev != null)
    {
      m_prev.m_targetX = m_targetX - cos(m_angle) * m_length;
      m_prev.m_targetY = m_targetY - sin(m_angle) * m_length;
    }
  }
  
  void curl(float amount)
  {
    if (!isBeingCarried)
      m_angle += amount;
  }     

}


boolean circleLineIntersect(float x1, float y1, float x2, float y2, float cx, float cy, float cr)
{
  float dx = x2 - x1;
  float dy = y2 - y1;
  float a = dx * dx + dy * dy;
  float b = 2 * (dx * (x1 -cx) + dy * (y1 -cy));
  float c = cx * cx + cy * cy;
  c += x1 *  x1 + y1 * y1;
  c -= 2 * (cx * x1 + cy * y1);
  c -= cr * cr;
  float bb4ac = b * b - 4 * a * c;
  
  if (bb4ac < 0)
    return false;
  else
  {
    float mu = (-b +sqrt(b*b - 4*a*c)) / (2*a);
    float ix1 = x1 + mu*(dx);
    float iy1 = y1 + mu*(dy);
    mu = (-b - sqrt(b*b - 4*a*c)) / (2*a);
    float ix2 = x1 + mu*(dx);
    float iy2 = y1 + mu*(dy);
    
    float testX;
    float testY;
    if (dist(x1, y1, cx, cy) < dist(x2, y2, cx, cy))
    {
      testX = x2;
      testY = y2;
    }
    else
    {
      testX = x1;
      testY = y1;
    }
    if (dist(testX, testY, ix1, iy1) < dist(x1, y1, x2, y2) || dist(testX, testY, ix2, iy2) < dist(x1, y1, x2, y2))
   {
     return true;
   } 
   else
     return false;
  }
  
}


// A simple Particle class

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float radius;

  Particle(PVector l) {
    acceleration = new PVector(0,0.2);
    velocity = new PVector(random(-2,2),random(-4,-2));
    location = l.get();
    lifespan = 255.0;
    radius = random(15, 20);
  }

  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 3;
  }

  // Method to display
  void display() {
    //stroke(255, 0, 0, lifespan);
    fill(255, 48,16, lifespan);
    noStroke();
    ellipse(location.x,location.y, radius * (lifespan / 255.0), radius * (lifespan / 255.9));
  }
  
  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}

// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector location) {
    origin = location.get();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(origin));
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}

class Spider
{
  int tipCount = 8;
  Leg[] m_legs = new Leg[tipCount];
  float x = width / 2;
  float y = height - 230;
  AnimatedSprite head;
  AnimatedSprite mandible;
  PImage body;
  PImage butt;
  float buttDirection = -0.01;
  float buttOffset = 0;
  boolean buttExploding = true;
  
  Spider()
  {
    m_legs[0] = new Leg(x-50, y, PI, 80, y);    
    m_legs[3] = new Leg(x-60, y - 10, PI + QUARTER_PI * 0.33, 84, y);
    m_legs[5] = new Leg(x-65, y - 20, PI + QUARTER_PI * 0.65, 90, y); 
    m_legs[7] = new Leg(x-68, y - 30, PI + QUARTER_PI, 98, y);  
    
    m_legs[1] = new Leg(x+50, y, 0, 80, y);
    m_legs[2] = new Leg(x+60, y - 10, -QUARTER_PI * 0.33, 84, y);
    m_legs[4] = new Leg(x+65, y - 20, -QUARTER_PI * 0.65, 90, y);
    m_legs[6] = new Leg(x+68, y - 30, -QUARTER_PI, 98, y);
    
    head = new AnimatedSprite("head.png", 242, 242);
    mandible = new AnimatedSprite("mandible.png", 242, 242);
    body = requestImage("body1.png");
    butt = requestImage("body0.png");
    
    y = 0;
  }
  
  void draw()  
  {
    if (buttExploding)
    {
      if (y >= height - 230)
      {
        y = height - 230;
        buttExploding = false;
        buttOffset = 0;
        buttDirection = -0.01;
        for (int i = 0; i < the_babbySpiders.length; i++)
        {
          the_babbySpiders[i] = new BabbySpider();
        }
      }
      else
      {
        y += 5;
      }
    }  
      
    if (tipCount < 2)
      head.setAnimation(3,3, false);
    else if (tipCount < 5)
      head.setAnimation(2,2, false);
    else if (tipCount < 7)
      head.setAnimation(1,1, false);
    
    buttOffset += buttDirection;
    
    if (buttOffset > 0.6 || buttOffset < -0.6)
      buttDirection = -buttDirection;
    y += buttOffset;
    
    noFill();
    m_legs[0].m_segments[0].m_x = x-50;
    m_legs[0].m_segments[0].m_y = y; 
    m_legs[3].m_segments[0].m_x = x-60;
    m_legs[3].m_segments[0].m_y = y-10;   
    m_legs[5].m_segments[0].m_x = x-65;
    m_legs[5].m_segments[0].m_y = y-20;
    m_legs[7].m_segments[0].m_x = x-68;
    m_legs[7].m_segments[0].m_y = y-30;
    
    m_legs[1].m_segments[0].m_x = x+50;
    m_legs[1].m_segments[0].m_y = y; 
    m_legs[2].m_segments[0].m_x = x+60;
    m_legs[2].m_segments[0].m_y = y-10;   
    m_legs[4].m_segments[0].m_x = x+65;
    m_legs[4].m_segments[0].m_y = y-20;
    m_legs[6].m_segments[0].m_x = x+68;
    m_legs[6].m_segments[0].m_y = y-30;
   
    strokeWeight(5);
    stroke(192, 224, 192, 192);
    line(x, 0, x, y);

    float explodeOffset = 0;
    if (buttExploding)
    {
      explodeOffset = -100;
      
    imageMode(CENTER);
    pushMatrix();
    translate(x, y - 80 + explodeOffset);
    float s = 0.45;
    if (buttExploding)
      s = 0.2 + noise((float)y * 0.01);
    scale(s, s);
    image(butt, 0, 0);
    popMatrix();
    }

    
    for (int i=m_legs.length-1; i >= 0; i--)
    {
      for (int j=0; j < m_legs[i].m_segments.length; j++)
      {
        if (m_legs[i].m_buttons[2] != 0)
          m_legs[i].reach(j);
           
        if (m_legs[i].m_buttons[j] != 0)
        {
          if (j == 0)
            m_legs[i].curlUp(j);
          else
            m_legs[i].curlDown(j);
          
        }
        else
        {
          if (j == 0)
            m_legs[i].curlDown(j);
          else
            m_legs[i].curlUp(j);
          
        }
      }
         
      int divisor = 1;
      if (i > 3)
       divisor = 2;
       
      int amount = 255 / divisor;
      //tint(255,255,255, amount);
      
        int offset = 128;
        if (buttExploding)
          offset = 0;
          
      if (i == 3)
      {
        drawGradient(96, width - 96, offset, height, 48);

      }
      if (i == 5)
      {
        drawGradient(96, width - 96, offset, height,64); 
   
        pushMatrix();
        translate(x, y-50);
        scale(0.5, 0.5);
        image(body, 0, 0);
        popMatrix();      
      }
        
      m_legs[i].draw();
      //noTint();
    }
    
        pushMatrix();
        translate(x, y);
        scale(0.5, 0.5);
        head.draw();
        if (mandible.startFrame != 1)
          mandible.draw();
        popMatrix();
    
    // draw separated segments last
    for (int i=m_legs.length-1; i >= 0; i--)
    {
      for (int j = 0; j < m_legs[i].m_segments.length; j++)
      {
        if (m_legs[i].m_segments[j].isBeingCarried)
          m_legs[i].m_segments[j].draw(m_legs[i].m_isLeft);
      }
    }
  }
}


