
// Hyun Woo Jo  
// Copyrighted 2013 Feb Hyun Woo Jo
float dir, t, pv;
float px, py, pSize, pxSpeed, oldpy, vv;
float cx, cxSpeed;
float pow, r, g;
float score, time, scored, dur;

PImage p, c, s;

void setup( )
{
  size( 700, 400 ); 

  p = loadImage( "ball.png");
  imageMode( CENTER );
  c = loadImage ( "cup.png");
  s = loadImage ( "splash.png");
  smooth();

  dir = -1;
  t=0;
  time=20;
  score=0;

  cx = 400;
  cxSpeed = 0.7;

  px = 1000;
  py = 100;
  pSize = 30;
}

void draw( )
{
  prepWindow( );
  power();
  drawCup(cx);
  moveCup();
  drawImage( px, py, pSize);
  moveImage( );
  gameText();
  gameWatch();
}

void moveImage( )
{ 
  fill(255);
  ellipse(50,50,30,30);
  fill(255,202,0);
  ellipse(50,50,20,20);
  px = px + pxSpeed; 
  if (py > height-15)
  {
    dir=1;
    t=0;
  }
  if (px > cx-20 & px<cx+30)//score
  {
    if (py+36<360 & py+40 >360 & vv<0)
    {
      px=900;
      if (time>0)
      {score++;scored=1;}
    }
  }

  if (px < cx-20 & px>cx-40)//rim
  {
    if (py+36<360 & py+40 >360 & vv<0)
    {
      dir=1;
      t=0;
    }
  }
  if (px > cx+30 & px<cx+50)//rim
  {
    if (py+36<360 & py+40 >360 & vv<0)
    {
      dir=1;
      t=0;
    }
  }

  if (dir==-1)
  {
    py = py+t*0.05;
    t=t+1;
    pv = t*0.05;
  }
  if (dir==1)
  {
    py = py-(pv-t*0.05);
    t = t+1;
  }
}

void drawImage( float px, float py, float pSize)
{
  vv= oldpy-py;
  image( p, px, py, pSize, pSize);
  oldpy =py;
}

void drawCup(float bx)
{
  image(c, bx, 360, 65, 80);
  if (scored == 1)
  {
    dur++;
    image(s,bx-3,303,100,50);
    if (dur==15)
    {dur=0; scored=0;}
  }
}

void moveCup()
{
   cx = cx + cxSpeed;
   if ( cx > width-120 ) // too far right?
   {
     cxSpeed = -cxSpeed;  // move left
   }
   else if( cx < 300 )  // too far left
   {
     cxSpeed = -cxSpeed;  // move right
   }
}

void prepWindow( )
{
  fill( 255 );
  rect( 0, 0, width, height );
}

void power()
{
  fill(255);
  rect(40, 300, 100, 20);
  if (mouseX<40)
  {
    pow = 0;
  }
  else if (mouseX>140)
  {
    pow = 100;
  }
  else
  {
    pow = mouseX-40;
  }
  if (pow<50)
  {
    g = 255;
    r = 5.1*pow;
  }
  if (pow>=50)
  {
    g = 255 - 5.1*(pow-50);
    r = 255;
  }
  fill(r, g, 0);
  rect(40, 300, pow, 20);
  fill(80,80,255);
  triangle(pow+40,320,pow+45,328,pow+35,328);
  fill(0);
  textSize(20);
  text("Power", 60, 318);
  textSize(10);
  text("Drag mouse to adjust power",40,340);
  text("and click to shoot",40,350);
}

void mouseClicked() 
{
  px = 50;
  py = 50;
  dir=-1;
  t=0;
  pxSpeed = pow*0.07;
}

void gameText()
{
  fill(0);
  textSize(20);
  text("Time Left:" + int(time), 550, 30);
  text("Score:"  +int(score), 550, 50);
}

void gameWatch()
{
  if (time<0)
  {
    fill(255);
    rect(0,0,700,400);
    fill(0);
    textSize(50);
    text("GAME OVER", 300,200);
    textSize(40);
    text("Score:"+int(score),300,250);
    textSize(20);
    
    fill(255,100,0);
    rect(300,260,130,30);
    fill(0);
    text("Play Again",311,282);
   
    image(c,120,200, 130, 160);
    image(p,180,270, 60, 60);
    if (mouseX>300 & mouseX<430 & mouseY>260 &mouseY<290 &mousePressed)
    {
      score = 0;
      time =20;
      key = 'a';
    }
  }
  time= time -0.01;
  
}


