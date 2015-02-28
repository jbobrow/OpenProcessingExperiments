
//Homework 8
//Amy Friedman
//amyfried
//Copyright Amy Friedman October 2013 Pittsburgh, PA
//bricklist & array came from processing forum
//first written by kyten917 then editted by Chrisir, adapted by Amy Friedman for code

//CONTROLS
//spacebar resets the game
// p pauses the game
// l loops (unpauses) the game

//for PLAYER ONE
//left arrow moves control bar left
//right arrow moves control bar right
//up arrow increase the width of the control bar
//m decreases x speed of jims face
//b decreases y speed of jims face

//for PLAYER TWO
// f increases the x speed of jims face
// s increases the y speed of jims face 
// e decreases the width of the control bar

float x,y,faceSpeedx, faceSpeedy;//face dimensions
float xcb,ycb,wdcb,htcb; //controlbar
float wdbp;

int wd,ht;
int points;
int lives;

ArrayList brickslist;


void setup()
{
  size(400,400);
  rectMode(CENTER);
  x=200;
  y=350;
  wd=40;
  ht=40;
  faceSpeedx=3;
  faceSpeedy=3;
  
  xcb=200;
  ycb=380;
  wdcb=100;
  htcb=15;
  wdbp=50;
  
  points=0;
  lives=2;
  
  brickslist = new ArrayList();
  // fill the array list
  for (int dx= 1;dx<=8; dx++) 
  {
    for (int dy = 1; dy<=6; dy++) 
    {
      brickslist.add(new Bricks (dx*40+20, dy*30+10, wdbp, 20));
    }
  }
}

