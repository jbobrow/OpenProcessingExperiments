
//kevin hyun khyun
//copyright 2012
float easeX, easeY, inc;
float r, g, b; //color
float bs; //ball size
float boundSize, buff; //warning rectangle size paramters

float obs1X, obs1Y, obs1XSpeed, obs1YSpeed; //parameters for obstacle 1
float obs2X, obs2Y, obs2XSpeed, obs2YSpeed; //parameters for obstacle 2
float obs3X, obs3Y, obs3XSpeed, obs3YSpeed; //parameters for obstacle 3
float obs4X, obs4Y, obs4XSpeed, obs4YSpeed; //parameters for obstacle 4

float score;

void setup()
{
  size(600, 600);
  smooth();
  noCursor();
  bs = width/40;
  boundSize = bs * 1.5;
  buff = 10;
  easeX = width/2;
  easeY = height/2;
  inc = .1;

  obs1X = random(width);
  obs1Y = random(height);
  obs1XSpeed = width * random(.01, .03);
  obs1YSpeed = height * random(.01, .04);

  obs2X = random(width);
  obs2Y = random(height);
  obs2XSpeed = width * random(.02, .04);
  obs2YSpeed = height * random(.02, .03);

  obs3X = random(width);
  obs3Y = random(height);
  obs3XSpeed = width * random(.02, .03);
  obs3YSpeed = height * random(.02, .04);

  obs4X = random(width);
  obs4Y = random(height);
  obs4XSpeed = width * random(.001, .005);
  obs4YSpeed = height * random(.002, .006);

  r = 3;
  g = 48;
  b = 59;
}

void draw()
{
  prepWindow();
  easeBall();
  obs1();
  obs2();
  obs3();
  obs4();
  text();
  warningBar();
  collisionObs1();
  collisionObs2();
  collisionObs3();
  collisionObs4();
  moveobs1();
  moveobs2();
  moveobs3();
  moveobs4();
  resetScore();
}

void moveobs4()
{
  obs4X = obs4X + obs4XSpeed;

  if (obs4X > width || obs4X < 0)
  {
    obs4XSpeed = (-1 * obs4XSpeed);
  }

  obs4Y = obs4Y + obs4YSpeed;

  if (obs4Y > height || obs4Y < 0)
  {
    obs4YSpeed = (-1 * obs4YSpeed);
  }
}

void moveobs3()
{
  obs3X = obs3X + obs3XSpeed;

  if (obs3X > width || obs3X < 0)
  {
    obs3XSpeed = (-1 * obs3XSpeed);
  }

  obs3Y = obs3Y + obs3YSpeed;

  if (obs3Y > height || obs3Y < 0)
  {
    obs3YSpeed = (-1 * obs3YSpeed);
  }
}

void moveobs2()
{
  obs2X = obs2X + obs2XSpeed;

  if (obs2X > width || obs2X < 0)
  {
    obs2XSpeed = (-1 * obs2XSpeed);
  }

  obs2Y = obs2Y + obs2YSpeed;

  if (obs2Y > height || obs2Y < 0)
  {
    obs2YSpeed = (-1 * obs2YSpeed);
  }
}

void moveobs1()
{
  obs1X = obs1X + obs1XSpeed;

  if (obs1X > width || obs1X < 0)
  {
    obs1XSpeed = (-1 * obs1XSpeed);
  }

  obs1Y = obs1Y + obs1YSpeed;

  if (obs1Y > height || obs1Y < 0)
  {
    obs1YSpeed = (-1 * obs1YSpeed);
  }
}

void obs4()
{
  noStroke();
  fill(255, 0, 0);
  ellipse(obs4X, obs4Y, ((3*bs) /4), ((3*bs) /4));
}

void obs3()
{
  stroke(0);
  fill(255);
  ellipse(obs3X, obs3Y, ((3*bs) /4), ((3*bs) /4));
}

void obs2()
{
  stroke(0);
  fill(255);
  ellipse(obs2X, obs2Y, ((3*bs) /4), ((3*bs) /4));
}

void obs1()
{
  stroke(0);
  fill(255);
  ellipse(obs1X, obs1Y, ((3*bs) /4), ((3*bs) /4));
}

