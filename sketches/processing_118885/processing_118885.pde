
int mSpawnTime = 1000;        // Agent spawn time
int mWaveEnemies = 3;         // Number of waves 
int mWaveCurrent = 0;         // Current wave id
int mLastSpawn = 0;           // Timer for last enemy spawn
int mWaveCount = 5;           // Number of enemies in wave
int mWaves = 0;               // Currently cleared waves
int mLevel = 0;               // Current level
int mLevelFinished;           // Was level finished
boolean mLoaded = false;      // Was level loaded
boolean mLastLevel = false;   // Is this last level
boolean mRunning = false;     // Is the game running
boolean mVictory = false;     // Did we win

// Images for gold, lives, background and lose-screen
PImage GoldImage;              
PImage HeartImage;

PImage Background;

PImage LoseImage;

// Starting money and lives
int mMoney = 1000;
int mLives = 3;

/**
  * Helper class containing int pair
  **/
class Pair
{
  public int First;
  public int Second;

  public Pair(int a, int b)
  {
    First = a;
    Second = b;
  }

  public boolean Equals(Pair p)
  {
    return (p.First == First) && (p.Second == Second);
  }
};

/**
  * Game surface class
  **/
class Surface
{
  // Time and tile-over images
  PImage Tile;
  PImage TileOver;

  // Dimensions
  public int Dimensions[];
  
  // Predefined path for enemies
  public ArrayList<Pair> mPath;

  // Sizeof tile in pixels
  public int TileSize;

  // Offset for gaming surface
  public float Position[];

  // Which positions are filled by turret
  public ArrayList<Pair> mFilled;

  // Constructor
  public Surface(int dimX, int dimY, float x, float y)
  {
    Dimensions = new int[2];
    Dimensions[0] = dimX;
    Dimensions[1] = dimY;

    Position = new float[2];
    Position[0] = x;
    Position[1] = y;

    mPath = new ArrayList<Pair>();
    mFilled = new ArrayList<Pair>();

    Tile = loadImage("tile.png");
    TileOver = loadImage("tile_over.png");

    TileSize = 32;
  }

  // Helper functions to get tile based upon position and position based upon tile
  public Pair GetTile(float x, float y)
  {
    int mx = (int)(x - Position[0]) / TileSize;
    int my = (int)(y - Position[1]) / TileSize;

    return new Pair(mx, my);
  }

  public Pair GetPosition(int x, int y)
  {
    int px = x * TileSize + (int)Position[0];
    int py = y * TileSize + (int)Position[1];

    return new Pair(px, py);
  }

  // Render the surface (render each tile)
  public void Render()
  {
    int mx = (int)(mouseX - Position[0]) / TileSize;
    int my = (int)(mouseY - Position[1]) / TileSize;

    for (int j = 0; j < Dimensions[1]; j++)
    {
      for (int i = 0; i < Dimensions[0]; i++)
      {
        if ((i == mx) && (j == my))
        {
          image(TileOver, Position[0] + TileSize * i, Position[1] + TileSize * j, TileSize + 1, TileSize + 1);
        }
        else
        {
          image(Tile, Position[0] + TileSize * i, Position[1] + TileSize * j, TileSize + 1, TileSize + 1);
        }
      }
    }
  }
};

// Sprites of the enemies
PImage EnemyWalk[];
PImage EnemyDie[];
int EnemyFrames = 3;

/**
  * Enemy class
  **/
class Enemy extends Sprite
{
  // Variables for animations
  int Temp;
  int Frame;
  public int State;

  // Enemy HP and speed
  public float HitPoints;
  public float Speed;

  // Enemy path-finding (next goal)
  int mCurrent;
  Pair mGoal;

  // Alpha value
  int mAlpha;

  // Going right or left
  boolean mFlip;

  // Constructor
  public Enemy(float x, float y, float w, float h, float hp, float speed, Surface s)
  {
    super(x, y, w, h);

    HitPoints = hp;
    Speed = speed;

    Frame = 0;
    State = 0;

    EnemyWalk = new PImage[EnemyFrames];
    EnemyWalk[0] = loadImage("agent_walk1.png");
    EnemyWalk[1] = loadImage("agent_walk2.png");
    EnemyWalk[2] = loadImage("agent_walk3.png");

    EnemyDie = new PImage[EnemyFrames];
    EnemyDie[0] = loadImage("agent_die1.png");
    EnemyDie[1] = loadImage("agent_die2.png");
    EnemyDie[2] = loadImage("agent_die3.png");

    mCurrent = -1;
    mGoal = s.mPath.get(0);

    mAlpha = 0;
  }

