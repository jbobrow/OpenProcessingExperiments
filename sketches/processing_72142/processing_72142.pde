
float fishx;
float fishy;
float fishoriginalsize=20;
float fishsize=fishoriginalsize;
int xsize=1350;
int fishspeed=5;
int ysize=735;
Gobler Gobler1;
Gobler Gobler2;
Gobler Gobler3;
Gobler Gobler4;
Gobler Gobler5;
Gobler Gobler6;
Gobler Gobler7;
Gobler Gobler8;
Gobler Gobler9;
Gobler Gobler10;
Gobler Gobler11;
Gobler Gobler12;
Gobler Gobler13;
Gobler Gobler14;
Gobler Gobler15;
int goblermaxspeed=7;
int captured;
float killsize=1300;
int fishdirection;
float killfishx=xsize+killsize/2;
float killfishy=ysize/2;
int killfishspeed=-1;

void setup()
{
  frameRate(60);
  size(xsize,ysize);
  fishx=500;
  fishy=500; 
  Gobler1=new Gobler();
    Gobler1.check();
  Gobler2=new Gobler();
    Gobler2.check();
  Gobler3=new Gobler();
    Gobler3.check();
  Gobler4=new Gobler();
    Gobler4.check();
  Gobler5=new Gobler();
    Gobler5.check();
  Gobler6=new Gobler();
    Gobler6.check();
  Gobler7=new Gobler();
    Gobler7.check();
  Gobler8=new Gobler();
    Gobler8.check();
  Gobler9=new Gobler();
    Gobler9.check();
  Gobler10=new Gobler();
    Gobler10.check();
  Gobler11=new Gobler();
    Gobler11.check();
  Gobler12=new Gobler();
    Gobler12.check();
  Gobler13=new Gobler();
    Gobler13.check();
  Gobler14=new Gobler();
    Gobler14.check();
  Gobler15=new Gobler();
    Gobler15.check();
}

void drawfish()
{
  background(0,0,255);
  fill(0,255,0);
  stroke(0,255,0);
  ellipse(fishx,fishy,fishsize,fishsize*2/5);
  if(fishdirection==1)
  {
    triangle(fishx-fishsize*4/5,fishy+fishsize*3/10,fishx-fishsize*3/5,fishy,fishx,fishy);
    triangle(fishx-fishsize*3/5,fishy,fishx-fishsize*4/5,fishy-fishsize*3/10,fishx,fishy);
    fill(255,100,0);
    ellipse(fishx+fishsize*3/10,fishy-fishsize*2/25,fishsize/7,fishsize*2/15);
    stroke(255,100,0);
    strokeWeight(3);
    line(fishx+fishsize*4/9,fishy+fishsize*2/25,fishx+fishsize/5,fishy+fishsize*1/10);
  }
  else
  {
    triangle(fishx+fishsize*4/5,fishy+fishsize*3/10,fishx+fishsize*3/5,fishy,fishx,fishy);
    triangle(fishx+fishsize*3/5,fishy,fishx+fishsize*4/5,fishy-fishsize*3/10,fishx,fishy);
    fill(255,100,0);
    ellipse(fishx-fishsize*3/10,fishy-fishsize*2/25,fishsize/7,fishsize*2/15);
    stroke(255,100,0);
    strokeWeight(3);
    line(fishx-fishsize*4/9,fishy+fishsize*2/25,fishx-fishsize/5,fishy+fishsize*1/10);
  }
}

