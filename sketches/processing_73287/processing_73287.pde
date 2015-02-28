
int BallOn;
float Vx;
float Vy;
float Px;
float Py;
float Mu;
float G;
int BallX;
int BallY;
float St;
int Counter;
Float Squ;
int fillGButton;
boolean Button;

void setup (){
size (600, 600);
St=2;
smooth();
Squ=.5;
fill (150);
G=1;
fillGButton=150;
Mu=.8;
BallX=20;
BallY=20;
Button=false;
Counter=0;
}

void draw ()
{
background (255);
stroke (0);
fill (255);
Counter++;
for (int x=-20;x<600;x=x+20)
{
 for (int y=-20;y<600;y=y+20)
  {
  if (mouseX>x &&mouseX;<x+20 &&mouseY;>y&&mouseY;<y+20)
    {
    fill(100);
    }
  rect (x, y, 20,20);
  fill(30);
  }
}
  

  Button=false;
  if (mouseX>150 && mouseX<230 && mouseY>20 &&mouseY;<50||mouseX>260 && mouseX<340 && mouseY>20 &&mouseY;<50 && mousePressed || mouseX>20 && mouseX<100 && mouseY>20 &&mouseY;<50)
  {
    Button=true;
  }  
  if (mousePressed && Button==false)
    {
    //creates ball;
    BallOn=1;
    Px=mouseX;
    Py=mouseY;
    Vx=mouseX-pmouseX;
    Vy=mouseY-pmouseY;
    }
  if(BallOn==1)
  {
   //ball movement 
   fill(Py/5,100,100);
   Vy=Vy+G;//applies gravity
   Px=Px+Vx;
   Py=Py+Vy;
   ellipse (Px,Py,BallX,BallY);
     if(Px>width-(BallX/2))
     {
       Px=width-BallX/2;
       Vx=Vx*Mu*-1;
     }
     if(Px<0+(BallX/2))
     {
       Px=BallX/2;
       Vx=Vx*Mu*-1;
     }
     if(Py>height-(BallY/2))
     {
       Py=height-BallY/2;
       Vy=Vy*Mu*-1;
     }
     if(Py<0+(BallY/2))
     {
       Py=BallY/2;
       Vy=Vy*Mu*-1;
     }
     if (Py<BallY)
     {
       //ground friction
       Vx=Vx*Mu*.5;
     }
     if (sq(Px-mouseX)+sq(Py-mouseY)<=sq(.5*BallX)&&Counter;>30)
     {
       //mouseBounce
     Vx=(Vx*-1)+.5*(mouseX-pmouseX);
     Vy=(Vy*-1)+.5*(mouseY-pmouseY);
     Counter=0;
     }
     //squash and stretch beginning
     //if(BallX<20){
     //  BallX++;
     //}
     //if (BallY<20){
     //  BallY++;
     //}
     //if (BallX>20){
     //  BallX--;
     //}
     //if (BallY>20){
     //  BallY--;
     //}
  }
fill(fillGButton);
rect (20,20,80,30);
fill(0);
text ("Gravity", 30, 40);


fill(150);
rect (150,20,80,30);
fill(0);
text ("Ball+", 160, 40);
if (mouseX>150 && mouseX<230 && mouseY>20 &&mouseY;<50 && mousePressed)
{ 
   //BallIncrease
   BallX++;
   BallY++;
}
fill(150);  
rect (250,20,80,30);
fill(0);
text ("Ball-", 260, 40);
if (mouseX>260 && mouseX<340 && mouseY>20 &&mouseY;<50 && mousePressed)
  { 
   //BallDecrease
  BallX--;
  BallY--;
  }
}


void mouseReleased(){
if (mouseX>20 && mouseX<100 && mouseY>20 &&mouseY;<50)
 { 
   //toggle gravity
   fill(100);
   if (G==1.0)
   {
     fillGButton=100;
     G=0;  
   }
   else
   {
    fillGButton=150;
    G=1;
   }
 }

}