  // Rendering (renders animation and scales for direction)
  public void Render()
  {
    if (mFlip)
    {
      scale(-1, 1);
    }

    switch(State)
    {
    case 0:
      if (mFlip)
      {
        image(EnemyWalk[Frame], -X - Width, Y, Width, Height);
      }
      else
      {
        image(EnemyWalk[Frame], X, Y, Width, Height);
      }
      break;

    case 1:
      tint(255, 255, 255, mAlpha);
      if (mFlip)
      {
        image(EnemyDie[Frame], -X - Width, Y, Width, Height);
      }
      else
      {
        image(EnemyDie[Frame], X, Y, Width, Height);
      }
      tint(255, 255, 255, 255);
      break;

    case 2:
      tint(255, 255, 255, mAlpha);
      if (mFlip)
      {
        image(EnemyWalk[Frame], -X - Width, Y, Width, Height);
      }
      else
      {
        image(EnemyWalk[Frame], X, Y, Width, Height);
      }
      tint(255, 255, 255, 255);
      break;

    default:
      break;
    }

    if (mFlip)
    {
      scale(-1, 1);
    }
  }

  // Update function
  public void Update(ArrayList<Projectile> p, Surface s, int fps)
  {
    // Update Logic
    switch(State)
    {
    case 0:
      mAlpha += 3;
      mAlpha = min(mAlpha, 255);

      // Loop all the projectiles and test whether it hits us, if it hits, we lose HP
      for (int i = p.size() - 1; i >= 0; i--)
      {
        Projectile proj = p.get(i);
        float dx = proj.X - (X + Width * 0.5f);
        float dy = proj.Y - (Y + Height * 0.5f);
        float d = dx * dx + dy * dy;

        if (d < (Width * Width * 0.25f))
        {
          HitPoints -= proj.mDamage;
          p.remove(i);
        }
      }

      Pair tile = s.GetTile(X, Y);
      if (tile.Equals(mGoal))
      {
        mCurrent++;
        if (mCurrent == (s.mPath.size() - 1))
        {
          // Unit arrived at target position
          State = 2;

          for (int i = p.size() - 1; i >= 0; i--)
          {
            Projectile proj = p.get(i);
            if (proj.mTarget == this)
            {
              p.remove(i);
            }
          }

          mLives--;
        }
        else
        {
          mGoal = s.mPath.get(mCurrent + 1);
        }
      }
      else
      {
        Pair pos = s.GetPosition(mGoal.First, mGoal.Second);

        float dx = (float)(pos.First + 1) - X;
        float dy = (float)(pos.Second + 1) - Y;
        float l = sqrt(dx * dx + dy * dy);
        dx /= l;
        dy /= l;

        if (dx > 0)
        {
          mFlip = true;
        }
        else
        {
          mFlip = false;
        }

        X += dx * Speed;
        Y += dy * Speed;
      }

      // If we lose all our hp, we're dead
      if (HitPoints <= 0)
      {
        State = 1;
        Frame = 0;
        
        mMoney += 150;

        for (int i = p.size() - 1; i >= 0; i--)
        {
          Projectile proj = p.get(i);
          if (proj.mTarget == this)
          {
            p.remove(i);
          }
        }
      }
      break;

    case 2:
      // Enemy reached exit point - it can't die anymore, just leaves the map
      float dx = X - (float)(width / 2);
      float dy = Y - (float)(height / 2);
      float l = sqrt(dx * dx + dy * dy);
      dx /= l;
      dy /= l;

      if (dx > 0)
      {
        mFlip = true;
      }
      else
      {
        mFlip = false;
      }

      X += dx * Speed;
      Y += dy * Speed;

      mAlpha -= 3;

      if (mAlpha <= 0)
      {
        State = 1;
      }
      break;

    default:
      break;
    }

    // Update Animation
    Temp++;
    if (Temp > fps)
    {
      Temp -= fps;

      switch(State)
      {
      case 0:
      case 2:
        Frame = (Frame + 1) % EnemyFrames;
        break;

      case 1:
        Frame = min(Frame + 1, EnemyFrames - 1);
        break;

      default:
        break;
      }
    }
  }
}

