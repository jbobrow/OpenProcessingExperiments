
//press e to enable string
//a and c key to toogle ellipse size at centre
class round
{
PVector ball;
float speed;
int h=50;
int r,g,b;
PVector size;
int a;
round(float x,float y,float speed,int a)
{
ball=new PVector(x,y);
this.speed=speed;
r=int(random(0,255));
g=int(random(0,255));
b=int(random(0,255));
this.a=a;

}
void disp()
  {
if(mousePressed == true)
  {
  // ball.x=mouseX;
  //ball.y=mouseY;
  pg.strokeWeight(15);
  pg.stroke(r,g,b);
  pg.ellipse(ball.x,ball.y,a,a);
  if(key=='c')
  pg.ellipse(ball.x,ball.y,a-60,a-60);
  if(key!='c')
  pg.ellipse(ball.x,ball.y,a-42,a-42);
  pg.textSize(20);
  pg.text("ball number "+n,700,70);
}
  else
  {
  pg.strokeWeight(15);
  pg.stroke(r,g,b);
 // pg.ellipse(ball.x,ball.y,100,100);
 pg.fill(255);
 pg.ellipse(ball.x,ball.y,a,a);
 if(key=='c')
 pg.ellipse(ball.x,ball.y,a-60,a-60);
  if(key!='c')
 pg.ellipse(ball.x,ball.y,a-42,a-42);
 pg.fill(0);
 pg.textSize(20);
  pg.text("ball number "+n,700,70);
speed=speed+0.5;
ball.y = ball.y + speed;
if(ball.x>width)ball.x=width;
else if(ball.x<0)ball.x=0;
if (ball.y > height - h) {
    // set the position to be on the floor
    ball.y = height - h;
    // and make the y speed 90% of what it was,
    // but in the opposite direction
    speed = speed* -0.9;
     
    //switch the direction
    //speedY = speedY;
  }
  else if (ball.y <= 0) {
    // if the ball hits the top,
    // make it bounce off
    speed = -speed;
}
  }
  }
}

//round r0;
round r[];
int n=0;
PGraphics pg;
void setup()
{
  
//r=new round(56,56,2);
r=new round[30];
pg=createGraphics(900,600);
//r0=new round(256,56,4);
size(900,600);
 }
void draw()
{
   pg.beginDraw();
  //pg.background(234,227,159);
  pg.background(255,255,255);
  //r.disp();
  //r0.disp();
  for(int i=0;i<n;i++)
  {
  r[i].disp();
  pg.strokeWeight(2);
  if(key=='e')
  pg.line(r[i].ball.x,r[i].ball.y,mouseX,mouseY);
  pg.fill(0);
 
}
  pg.endDraw();
image(pg,0,0);

}


void mouseClicked()
{
if(n<30)
{
  r[n]=new round(mouseX,mouseY,n,int(random(50,100)));
n++;
}
else
n=0;
}





