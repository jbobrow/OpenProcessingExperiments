
//Isla Hansen ihansen@andrew.cmu.edu
//copyright 2012
//homework 7 - game

//move the cursor to give direction to the wrapping green player. Try to avoid the red balls. 


//TOOLS:
//Drag (click/hold & move) the mouse to change the colors of "players" / initials.
//Press the ENTER key to increase the speed of your green player.
//Press the BACKSPACE key to decrease the speed of your green player.

 


float x,y,w,h,x2,y2,x3,y3,redSpeedX,redSpeedY,blueSpeedX,blueSpeedY;
color cb, c1, c2, c3, c4, c5, c6, c7,c8,c9,c10,c11,c12,haloA,haloB;
int collisionCount, gameTime, prevTime, score;

void setup()
{

size(400,400);
cb= color(0,0,0);
c1= color(50,255,200);
c2= color(105,255,210);
c3= color(145,255,225);
c4= color(200,255,240);
c5= color(255,255,255);
c6= color(230,255,255);
c7=color(random(255), random(255), random(255));
c8=color(random(255), random(255), random(255));
c9=color(random(255), random(255), random(255));
c10=color(random(255), random(255), random(255));
c11=color(random(255), random(255), random(255));
c12=color(random(255), random(255), random(255));
haloA=color(0,250,100,150);
haloB=color(255,0,0,150);
x=width*.5;
y=height*.5;
x2=x;
y2=y;
x3=x;
y3=y;
redSpeedX=1;
redSpeedY=1;
blueSpeedX=1;
blueSpeedY=1;
w=200;
h=200;
collisionCount=0;
gameTime=0;
score=0;
frameRate(60);




}

void draw()
{
background(cb);
initials (x,y,.15 *w, .15*h, haloA);
initials (x2, y2, .1*w, .1*h, haloB);
initials (x2+w, y2+h, .1*w, .1*h,haloB);
initials (x2+w, y2, .1*w, .1*h,haloB);
initials (x2, y2+h, .1*w, .1*h,haloB);
wrapMousePlayer();
bounceInitials();
collision(); 
showCollisionCount();
showGameTime();
showScore();
}

//Here is the function to draw the "initial" balls.

void initials (float x, float y, float w, float h, color halo)

{
  smooth();

strokeCap(SQUARE);
 
stroke(halo);
strokeWeight(9);
fill(c1);
ellipse(x,y,w,h);

noStroke(); 
fill(c2);
ellipse(x-(.08*w),y-(.08*h),w*.4,h*.4);
 
fill(c3);
ellipse(x-(.1*w),y-(.1*h),w*.3,h*.3);
 
fill(c4);
ellipse(x-(.1*w),y-(.1*h),w*.2,h*.2);
 
fill(c5);
ellipse(x-(.1*w),y-(.1*h),w*.1,h*.1);
 
 
noFill();
stroke(c6);
strokeWeight(3);
 
//top of i
beginShape();
curveVertex(x+(.1*w),y-(.4*h));
curveVertex(x-(.1*w),y-(.4*h));
curveVertex(x-(.3*w),y-(.3*h));
curveVertex(x-(.45*w),y-(.1*h));
curveVertex(x-(.5*w),y+(.1*h));
endShape();
 
//bottom of i
beginShape();
curveVertex(x+(.1*w),y+(.4*h));
curveVertex(x-(.1*w),y+(.4*h));
curveVertex(x-(.3*w),y+(.3*h));
curveVertex(x-(.45*w),y+(.1*h));
curveVertex(x-(.5*w),y-(.1*h));
endShape();
 
//i vertical
beginShape();
curveVertex(x-(.2*w),y-(.4*h));
curveVertex(x-(.3*w),y-(.3*h));
curveVertex(x-(.3*w),y+(.3*h));
curveVertex(x-(.1*w),y+(.4*h));
endShape();
 
//h outside curve
beginShape();
curveVertex(x,y-(.3*h));
curveVertex(x+(.2*w),y-(.38*h));
curveVertex(x+(.36*w),y);
curveVertex(x+(.2*w),y+(.38*h));
curveVertex(x,y+(.3*h));
endShape();
 
//h inside curve
beginShape();
curveVertex(x-(.2*w),y-(.3*h));
curveVertex(x+(.05*w),y-(.40*h));
curveVertex(x+(.18*w),y);
curveVertex(x+(.05*w),y+(.40*h));
curveVertex(x-(.2*w),y+(.3*h));
endShape();
 
//h horizontal curve
beginShape();
curveVertex(x+(.7*w),y-(.2*h));
curveVertex(x+(.36*w),y);
curveVertex(x+(.18*w),y);
curveVertex(x-(.1*w),y-(.2*h));
endShape();



}