// Turret creation buttons
Button mProxyButton;
Button mLinkButton;
Button mHitmanButton;

// Start game/Next wave button
Button mNextWaveButton;

// Three types of turrets
Turret mProxyTurret;
Turret mLinkTurret;
Turret mHitmanTurret;

// List of enemies, turrets and projectiles
ArrayList<Enemy> mEnemies;
ArrayList<Turret> mTurrets;
ArrayList<Projectile> mProjectiles;

// Game surface
Surface mSurface;

// Is game lost?
boolean mLost = false;

// Setup function, loads all the stuff - sets level 1
// Nothing really interesting happens here
void setup()
{
  size(640, 400);
  background(0, 128, 0);
  frameRate(60);

  GoldImage = loadImage("gold.png");
  HeartImage = loadImage("heart.png");
  LoseImage = loadImage("lose.jpg");

  mProxyButton = new Button(640 - 52, 4, 48, 48, "proxy_button.png", "proxy_button_over.png");
  mLinkButton = new Button(640 - 52, 56, 48, 48, "link_button.png", "link_button_over.png");
  mHitmanButton = new Button(640 - 52, 108, 48, 48, "hitman_button.png", "hitman_button_over.png");
  mNextWaveButton = new Button(640 - 52, 212, 48, 48, "wave.png", "wave_over.png");

  mProxyTurret = new ProxyTurret(0, 0);
  mLinkTurret = new LinkTurret(0, 0);
  mHitmanTurret = new HitmanTurret(0, 0);

  mEnemies = new ArrayList<Enemy>();
  mTurrets = new ArrayList<Turret>();
  mProjectiles = new ArrayList<Projectile>();
  
  Background = loadImage("level1.png");

  mSurface = new Surface(18, 12, 4, 4);

  mSurface.mPath.clear();
  mSurface.mPath.add(new Pair(0, 2));
  mSurface.mPath.add(new Pair(1, 2));
  mSurface.mPath.add(new Pair(2, 2));
  mSurface.mPath.add(new Pair(2, 3));
  mSurface.mPath.add(new Pair(3, 3));
  mSurface.mPath.add(new Pair(3, 4));
  mSurface.mPath.add(new Pair(3, 5));
  mSurface.mPath.add(new Pair(4, 5));
  mSurface.mPath.add(new Pair(4, 6));
  mSurface.mPath.add(new Pair(4, 7));
  mSurface.mPath.add(new Pair(4, 8));
  mSurface.mPath.add(new Pair(5, 8));
  mSurface.mPath.add(new Pair(5, 9));
  mSurface.mPath.add(new Pair(6, 9));
  mSurface.mPath.add(new Pair(7, 9));
  mSurface.mPath.add(new Pair(8, 9));
  mSurface.mPath.add(new Pair(9, 9));
  mSurface.mPath.add(new Pair(10, 9));
  mSurface.mPath.add(new Pair(11, 9));
  mSurface.mPath.add(new Pair(12, 9));
  mSurface.mPath.add(new Pair(12, 8));
  mSurface.mPath.add(new Pair(13, 8));
  mSurface.mPath.add(new Pair(13, 7));
  mSurface.mPath.add(new Pair(13, 6));
  mSurface.mPath.add(new Pair(13, 5));
  mSurface.mPath.add(new Pair(14, 5));
  mSurface.mPath.add(new Pair(14, 4));
  mSurface.mPath.add(new Pair(14, 3));
  mSurface.mPath.add(new Pair(15, 3));
  mSurface.mPath.add(new Pair(15, 2));
  mSurface.mPath.add(new Pair(16, 2));
  mSurface.mPath.add(new Pair(17, 2));

  mLastSpawn = millis();
}

int mPlaceState = 0;