void draw()
{
  fill(#E5FFD3);
  rect(width*.5,height*.5,width,height);
  
  patternCollide();
  blockPattern();
  controlbarCollide();
  controlBar(xcb,ycb,wdcb,htcb);
  jimMove();
  jimsFace(x,y,wd,ht);
  showPoints();
  showLives();
}

void blockPattern()
{
  for (int i = brickslist.size()-1; i>=0; i--) 
  {
    Bricks oneSingleBrick = (Bricks) brickslist.get(i);
  noStroke();
  fill(random(100,255),random(100,255),random(50,255));
  rect(oneSingleBrick.xblock, oneSingleBrick.yblock, oneSingleBrick.wdblock, oneSingleBrick.htblock);
  }
}
  
void patternCollide()
{
  for (int i = brickslist.size()-1; i>=0; i--) {
    // get the brick #i
    Bricks oneSingleBrick = (Bricks) brickslist.get(i);
    // check it
    if (oneSingleBrick.collide( x, y, wd, ht ) ) 
    {
      faceSpeedy = -faceSpeedy;
      points=points+200;
      brickslist.remove(i);
    }
    
}}
  
void showLives()
{
  fill(0);
  text("Lives:" + lives, width*.8, height*.05);
}
void showPoints()
{
  fill(0);
  text("Score:" + points, width*.05, height*.05);
}

void controlbarCollide()
{
  float d = dist(x,y,xcb,ycb);
  
   if (d < (wd + wdcb)&& d<(ht*.5 +htcb))
  {
     faceSpeedy = -faceSpeedy;  
  }
}

void keyPressed()
{
  if (key=='f')//x speed increases
  {
    faceSpeedx++;
  }
  else if (key=='m')//x speed decreases
  {
    faceSpeedx--;
  }
  else if (key=='s')//yspeed increases
  {
    faceSpeedy++;
  }
  else if (key=='b')//yspeed decreases
  {
    faceSpeedy--;
  }
  else if (key=='p') //pauses game
  {
    noLoop();
  }
    else if (key=='l')//unpause, loops game
  {
    loop();
  }

  else if (keyCode==UP)//controlbar gets bigger
  {
    wdcb=wdcb+25;
  }
  else if (key=='e')//controlbar gets smaller
 {
   wdcb=wdcb-25;
 }
 else if (keyCode==LEFT)//control bar moves left
 {
   xcb=xcb-50;
 }
 else if (keyCode==RIGHT)//controlbar moves right
 {
   xcb=xcb+50;
 }
 else if (key==' ')//resets the game
 {
   reset();
 }
}

void reset()
{
  loop();
  lives=2;
  points=0;
  x=200;
  y=350;
  xcb=200;
  ycb=380;
  for (int dx= 1;dx<=8; dx++) 
  {
    for (int dy = 1; dy<=8; dy++) 
    {
      brickslist.add(new Bricks (dx*40+20, dy*30+10, wdbp, 20));
    }
  }
}

void controlBar(float xcb,float ycb,float wdcb,float htcb)
{
  fill(0,255,255);
  rect(xcb,ycb,wdcb,htcb);
}

void jimMove()
{
   x = x + faceSpeedx; 
   if ( x > width || x < 0  ) 
   {
     faceSpeedx = -faceSpeedx;  
   }
    y = y + faceSpeedy; 
   if ( y < 0  ) 
   {
     faceSpeedy = -faceSpeedy;  
   } 
   if (y>width && lives>1)
   {
    lives--;
    x=xcb;
    y=ycb;
   }
   else if (y>width && lives==1)
   {
    lives=lives-1;
    points=0;
    fill(100);
    textSize(20);
    text("YOU LOSE!!", width*.25, height*.25); 
    noLoop();
    }
    
  }

void jimsFace(float x, float y, float wd, float ht)
{
noStroke();
fill(#F7D3AC);
ellipse(x, y, wd, ht);

//dimples//
noStroke();
fill(#9B652C);//brown//
ellipse(x-wd*.27, y+ht*.17, wd*.13, ht*.13);
ellipse(x+wd*.27, y+ht*.17, wd*.13, ht*.13);
ellipse( x-wd*.2, y-ht*.12, wd*.17, ht*.13);
ellipse( x+wd*.2, y-ht*.12, wd*.17, ht*.13);
fill(#F7D3AC);//skin//
ellipse(x-wd*.28, y+ht*.16, wd*.13, ht*.13);
ellipse(x+wd*.28, y+ht*.16, wd*.13, ht*.13); 
ellipse( x-wd*.2, y-ht*.13, wd*.2, ht*.13);
ellipse( x+wd*.2, y-ht*.13, wd*.2, ht*.13);

//eyes//
noStroke();
fill(#FFFFFF); //white eye part//
ellipse( x-wd*.15, y-ht*.1, wd*.2, ht*.1);
ellipse(x+wd*.15, y-ht*.1, wd*.2, ht*.1);
noStroke();
fill(#836646); //iris//
ellipse(x-wd*.15, y-ht*.1, wd*.09, ht*.11);
ellipse( x+wd*.2, y-ht*.1, wd*.09, ht*.11);
fill(#030303); //pupil//
ellipse( x-wd*.15, y-ht*.1, wd*.05, ht*.07);
ellipse(x+wd*.2, y-ht*.1, wd*.05, ht*.07);
strokeWeight(8);

//smile//
strokeWeight(7);
stroke(#FF939F);
fill(#FFFFFF);
beginShape();
 curveVertex( x-wd*.2, y+ht*.25);
 curveVertex( x-wd*.2, y+ht*.25);
 curveVertex( x-wd*.2, y+ht*.27);
 curveVertex(x-wd*.13, y+ht*.30);
 curveVertex(       x, y+ht*.33);
 curveVertex(x+wd*.13, y+ht*.30);
 curveVertex( x+wd*.2, y+ht*.27);
 curveVertex( x+wd*.2, y+ht*.25);
 curveVertex( x+wd*.2, y+ht*.25);
endShape();

//mustache//
stroke(200);
fill(200);
beginShape();
 curveVertex( x-wd*.1, y+ht*.1);
 curveVertex( x-wd*.1, y+ht*.1);
 curveVertex(x-wd*.23, y+ht*.3);
 curveVertex(x-wd*.17, y+ht*.27);
 curveVertex( x-wd*.1, y+ht*.23);
 curveVertex(x-wd*.03, y+ht*.27);
 curveVertex(      x,  y+ht*.27);
 curveVertex(x+wd*.03, y+ht*.27);
 curveVertex( x+wd*.1, y+ht*.23);
 curveVertex(x+wd*.17, y+ht*.27);
 curveVertex(x+wd*.23, y+ht*.3);
 curveVertex( x+wd*.1, y+ht*.1);
 curveVertex( x+wd*.1, y+ht*.1);
endShape();

//nose//
strokeWeight(1);
stroke(#9B652C);
fill(#F7D3AC);
beginShape();
  curveVertex(x-wd*.15, y-ht*.2);//reference point
  curveVertex(x-wd*.07, y-ht*.2);
  curveVertex(x-wd*.05, y+ht*.02);
  curveVertex(x-wd*.1, y+ht*.1);
  curveVertex(x-wd*.11, y+ht*.17);
  curveVertex(x-wd*.06, y+ht*.15);
  curveVertex(x-wd*.03, y+ht*.18);
  curveVertex(   x*.98, y+ht*.19);
  curveVertex(       x, y+ht*.2);
  curveVertex(  x*1.02, y+ht*.19);
  curveVertex(x+wd*.03, y+ht*.18);
  curveVertex(x+wd*.06, y+ht*.15);
  curveVertex(x+wd*.11, y+ht*.17);
  curveVertex(x+wd*.13, y+ht*.16);
  curveVertex( x+wd*.1, y+ht*.1); 
  curveVertex(x+wd*.05, y+ht*.02);
  curveVertex(x+wd*.07, y-ht*.2);
  curveVertex(x+wd*.15, y-ht*.2);//reference point
endShape();
arc( x-wd*.09, y+ht*.13, wd-wd*1.24, ht-ht*1.25,    HALF_PI,    PI+HALF_PI, OPEN);
arc(x+wd*.095, y+ht*.13, wd-wd*1.24, ht-ht*1.25, PI+HALF_PI,TWO_PI+HALF_PI, OPEN);

//ears
fill(#F7D3AC);
noStroke();
ellipse(x-wd*.5, y-ht*.07, wd*.2, ht*.2);
ellipse(x+wd*.5, y-ht*.07, wd*.2, ht*.2);

//glasses//
noFill();
stroke(15);
strokeWeight(2);
fill(#E0FBFF, 125);
beginShape(); //left side//
 curveVertex(x-wd*.37, y-ht*.23);//reference point
 curveVertex(x-wd*.37, y-ht*.23);
 curveVertex(x-wd*.33, y-ht*.1);
 curveVertex(x-wd*.27, y-ht*.03);
 curveVertex(x-wd*.13, y-ht*.03);
 curveVertex(x-wd*.07, y-ht*.1);
 curveVertex(x-wd*.03, y-ht*.23);
 curveVertex(x-wd*.03, y-ht*.23);//reference point
endShape();

beginShape();//right side//
 curveVertex(x+wd*.03, y-ht*.23);//reference point
 curveVertex(x+wd*.03, y-ht*.23);
 curveVertex(x+wd*.07, y-ht*.1);
 curveVertex(x+wd*.13, y-ht*.03);
 curveVertex(x+wd*.27, y-ht*.03);
 curveVertex(x+wd*.33, y-ht*.1);
 curveVertex(x+wd*.37, y-ht*.23);
 curveVertex(x+wd*.37, y-ht*.23);//reference point
endShape();
line(x-wd*.5, y-ht*.23, x+wd*.5, y-ht*.23);

}
class Bricks {
  float htblock;
  float wdblock;
  float xblock;
  float yblock;
  Bricks(float tempx, float tempy, float tempwdth, float temphgt) {
    htblock = temphgt;
    wdblock = tempwdth;
    xblock = tempx;
    yblock = tempy;
  }
  
boolean collide (float x, float y, int wd, int ht) {
    
  float d2 = dist(x,y,xblock,yblock);
  
   if (d2 < (wd*.5 + wdblock*.5)&& d2<(ht*.5 +htblock*.5))
   {
      return (true);
    }
    else {
      return (false);
    }
  }
}


