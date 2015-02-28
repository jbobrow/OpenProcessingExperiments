



// copyright Yasha Mir
// Oct 26th 2013
// Directions
// Press 'r' or 'l' to move multicolored ball
// Press 'f' to make it go faster & 's' to go slower
// Avoid hitting the crazy white ball &
// reach the bottom bar with least # of collisions
 

//import ddf.minim.*; 
int collision;
int score;
int lastCollisionTime;
//Minim m;
//AudioPlayer s1, s2;
//PFont f1;
 
float x1,y1,sz1,dx1,dy1,col1;
float x2, y2, sz2, dx2, dy2;
float x3, y3, sz3;
 
void setup()
{
  size (600,600);
 
  x1= 50;
  y1= 50;
  sz1= 30;
  dx1= 3;
  dy1= 2;
 
  x2 = 300;
  y2 = 500;
  dx2= 20;
  dy2= random(50);
  sz2= 50;
   
  x3= 0;
  y3= 570;
  sz3=30;
  
//  m=new Minim(this);
//  s1 = m.loadFile("1.wav");
//  s2 = m.loadFile("2.wav");  
//  
//  f1 = loadFont( "f1.vlw" ); 
//  textFont( f1, 25 );
 
  noStroke();
  smooth();
  
  score  = 0;
  collision = 0;
}
 
void draw()
{
  prepScreen();
  fig1();
  movFig1();
  fig2();
  movFig2();
  fig3();
   
  collision();
  
  showTime( );
  showStats( );
  
//  saveFrame ("frames/####.tif");
}

//void stop( )
//{
//   s1.close( );
//   s2.close( );
// 
//   m.stop( );
//   super.stop( ); 
//}

 
void showTime( )
{
   fill( 102,5,240 );
   text( "Time: " + millis( )/1000, width*.05, height*.1 );
}
 
void prepScreen()
{
  background (200); 
}
 
void fig1()
{
  fill (0,random(250),random(250));
  ellipse (x1,y1,sz1,sz1);
}
 
void movFig1()
{
    y1+=dy1;
    if (x1>width)
  {
    x1=0;
  }
    if (y1>height)
  {
    x1+=10;
    y1=0;
  }
}
 
void fig2()
{
  fill (255);
  ellipse (x2,y2,sz2,sz2);
}
 
 
void movFig2()
{
 x2+=dx2;
 y2+=dy2;
 if (x2>width || x2<0)
  {
  dx2=-dx2;
  }
 else if (y2>height||y2<0)
  {
  dy2=-dy2;
  }
}
 
void fig3()
{
 fill(102,5,240);
 rect (x3,y3,width,sz3);
}
 
void keyPressed()
{
 if (key =='r')  x1+=5;
 else if (key=='l') x1-=10;
  
 if (key=='s') y1-=5;
 else if (key=='f') y1+=10;
}
 
void collision()
{
 float d = dist(x1,y1,x2,y2);
 float e = sz1*.5+sz2*.5;
 if(d < e)
  {
//    s2.play();
//    s2.rewind();
    collision++;
    lastCollisionTime = millis();

    fill (102,5,240);
    ellipse (width/2,height/2,width,height);
    x1=random(300);
  }
  else if (y1==y3)
  {
//    s1.play();
//    s1.rewind();
    score++;
    fill (8,245,5);
  
    ellipse (width/2,height/2,width/2,height/2);
    x1=random(600);
  } 
}
 
void showStats( )
{
 fill( 102,5,240 );
 text( "score : " + score, width*.05, height*.85);  
 text( "Collissions : " + collision, width*.05, height*.9);                 
}