// This is the main game code
void draw()
{
  // In case we lost, show lose image
  if(mLost)
  {
    background(0, 0, 0);
    image(LoseImage, (width - LoseImage.width) * 0.5, (height - LoseImage.height) * 0.5);
  }
  else
  {
    // We lost if lives <= 0
    if(mLives <= 0)
    {
      mLost = true;
    }
    
    // If game is running, spawn enemies
    if (mRunning == true)
    {
      if (mWaveCurrent < mWaveEnemies)
      {
        if (millis() - mLastSpawn >= mSpawnTime)
        {
          mLastSpawn = millis();
          mEnemies.add(new Enemy(-20, 60, 32, 26, 100, 1, mSurface));
          mWaveCurrent++;
        }
      }
    }
  
    // Draw background and user interface
    background(0, 128, 0);
    
    tint(255, 255, 255, 255);
    image(Background, 4, 4);
  
    mProxyButton.Update();
    mLinkButton.Update();
    mHitmanButton.Update();
    mNextWaveButton.Update();
  
    tint(255, 255, 255, 255);
  
    // Draw game surface, turrets, projectiles and enemies
    mSurface.Render();
  
    for (int i = mTurrets.size() - 1; i >= 0; i--)
    {
      Turret t = mTurrets.get(i);
      t.Update(mEnemies, mProjectiles);
      t.Render();
    }
  
    for (int i = mProjectiles.size() - 1; i >= 0; i--)
    {
      Projectile p = mProjectiles.get(i);
      p.Update();
      p.Render();
    }
  
    for (int i = mEnemies.size() - 1; i >= 0; i--)
    {
      Enemy e = mEnemies.get(i);
      e.Update(mProjectiles, mSurface, 12);
      e.Render();
    }
  
    // Draw rest of the UI and in case of hover, show text
    mProxyButton.Render();
    mLinkButton.Render();
    mHitmanButton.Render();
    mNextWaveButton.Render();
    
    if(mProxyButton.State)
    {
      text("Proxy\nDMG: LOW\nRANGE: LOW\nPrice: 500", mProxyButton.X - 80, mProxyButton.Y + 20);
    }
    
    if(mLinkButton.State)
    {
      text("Link\nDMG: LOW\nRANGE: HIGH\nPrice: 750", mLinkButton.X - 80, mLinkButton.Y + 20);
    }
    
    if(mHitmanButton.State)
    {
      text("Hitman\nDMG: INSANE\nRANGE: MID\nPrice: 2000", mHitmanButton.X - 80, mHitmanButton.Y + 20);
    }
  
    // Draw money
    image(GoldImage, 640 - 52, 480 - 128 - 52);
    fill(255, 255, 255);
    text(mMoney, 640 - 44, 480 - 128);
    text("START", 640 - 47, 212 + 27);
  
    // Draw HP
    for (int i = 0; i < mLives; i++)
    {
      image(HeartImage, 640 - 56 + 18 * i, 480 - 52 - 64);
    }
    
    // Check if we have to kill some enemies
    boolean cleared = true;
    int remaining = 0;
    for (int i = mEnemies.size() - 1; i >= 0; i--)
    {
      Enemy e = mEnemies.get(i);

      if (e.State != 1)
      {
        cleared = false;
        remaining++;
      }
    }
    
    // If we don't just load next level, or victory screen
    if(cleared)
    {
      text("Place turrets and press start for next wave", 4, 10);
          
      if(mWaves >= mWaveCount)
      {
        if(mLevel == 0 && (mWaveCurrent >= mWaveEnemies))
        {
          text("You've won Level " + (mLevel + 1), 4, 20);
          
          mLevel = 1;
          
          if(mLoaded == false)
          {
            Background = loadImage("level2.png");
            
            mTurrets.clear();
            mEnemies.clear();
            
            mSurface.mPath.clear();
            mSurface.mPath.add(new Pair(0, 0));
            mSurface.mPath.add(new Pair(1, 0));
            mSurface.mPath.add(new Pair(2, 0));
            mSurface.mPath.add(new Pair(3, 0));
            mSurface.mPath.add(new Pair(4, 0));
            mSurface.mPath.add(new Pair(4, 1));
            mSurface.mPath.add(new Pair(4, 2));
            mSurface.mPath.add(new Pair(4, 3));
            mSurface.mPath.add(new Pair(4, 4));
            mSurface.mPath.add(new Pair(4, 5));
            mSurface.mPath.add(new Pair(3, 5));
            mSurface.mPath.add(new Pair(2, 5));
            mSurface.mPath.add(new Pair(2, 6));
            mSurface.mPath.add(new Pair(2, 7));
            mSurface.mPath.add(new Pair(3, 7));
            mSurface.mPath.add(new Pair(4, 7));
            mSurface.mPath.add(new Pair(5, 7));
            mSurface.mPath.add(new Pair(6, 7));
            mSurface.mPath.add(new Pair(7, 7));
            mSurface.mPath.add(new Pair(8, 7));
            mSurface.mPath.add(new Pair(9, 7));
            mSurface.mPath.add(new Pair(9, 6));
            mSurface.mPath.add(new Pair(9, 5));
            mSurface.mPath.add(new Pair(8, 5));
            mSurface.mPath.add(new Pair(7, 5));
            mSurface.mPath.add(new Pair(7, 4));
            mSurface.mPath.add(new Pair(7, 3));
            mSurface.mPath.add(new Pair(8, 3));
            mSurface.mPath.add(new Pair(9, 3));
            mSurface.mPath.add(new Pair(10, 3));
            mSurface.mPath.add(new Pair(11, 3));
            mSurface.mPath.add(new Pair(12, 3));
            mSurface.mPath.add(new Pair(12, 4));
            mSurface.mPath.add(new Pair(12, 5));
            mSurface.mPath.add(new Pair(12, 6));
            mSurface.mPath.add(new Pair(12, 7));
            mSurface.mPath.add(new Pair(12, 8));
            mSurface.mPath.add(new Pair(12, 9));
            mSurface.mPath.add(new Pair(12, 10));
            mSurface.mPath.add(new Pair(13, 10));
            mSurface.mPath.add(new Pair(14, 10));
            mSurface.mPath.add(new Pair(15, 10));
            mSurface.mPath.add(new Pair(16, 10));
            mSurface.mPath.add(new Pair(17, 10));
            
            mWaves = 0;
          
            mLoaded = true;
          }
        }
        else if(mLevel >= 1 && mLevel < 3 && (mWaveCurrent >= mWaveEnemies))
        {
          print("LAST EPIC LEVEL\n");
          
          text("You've won Level " + (mLevel + 2), 4, 20);
          
          mLevel = 3;
          
          if(mLoaded == false)
          {
            Background = loadImage("level3.png");
            
            mTurrets.clear();
            mEnemies.clear();
            
            mSurface.mPath.clear();
            mSurface.mPath.add(new Pair(0, 2));
            mSurface.mPath.add(new Pair(1, 2));
            mSurface.mPath.add(new Pair(2, 2));
            mSurface.mPath.add(new Pair(3, 2));
            mSurface.mPath.add(new Pair(4, 2));
            mSurface.mPath.add(new Pair(5, 2));
            mSurface.mPath.add(new Pair(6, 2));
            mSurface.mPath.add(new Pair(7, 2));
            mSurface.mPath.add(new Pair(8, 2));
            mSurface.mPath.add(new Pair(9, 2));
            mSurface.mPath.add(new Pair(10, 2));
            mSurface.mPath.add(new Pair(11, 2));
            mSurface.mPath.add(new Pair(12, 2));
            mSurface.mPath.add(new Pair(13, 2));
            mSurface.mPath.add(new Pair(14, 2));
            mSurface.mPath.add(new Pair(14, 3));
            mSurface.mPath.add(new Pair(14, 4));
            mSurface.mPath.add(new Pair(14, 5));
            mSurface.mPath.add(new Pair(13, 5));
            mSurface.mPath.add(new Pair(13, 6));
            mSurface.mPath.add(new Pair(12, 6));
            mSurface.mPath.add(new Pair(12, 7));
            mSurface.mPath.add(new Pair(11, 7));
            mSurface.mPath.add(new Pair(11, 8));
            mSurface.mPath.add(new Pair(10, 8));
            mSurface.mPath.add(new Pair(10, 9));
            mSurface.mPath.add(new Pair(9, 9));
            mSurface.mPath.add(new Pair(9, 10));
            mSurface.mPath.add(new Pair(8, 10));
            mSurface.mPath.add(new Pair(8, 11));
            
            mWaves = 0;
            
            mLoaded = true;
          }
        }
        else if(mLevel >= 3 && (mWaveCurrent >= mWaveEnemies))
        {
          text("Contgratulations, you've beaten all the agents! - VICTORY!", 150, 240);
          mVictory = true;
        }
      }
    }
    else
    {
      text("You have to kill " + mWaveEnemies + " agents in this wave", 4, 10);
    }
  
    // Show where we're going to place turret
    tint(255, 255, 255, 128);
  
    switch(mPlaceState)
    {
    case 1:
      mProxyTurret.X = mouseX - 4;
      mProxyTurret.Y = mouseY - 4;
      mProxyTurret.Render();
      break;
  
    case 2:
      mLinkTurret.X = mouseX - 4;
      mLinkTurret.Y = mouseY - 4;
      mLinkTurret.Render();
      break;
  
    case 3:
      mHitmanTurret.X = mouseX - 4;
      mHitmanTurret.Y = mouseY - 4;
      mHitmanTurret.Render();
      break;
  
    default:
      break;
    }
  }
}

