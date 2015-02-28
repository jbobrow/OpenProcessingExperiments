
//HW6
//Richard May_rwmay@andrew.cmu.edu
// Copyright Pittsburgh, September 2012

/* Controls:
up increases y speed, down decreases y speed
right increases x speed, left decreases x speed
w increses square size, s decreases square size
space bar rests and stops movement
holding x spawns random buddy 
use slow movements to see circle compress when it hits the two verticle boundaries
*/

float deltax,Xpos,Ypos,Xspeed,Yspeed,varX,varY,dX,dX2,dY;
float Xpos2,Ypos2,Xspeed2,Yspeed2,wd,ht;
void setup ()
{
  
  size (800,400);
  Xspeed = random(1,5);
  Yspeed = random (1,5);
  Xpos = 50;
  Ypos =  50;
  varX = 60;
  varY = 60;
  
  Xpos2= 40;
  Ypos2= 40;
  ht= 40;
  wd= 40;
  Xspeed2 = random (1,5);
  Yspeed2 = .5*Xspeed2;
}
void draw () {
 dX = dist (Xpos,Ypos,width,Ypos);
 dX2 = dist (Xpos,Ypos,0,Ypos);
  windPrep();
  design();
  design2();
  designMoveX();
  designMoveY();
  wrappedMove();
if (Xpos<.5*width)
 {  designPhysicsLeft();
 }
if (Xpos>.5*width)
 {  designPhysicsRight();
 }
 
 }



//rotate test
//float x = 200 * sin (radians(60) );
//float y = 200 * cos (radians(60));
//pintln(sin(radians(frameCount))*100);//___x
//pintln(cos(radians(frameCount))*100);//___y
//  point (x,y);

void keyPressed() //changes direction and speed
{
  if (keyCode == UP)
  {
    Yspeed--;
    Yspeed2--;
  }
  if (keyCode == DOWN)
  {
    Yspeed++;
    Yspeed2++;
  }
  
  if (keyCode == RIGHT)
  {
    Xspeed++;
    Xspeed2++;
  }
  if (keyCode == LEFT)
  {
    Xspeed--;
    Xspeed2--;
  }
  if (key == ' ') {
    Xspeed = 0;
    Yspeed = 0;
    Xspeed2 = 0;
    Yspeed2 = 0;
    Xpos =50;
    Ypos =50;
    Xpos2 =40;
    Ypos2 =40; 
    ht = 40;
    wd = 40;
    }
    if (key == 'w')
    {
      wd++;
      ht++;
    }
    if (key == 's')
    {
      wd--;
      ht--;
    }
    if (key == 'x')
    {
      fill (random (0,255),random (0,255),random (0,255),random (0,220));
      ellipse (Xpos-30,Ypos-60 ,varX+random(0,30),varY+random(0,40));
    }
}







void wrappedMove()
{
 if (Xpos2> 0-80)
 {
   Xpos2=Xpos2 + Xspeed2;
  }
  if (Xpos2 > width+20)
{
  Xpos2 = 0 -30;
  Ypos2 = 0-30;
}
if (Ypos2 > 0-50)
{
 Ypos2 = Ypos2 + Yspeed2;
 
}
}
void designPhysicsLeft() {
   
  //left hits
 if (dX == width - varX/2)
  {
     varX =50;
     varY = 70;
  }

 if (varX == 50 && dX < (width*.97) - varX/2)
  //ball condenses when hits wall
 {
    varX = 60;
    varY = 60; 
 } 
}



void designPhysicsRight(){
  
  //right hits
 if (dX2 == width - varX/2)
  {
     varX =50;
     varY = 70;
  }
  if (varX == 50 && dX2 < (width*.9) - varX/2)
  //ball condenses when hits wall
 {
    varX = 60;
    varY = 60; 
 } 
 
}



void designMoveX() {
if (Xpos > 0 + varX);
 {
   Xpos = Xpos + Xspeed;
 }
if (Xpos > width - varX/2)
{
  Xspeed = -Xspeed;
  //Xpos = -Xpos;
}
if (Xpos < 0 + varX/2)
{
  Xspeed = -Xspeed;
}
//buddy
stroke(222,255,255);
point(Xpos+(2*PI*(.5*varX)),Ypos+ (2*PI*(.5*varY)));

}



void designMoveY(){
  if (Ypos > 0 + varY);
  {Ypos=Ypos + Yspeed;
  }
  if (Ypos>height - varX/2)
  {
    Yspeed = -Yspeed;
  }
  if (Ypos < 0 + varY/2)
  {
    Yspeed = -Yspeed;
  }
}
 
 void design2()
 {
   fill (random ( 0,255), 240, 230);
   rect (Xpos2,Ypos2,wd,ht);
 }

void design ()
{
  strokeWeight(2);
  fill (255,255,255,40);
  ellipse (Xpos,Ypos,varX,varY);
  stroke(255,random (0,255), random (0,255));
  line (Xpos,Ypos,Xpos+(.5*varX),Ypos+(.5*varY));
  strokeWeight(.5);
  line (Xpos+(.5*varX),Ypos+(.5*varY),width,height);
  line (Xpos+(.5*varX),Ypos+(.5*varY),width,0);
  
}
void windPrep ()
{
  smooth ();
  fill (0, 20);
  rect (0,0,width, height);
}


