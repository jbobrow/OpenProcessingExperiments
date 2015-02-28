
PImage frogger;

float froggerX;
float froggerY;
float variable;

float rect1x;
float rect2x;
float rect3x;
float rect4x;
float rect1speed;
float rect2speed;
float rect3speed;
float rect4speed;

float square1x;
float square2x;
float square3x;
float squareSpeed;

float ellipse1x;
float ellipse2x;
float ellipse3x;
float ellipse4x;
float ellipse5x;
float ellipse6x;
float ellipseSpeed;
float ellipseVar1x;
float ellipseVar2x;

float quad1x;
float quad2x;
float quad3x;

float circle1x;
float circle2x;
float circle3x;
float circle4x;
float circle5x;
float circle6x;
float circleSpeed;
float circleVar1x;
float circleVar2x;

float top1x;
float top2x;


void setup()
{
  size(600, 550);
  smooth();
  background(255);

  frogger = loadImage("Frogger.jpg");

  rect1x = 0;
  rect2x = 0;
  rect3x = 375;
  rect4x = 350;
  rect1speed = 1;
  rect2speed = 2;
  rect3speed = 1;
  rect4speed = 2;

  froggerX=275;
  froggerY=500;
  variable=50;

  square1x = 50;
  square2x = 250;
  square3x = 450;
  squareSpeed = -3;  

  ellipse1x =50;
  ellipse2x =100;
  ellipse3x =150;
  ellipse4x =350;
  ellipse5x =400;
  ellipse6x =450;
  ellipseSpeed = 1;
  ellipseVar1x = 25; 
  ellipseVar2x = 325;

  quad1x =50; 
  quad2x =250; 
  quad3x =450;

  circle1x =50;
  circle2x =100;
  circle3x =150;
  circle4x =350;
  circle5x =400;
  circle6x =450;
  circleSpeed =-1;
  circleVar1x =25;
  circleVar2x =325;
  
  top1x =0;
  top2x =435;
}