// If mouse was pressed
void mousePressed()
{
  if (mouseButton == LEFT)
  {
    // Handle turret buttons
    if (mProxyButton.State)
    {
      mPlaceState = 1;
    }
    else if (mLinkButton.State)
    {
      mPlaceState = 2;
    }
    else if (mHitmanButton.State)
    {
      mPlaceState = 3;
    }
    // Handle next wave/level button
    else if (mNextWaveButton.State)
    {      
      // Basically clear turrets for next level, clear enemies, set spawn timers, increase difficulty
      boolean clickable = true;

      mLoaded = false;

      for (int i = mEnemies.size() - 1; i >= 0; i--)
      {
        Enemy e = mEnemies.get(i);

        if (e.State != 1)
        {
          clickable = false;
        }
      }

      if (clickable && mVictory == false)
      {          
        if (mWaves < mWaveCount)
        {
          mEnemies.clear();
          mProjectiles.clear();

          mRunning = true;

          mSpawnTime -= 50;
          mWaveEnemies += 2;
          mWaveCurrent = 0;
          mLastSpawn = millis();

          mWaves++;
        }
        else
        {         
          mWaveCurrent = 0;
          mWaveEnemies = 5 + 2 * mLevel;
          mRunning = true;
          mEnemies.clear();
          mProjectiles.clear();
          mMoney += 1000;
          mLevel++;
        }
      }
    }
    else
    {
      int mx = (int)(mouseX - mSurface.Position[0]) / mSurface.TileSize;
      int my = (int)(mouseY - mSurface.Position[1]) / mSurface.TileSize;

      boolean placeable = true;

      for (int i = mSurface.mFilled.size() - 1; i >= 0; i--)
      {
        Pair p = mSurface.mFilled.get(i);
        if (p.First == mx && p.Second == my)
        {
          placeable = false;
        }
      }

      for (int i = mSurface.mPath.size() - 1; i >= 0; i--)
      {
        Pair p = mSurface.mPath.get(i);
        if (p.First == mx && p.Second == my)
        {
          placeable = false;
        }
      }

      if (placeable == true && mx >= 0 && mx < mSurface.Dimensions[0] && my >= 0 && my < mSurface.Dimensions[1])
      {
        switch(mPlaceState)
        {
        case 1:
          if(mMoney > 300)
          {
            mMoney -= 300;
            mTurrets.add(new ProxyTurret(mx * mSurface.TileSize + mSurface.Position[0], my * mSurface.TileSize + mSurface.Position[1]));
            mSurface.mFilled.add(new Pair(mx, my));
          }
          break;

        case 2:
          if(mMoney > 750)
          {
            mMoney -= 750;
            mTurrets.add(new LinkTurret(mx * mSurface.TileSize + mSurface.Position[0], my * mSurface.TileSize + mSurface.Position[1]));
            mSurface.mFilled.add(new Pair(mx, my));
          }
          break;

        case 3:
          if(mMoney > 2000)
          {
            mMoney -= 2000;
            mTurrets.add(new HitmanTurret(mx * mSurface.TileSize + mSurface.Position[0], my * mSurface.TileSize + mSurface.Position[1]));
            mSurface.mFilled.add(new Pair(mx, my));
          }
          break;

        default:
          break;
        }
      }
    }
  }
  else if (mouseButton == RIGHT)
  {
    mPlaceState = 0;
  }
}

