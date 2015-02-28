
float x=400, y=50, s=0;
boolean falling=true;
color bColor=255, rColor=0;
PImage back;
Ball ball;
Ant[] ant= new Ant[50];
Bird eagle;

void setup()
{
  size(800, 700);
  back=loadImage("hoop2.jpg");
  ball=new Ball(x, y, s);
  for (int i=0;i<50;i++)
  {
    ant[i]=new Ant(random(0, 800), 625, random(.5, 3));
  }
  eagle=new Bird(0,0,20,"eagle3.jpg","eagle2.jpg");
}

void draw()
{
  image(back, 0, 0, 800, 700);
  ball.bounce();
  for (int i=0;i<50;i++)
  {
    ant[i].move();
    if (ball.smashes(ant[i])&&ball.s>0)
    {
      rColor+=5;
      ant[i].dies();
    }
    if(eagle.snatch(ant[i]))
    {
      eagle.s/=1.1;
      ant[i].dies();
    }
  }
  eagle.move();
}

class Creature
{
  float x, y, s;
  Creature(float tempX, float tempY, float tempS)
  {
    x=tempX;
    y=tempY;
    s=tempS;
  }
}

class Ball extends Creature
{
  float deflate=0;
  Ball(float tempX, float tempY, float tempS)
  {
    super(tempX, tempY, tempS);
  }

  void bounce()
  {
    fill(bColor);
    stroke(0);
    strokeWeight(5);
    ellipse(x, y+deflate, 50+deflate, 50-deflate);
    fill(255, 0, 0, rColor);
    stroke(255, 0, 0, rColor);
    ellipse(x, y+deflate, 50+deflate, 50-deflate);
    y+=s;
    if (y<600&&falling)
    {
      s+=5;
    }
    if (y<600&&!falling)
    {
      s+=5;
      if (s>=0)
      {
        falling=true;
      }
    }
    if (y>=600&&falling)
    {
      if (s>10)
      {
        s/=1.1;
        s*=-1;
        deflate++;
        falling=false;
      }
      else
      {
        s=0;
        falling=false;
      }
    }
    if (bColor>2&&!falling)
      bColor-=2;
  }

  boolean smashes(Creature other)
  {
    if (this.x<=other.x&&
      this.x+deflate+20>=other.x&&
      this.y<=other.y&&
      this.y+70>=other.y
      ||
      this.x<=other.x+50&&
      this.x+deflate+20>=other.x+50&&
      this.y<=other.y&&
      this.y+70>=other.y
      ||
      this.x<=other.x&&
      this.x+deflate+20>=other.x&&
      this.y<=other.y+7&&
      this.y+70>=other.y+7
      ||
      this.x<=other.x+20&&
      this.x+deflate+20>=other.x+20&&
      this.y<=other.y+7&&
      this.y+70>=other.y+7)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
}

class Ant extends Creature
{
  boolean right=true;
  Ant(float tempX, float tempY, float tempS)
  {
    super(tempX, tempY, tempS);
  }

  void move()
  {
    x+=s;
    if (x>730||x<0||random(0, 500)>470)
    {
      s*=-1;
    }
    noStroke();
    fill(0);
    ellipse(x, y, 10, 7);
    ellipse(x+10, y, 10, 7);
    ellipse(x+5, y, 10, 5);
    line(x+5, y+4, x-5, y+10);
    line(x+15, y+4, x+5, y+10);
    line(x+10, y+4, x, y+10);
  }

  boolean collide(Ant other)
  {
    if (this.x<=other.x&&
      this.x+20>=other.x&&
      this.y<=other.y&&
      this.y+50>=other.y
      ||
      this.x<=other.x+50&&
      this.x+20>=other.x+50&&
      this.y<=other.y&&
      this.y+50>=other.y
      ||
      this.x<=other.x&&
      this.x+20>=other.x&&
      this.y<=other.y+50&&
      this.y+50>=other.y+50
      ||
      this.x<=other.x+50&&
      this.x+20>=other.x+50&&
      this.y<=other.y+50&&
      this.y+50>=other.y+50)
    {
      return true;
    }
    else
    {
      return false;
    }
  }

  void dies()
  {
    if (random(1, 2)>1)
    {
      x=800;
    }
    else
    {
      x=-70;
    }
  }
}

class Bird extends Creature
{
  PImage img,img2;
  boolean dive=false;
  Bird(float tempX, float tempY, float tempS,String m, String m2)
  {
    super(tempX, tempY, tempS);
    img=loadImage(m);
    img2=loadImage(m2);
  }
  void move()
  {
    x+=s;
    if(x>700||x<0)
    {
      s*=-1;
    }
    if(random(0,500)>490&&y==0)
    {
      dive=true;
    }
    if(dive)
    {
      y+=10;
    }
    if(y>=575)
    {
      dive=false;
    }
    if(!dive&&y>0)
    {
      y-=20;
    }
    if(s>=0)
    image(img,x,y);
    else
    image(img2,x,y);
  }
  
  boolean snatch(Ant other)
  {
    if (this.x<=other.x&&
      this.x+100>=other.x&&
      this.y<=other.y&&
      this.y+100>=other.y
      ||
      this.x<=other.x+50&&
      this.x+100>=other.x+50&&
      this.y<=other.y&&
      this.y+100>=other.y
      ||
      this.x<=other.x&&
      this.x+100>=other.x&&
      this.y<=other.y+7&&
      this.y+100>=other.y+7
      ||
      this.x<=other.x+20&&
      this.x+100>=other.x+20&&
      this.y<=other.y+7&&
      this.y+100>=other.y+7)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
}


