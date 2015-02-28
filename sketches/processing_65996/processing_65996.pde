
// (C) 2012 Jeff Chien.
// Lint prototype game

final float BRAD = 8, BSPEED = 5;
final float ANGLESPD = radians(10);
final float SQWIDTH = 320;
final float CIRCRAD = SQWIDTH / sqrt(2);
final int FPS = 60;
final int TEXTSIZE = 18;

PVector bpos, bvel, origBVel, w1, w2, w3, w4;
float angle;
boolean started, paused, stopped;
ArrayList<PVector> dots = new ArrayList<PVector>(), 
                  origDots = new ArrayList<PVector>();
long time;

void setup()
{
  smooth();
  size(640, 480);
  frameRate(FPS);
  
  rectMode(CENTER);
  ellipseMode(RADIUS);
  textFont(loadFont("LevenimMT-48.vlw"));
  textSize(TEXTSIZE);

  setupLevel();
}

void setupLevel()
{
  bpos = new PVector(width / 2, height / 2);
  bvel = new PVector(random(-5, 5), random(-5, 5));
  bvel.mult(BSPEED / bvel.mag());
  origBVel = bvel.get();
  
  angle = 0;
  time = 0;
  started = false;
  paused = false;
  stopped = false;
  
  dots.clear();
  for(int i = 0; i < 20; i++)
  {
    PVector d;
    boolean tooClose;
    do
    {
      tooClose = false;
      d = new PVector(random(-CIRCRAD * 0.6, CIRCRAD * 0.6),
                      random(-CIRCRAD * 0.6, CIRCRAD * 0.6));
      d.limit(CIRCRAD * 0.75);
      d.x += width / 2;
      d.y += height / 2;
      for(PVector other : dots)
        if(d.dist(other) < 5)
          tooClose = true;
    }
    while(tooClose);
    dots.add(d);
  }
  origDots.clear();
  origDots.addAll(dots);
  
  recalcWalls();
}

void restartLevel()
{
  bpos = new PVector(width / 2, height / 2);
  bvel = origBVel.get();
  
  angle = 0;
  time = 0;
  started = false;
  paused = false;
  stopped = false;
  
  dots.clear();
  dots.addAll(origDots);
  
  recalcWalls();
}

boolean collisionCheck(PVector w1, PVector w2)
{
  PVector t1, t2;
  t1 = w1.get(); t1.sub(bpos);
  t2 = w2.get(); t2.sub(bpos);
  PVector d = t2.get();
  d.sub(t1);
  float dr = d.mag(),
        D = t1.x * t2.y - t1.y * t2.x;
  if(abs(BRAD * dr) < abs(D))
    return(false);
  
  // Collision
  PVector wnorm;
  wnorm = new PVector(-d.y, d.x);
  wnorm.limit(1);
  wnorm.mult(-2 * wnorm.dot(bvel));
  bvel.add(wnorm);
  bpos.add(bvel);
  
  return(true);
}

PVector circlePoint(float theta)
{
  return(new PVector(CIRCRAD * cos(theta) + width / 2,
                      CIRCRAD * sin(theta) + height / 2));
}

void recalcWalls()
{
  w1 = circlePoint(radians(45) + angle);
  w2 = circlePoint(radians(135) + angle);
  w3 = circlePoint(radians(225) + angle);
  w4 = circlePoint(radians(315) + angle);
  
  PVector t1 = new PVector(bpos.x - width / 2, bpos.y - height / 2);
  float xTmp = t1.x;
  t1.x = constrain(t1.x * cos(-angle) - t1.y * sin(-angle), 
                -SQWIDTH / 2 + BRAD, 
                 SQWIDTH / 2 - BRAD);
  t1.y = constrain(xTmp * sin(-angle) + t1.y * cos(-angle), 
                -SQWIDTH / 2 + BRAD, 
                 SQWIDTH / 2 - BRAD);
  bpos.x = t1.x * cos(angle) - t1.y * sin(angle) + width / 2;
  bpos.y = t1.x * sin(angle) + t1.y * cos(angle) + height / 2;
}

void draw()
{
  background(255);

  pushMatrix();
    stroke(#0A49FF);
    strokeWeight(3);
    fill(255);
    translate(width / 2, height / 2);
    rotate(angle);
    rect(0, 0, SQWIDTH + 1, SQWIDTH + 1);
  popMatrix();

  noStroke();
  if(!stopped)
  {
    fill(50);
    for(int i = 0; i < dots.size(); i++)
    {
      PVector d = dots.get(i);
      if(d.dist(bpos) <= BRAD + 1)
      {
        dots.remove(d);
        i--;
        continue;
      }
      ellipse(d.x, d.y, 1, 1);
    }
    if(dots.size() == 0)
      stopped = true;
  }
  fill(#FF0A49);
  ellipse(bpos.x, bpos.y, BRAD, BRAD);
  
  if(!stopped || sin(radians(frameCount) * 5) > 0)
    text(String.format("Time Elapsed: %.02f", 
                    1.0f * time / FPS), 10, TEXTSIZE + 5);
  if(!started)
    text("Press any key to begin.", 10, height - 15);
  else
  {
    text("Press left/right to Rotate Square.", 10, height - 15 - 2 * TEXTSIZE);
    text("Press r to Restart.", 10, height - 15 - TEXTSIZE);
    if(!stopped)
    {
      if(!paused)
        text("Press p to Pause.", 10, height - 15);
      else
        text("Press p to Resume.", 10, height - 15);
    }
  }
  
  if(started && !stopped && !paused)
  {
    time++;
    if(!collisionCheck(w1, w4)
      && !collisionCheck(w2, w1)
      && !collisionCheck(w3, w2)
      && !collisionCheck(w4, w3))
        bpos.add(bvel);
  }
}

void keyPressed()
{
  if(started && key == 'r')
  {
    restartLevel();
    return;
  }
  
  if(!started)
  {
    started = true;
  }
  else if(key == 'p')
  {
    paused = !paused;
  }
  if(key == CODED && !paused)
  {
    if(keyCode == LEFT)
      angle -= ANGLESPD;
    else if (keyCode == RIGHT)
      angle += ANGLESPD;
      
    recalcWalls();
  }
}