/**
  * Button class
  *
  * inherits Sprite, contains image for Away/Over states
  **/
class Button extends Sprite
{
  PImage Away;
  PImage Over;
  
  public boolean State;
  
  // Constructor
  public Button(float x, float y, float w, float h, String away, String over)
  {
    super(x, y, w, h);
    Away = loadImage(away, "png");
    Over = loadImage(over, "png");
  }
  
  // Update method, checks whether mouse pointer is over button
  void Update()
  {
    if(mouseX >= X && mouseX <= X + Width && mouseY >= Y && mouseY <= Y + Height)
    {
      State = true;
    }
    else
    {
      State = false;
    }
  }
  
  // Render method, based upon state renders the button image
  void Render()
  {
    if(State)
    {
      image(Over, X, Y);
    }
    else
    {
      image(Away, X, Y);
    }
  }
};
/**
  * Projectile class
  **/
class Projectile extends Sprite
{
  Enemy mTarget;  // Target that will be hit by projectile
  float mDamage;  // Damage that will projectile deal
  float mSpeed;   // Speed of the projectile
  
  // Constructor, takes turret that is shooting it and the enemy
  public Projectile(Turret t, Enemy target)
  {
    super(t.X + t.Width * 0.5, t.Y + t.Height * 0.5, 3, 3);
    mDamage = t.Damage;
    mTarget = target;
    mSpeed = 2.5f;
  }
  
