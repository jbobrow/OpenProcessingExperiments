
//hw8 CMU 48-757 
//copywrite Zack Jacobson-Weaver 2011
float bgx,bgy,ggx,ggy,rectSize,circleSize,deltabgX,deltabgY, deltaggX, deltaggY, distggX,distggY,
collide;
color col;
color txt;
int hits;

void setup()
{
  size (600,600); 
  ggy=height/2;
  ggx=width/2;
  bgx=random (300);
  bgy=random (400);
  deltaggX=0;
  deltaggY=0;
  deltabgX=random(8,30);
  deltabgY=random(8,30);
  col = color(random(256), random (256), random(256));
  circleSize = width/3;
  rectSize = width/5;
  frameRate(60);
  hits = 0;  
  noCursor();
  smooth();
  txt = color(240,240,0);
  
  
}

void draw()
{
  gameBoard();
  
  drawGoodguy(ggx,ggy,50);
  
  moveGoodguy();
  
  collisionGb();
  
  drawBadguy(bgx,bgy,40);
  
  moveBadguy();
  
  saveGoodguy();
  
  stats();
}



void drawGoodguy(float ggx, float ggy, int circleSize)
{
  ellipseMode(CENTER);
  noStroke();
  fill(col,256,random(256),60);
  ellipse(ggx, ggy, circleSize, circleSize);
  noStroke();
  fill(random(256),random(256),random(256));
  ellipse(ggx,ggy,circleSize/2.5, circleSize/2.5);
  
  rectMode(CENTER);
  fill(col,random(128),col);
  rect(ggx+circleSize/2, ggy+circleSize/2, circleSize/4, circleSize/4);
  fill(col,random(128),col);
  rect(ggx-circleSize/2, ggy-circleSize/2, circleSize/4, circleSize/4);
  fill(col,random(128),col);
  rect(ggx+circleSize/2, ggy-circleSize/2, circleSize/4, circleSize/4);
  fill(col,random(128),col);
  rect(ggx-circleSize/2, ggy+circleSize/2, circleSize/4, circleSize/4);
}



void drawBadguy (float bgx, float bgy, float rectSize)
{
  rectMode(CENTER);
  stroke(random (128,255), col, col);
  rect(bgx, bgy, rectSize/2, rectSize/2);
  
  strokeWeight(5);
  strokeCap(SQUARE);
  stroke(random (128,255), col, col);
  line(bgx - rectSize/2, bgy - rectSize/2, bgx + rectSize/2, bgy+rectSize/2);
  line(bgx + rectSize/2, bgy - rectSize/2, bgx - rectSize/2, bgy +rectSize/2);
  line(bgx, bgy - rectSize/2, bgx, bgy +rectSize/2);
  line(bgx + rectSize/2, bgy, bgx - rectSize/2, bgy);
}


void moveGoodguy()
{
  ggx = ggx + deltaggX;
  ggy = ggy + deltaggY;
}


void moveBadguy()
{
  bgx = bgx + deltabgX;
  
    if (bgx > width + rectSize/8)
    {
       deltabgX = - deltabgX;
    }
  
    if (bgx <   - rectSize/8)
    {
       deltabgX = -deltabgX;
    }
  
  bgy = bgy + deltabgY;
  
    if (bgy > height + rectSize/8)
    {
       deltabgY = - deltabgY;
    }
  
    if (bgy <   - rectSize/8)
    {
       deltabgY = -deltabgY;
    }
}


void saveGoodguy()
{
    if (abs (ggy) > height*3 || abs (ggx) > width*3)
    {
      textAlign(CENTER);
      textSize(width/20);
      fill(txt);
      text("Lost it. WAY TO GO!",width/2,height/2);
      text("Hit the Space Bar, dummy.",width/2, height/1.8);
    }
}

void collisionGb()
{
  collide = dist(ggx,ggy,bgx,bgy);
  
    if (collide < 30)
    {
      background(0,0,255);
      textAlign(CENTER);
      fill(txt);
      textSize(width/4);
      text("BANG", ggx, ggy);
      fill(255,0,0);
      textSize(width/3.9);
      text("BANG", ggx, ggy);
      hits = hits + 1;
      bgx = random(122);
      bgy = random(255);
      deltabgX = random(8,30);
      deltabgY = random(8,30);
    }
}

void stats()
{
  
    textAlign(LEFT);
    textSize(width/30);
    fill(txt);
    text("Hits:" + hits, width/20,height/1.2);
    text("Xspeed:" + abs (deltaggX), width/20, height/1.15);
    text("Yspeed:" + abs (deltaggY), width/20, height/1.1);
    text("Time ellapsed:" + millis()/1000,width/20,height/1.05);
    
}

void gameBoard( )
{
  
  fill( 0, 0, 0, 35 );
  background(0);

}



void keyPressed()
{
  if (keyPressed && key == ' ')
  {
    ggx = width/2;
    ggy = height/2;
    deltaggX = 0;
    deltaggY = 0;
  }
  
  if (key == CODED)
  {
  if (keyCode == UP)
  {
    deltaggY = deltaggY - 1;
  } 
  if(keyCode == DOWN)
  {
    deltaggY = deltaggY + 1;
  }
  if(keyCode == RIGHT)
  {
    deltaggX = deltaggX + 1;
  }
  if(keyCode == LEFT)
  {
    deltaggX = deltaggX - 1;
}
  }
}



