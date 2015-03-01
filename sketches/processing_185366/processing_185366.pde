
gameClass game;
playerClass player;

int a,d;
boolean start;
boolean reset;
int score;
PFont f;

float INF = Float.POSITIVE_INFINITY;
float normalx, normaly;

void setup()
{
  size(500,400);
  frameRate(60);
  game = new gameClass();
  player = new playerClass(width/2-25, height - 20);
  score = 0;
  f = createFont("Arial", 16,true);
  
  normalx = 0;
  normaly = 1;
}

void draw()
{
  background(0);
  //level
  fill(20,30,205);
   noStroke();
  rect(0,0,width,10);
  rect(-1,0,10,height);
  rect(width-9,0,110,height);
 
 if(player.life > 0) {
 game.run();
 fill(255);
 text("Score: " + score, width -80, height-10);
 text("lives: " + player.life, 10, height-10);
 }
 
 if(player.life <= 0) {
    fill(220,20,20);
    text("Game Over", width/2-25,height/3);
    fill(80,80,200);
    text("Your score: " + score, width/2-50,height/3+20);
    fill(255);
    text("press SPACE to try again", width/2-75,height-100);
    if(start) {
      player = new playerClass(width/2-25, height - 20);
      game.defineTiles();
      start = false;
    }
 }
 
 if (game.tiles.size() == 0) {
   fill(220,20,20);
    text("You've Won", width/2-25,height/3);
    fill(80,80,200);
    text("Your score: " + score, width/2-50,height/3+20);
    fill(255);
    text("press SPACE to play again", width/2-75,height-100);
    if(start) {
      player = new playerClass(width/2-25, height - 20);
      game.defineTiles();
      start = false;
    }
 }
}

void keyPressed() {
  if (key == 'a') a = 1;
  if (key == 'd') d = 1;
  if (key == ' ') start = true;
  if (key == 'r') reset = true;
}
void keyReleased() {
  if (key == 'a') a = 0;
  if (key == 'd') d = 0;
  if (key == ' ') start = false;
  if (key == 'r') reset = false;
}


class gameClass
{
  ArrayList tiles;
  ArrayList balls;
  ArrayList bonusTiles;
  ArrayList colors;
  
  gameClass()
  {
     balls  = new ArrayList();
     bonusTiles = new ArrayList();
     defineColors();
     addBall();
     defineTiles();
  }
  
  void run()
  {
    player.run();
    
    for (int i = 0; i < tiles.size(); i++) {
      tileClass t = (tileClass) tiles.get(i);
     
     t.run();
     
     if (t.alive == false) {
       if (t.bonus > 0) {
         AddBonusTile(t);
       }
     }
     if (t.alive == false) tiles.remove(i);
    }
    
    for (int j = 0; j < bonusTiles.size(); j++) {
           bonusClass tb = (bonusClass) bonusTiles.get(j);
           tb.run();
           
           if (tb.alive == false) bonusTiles.remove(tb);
     }
    
    for (int i = 0; i < balls.size(); i++) {
      ballClass b = (ballClass) balls.get(i);
     
     b.run(tiles,b);
    }
  }
  
  void addBall()
  {
    balls.add(new ballClass(width/2, height-25));
  }
  
  void defineTiles()
  {
    int IDs = 0;
    tiles = new ArrayList();
    
    for (int i = 0; i < width /40; i++) {
      for (int j = 0; j < height /50; j++) {
        //color col = color(random(i*25),random(j*25),random(i+j*25));
        colorClass c = (colorClass) colors.get(j);
        color col = c.col;
        float x = i * 40+10;
        float y = j * 15 + 40;
        IDs += 1;
        int life = 1;
        int bonus = 0;
        if (random(100) > 70) bonus = round(random(1,5));
        if (j == 0) { col = color(128); life = 2; bonus = 0; }
        tiles.add(new tileClass(x,y,life,col,bonus,IDs));
      }
    }
  }
  
 void AddBonusTile(tileClass t)
  {
     bonusTiles.add(new bonusClass(t.pos.x,t.pos.y,t.bonus));
  }
  
  void defineColors()
  {
     colors = new ArrayList();
     for (int i = 0; i < 20; i++) {
       colors.add(new colorClass(i));
     }
  }
}

class playerClass
{
  PVector pos,pos2;
  PVector vel;
  PVector acc;
  PVector normal;
  
  color col;
  
  float sizeX, sizeY;
  float speed, maxSpeed;
  
