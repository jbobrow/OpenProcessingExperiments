
// (C) 2012 Jeff Chien.
// Lint prototype game

final float BRAD = 8, BSPEED = 5, DRAD = 2;
final float ANGLESPD = radians(10);
final float SQWIDTH = 320;
final float CIRCRAD = SQWIDTH / sqrt(2);
final int FPS = 60;
final int TEXTSIZE = 18;

PVector bpos, bvel, origBVel, w1, w2, w3, w4;
float theta, cosTheta, sinTheta;
boolean started, paused, stopped;
ArrayList<PVector> dots, origDots;
long time, bestTime;

void setup()
{
  smooth();
  size(640, 480);
  frameRate(FPS);

  rectMode(CENTER);
  ellipseMode(RADIUS);
  textFont(loadFont("LevenimMT-48.vlw"));
  textSize(TEXTSIZE);

  dots = new ArrayList<PVector>();
  origDots = new ArrayList<PVector>();

  setupLevel();
}

void resetVars()
{
  bpos = new PVector(width / 2, height / 2);

  theta = 0;
  time = 0;
  started = false;
  paused = false;
  stopped = false;
}

void setupLevel()
{
  resetVars();
  
  bestTime = 0;
  
  bvel = new PVector(random(-5, 5), random(-5, 5));
  bvel.mult(BSPEED / bvel.mag());
  origBVel = bvel.get();

  dots.clear();
  for (int i = 0; i < 20; i++)
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
      for (PVector other : dots)
        if (d.dist(other) < 5)
          tooClose = true;
    }
    while (tooClose);
    dots.add(d);
  }
  origDots.clear();
  origDots.addAll(dots);

  recalcWalls();
}

void restartLevel()
{
  resetVars();
  bvel = origBVel.get();

  dots.clear();
  dots.addAll(origDots);

  recalcWalls();
}

boolean collisionCheck(PVector w1, PVector w2)
{
  PVector t1, t2;
  t1 = w1.get(); 
  t1.sub(bpos);
  t2 = w2.get(); 
  t2.sub(bpos);
  PVector d = t2.get();
  d.sub(t1);
  float dr = d.mag(), 
  D = t1.x * t2.y - t1.y * t2.x;
  if (abs(BRAD * dr) < abs(D))
    return(false);

  // Collision
  float angle = PVector.angleBetween(bvel, new PVector(bpos.x - width / 2, bpos.y - height / 2));
  assert(angle <= PI);
  if(angle <= 90)
  {
    PVector wnorm;
    wnorm = new PVector(-d.y, d.x);
    wnorm.limit(1);
    wnorm.mult(-2 * wnorm.dot(bvel));
    bvel.add(wnorm);
    bpos.add(bvel);
  }
  else
  {
    println("bouncing in; not reflecting");
  }

  return(true);
}

PVector circlePoint(float a)
{
  return(new PVector(CIRCRAD * cos(a) + width / 2, 
  CIRCRAD * sin(a) + height / 2));
}

void recalcWalls()
{
  w1 = circlePoint(radians(45) + theta);
  w2 = circlePoint(radians(135) + theta);
  w3 = circlePoint(radians(225) + theta);
  w4 = circlePoint(radians(315) + theta);

  cosTheta = cos(theta);
  sinTheta = sin(theta);

  constrainBall();
}

void constrainBall()
{
  PVector t1 = new PVector(bpos.x - width / 2, bpos.y - height / 2);
  float xTmp = t1.x;
  t1.x = constrain(t1.x * cosTheta + t1.y * sinTheta, 
                -SQWIDTH / 2 + BRAD - 1, 
                SQWIDTH / 2 - BRAD + 1);
  t1.y = constrain(t1.y * cosTheta - xTmp * sinTheta, 
                -SQWIDTH / 2 + BRAD - 1, 
                SQWIDTH / 2 - BRAD + 1);
  bpos.x = t1.x * cosTheta - t1.y * sinTheta + width / 2;
  bpos.y = t1.x * sinTheta + t1.y * cosTheta + height / 2;
}

void draw()
{
  background(255);

  pushMatrix();
  stroke(#0A49FF);
  strokeWeight(3);
  fill(255);
  translate(width / 2, height / 2);
  rotate(theta);
  rect(0, 0, SQWIDTH + 1, SQWIDTH + 1);
  popMatrix();

  noStroke();
  if (!stopped)
  {
    fill(50);
    for(int i = 0; i < dots.size(); i++)
    {
      PVector d = dots.get(i);
      if(d.dist(bpos) <= BRAD + DRAD)
      {
        dots.remove(d);
        i--;
        continue;
      }
      ellipse(d.x, d.y, DRAD, DRAD);
    }
    if(dots.size() == 0)
    {
      stopped = true;
      if (bestTime == 0 || bestTime > time)
        bestTime = time;
    }
  }
  fill(#FF0A49);
  ellipse(bpos.x, bpos.y, BRAD, BRAD);
  stroke(0);
  strokeWeight(1);
  line(bpos.x, bpos.y, bpos.x + 3 * bvel.x, bpos.y + 3 * bvel.y);

  // Flash if:
  // 1) Game ended
  // 2) Game running, close to best time
  if((!stopped && (bestTime <= time || bestTime - time > 10 * FPS))
      || sin(radians(frameCount) * 5) > 0)
    text(String.format("Time Elapsed: %.02f", 
      1.0f * time / FPS), 10, TEXTSIZE + 5);

  // Flash if there's a new best time
  if(bestTime > 0 &&
      (!stopped 
        || bestTime != time 
        || sin(radians(frameCount) * 5) > 0))
    text(String.format("Best Time: %.02f", 
      1.0f * bestTime / FPS), 10, 2 * TEXTSIZE + 5);

  text("Press n for New Level.", 440, height - 15);
  if(!started)
    text("Press any key to begin.", 10, height - 15);
  else
  {
    text("Press r to Restart.", 10, height - 15);
    if(!stopped)
    {
      if(!paused)
      {
        text("Press left/right to Rotate Square.", 10, height - 15 - TEXTSIZE);
        text("Press p to Pause.", 10, height - 15 - 2 * TEXTSIZE);
      }
      else
      {
        text("Press p to Resume.", 10, height - 15 - 2 * TEXTSIZE);
      }
    }
  }

  if(started && !stopped && !paused)
  {
    time++;
    if (dist(bpos.x, bpos.y, width / 2, height / 2) > SQWIDTH * 0.4)
      constrainBall();
    if (!collisionCheck(w1, w4)
      && !collisionCheck(w2, w1)
      && !collisionCheck(w3, w2)
      && !collisionCheck(w4, w3))
      bpos.add(bvel);
  }
}

void keyPressed()
{
  if(key == 'n')
  {
    setupLevel();
    return;
  }
  else if(started && key == 'r')
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
  if(key == CODED && !paused && !stopped)
  {
    if(keyCode == LEFT)
    {
      theta -= ANGLESPD;
      recalcWalls();
    }
    else if(keyCode == RIGHT)
    {
      theta += ANGLESPD;
      recalcWalls();
    }
  }
}