class Gobler
{
  float ypos;
  float xpos;
  float goblerspeed;
  float goblersize;
  int goblertailcolor;
  int goblerbodycolor;
  void check()
  {
  goblerbodycolor=int(random(.5,3.5));
  ypos=random(0,ysize);
  xpos= int(random(.5,1.5));
  goblersize=random(1,200);
  if(xpos==0)
  {
    goblerspeed=random(1,goblermaxspeed);
  }
  else
  {
    goblerspeed=random(-goblermaxspeed,-1);
    xpos=xsize;
  }
  }
  void move()
  {
    xpos=xpos+goblerspeed;
    if(goblerbodycolor==0)
    {
      fill(176,23,21);
      stroke(176,23,21);
    }
    if(goblerbodycolor==1)
    {
      fill(255,215,0);
      stroke(255,215,0);
    }
     if(goblerbodycolor==2)
    {
      fill(122,55,139);
      stroke(122,55,139);
    }
    if(goblerbodycolor==3)
    {
      fill(0,6,125);
      stroke(0,6,125);
    }
    ellipse(xpos,ypos,goblersize,goblersize*2/5);
    goblertailcolor=int(random(.5,3.5));
    if(goblertailcolor==0)
    {
      fill(176,23,21);
      stroke(176,23,21);
    }
    if(goblertailcolor==1)
    {
      fill(255,255,255);
      stroke(255,255,255);
    }
     if(goblertailcolor==2)
    {
      fill(0,0,0);
      stroke(255,255,255);
    }
    if(goblertailcolor==3)
    {
      fill(200,100,100);
      stroke(100,100,100);
    }
    if(goblerspeed>0)
    {
      triangle(xpos-goblersize*4/5,ypos+goblersize*3/10,xpos-goblersize*3/5,ypos,xpos,ypos);
      triangle(xpos-goblersize*3/5,ypos,xpos-goblersize*4/5,ypos-goblersize*3/10,xpos,ypos);
      fill(255,100,0);
      ellipse(xpos+goblersize*3/10,ypos-goblersize*2/25,goblersize/7,goblersize*2/15);
      stroke(255,100,0);
      strokeWeight(3);
      line(xpos+goblersize*4/9,ypos+goblersize*2/25,xpos+goblersize/5,ypos+goblersize*1/10);
    }
    else
    {
      triangle(xpos+goblersize*4/5,ypos+goblersize*3/10,xpos+goblersize*3/5,ypos,xpos,ypos);
      triangle(xpos+goblersize*3/5,ypos,xpos+goblersize*4/5,ypos-goblersize*3/10,xpos,ypos);
      fill(255,100,0);
      ellipse(xpos-goblersize*3/10,ypos-goblersize*2/25,goblersize/7,goblersize*2/15);
      stroke(255,100,0);
      strokeWeight(3);
      line(xpos-goblersize*4/9,ypos+goblersize*2/25,xpos-goblersize/5,ypos+goblersize*1/10);
    }
      
    if(xpos<0|xpos>xsize)
    {
       xpos=int(random(.5,1.5));
       ypos=random(0,ysize);
       goblersize=random(1,200);
      if(xpos==0)
      {
        goblerspeed=random(1,goblermaxspeed);
      }
      else
      {
        goblerspeed=random(-goblermaxspeed,-1);
        xpos=xsize;
      }
    }
    if(((abs(xpos-fishx))<((fishsize+goblersize)/2))&&
    ((abs(ypos-fishy))<((fishsize+goblersize)/4)))
    if(fishsize>=goblersize)
    {
      fishsize=fishsize+10;
       xpos=int(random(.5,1.5));
       ypos=random(0,ysize);
       goblersize=random(1,200);
      if(xpos==0)
      {
        goblerspeed=random(1,goblermaxspeed);
      }
      else
      {
        goblerspeed=random(-goblermaxspeed,-1);
        xpos=xsize;
      }
    }
    else
    {
      celebration();
      stroke(255,100,0);
      captured=1;
    }
  }
}
    


void movefish()
{
  if(keyPressed==false)
  {
  }
  else
 {
    if(keyCode==UP)
    {
      if(fishy<0)
     {
     }
     else
     {
       fishy=fishy-fishspeed;
     }
    }
    if(keyCode==DOWN)
    {
      if(fishy>ysize)
     {
     }
     else
     {
       fishy=fishy+fishspeed;
     }
    }
    if(keyCode==RIGHT)
   {
     fishdirection=1;
     if(fishx>xsize)
     {
     }
     else
     {
       fishx=fishx+fishspeed;
     }
   }
   if(keyCode==LEFT)
   {
     fishdirection=0;
     fishx=fishx-fishspeed;
     if(fishx<0)
     {
     }
     else
     {
       fishx=fishx-fishspeed;
     }
   }
 }
}

void celebration()
{
  strokeWeight(10);
      stroke(255,20,147);
        line(250,200,100,200);
        line(100,600,100,200);
        line(250,600,100,600);
        line(250,600,250,400);
        line(250,400,200,400);
        
        line(300,200,450,200);
        line(300,200,300,600);
        line(300,600,450,600);
        line(450,600,450,200);
        
        line(500,200,650,200);
        line(575,200,575,600);
        
        line(800,200,825,150);
        
        line(900,200,1050,200);
        line(900,400,1050,400);
        line(900,600,1050,600);
        line(900,200,900,600);
        
        line(1100,200,1100,600);
        line(1250,200,1250,600);
        line(1175,600,1100,200);
        line(1175,600,1250,200);
}