void text()
{
  //time played
  textAlign(CENTER);
  text("time played :  " + millis()/1000, width/2, height*.9);
  text("score :  " + score, width/2, height* .8);
}


void prepWindow()
{
  background(r, g, b);
}

void easeBall()
{
  fill(255);
  easeX = easeX + (mouseX - easeX)*inc;
  easeY = easeY + (mouseY -easeY)*inc;

  ellipse(easeX, easeY, bs, bs);
}

void collisionObs1()
{
  float d = dist(mouseX, mouseY, obs1X, obs1Y);
  if (d < bs + buff/2)
  {
    background(200, 0, 0);
    obs1X = random(width);
    obs1Y = random(height);
    obs1XSpeed = width * random(.01, .03);
    obs1YSpeed = height * random(.01, .04);

    obs2X = random(width);
    obs2Y = random(height);
    obs2XSpeed = width * random(.02, .04);
    obs2YSpeed = height * random(.02, .03);

    obs3X = random(width);
    obs3Y = random(height);
    obs3XSpeed = width * random(.02, .03);
    obs3YSpeed = height * random(.02, .04);

    obs4X = random(width);
    obs4Y = random(height);
    obs4XSpeed = width * random(.001, .005);
    obs4YSpeed = height * random(.002, .006);

    score = score-1;
  }
}

void collisionObs2()
{
  float d = dist(mouseX, mouseY, obs2X, obs2Y);
  if (d < bs + buff/2)
  {
    background(200, 0, 0);
    obs1X = random(width);
    obs1Y = random(height);
    obs1XSpeed = width * random(.01, .03);
    obs1YSpeed = height * random(.01, .04);

    obs2X = random(width);
    obs2Y = random(height);
    obs2XSpeed = width * random(.02, .04);
    obs2YSpeed = height * random(.02, .03);

    obs3X = random(width);
    obs3Y = random(height);
    obs3XSpeed = width * random(.02, .03);
    obs3YSpeed = height * random(.02, .04);

    obs4X = random(width);
    obs4Y = random(height);
    obs4XSpeed = width * random(.001, .005);
    obs4YSpeed = height * random(.002, .006);

    score = score-1;
  }
}

void collisionObs3()
{
  float d = dist(mouseX, mouseY, obs3X, obs3Y);
  if (d < bs + buff/2)
  {
    background(200, 0, 0);
    obs1X = random(width);
    obs1Y = random(height);
    obs1XSpeed = width * random(.01, .03);
    obs1YSpeed = height * random(.01, .04);

    obs2X = random(width);
    obs2Y = random(height);
    obs2XSpeed = width * random(.02, .04);
    obs2YSpeed = height * random(.02, .03);

    obs3X = random(width);
    obs3Y = random(height);
    obs3XSpeed = width * random(.02, .03);
    obs3YSpeed = height * random(.02, .04);

    obs4X = random(width);
    obs4Y = random(height);
    obs4XSpeed = width * random(.001, .005);
    obs4YSpeed = height * random(.002, .006);

    score = score-1;
  }
}

void collisionObs4()
{
  float d = dist(mouseX, mouseY, obs4X, obs4Y);
  if (d < bs + buff/2)
  {
    textAlign(CENTER);
    text("HIT!", width/2, height/2);

    score = score+1;
  }
}

void warningBar()
{
  noStroke();
  if (mouseX <= boundSize + buff)
  {
    fill(200, 0, 0);
    rect(0, 0, boundSize, height);
  }

  if (mouseX >= (width - (boundSize + buff)))
  {
    fill(200, 0, 0);
    rect( (width-boundSize), 0, (width-boundSize), height);
  }

  if (mouseY <= boundSize + buff)
  {
    fill(200, 0, 0);
    rect(0, 0, width, boundSize );
  }

  if (mouseY >= (width - (boundSize + buff)))
  {
    fill(200, 0, 0);
    rect(0, (width - boundSize), width, height);
  }
}

void resetScore()
{
  if (easeX <= boundSize || easeX >= (width - boundSize) || easeY <= boundSize || easeY >= (width - boundSize) )
  {
    background(200, 0, 0);
    fill(255);
    text("score reset", width/2, height/2);
    score = 0;
  }
}