// this is a function to wrap
//the movement of one set of initials in both
//horizontal and vertical directions, with influence from the mouse.

void wrapMousePlayer()
{
 if(mouseX > width/2)
  {
    x3=0;
   
    x=x+blueSpeedX;
    if (x>width)
    {
        
    score=0;
    x=x3+blueSpeedX;}
}
  if(mouseY > height/2)
  {
    y3=0;
    
    y=y+blueSpeedY;
    if (y>height)
    {score=0;
    y=y3+blueSpeedY;}
  }
  if(mouseX < width/2)
  {
    x=x-blueSpeedX;
    
    if (x<0)
    { score=0;
      x=width-blueSpeedX;
    }
  }
  if (mouseY < height/2)
  {
    y=y-blueSpeedY;
   
    if(y<0)
    { score=0;
      y=height-blueSpeedY;
    }
  }
  
}

//This is a function to bounce the 4 "red" balls or
//secondary sets of initials either vertically
//or horizontally (in this case, both: diagonally)
void bounceInitials()
{
    x2=x2+redSpeedX;
    if (x2>width || x2<0)
   {
      redSpeedX = -redSpeedX;
   }
   y2=y2+redSpeedY;
    if (y2>height || y2<0)
  {
    redSpeedY=-redSpeedY;
    }
  }
 
 
 
 //this function allows you to personalize the color of your characters,
 // though the moveable / controllable initial ball with remain halo'd
 //in green, and the red bouncing initial balls will remain halo'd
 //in red.
void mouseDragged()
{
      c1=c7*mouseX;
      c2=c8*mouseY;
      c3=c9*mouseX;
      c4=c10*mouseY;
      c5=c11*mouseX;
      c6=c12*mouseY;
     
    }

//this function outlines that the CONTROL key will
//change the size of the balls, the ENTER key will 
//increase the speed of the green ball, the BACKSPACE
//key will decrease the speed of the green ball, the
// TAB key will randomize the location of the red balls,
// and the DELETE key will randomize the speed of
//the red balls. 
   
void keyPressed()
{
  if (key == CODED) {

   if (key == ENTER)
  { //speed up
  blueSpeedX=blueSpeedX+1;
  blueSpeedY=blueSpeedY+1;
  }
  if (key == BACKSPACE)
 { // slow down
 blueSpeedX=blueSpeedX-1;
 blueSpeedY=blueSpeedY-1;
   if (blueSpeedX<=0)
   {blueSpeedX=1;}
   if(blueSpeedY<=0)
   {blueSpeedY=1;}

 } 

}
}

// here is a function to make the collision appear RED
void collision()
{
  //if the distance between any red ball and the green ball is less than the sum of their two radiuses, they've collided
  
  //red ball one
  if ( (dist(x,y,x2,y2)) < ((.1*w)+(.05*w)) )
  {
    cb=color(255,0,0);
    collisionCount=collisionCount+1;
    score -= 1000;
    x2=random(width);
    y2=random(height);
    redSpeedX=random(5);
     redSpeedY=random(5);
  }
  
  //red ball two
  else if ( (dist(x,y,x2+w, y2+h)) < ((.1*w)+(.05*w)) )
  {
   cb=color(255,0,0); 
   collisionCount=collisionCount+1;
   score -= 1000;
   x2=random(width);
    y2=random(height);
    redSpeedX=random(5);
    redSpeedY=random(5);
  }
  
  //red ball three
  else if (  (dist(x,y,x2+w, y2)) < ((.1*w)+(.05*w)) )
  {
    cb=color(255,0,0);
    collisionCount=collisionCount+1;
    score -= 1000;
    x2=random(width);
    y2=random(height);
    redSpeedX=random(5);
    redSpeedY=random(5);
  }

  
  //red ball four
  else if( (dist(x,y,x2, y2+h)) < ((.1*w)+(.05*w)) )
  {
    cb=color(255,0,0);
    collisionCount=collisionCount+1;
    score -= 1000;
    x2=random(width);
    y2=random(height);
    redSpeedX=random(5);
    redSpeedY=random(5);
  }
  
  else
  {
    cb=color(0,0,0);
  }
}

void showCollisionCount()
{
  fill(255,250,250);
  text("collision count   " + collisionCount, width/2,height*.1);
  
}

void showGameTime()
{
  gameTime=millis()/1000;
  text("game time   " + gameTime, width/2, height*.15);
  
  if (gameTime != prevTime) {
    score+=200; 
  }
  prevTime = gameTime;
}

void showScore()
{

 text("score   " + score,width/2,height*.2);
}


     
