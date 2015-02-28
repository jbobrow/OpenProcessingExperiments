
//Hao-Yun Mei, hmei
//Copy right_Hao-Yun Mei_Carnegie Mellon University




float x, y, xN;
float ninjaX, ninjaY;
float Mx, My, Mdrop;
float v;
int gameTime, live, gamePhase;
boolean isHit = false;
int fCount =0;
float tV=5;
void setup()
{
  size (400, 600);
  smooth();
  rectMode( CENTER );
  ellipseMode( CENTER );
  textAlign(CENTER, CENTER);
  stroke (2);
  x = width/2;
  y = height;
  xN = width/2;
  My = height;

  v = 5;
  gameTime = 0;
  gamePhase = 0;
  live = 3;
}

void draw()
{
  background(200);
  if (gamePhase == 0)
  {
    instruction();
  }
  else if (gamePhase == 1)
  {
    ninjaGame();
    timeClock();
    life();
    gameOver();
  }
  else
  {
    gameOver();
  }
  
 // if (keyPressed) saveFrame ("hw7.jpg");
  
}

void ninjaGame()
{

  ninja(mouseX, mouseY);
  ninjaWeapon();
  checkhit(Mx, My);
}
void ninjaStar(float x, float y)
{
  noStroke();
  fill(255);
  beginShape();
  vertex(x, y);
  vertex(x+10, y+5);
  vertex(x+15, y+15);
  vertex(x+20, y+5);
  vertex(x+30, y);
  vertex(x+20, y-5);
  vertex(x+15, y-15);
  vertex(x+10, y-5);
  vertex(x, y);
  endShape();  
  fill(0);
  //ellipse(x+30,y,15,15);
  rect(x+15, y, 7, 7);
}

void ninja(float Nx, float Ny)
{
  xN = mouseX;
  fill(0);
  ellipse (xN, y-50, 45, 35);
  fill(252, 209, 173);
  ellipse (xN, y-47, 30, 18);
  fill (0);
  ellipse (xN-5, y-47, 4, 4);
  ellipse (xN+5, y-47, 4, 4);
  beginShape();
  curveVertex(xN-5, y-34);
  curveVertex(xN-5, y-34);
  curveVertex(xN-20, y-28);
  curveVertex(xN-20, y-22);
  curveVertex(xN-12, y-22);
  curveVertex(xN-12, y-20);
  curveVertex(xN-12, y-10);
  curveVertex(xN-12, y);
  curveVertex(xN-10, y);
  curveVertex(xN-5, y);
  curveVertex(xN, y-10);
  curveVertex(xN+5, y);
  curveVertex(xN+10, y);
  curveVertex(xN+12, y);
  curveVertex(xN+12, y-10);
  curveVertex(xN+12, y-20);
  curveVertex(xN+12, y-22);
  curveVertex(xN+20, y-22);
  curveVertex(xN+20, y-28);
  curveVertex(xN+5, y-34);
  curveVertex(xN+5, y-34);
  endShape();
}

void ninjastarMove()
{
  My = My+ v;
  println(v);

  if (frameCount%100 ==0 && tV < 20 && gameTime>11) {
    tV++;
  }
  else if (tV >= 19) {
    // println("maxspeed");
  }


  if ( My > height )
  {
    v=tV;

    My = 0;
    Mx = random(width);
  }
}






void ninjaWeapon()
{

  ninjastarMove();
  ninjaStar(Mx, My);
}




void checkhit(float tX, float tY)
{

  //float fCount = 0;
  float d = dist(tX, tY, mouseX, height);
  if (d<80) {
    println("ouch!");
    live--;
    My = 0;
    Mx = random(width);
    isHit = true;
  }
  if (isHit)
  {
    pushStyle();
    textSize (100);
    text ("Ouch!", width/2, height/2);
    popStyle();
    fCount++;
    if (fCount > 20) {
      isHit = false;
      fCount=0;
    }
  }
}

void timeClock()
{
  text( "Clock" + millis()/1000, 25, 15);
  gameTime = millis()/1000;
}

void life()
{

  text( "Life " +live, 370, 15);
}

void gameOver()
{
  if (live <= 0)
  {
    rectMode(CORNER);
    fill(0);
    rect (0, 0, width, height);
    fill (255);
    textSize (50);
    text ("Game Over", width/2, height/2);
    gamePhase = 2;
  }
}

void instruction()
{
  text ("Hide from the NinjaStar", width/2, height/2);
  text ("Press any key to play", width/2, height/2-100);
}

void keyPressed()
{
  if (gamePhase == 0)
  {
    gamePhase = 1;
  }
}


