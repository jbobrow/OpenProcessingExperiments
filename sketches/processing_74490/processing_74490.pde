
// Constant Game Speed with Maximum FPS
int frameRate = 50;
boolean interpolate = true;

int TICKS_PER_SECOND = 25;
int SKIP_TICKS = 1000 / TICKS_PER_SECOND;
int MAX_FRAMESKIP = 10;

int next_game_tick = millis();
int loops;
float interpolation;

int moveX;
int speed = 30;

int nextSecond;

int[] prepopulatedArray = new int[1000];
int[] EventLogCache = new int[1000];
int[] EventLog;

int cachedUpdateCounter=0;
int updateCounter=0;
int actulUpdateCount;

void setup()
{
  size(1650, 850);
  frameRate(50);

  for (int i=0;i<1000;i++) // prepopulate array
    prepopulatedArray[i] = 0;

  ResetEventLog();
}

void draw()
{
  if (millis() > nextSecond)
    ResetEventLog();

  int thisSecond = nextSecond - millis();
  EventLogCache[thisSecond] = 1;

  loops = 0;
  while (millis () > next_game_tick && loops < MAX_FRAMESKIP)
  {     
    if (EventLogCache[thisSecond]==1)
      EventLogCache[thisSecond] = 3;
    else
      EventLogCache[thisSecond] = 2;
      
    update_game();
    cachedUpdateCounter++;
    
    next_game_tick += SKIP_TICKS;
    loops++;
  }

  interpolation = float(millis() + SKIP_TICKS - next_game_tick) / float(SKIP_TICKS);

  draw_game(interpolation);
}

void update_game()
{
  moveX += speed;
  moveX %= width-10;
}

void draw_game(float interpolation) 
{
  background(0);
  
  text("Configured FPS: "+frameRate, 10, 15);
  if (interpolate)
    text("Interpolate ON", width - 90, 15);
  else
    text("Interpolate OFF", width - 90, 15);

  float view_position_x;
  if (interpolate)
    view_position_x = moveX + (speed * interpolation);
  else
    view_position_x = moveX;

  rect(view_position_x, height-24, 20, 20);

  int x = 1, y = 1;
  int drawCount=0, updateCount=0, colSize=80;
  for (int i=1; i<=1000; i++)
  {
    textSize(12);
    
    y++;
    if (y>50)
    {
      x++;
      y = 0;
    }
    if (EventLog[i]==1)
    {
      fill(#2C49FF);
      text(i+": Draw", x*colSize-55, 15*y+70); 
      fill(255);
      drawCount++;
    }
    else if (EventLog[i]==2)
    {
      fill(#F9FF5D);
      text(i+": Update", x*colSize-55, 15*y+70); 
      fill(255);
      updateCount++;
    }
    else if (EventLog[i]==3)
    {
      fill(#5DFF71);
      text(i+": U&D", x*colSize-55, 15*y+70); 
      fill(255);
      drawCount++; 
      updateCount++;
    }
    else if (EventLog[i]==4)
    {
       text(i+": Test", x*colSize-55, 15*y+70); 
    }
    else
    {
     text(i+":", x*colSize-55, 15*y+70); 
    }
  }

  text("Draw rate: "+drawCount, 10, 30);
  text("Update rate: "+updateCount, 10, 45);
  text("Update Counter:     "+updateCounter, 150, 30);
  text("Calculated Counter: "+actulUpdateCount, 150, 45); 
}


void ResetEventLog()
{
  nextSecond = millis()+1000;
  EventLog = new int[1001];
  arrayCopy(EventLogCache, EventLog);
  arrayCopy(prepopulatedArray, EventLogCache);
  EventLogCache = new int[1001];
  
  updateCounter = cachedUpdateCounter;
  actulUpdateCount = millis() / SKIP_TICKS;
  
  EventLogCache[0] = 4;
}

void keyPressed()
{
  if (key==CODED)
  {
    if (keyCode==UP)
      frameRate(frameRate++);

    if (frameRate>1)
      if (keyCode==DOWN)
        frameRate(frameRate--);
  }

  if (key=='i')
    interpolate = !interpolate;
}