  int bonus;
  boolean bonusChange = false;
  boolean b1,b2,b3,b4,b5;
  int life;
  
  playerClass(float x_, float y_)
  {
     pos = new PVector(x_,y_);
     vel = new PVector();
     acc = new PVector();
     normal = new PVector();
     
     col = color(160);
     sizeX = 40.0f;
     sizeY = 10.0f;
     pos2 = new PVector(x_+sizeX/2,y_+sizeY);
     speed = 2.0f;
     maxSpeed = 4.0f;
     life = 3;
     score = 0;
     
     b1 = b2 = b3 = b4 = b5 = false;
  }
  
  void run()
  {
   normalCalc();
   bonus();
   update();
   boundry();
   show(); 
  }
  
  void update()
  {
    acc.x = (d-a) * speed;
    acc.y = 0;
    
    vel.add(acc);
    vel.limit(maxSpeed);
    vel.mult(0.8);
    if (abs(vel.x) < 0.001f) vel.x = 0;
    pos.add(vel);
    pos2.add(vel);
    acc.set(0,0,0);
  }
  
  void normalCalc()
  {
    float dx = 0;
    float dy = -1;
    
    normal.x = dx;
    normal.y = dy;
    
    normal.add(vel);
  }
  
  void show()
  {
    noStroke();
    fill(220,0,0);
    ellipse(pos.x, pos.y+sizeY/2,10,10);
    ellipse(pos.x+sizeX, pos.y+sizeY/2,10,10);
    fill(col);
    stroke(0);
    rect(pos.x,pos.y,sizeX,sizeY);
    stroke(255);
    line(pos.x+1,pos.y+sizeY/1.5,pos.x+sizeX-1,pos.y+sizeY/1.5);
    
    //stroke(255,0,0);
    //line(pos.x + sizeX/2, pos.y,
    //     pos.x + normal.x + sizeX/2, pos.y + normal.y * 20);
    //noFill();
    //ellipse(pos.x + sizeX/2,pos.y + sizeX/4, sizeX,sizeX);
  }
  
  void boundry()
  {
    if (pos.x <= 15) pos.x = 15;
    if (pos.x + sizeX >= width-15) pos.x = width - sizeX-15;
  }
  
  void bonus()
  {
   if (bonusChange) {
     if (bonus == 1 && b1 == false) { sizeX += 20; b1 = true; b2 = false; }
     if (bonus == 2 && b2 == false) { sizeX -= 20; b2 = true; b1 = false; }
     if (bonus == 3 && b3 == false) { maxSpeed += 1.0f; b3 = true; b4 = false; }
     if (bonus == 4 && b4 == false) { maxSpeed -= 1.0f; b4 = true; b3 = false; }
     if (bonus == 5) { life += 1; }
     bonusChange = false;
    }
  }
}

class ballClass
{
   PVector pos;
   PVector vel;
   PVector acc;
   PVector bou;
   PVector n;
   
   float size;
   color col;
   float speed;
   
   boolean onlyonce = true;
   
   ballClass(float x_, float y_)
   {
     pos = new PVector(x_, y_);
     vel = new PVector();
     acc = new PVector();
     n = new PVector();
     
     size = 10.0f;
     speed = 3.5f;
     col = color(100,100,255);
   }
   
   void run(ArrayList tiles, ballClass ball)
   {
     update();
     bounce(tiles,ball);
     show();
   }
   
   void update()
   {
     if(start == false && onlyonce){
       pos.x = player.pos.x + player.sizeX/2;
     }
     
     if (start && onlyonce) {
       vel.set(random(-3,3),-speed);
       onlyonce = false;
     }
     vel.limit(speed);
     pos.add(vel);
   }
   
