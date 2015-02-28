
//variables
boolean title = true;
//bloder1
float bx=400;
float by=-10;
float bsp=random(4, 8);
//bolder2
float b2x=350;
float b2y=-10;
float b2sp=random(4, 8);
//bolder3
float b3x=300;
float b3y=-10;
float b3sp=random(4, 8);
//bolder4
float b4x=250;
float b4y=-10;
float b4sp=random(4, 8);
//bolder 5
float b5x=200;
float b5y=-10;
float b5sp=random(4, 8);
//bolder6
float b6x=150;
float b6y=-10;
float b6sp=random(4, 8);
//bolder7
float b7x=100;
float b7y=-1000;
float b7sp=0;
//bolder8
float b8x=50;
float b8y=-1000;
float b8sp=0;
//bolder9
float b9x=0; 
float b9y=-1000;
float b9sp=0;
//log
float Lx=32;
float Ly=-10;
float Lsp=random(4, 8);
float LT;
float Lb;
float Lr;
float Ll;
//Tokens
float t1x=50;
float t1y=-10;
float t1sp=random(4, 8);
//scoreboard
int score=0;
int counter=0;
//setup loop
void setup()
{
  size(400, 600);
  smooth();
  background(255);
}
//draw loop
void draw()
{
  background(255);
  if (title==true)
  {
    background(255);
    fill(0);
    textAlign(CENTER);
    textSize(35);
    text("How to Play:", width/2, 40);
    fill(0, 0, 255);
    textAlign(CENTER);
    textSize(15);
    text("Avoid ->", 140, 100);
    fill(0);
    ellipse(198, 96, 20, 20);
    ellipse(278, 96, 63, 10);
    fill(0, 0, 255);
    textAlign(CENTER);
    textSize(15);
    text("Hit the Level-up Tokens ->", 140, 150);
    fill(255, 0, 0);
    ellipse(254, 143, 20, 20);
    fill(255);
    rect(146, 541, 110, 25);
    fill(0);
    textAlign(CENTER);
    textSize(35);
    text("START", 201, 567);
    text("click to start", 193, 454);
    text("V", 193, 512);
    text("l", 195, 490);
  }
  if (title==false)
  {
    noCursor();
    //scoreboard
    fill(0);
    textAlign(CENTER);
    textSize(25);
    text("Score: " + score, width/2, 30);
    fill(0, 0, 255);
    textAlign(CENTER);
    textSize(20);
    text("Lvl: "+ counter, width/2, 55);
    //falling obsticales   
    fill(0);
    ellipse(bx, by, 20, 20);//bolder1
    by+=bsp;
    ellipse(b2x, b2y, 20, 20);//bolder2
    b2y+=b2sp;
    ellipse(b3x, b3y, 20, 20);//bolder3
    b3y+=b3sp;
    ellipse(b4x, b4y, 20, 20);//bolder4
    b4y+=b4sp;
    ellipse(b5x, b5y, 20, 20);//bolder5
    b5y+=b5sp;
    ellipse(b6x, b6y, 20, 20);//bolder6
    b6y+=b6sp;
    ellipse(b7x, b7y, 20, 20);//bolder7
    b7y+=b7sp;
    ellipse(b8x, b8y, 20, 20);//bolder8
    b8y+=b8sp;
    ellipse(b9x, b9y, 20, 20);//bolder8
    b9y+=b9sp;
    ellipse(Lx, Ly, 63, 10);//log1
    Ly+=Lsp;
    LT=Ly-5;
    Lb=Ly+5;
    Lr=Lx+32;
    Ll=Lx-32;
    //level up token
    fill(255, 0, 0);
    ellipse(t1x, t1y, 20, 20);
    t1y+=t1sp;
    //bolders
    if (by>=height+10)
    {
      by=random(-40, -10);
      bx=random(width);
      bsp = random(4, 8);
      score++;
    }
    if (b2y>=height+10)
    {
      b2y=random(-40, -10);
      b2x=random(width);
      b2sp= random(4, 8);
      score++;
    }
    if (b3y>=height+10)
    {
      b3y=random(-40, -10);
      b3x=random(width);
      b3sp= random(4, 8);
      score++;
    }
    if (b4y>=height+10)
    {
      b4y=random(-40, -10);
      b4x=random(width);
      b4sp= random(4, 8);
      score++;
    }
    if (b5y>=height+10)
    {
      b5y=random(-40, -10);
      b5x=random(width);
      b5sp= random(4, 8);
      score++;
    }
    if (b6y>=height+10)
    {
      b6y=random(-40, -10);
      b6x=random(width);
      b6sp= random(4, 8);
      score++;
    }
    if (Ly>=height+10)
    {
      Ly=random(-40, -10);
      Lx=random(width);
      Lsp=3;
      score++;
    }
    if (counter<=1)
    {
      if (b7y>=height+10)
      {
        b7y=random(-40, -10);
        b7x=random(width);
        b7sp=random(4, 8);
        score++;
      }
    }
    if (counter<=2)
    {
      if (b8y>=height+10)
      {
        b8y=random(-40, -10);
        b8x=random(width);
        b8sp=random(4, 8);
        score++;
      }
    }
    if (counter<=3)
    {
      if (b9y>=height+10)
      {
        b9y=random(-40, -10);
        b9x=random(width);
        b9sp=random(4, 8);
        score++;
      }
    }
    if (t1y>=height+10)
    {
      t1y=random(-40, -1000);
      t1x=random(width);
      t1sp= random(4, 8);
      score=score+5;
    }
    //player
    fill(0, 0, 255);
    ellipse(mouseX, mouseY, 15, 15);
    strokeWeight(3);
    //level up
    if (dist(mouseX, mouseY, t1x, t1y)<=17)
    {
      counter++;
      t1x=random(width);
      t1y=-10;
      t1sp=random(4, 8);
    }
    if ((score >= 1500)||
      (counter >= 50))
    {
      background(255);
      fill(random(255), random(255), random(255));
      textAlign(CENTER);
      textSize(45);
      text("YOU WIN!!!", width/2, height/2);
      noLoop();
    }
    //gameover
    if (dist(mouseX, mouseY, bx, by)<=17)
    {
      gameOver();
    }
    if (dist(mouseX, mouseY, b2x, b2y)<=17)
    {
      gameOver();
    }
    if (dist(mouseX, mouseY, b3x, b3y)<=17)
    {
      gameOver();
    }
    if (dist(mouseX, mouseY, b4x, b4y)<=17)
    {
      gameOver();
    }
    if (dist(mouseX, mouseY, b5x, b5y)<=17)
    {
      gameOver();
    }
    if (dist(mouseX, mouseY, b6x, b6y)<=17)
    {
      gameOver();
    }
    if ((mouseX<Lr)&&
      (mouseX>Ll)&&
      (mouseY<Lb)&&
      (mouseY>LT))
    {
      gameOver();
    }
  }
}
void keyPressed()
{
  if (key=='p')
  {
    background(255);
    fill(0);
    textAlign(CENTER);
    textSize(36);
    text("Paused", width/2, height/2);
    fill(0, 0, 255);
    textSize(25);
    text("Press u to resume", width /2, height/2+50);
    textSize(25);
    text("Press Spacebar to restart", width/2, height/2+100);
    noLoop();
  }
  if (key=='u')
  {
    loop();
  }
  if (key==' ')
  {
    reset();
  }
}
void reset()
{
  loop();
  score = 0;
  bx=400;
  by=-10;
  bsp=random(4, 8);
  b2x=350;
  b2y=-10;
  b2sp=random(4, 8);
  b3x=300;
  b3y=-10;
  b3sp=random(4, 8);
  b4x=250;
  b4y=-10;
  b4sp=random(4, 8);
  b5x=200;
  b5y=-10;
  b5sp=random(4, 8);
  b6x=150;
  b6y=-10;
  b6sp=random(4, 8);
  b7x=100;
  b7y=-1000;
  b7sp=0;
  b8x=50;
  b8y=-1000;
  b8sp=0;
  b9x=0; 
  b9y=-1000;
  b9sp=0;
  //log
  Lx=32;
  Ly=-10;
  Lsp=random(4, 8);
  //token
  t1x=50;
  t1y=-10;
  t1sp=random(4, 8);
  counter=0;
}
void gameOver()
{
  background(255);
  fill(0);
  textAlign(CENTER);
  textSize(36);
  text("GAMEOVER", width/2, height/2);
  fill(0, 0, 255);
  textSize(25);
  text("Press Spacebar to restart", width/2, height/2+100);
  text("score: "+score, width/2, height/2+50);
  text("Lvl: "+counter, width/2, height/2-50);
  cursor();
  noLoop();
}
void mousePressed()
{
  if ((mouseX>=146)&&
    (mouseX<=256) &&
    (mouseY>=541) &&
    (mouseY<=566))
  {
    title = false;
  }
}