  // Render method (projectile is ellipse)
  public void Render()
  {
    fill(0, 0, 0);
    ellipse(X, Y, 3, 3);
  }
  
  // Update method - moves the projectile towards enemy
  public void Update()
  {
    float dx = (float)(mTarget.X + mTarget.Width * 0.5) - X;
    float dy = (float)(mTarget.Y + mTarget.Height * 0.5) - Y;
    float l = sqrt(dx * dx + dy * dy);
    dx /= l;
    dy /= l;
    
    X += dx * mSpeed;
    Y += dy * mSpeed;
  }
}
/**
  * Sprite class
  *
  * contains position and size of the sprite
  **/
class Sprite
{
  public float X;
  public float Y;
  public float Width;
  public float Height;
    
  public Sprite(float x, float y, float w, float h)
  {
    X = x;
    Y = y;
    Width = w;
    Height = h;
  }
};
class Turret extends Sprite
{
  float Range;
  float Damage;
  int mLastShot;
  
  public Turret(float x, float y, float w, float h,
                float range, float damage)
  {
    super(x, y, w, h);
    Range = range;
    Damage = damage;
    mLastShot = 0;
  }
  
  public void Render()
  {
    rect(X, Y, Width, Height);
  }
  
  public void Update(ArrayList<Enemy> e, ArrayList<Projectile> p)
  {
    for(int i = 0; i < mEnemies.size(); i++)
    {
      Enemy en = mEnemies.get(i);
      
      if(en.State == 1)
      {
        continue;
      }
      
      float dx = (float)(en.X) - X;
      float dy = (float)(en.Y) - Y;
      float d = dx * dx + dy * dy;
      
      if(d < Range * Range)
      {
        if(millis() - mLastShot > 1000)
        {
          mLastShot = millis();
          p.add(new Projectile(this, en));
        }
      }
    }
  }
}

PImage ProxyTurretImage = null;
PImage ProxyProjectileImage = null;

class ProxyTurret extends Turret
{
  PImage Turret;
  PImage Projectile;
  
  public ProxyTurret(float x, float y)
  {
    super(x, y, 32, 32, 5 * 32, 25);
    
    if(ProxyTurretImage == null)
    {
      ProxyTurretImage = loadImage("proxy.png");
    }
  }
  
  public void Render()
  {
    image(ProxyTurretImage, X, Y);
  }
}

PImage LinkTurretImage = null;
PImage LinkProjectileImage = null;

class LinkTurret extends Turret
{
  public LinkTurret(float x, float y)
  {
    super(x, y, 32, 32, 7 * 32, 35);
    
    if(LinkTurretImage == null)
    {
      LinkTurretImage = loadImage("link.png");
    }
  }
  
  public void Render()
  {
    image(LinkTurretImage, X, Y);
  }
}

PImage HitmanTurretImage = null;
PImage HitmanProjectileImage = null;

class HitmanTurret extends Turret
{  
  public HitmanTurret(float x, float y)
  {
    super(x, y, 32, 32, 6 * 32, 50);
    
    if(HitmanTurretImage == null)
    {
      HitmanTurretImage = loadImage("hitman.png");
    }
  }
  
  public void Render()
  {
    image(HitmanTurretImage, X, Y);
  }
}