void kill()
{
   if(fishsize>200)
    {
      if(killfishx<0)
      {
        killfishspeed=1;
      }
      if(killfishx>xsize)
      {
        killfishspeed=-1;
      }
      fill(0,0,0);
      stroke(0,0,0);
      strokeWeight(3);
      if(killfishspeed==-1)
      {
        ellipse(killfishx,killfishy,fishsize+killsize,(fishsize+killsize)*2/5);
        triangle(killfishx+(fishsize+killsize)*4/5,killfishy+(fishsize+killsize)*3/10,killfishx+(fishsize+killsize)*3/5,killfishy,killfishx,killfishy);
        triangle(killfishx+(fishsize+killsize)*3/5,killfishy,killfishx+(fishsize+killsize)*4/5,killfishy-(fishsize+killsize)*3/10,killfishx,killfishy);
        fill(0,0,255);
        stroke(0,0,255);
        ellipse(killfishx-(fishsize+killsize)*3/10,killfishy-(fishsize+killsize)*2/25,(fishsize+killsize)/7,(fishsize+killsize)*2/15);
        line(killfishx-(fishsize+killsize)*4/9,killfishy+(fishsize+killsize)*2/25,killfishx-(fishsize+killsize)/5,killfishy+(fishsize+killsize)*1/10);
      }
      else
      {
        ellipse(killfishx,killfishy,fishsize+killsize,(fishsize+killsize)*2/5);
        triangle(killfishx-(fishsize+killsize)*4/5,killfishy+(fishsize+killsize)*3/10,killfishx-(fishsize+killsize)*3/5,killfishy,killfishx,killfishy);
        triangle(killfishx-(fishsize+killsize)*3/5,killfishy,killfishx-(fishsize+killsize)*4/5,killfishy-(fishsize+killsize)*3/10,killfishx,killfishy);
        fill(0,0,255);
        stroke(0,0,255);
        ellipse(killfishx+(fishsize+killsize)*3/10,killfishy-(fishsize+killsize)*2/25,(fishsize+killsize)/7,(fishsize+killsize)*2/15);
        line(killfishx+(fishsize+killsize)*4/9,killfishy+(fishsize+killsize)*2/25,killfishx+(fishsize+killsize)/5,killfishy+(fishsize+killsize)*1/10);
      }
       killfishx=killfishx+killfishspeed;
      if(abs(killfishx-fishx)<((fishsize+killsize)+fishsize)/2&&abs;(killfishy-fishy)<((fishsize+killsize+fishsize)*1/5))
      {
        celebration();
        captured=1;
      }
    }
  else
  {}
}

void draw()
{
  if(captured==1)
  {
    if(mousePressed==true)
    { 
      captured=0;
      fishx=500;
      fishy=500;
      fishsize=fishoriginalsize;
      Gobler1=new Gobler();
      Gobler1.check();
      Gobler2=new Gobler();
      Gobler2.check();
      Gobler3=new Gobler();
      Gobler3.check();
      Gobler4=new Gobler();
      Gobler4.check();
      Gobler5=new Gobler();
      Gobler5.check();
      Gobler6=new Gobler();
      Gobler6.check();
      Gobler7=new Gobler();
      Gobler7.check();
      Gobler8=new Gobler();
      Gobler8.check();
      Gobler9=new Gobler();
      Gobler9.check();
      Gobler10=new Gobler();
      Gobler10.check();
      Gobler11=new Gobler();
      Gobler11.check();
      Gobler12=new Gobler();
      Gobler12.check();
      Gobler13=new Gobler();
      Gobler13.check();
      Gobler14=new Gobler();
      Gobler14.check();
      Gobler15=new Gobler();
      Gobler15.check();
    }
  }
  else
  {
    movefish();
    drawfish();
    Gobler1.move();
    Gobler2.move();
    Gobler3.move();
    Gobler4.move();
    Gobler5.move();
    Gobler6.move();
    Gobler7.move();
    Gobler8.move();
    Gobler9.move();
    Gobler10.move();
    Gobler11.move();
    Gobler12.move();
    Gobler13.move();
    Gobler14.move();
    Gobler15.move();
    kill();
  }
}