   void bounce(ArrayList tiles, ballClass ball)
   {
     // Check window collisions
       if (pos.x - size/2 <= 10) vel.x = -vel.x;
       if (pos.x + size/2 >= width-10) vel.x = -vel.x;
       if (pos.y - size/2 <= 10) vel.y = -vel.y;
       if (pos.y + size/2 >= height+20) {
          player.life -= 1;
          pos.set(player.pos.x+player.sizeX/2,player.pos.y-size/2);
          vel.set(0,0,0);
          onlyonce = true;
       }
       if (onlyonce == false && reset) {
          player.life -= 1;
          pos.set(player.pos.x+player.sizeX/2,player.pos.y-size/2);
          vel.set(0,0,0);
          onlyonce = true;
       }
     
     boxClass broadphasebox = GetSweptBroadPhaseBox(ball); //Broad-phase checking
     
     // Check player collisions
     if (AABBCheckPlayer(broadphasebox, player) && onlyonce == false)
     {
          float collisiontime = SweptAABBplayer(ball, player, normalx, normaly);
          if (collisiontime > 1.0f) collisiontime = 1.0f;
          vel.mult(collisiontime);
          //pos.add(vel);
          
          if (collisiontime < 1.0f)
          {
            //float distance = CircleDist(ball,player);
            //if (distance < ball.size + player.sizeX) {
            //}
            
             float remainingtime = 1.0f - collisiontime;
             //vel.mult(remainingtime);
             if (abs(normalx) > 0.0001f) vel.x = -vel.x;
             //if (abs(normaly) > 0.0001f) vel.y = -vel.y;
             vel.add(PVector.sub(ball.pos,player.pos2));
             if(player.vel.x > 0.0f) {
               vel.add(player.vel);
             }
          }
         
          
     }// player Check
       
     // Check tile collisions
      for (int i = 0; i < tiles.size(); i++) {
        tileClass t = (tileClass) tiles.get(i);
        
        if (t.life > 0) {
           if (AABBCheckTile(broadphasebox, t))
           {
                float collisiontime = SweptAABBtile(ball, t, normalx, normaly);
                
                vel.mult(collisiontime);
                pos.add(vel);
                
                if (collisiontime < 1.0f)
                {
                   //float remainingtime = 1.0f - collisiontime;
                   //vel.mult(remainingtime);
                   if (abs(normalx) > 0.0001f) vel.x = -vel.x;
                   if (abs(normaly) > 0.0001f) vel.y = -vel.y;
                   t.life -= 2;
                }
                
           } //tile Check
        }// life
      }// for
      
     vel.mult(3);
     vel.limit(speed);
     
   }// bounce func end
   
   void show()
   {
     fill(col);
     stroke(255);
     ellipse(pos.x,pos.y,size,size);
     strokeWeight(3);
     point(pos.x-2,pos.y+2);
     strokeWeight(1);
     //fill(255,0,0);
     //line(pos.x,pos.y,pos.x + vel.x * 5,pos.y + vel.y * 5);
   }
}

class tileClass
{
  PVector pos;
  PVector pos2;
  PVector vel;
  
  float speed;
  float sizeX, sizeY;
  color col;
  
  int life;
  int prize;
  int bonus;
  int ID;
  
  boolean alive;
  boolean onlyonce = true;
  
  tileClass(float x_, float y_, int life_, color col_, int bonus_, int ID_)
  {
    pos = new PVector(x_,y_);
    vel = new PVector();
    
    speed = 2.0f;
    sizeX = 40.0f;
    sizeY = 15.0f;
    pos2 = new PVector(x_+sizeX/2,y_+sizeY/2);
    col = col_;
    life = life_;
    bonus = bonus_;
    ID = ID_;
    prize = 5;
    alive = true;
  }
  
  void run()
  {
   update();
   show();
   colorize();
  }
  
  void update()
  {
    if (life < 1) {
      alive = false;
      //vel.y = speed;
      if (onlyonce) {
        score = score +prize;
        onlyonce = false;
      }
    }
    //if (pos.y > height) 
    
    //pos.add(vel);
  }
  
  void show()
  {
    stroke(0);
    fill(col);
    rect(pos.x,pos.y,sizeX,sizeY);
    stroke(255,150);
    line(pos.x+3,pos.y+sizeY-2,pos.x+sizeX-1,pos.y+sizeY-2);
    line(pos.x+2,pos.y+2,pos.x+2,pos.y+sizeY-2);
  }
  
  void colorize()
  {
   //col = color(map(life,0,3,100,red(col)),map(life,0,3,50,green(col)),map(life,0,3,50,blue(col)));
  } 
}

class bonusClass
{
   PVector pos;
   PVector vel;
   
   float speed;
   float sizeX,sizeY;
   color col;
   float theta;
   
   int bonus;
   boolean alive;
   boolean onlyonce = true;
   
   bonusClass(float x_,float y_, int bonus_)
   {
     pos = new PVector(x_,y_);
     vel = new PVector();
      
     sizeX = 30;
     sizeY = 10;
     speed = 2.0f;
     bonus = bonus_;
     alive = true;
     
     if (bonus == 1) col = color(150,250,50);
     if (bonus == 2) col = color(40,160,200);
     if (bonus == 3) col = color(200,100,150);
     if (bonus == 4) col = color(80,190,60);
     if (bonus == 5) col = color(20,250,100);
   }
   
