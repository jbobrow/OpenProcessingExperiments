
//AKolosky Hw7
//Copyright: Angela Kolosky, Pittsburgh, PA, 2013.

//To play the game...move the antibiotic pill to hit the germ
//Controls:


float x1,y1,dx1,dy1;
float x2,y2,dx2,dy2;
float szPill,szGerm;
int hits;


void setup()
{
  size(400,400);
  dx1=random(1,5);
  dy1=random(1,5);
  
  x2=random(50,100);
  y2=random(50,100);
  dx2=random(5,10);
  dy2=random(5,10);
  
  szPill=45;
  szGerm=45;
}

void draw()
{
  prepScreen();
  
  movePill();
    pill(x1,y1);
  moveGerm();
    germ(x2,y2);
  
  checkCollision();
  showstats();
  endGame();
}

void keyPressed()
{
 if (keyCode == UP)
    {dx2++;
     dy2++;
    }
 if (keyCode == DOWN)
    {dx2--;
     dy2--;
    }
 if (keyCode == RIGHT)
    {dx1++;
     dy1++;
    }
 if (keyCode == LEFT)
    {dx1--;
     dy1--;
    }
}

void endGame()
{
  if (hits > 30)
    {fill(0);
     rect(0,0,width,height);
     fill(255);
     textSize(40);
     text("Germ Squashed!", width*.5,height*.5);
    }
}

void showstats()
{
  fill(0);
  textSize(20);
  text("Hits: " + hits, width*.5, height*.9);
}

void checkCollision()
{
  float d = dist(x1,y1,x2,y2);
  float colDist =szPill/2+szGerm/2;
  if (d<= colDist)
  {
    hits = hits + 1;
    textSize(50);
    textAlign(CENTER);
    fill(0);
    text("PENICILLIN",width*.5,height*.5);
    
    //bouncing off each other
    float temp = dx1;
    dx1=dx2;
    dx2=temp;
    moveGerm();
    movePill();
  }
}

void moveGerm()
{
  y2+=dy2; 
   if (y2>height)
   {
     y2=0;
     x2=random(10,350);
   }
}

void germ(float x2,float y2)
{
  noStroke();
  fill(0,255,99,100);
  ellipse(x2,y2,width*.07,height*.07);
  ellipse(x2-width*.02,y2+height*.04,width*.07,height*.07);
  ellipse(x2+width*.02,y2+height*.04,width*.07,height*.07);
}

void movePill()
{
   x1+= dx1;
     if (x1>width ||x1<0)
       {
         dx1=-dx1;
       }
   y1+= dy1;
     if (y1>height ||y1<0)
       {
         dy1=-dy1;
       }
}

void pill(float x1, float y1)
{
   ellipseMode(CORNER);
   noStroke();
   fill(255,0,0);
   ellipse(x1,y1,width*.07,height*.07);
   fill(0,0,255);
   ellipse(x1,y1+height*.07,width*.07,height*.07);
   fill(255,0,0);
   rect(x1,y1+height*.035,width*.07,height*.035);
   fill(0,0,255);
   rect(x1,y1+height*.07,width*.07,height*.035);
}   

void prepScreen()
{
  fill(255);
  rect(0,0,width,height);
}