void draw()
{
  background(255, 255, 255);


  strokeWeight(0);
  fill(255, 0, 0);
  rect(rect1x, 450, 150, 50);
  rect(rect3x, 450, 150, 50);
  
  fill(108,16,155);
  rect(rect2x, 350, 100, 50);
  rect(rect4x, 350, 100, 50);

  rect1x = rect1x + rect1speed;
  rect2x = rect2x + rect2speed;
  rect3x = rect3x + rect3speed;
  rect4x = rect4x + rect4speed;

  fill(255,0,0);
  rect(square1x, 250, 50, 50);
  rect(square2x, 250, 50, 50);
  rect(square3x, 250, 50, 50);

  square1x = square1x + squareSpeed;
  square2x = square2x + squareSpeed;
  square3x = square3x + squareSpeed;

  fill(0, 0, 255);
  ellipse(ellipse1x, 225, 50, 50);
  ellipse(ellipse2x, 225, 50, 50);
  ellipse(ellipse3x, 225, 50, 50);
  ellipse(ellipse4x, 225, 50, 50);
  ellipse(ellipse5x, 225, 50, 50);
  ellipse(ellipse6x, 225, 50, 50);

  ellipse1x = ellipse1x + ellipseSpeed;
  ellipse2x = ellipse2x + ellipseSpeed;
  ellipse3x = ellipse3x + ellipseSpeed;
  ellipse4x = ellipse4x + ellipseSpeed;
  ellipse5x = ellipse5x + ellipseSpeed;
  ellipse6x = ellipse6x + ellipseSpeed;
  ellipseVar1x = ellipseVar1x + ellipseSpeed;
  ellipseVar2x = ellipseVar2x + ellipseSpeed;

  fill(225, 225, 0);
  quad(quad1x, 175, 100, 200, 150, 175, 100, 150);
  quad(quad2x, 175, 300, 200, 350, 175, 300, 150);
  quad(quad3x, 175, 500, 200, 550, 175, 500, 150);

  fill(0, 0, 255);
  ellipse(circle1x, 125, 50, 50);
  ellipse(circle2x, 125, 50, 50);
  ellipse(circle3x, 125, 50, 50);
  ellipse(circle4x, 125, 50, 50);
  ellipse(circle5x, 125, 50, 50);
  ellipse(circle6x, 125, 50, 50);

  circle1x = circle1x + circleSpeed;
  circle2x = circle2x + circleSpeed;
  circle3x = circle3x + circleSpeed;
  circle4x = circle4x + circleSpeed;
  circle5x = circle5x + circleSpeed;
  circle6x = circle6x + circleSpeed;
  circleVar1x = circleVar1x + circleSpeed;
  circleVar2x = circleVar2x + circleSpeed;

  fill(0,255,0);
  rect(top1x,0,315,50);
  rect(top2x,0,175,50);

  if (rect1x > width)
  {
    rect1x = -150;
  }

  if (rect2x > width)
  {
    rect2x = -100;
  }
  if (rect3x > width)
  {
    rect3x = -150;
  }

  if (rect4x > width)
  {
    rect4x = -100;
  }

  if (square1x <-50)
  {
    square1x = 650;
  }
  if (square2x <-50)
  {
    square2x = 650;
  }
  if (square3x <-50)
  {
    square3x = 650;
  }

  if (ellipse1x >= 625)
  {
    ellipse1x = -25;
  }
  if (ellipse2x>=625)
  {
    ellipse2x = -25;
  }
  if (ellipse3x>=625)
  {
    ellipse3x = -25;
  }
  if (ellipse4x >=625)
  {
    ellipse4x = -25;
  }
  if (ellipse5x >=625)
  {
    ellipse5x = -25;
  }
  if (ellipse6x >=625)
  {
    ellipse6x = -25;
  }
  if (ellipseVar1x >=625)
  {
    ellipseVar1x = -25;
  }
  if (ellipseVar2x >=625)
  {
    ellipseVar2x = -25;
  }
  if (circle1x <=-25)
  {
    circle1x = 625;
  }
  if (circle2x <=-25)
  {
    circle2x = 625;
  }
  if (circle3x <=-25)
  {
    circle3x = 625;
  }
  if (circle4x <=-25)
  {
    circle4x = 625;
  }
  if (circle5x <=-25)
  {
    circle5x = 625;
  }
  if (circle6x <=-25)
  {
    circle6x = 625;
  }
  if (circleVar1x <=-25)
  {
    circleVar1x = 625;
  }
  if (circleVar2x <=-25)
  {
    circleVar2x = 625;
  }

  fill(0);
  textSize(11);
  text(froggerX + ", " + froggerY, 525, 545);

  image(frogger, froggerX, froggerY, 50, 50);

  if (froggerY==450)
  {
    if (froggerX<=rect1x+150 && froggerX>=rect1x-50)
    {
      gameOver();
    }
  }
  if (froggerY==450)
  {
    if (froggerX<=rect3x+150 && froggerX>=rect3x-50)
    {
      gameOver();
    }
  }
  if (froggerY==350)
  {
    if (froggerX<=rect2x+100 && froggerX>=rect2x-50)
    {
      gameOver();
    }
  }
  if (froggerY==350)
  {
    if (froggerX<=rect4x+100 && froggerX>=rect4x-50)
    {
      gameOver();
    }
  }
  if (froggerY==250)
  {
    if (froggerX<=square1x+50 && froggerX>=square1x-50)
    {
      gameOver();
    }
  }
  if (froggerY==250)
  {
    if (froggerX<=square2x+50 && froggerX>=square2x-50)
    {
      gameOver();
    }
  }
  if (froggerY==250)
  {
    if (froggerX<=square3x+50 && froggerX>=square3x-50)
    {
      gameOver();
    }
  }
  if (froggerY==200)
  {
    if (froggerX<=ellipseVar1x+150 && froggerX>=
      ellipseVar1x-50)
    {
      gameOver();
    }
  }
  if (froggerY==200)
  {
    if (froggerX<=ellipseVar2x+150 && froggerX>=
      ellipseVar2x-50)
    {
      gameOver();
    }
  }
  if (froggerY==150)
  {
    if (froggerX<=quad1x+100 && froggerX>=quad1x-50)
    {
      gameOver();
    }
  }
  if (froggerY==150)
  {
    if (froggerX<=quad2x+100 && froggerX>=quad2x-50)
    {
      gameOver();
    }
  }
  if (froggerY==100)
  {
    if (froggerX<=circleVar1x+150 && froggerX>=
      circleVar1x-50)
    {
      gameOver();
    }
  }
  if (froggerY==100)
  {
    if (froggerX<=circleVar2x+150 && froggerX>=
      circleVar2x-50)
    {
      gameOver();
    }
  }
 if (froggerY==0)
  {
    if (froggerX<=top1x+315 && froggerX>=top1x-50)
    {
      gameOver();
    }
  }
  if (froggerY==0)
  {
    if (froggerX<=top2x+165 && froggerX>=top2x-50)
    {
      gameOver();
    }
  }

  if (froggerY<0)
  {
    noLoop();
    background(255, 255, 255);
    fill(random(255),random(255),random(255));
    textSize(50);
    textAlign(CENTER);
    text("You Win!! (:", width/2, height/2);
  }
  if(froggerX>=575)
  {
   froggerX=525; 
  }
  if(froggerX<25)
  {
   froggerX=25;
  }
  if(froggerY>=height)
  {
   froggerY=500; 
  }
}


void keyPressed()
{
  if (keyCode==UP)
  {
    froggerY=froggerY-variable;
  }
  if (keyCode==RIGHT)
  {
    froggerX=froggerX+variable;
  }
  if (keyCode==DOWN)
  {
    froggerY=froggerY+variable;
  }
  if (keyCode==LEFT)
  {
    froggerX=froggerX-variable;
  }
  
  if (key==' ')
  {  
    println("reset");
    reset();
  }
}


void gameOver()
{
  background(255);
  fill(255,0,0);
  textSize(50);
  textAlign(CENTER);
  text("Game Over! ):", width/2, height/2);
  noLoop();
}


void reset()
{
  rect1x = 0;
  rect2x = 0;
  rect3x = 375;
  rect4x = 350;
  rect1speed = 1;
  rect2speed = 2;
  rect3speed = 1;
  rect4speed = 2;

  froggerX=275;
  froggerY=500;
  variable=50;

  square1x = 50;
  square2x = 250;
  square3x = 450;
  squareSpeed = -3;  

  ellipse1x =50;
  ellipse2x =100;
  ellipse3x =150;
  ellipse4x =350;
  ellipse5x =400;
  ellipse6x =450;
  ellipseSpeed = 1;
  ellipseVar1x = 25; 
  ellipseVar2x = 325;

  quad1x =50; 
  quad2x =250; 
  quad3x =450;

  circle1x =50;
  circle2x =100;
  circle3x =150;
  circle4x =350;
  circle5x =400;
  circle6x =450;
  circleSpeed =-1;
  circleVar1x =25;
  circleVar2x =325;

  loop();
}