   void run()
   {
     update();
     collisions();
     show();
   }
   
   void update()
   {
    theta += random(1,3);
    if (theta >= 360) theta = 0;
     
     vel.set(0,1);
     vel.mult(speed);
     vel.limit(speed);
     pos.add(vel); 
   }
   
   void show()
   {
     pushMatrix();
     rectMode(CENTER);
     translate(pos.x,pos.y);
     rotate(radians(theta));
     fill(col);
     stroke(0);
     rect(0,0,sizeX,sizeY,5);
     stroke(255);
     strokeWeight(2);
     line(-sizeX/2+3,1,sizeX/2-3,1);
     rectMode(CORNER);
     popMatrix();
   }
   
   void collisions()
   {
     if (pos.y > height) alive = false;
     
     if (pos.x < player.pos.x + player.sizeX + 10 && pos.x + sizeX > player.pos.x - 10) {
       if (pos.y < player.pos.y + player.sizeY && pos.y + sizeY > player.pos.y) {
         if (onlyonce)
          player.bonus = bonus;
          player.bonusChange = true;
          score += 5*bonus;
          alive = false;
          onlyonce = false;
       }
     }
   }
     
}

float SweptAABBtile(ballClass p, tileClass t, float normalx, float normaly)
{
  float xInvEntry, yInvEntry;
  float xInvExit, yInvExit;
  
  if (p.vel.x > 0.0f)
  {
     xInvEntry = t.pos.x - (p.pos.x + p.size);
     xInvExit = (t.pos.x + t.sizeX) - p.pos.x;
  }
  else
  {
     xInvEntry = (t.pos.x + t.sizeX) - p.pos.x;
     xInvExit = t.pos.x - (p.pos.x + p.size);
  }
  
  if (p.vel.y > 0.0f)
  {
     yInvEntry = t.pos.y - (p.pos.y + p.size);
     yInvExit = (t.pos.y + t.sizeY) - p.pos.y;
  }
  else
  {
     yInvEntry = (t.pos.y + t.sizeY) - p.pos.y;
     yInvExit = t.pos.y - (p.pos.y + p.size);
  }
  
  float xEntry, yEntry;
  float xExit, yExit;
  
  if (p.vel.x == 0.0f)
  {
      xEntry = -INF;
      xExit = INF;
  }
  else
  {
      xEntry = xInvEntry / p.vel.x;
      xExit = xInvExit / p.vel.x;
  }
  
  if (p.vel.y == 0.0f)
  {
      yEntry = -INF;
      yExit = INF;
  }
  else
  {
      yEntry = yInvEntry / p.vel.y;
      yExit = yInvExit / p.vel.y;
  }
  
  float entryTime = max(xEntry, yEntry);
  float exitTime = min(xExit, yExit);
  
  if (xEntry < 0.0f) 
  {
      if (p.pos.x + p.size < t.pos.x || p.pos.x > t.pos.x + t.sizeX) return 1.0f;
  }
  if (yEntry < 0.0f)
  {
      if (p.pos.y + p.size < t.pos.y || p.pos.y > t.pos.y + t.sizeY) return 1.0f;
  }
  if (entryTime > exitTime || xEntry < 0.0f && yEntry < 0.0f)
  {
    normalx = 0.0f;
    normaly = 0.0f;
    return 1.0f;
  }
  else
  {
    if (xInvEntry < 0.0f)
    {
      if (xEntry > yEntry)
      {
         normalx = 1.0f;
         normaly = 0.0f;
      }
      else
      {
        normalx = -1.0f;
        normaly = 0.0f;
      }
    }
    else
    {
        if (yInvEntry < 0.0f)
        {
          normalx = 0.0f;
          normaly = 1.0f;
        }
        else
        {
          normalx = 0.0f;
          normaly = -1.0f;
        }
    }
    return entryTime;
  }
}

