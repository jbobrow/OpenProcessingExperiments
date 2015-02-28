
//Gloriana Gonzalez
//September 13, 2012

//use arrows to move duck around
//shift to change ball sizes
//spacebar to start over

//CHANGES-->same variable for bsw and bsh

float vbx, deltaX, vby, deltaY, hbx, hby; 
float bx1, deltaX1, by1, deltaY1;
float bs, skyw, skyh, skyx, skyy;
float duckx, ducky, ddeltaX, ddeltaY;
color col1, col2, col3;
PImage p;
PImage sky;
PImage sun;

void setup ()
{
 size (400, 400);
 smooth();
 background(255);
 
col1= color (0);
col2= color(255);
col3=color(random(255), random(255), random(255));

p=loadImage("duck.png");
sky= loadImage("sky.png");
sun= loadImage("sun.png");

skyw=400;
skyh=400;
skyx=0;
skyy=0;
println(p.width);
duckx=p.width*.1;
ducky=height-p.height*.1;
ddeltaX= .5;
ddeltaY= .5;

bs= 20;


hbx=0;
hby=height*.5;
vbx= 0;
deltaX= 2;
vby= height*.3;
deltaY=2;

bx1=0;
deltaX1=2;
by1= height*.7;
deltaY1=2;

}

void draw()
{
 

 skyBack(sky, width/2, height/2, skyw, skyh);

 sunSky (sun, width-sun.width*.125, sun.height*.125, sun.width*.25, sun.height*.25);
 
 ball(col1, vbx+200, vby, bs, bs);
 wrapBallv();
 
 ball(col1, hbx, hby, bs, bs);
 wrapBallh();
 
 ball(col1, bx1, by1, bs, bs);
 bounceBall();
 
 ball(col1, bx1, by1*.25, bs, bs);
 bounceBall();
 
 ball(col1, bx1, by1*.75, bs, bs);
 bounceBall();
 
 changeColor();
 flyingDuck(p, duckx, ducky, p.width*.2, p.height*.2);
 //duckFly();
 
 game();
 
 //saveFrame("hw6.jpg");
 

}




void lose()
{
   textSize (30);
   fill (255, 0, 0);
   text("YOU LOSE!", width*.3, height*.5);
   noLoop();
 }
 
 
  
  
void win()
{
   textSize (30);
   fill (45, 120, 20);
   text("YOU WIN!!!!", width*.3, height*.5);
   noLoop();
}
  
  
  
  
void game()
{
  if ( dist(bx1, by1, duckx, ducky) <  bs  ||  
       dist(bx1, by1*.25, duckx, ducky) <  bs  ||
       dist(bx1, by1*.75, duckx, ducky) <  bs ||
       dist(hbx, hby, duckx, ducky) <  bs  ||
       dist(vbx, vby, duckx, ducky) <  bs)  
  {
    lose();
  }
  if (dist(duckx, ducky, width-sun.width*.125,  sun.height*.125) < sun.width*.125)
  {
    win();
  }
}
  
  


void keyPressed()
{
  if (keyCode==SHIFT)
  {
    bs=random (20,60);

  }
  if (keyCode==UP)
  {
  ducky = ducky-20;
  }
  if (keyCode==RIGHT)
  {
  duckx =duckx+20;
  }
 if (keyCode==DOWN)
  {
  ducky = ducky+20;
  }
  if (keyCode==LEFT)
  {
  duckx =duckx-20;
  }
  if (keyCode==' ')
  {
  loop();
  by1=random(50, 300);
  bx1=0;
  duckx=p.width*.1;
  ducky=height-p.height*.1;
  }

}




void flyingDuck ( PImage duck, float x1, float y1, float wd, float ht)
{
  imageMode(CENTER);
  image (duck, x1, y1, wd, ht);
}




void duckFly()
{
  duckx = duckx + ddeltaX;;
    if(duckx>width)
      {
       duckx=0;
      }
 ducky = ducky - ddeltaY;
    if(ducky> height || ducky < 0)
      {
      ducky=height;
      }
}




void back(color c)
{
 fill(c); 
 rect(0,0, width, height);
}




void ball(color col, float x, float y, float w, float h)
{
  ellipseMode(CENTER);
  noStroke();
  fill(col);
  ellipse (x, y, w, h);
}




void wrapBallh ()
{
  hbx += deltaX;
    if(hbx>width)
      {
      hbx=0;
      }
}

void wrapBallv ()
{
  vby -= deltaY;
    if(vby<0)
      {
        vby=height;
      }
}




void bounceBall()
{
  bx1 += deltaX1;
  by1 += deltaY1;
  
  if(bx1>width-bs || bx1<0)
    {
      deltaX1= -deltaX1;
    }
   if(by1>height-bs || by1 <0)
    {
      deltaY1=-deltaY1;
    }
   
}




void changeColor ()
{
   if(bx1>width-bs || bx1<0)
    {
     col1= color(random(255), random(255), random(255));
    }
   if(by1>height-bs || by1 <0)
    {
     col1= color(random(255), random(255), random(255));
    }
}




void skyBack (PImage l, float x1, float y1, float wd, float ht)
{
  image (l, x1, y1, wd, ht);
}

void sunSky (PImage l, float x1, float y1, float wd, float ht)
{
  image (l, x1, y1, wd, ht);
}


