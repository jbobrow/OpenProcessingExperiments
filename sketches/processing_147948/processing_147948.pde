
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/134371*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
float hit = 0.0;
PImage space;
float life = 30;
float timer = 10;
float gamestate = 0;
float playstate= 0;
float WinState = 1;
float LoseState = 2;
float shoot= 0;
float circleX = 250;
float circleY = 200;
float circleRadius = 30;
float CircleLife = 100;


class Asteroid
 
{
  float x = 50;
  float y = 100;
  float radius = 20;
  float speed = 1;//random (2, 6);
}
 
class Ship
{
  float x = 250;
  float y = 650;
  float w = 30;
  float h = 30;
  float speed = 6;
}
 
boolean Left = false;
boolean Right = false;
 
Asteroid[] asteroids= new Asteroid[50];
Ship player = new Ship();
 
boolean rectRectIntersect(float left, float top, float right, float bottom, float otherLeft, float otherTop, float otherRight, float otherBottom)
{
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}


void setup()
{
  size(500, 700);
  textSize(30);
  space= requestImage("./background.png"); 
  for (int i = 0; i < asteroids.length; i += 1)
  {
  asteroids[i] = new Asteroid();
  asteroids[i].x = random(800);
  asteroids[i].y = random(100);
  }
}
 
void draw()
{
  noStroke();
  timer = timer - (1.0/30.0);
  image(space,0,0,width,height);
  fill(0,225,0);
  if (life <= 0)
  {
    text("Life: 0", 350,50);
  }
  else
  {
    text("Life: " + (int)life,350,50);
  }
  if (CircleLife <= 0)
  {
    text("Enemy Life: 0",10,50);
  }
  else
  {
    text("Enemy Life: " + (int)CircleLife,10,50);
  }
  if (timer < 0)
  {
    if ((life > 0) && (CircleLife <= 0))
    {
      gamestate = WinState;
    }
    else
    {
      gamestate = LoseState;
    }
  }
  if (gamestate == LoseState)
  {
    background(255);
    text("You Lose", 170,350);
  }
  if (gamestate == WinState)
  {
    text("You Win!", 170,350);
  }
  if (Right == true)
  {
    player.x += player.speed;
  }
   
  if (Left == true)
  {
    player.x -= player.speed;
  }
  fill(98,31,255);
  //rect(player.x, player.y, player.w, player.h);
   triangle(player.x,player.y,player.x-30,player.y+30,player.x+30,player.y+30);
  for (int i = 0; i < asteroids.length; i += 1)
  {
  asteroids[i].y += asteroids[i].speed;
   
  if (gamestate != WinState && rectRectIntersect(
  player.x,
  player.y,
  player.x + player.w,
  player.y + player.h,
  asteroids[i].x,
  asteroids[i].y,
  asteroids[i].x + asteroids[i].radius,
  asteroids[i].y + asteroids[i].radius))
  {
    hit = 1;
    life = life - 1;
    //asteroids[i].x = -1000;
  }
  if (hit == 1)
  {
    background(255,0,0);
    hit = 0;
  }
   
  ellipseMode(CORNER);
  //fill(122,27,3);
  fill(random(255), random(255), random(255));
  ellipse(asteroids[i].x, asteroids[i].y, asteroids[i].radius, asteroids[i].radius);
  }
  fill(255,1,111);
  ellipseMode(RADIUS);
  ellipse(circleX, circleY, circleRadius, circleRadius);
  

  if (keyPressed)
  {
    if (key == '1')
    {
      stroke(random(255),random(255),random(255));
      strokeWeight(4); 
      line((player.x),200,(player.x),650);
      if (circleLineIntersect((player.x + 15), 200, (player.x + 15), 650, circleX, circleY, circleRadius) == true)
      {
        noStroke();
        fill(255,255,0);
        ellipseMode(RADIUS);
        ellipse(circleX, circleY, circleRadius, circleRadius);
        CircleLife = CircleLife - 1;
      } 
    }
    else 
    {
      fill(255,1,111);
      CircleLife = CircleLife;
    }
  }
  if (CircleLife <= 0)
  {
    fill(#1747FF);
    pushMatrix();
    translate(250,140);
    beginShape();
    vertex(0,0);
    vertex(20,30);
    vertex(60,20);
    vertex(40,60);
    vertex(60,120);
    vertex(20,100);
    vertex(0,140);
    vertex(-20,100);
    vertex(-60,120);
    vertex(-40,60);
    vertex(-60,20);
    vertex(-20,30);
    endShape();
    popMatrix();
    pushMatrix();
    fill(random(255),150,0);
    translate(250,170);
    beginShape();
    vertex(0,0);
    vertex(10,15);
    vertex(30,10);
    vertex(20,30);
    vertex(30,60);
    vertex(10,50);
    vertex(0,70);
    vertex(-10,50);
    vertex(-30,60);
    vertex(-20,30);
    vertex(-30,10);
    vertex(-10,15);
    endShape();
    popMatrix();
     pushMatrix();
    fill(255,0,0);
    translate(250,187);
    beginShape();
    vertex(0,0);
    vertex(5,7.5);
    vertex(15,5);
    vertex(10,15);
    vertex(15,30);
    vertex(5,25);
    vertex(0,35);
    vertex(-5,25);
    vertex(-15,30);
    vertex(-10,15);
    vertex(-15,5);
    vertex(-5,7.5);
    endShape();
    popMatrix();
  }
}
 
boolean circleLineIntersect(float x1, float y1, float x2, float y2, float cx, float cy, float cr ) {
  float dx = x2 - x1;
  float dy = y2 - y1;
  float a = dx * dx + dy * dy;
  float b = 2 * (dx * (x1 - cx) + dy * (y1 - cy));
  float c = cx * cx + cy * cy;
  c += x1 * x1 + y1 * y1;
  c -= 2 * (cx * x1 + cy * y1);
  c -= cr * cr;
  float bb4ac = b * b - 4 * a * c;

  if (bb4ac < 0) {
    return false;
  } 
  else {
    
    float mu = (-b + sqrt( b*b - 4*a*c )) / (2*a);
    float ix1 = x1 + mu*(dx);
    float iy1 = y1 + mu*(dy);
    mu = (-b - sqrt(b*b - 4*a*c )) / (2*a);
    float ix2 = x1 + mu*(dx);
    float iy2 = y1 + mu*(dy);

    float testX;
    float testY;
    if (dist(x1, y1, cx, cy) < dist(x2, y2, cx, cy)) {
      testX = x2;
      testY = y2; 
    } else {
      testX = x1;
      testY = y1; 
    }
    
    if (dist(testX, testY, ix1, iy1) < dist(x1, y1, x2, y2) || dist(testX, testY, ix2, iy2) < dist(x1, y1, x2, y2)) {
      return true;
    } else {
      return false;
    }
  }
}

 
void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
   {
     Left = true;
   }
   if (keyCode == RIGHT)
   {
     Right = true;
   }
  }
}
 
void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
   {
     Left = false;
   }
   if (keyCode == RIGHT)
   {
     Right = false;
   }
  }
}