float SweptAABBplayer(ballClass p, playerClass t, float normalx, float normaly)
{
  float xInvEntry, yInvEntry;
  float xInvExit, yInvExit;
  
  
  if (p.vel.x > 0.0f)
  {
     xInvEntry = t.pos.x -10 - (p.pos.x + p.size);
     xInvExit = (t.pos.x + t.sizeX +10) - p.pos.x;
  }
  else
  {
     xInvEntry = (t.pos.x + t.sizeX +10) - p.pos.x;
     xInvExit = t.pos.x -10 - (p.pos.x + p.size);
  }
  
  if (p.vel.y > 0.0f)
  {
     yInvEntry = t.pos.y - (p.pos.y + p.size);
     yInvExit = (t.pos.y + t.sizeY) - p.pos.y;
  }
  else
  {
     yInvEntry = (t.pos.y + t.sizeY) - p.pos.y;
     yInvExit = t.pos.y - (p.pos.y + p.size);
  }
  
  float xEntry, yEntry;
  float xExit, yExit;
  
  if (p.vel.x == 0.0f)
  {
      xEntry = -INF;
      xExit = INF;
  }
  else
  {
      xEntry = xInvEntry / p.vel.x;
      xExit = xInvExit / p.vel.x;
  }
  
  if (p.vel.y == 0.0f)
  {
      yEntry = -INF;
      yExit = INF;
  }
  else
  {
      yEntry = yInvEntry / p.vel.y;
      yExit = yInvExit / p.vel.y;
  }
  
  float entryTime = max(xEntry, yEntry);
  float exitTime = min(xExit, yExit);
  
  if (xEntry < 0.0f) 
  {
      if (p.pos.x + p.size < t.pos.x || p.pos.x > t.pos.x + t.sizeX) return 1.0f;
  }
  if (yEntry < 0.0f)
  {
      if (p.pos.y + p.size < t.pos.y || p.pos.y > t.pos.y + t.sizeY) return 1.0f;
  }
  if (entryTime > exitTime || xEntry < 0.0f && yEntry < 0.0f)
  {
    normalx = 0.0f;
    normaly = 0.0f;
    return 1.0f;
  }
  else
  {
    if (xInvEntry < 0.0f)
    {
      if (xEntry > yEntry)
      {
         normalx = 1.0f;
         normaly = 0.0f;
      }
      else
      {
        normalx = -1.0f;
        normaly = 0.0f;
      }
    }
    else
    {
        if (yInvEntry < 0.0f)
        {
          normalx = 0.0f;
          normaly = 1.0f;
        }
        else
        {
          normalx = 0.0f;
          normaly = -1.0f;
        }
    }
    return entryTime;
  }
}

boxClass GetSweptBroadPhaseBox(ballClass b)
{
  boxClass broadphasebox = new boxClass();
  broadphasebox.pos.x = b.vel.x > 0 ? b.pos.x : b.pos.x + b.vel.x;
  broadphasebox.pos.y = b.vel.y > 0 ? b.pos.y : b.pos.y + b.vel.y;
  broadphasebox.sizeX = b.vel.x > 0 ? b.vel.x + b.size : b.size - b.vel.x;
  broadphasebox.sizeY = b.vel.y > 0 ? b.vel.y + b.size : b.size - b.vel.y;
  
  return broadphasebox;
}

boolean AABBCheckTile(boxClass b, tileClass t)
{
  return !(b.pos.x + b.sizeX < t.pos.x || b.pos.x > t.pos.x + t.sizeX || b.pos.y + b.sizeY < t.pos.y || b.pos.y > t.pos.y + t.sizeY);
}

boolean AABBCheckPlayer(boxClass b, playerClass t)
{
  return !(b.pos.x + b.sizeX < t.pos.x || b.pos.x > t.pos.x + t.sizeX || b.pos.y + b.sizeY < t.pos.y || b.pos.y > t.pos.y + t.sizeY);
}

class boxClass
{
   PVector pos;
   PVector vel;
   float sizeX,sizeY;
   
   boxClass()
   {
     pos = new PVector();
     vel = new PVector();
     sizeX = 0;
     sizeY = 0;
   }
   
   void show()
   {
    stroke(255);
    noFill();
    rect(pos.x,pos.y,sizeX,sizeY); 
   }
}

float CircleDist(ballClass b, playerClass p)
{
  float bX, bY, bR;
  float pX, pY, pR;
  
  bR = b.size;
  bX = b.pos.x;
  bY = b.pos.y;
  
  pR = p.sizeX/2;
  pX = p.pos.x + pR;
  pY = p.pos.y + pR-10;
  
  //noFill();
  //stroke(255);
  //ellipse(pX,pY,pR*2,pR*2);
  
  float dx = (bX + bR) - (pX + pR);
  float dy = (bY + bR) - (pY + pR);
  float dist = sqrt(dx * dx + dy * dy);
  
  return dist;
}

class colorClass
{
  color col;
  int ID;
  
  colorClass(int i)
  {
    ID = i;
    col = color(random(255),random(255),random(255));
  }
}



