
float maxsize = 2.95;
float sepratio = 1.03689;

class Ball {
  float lambda = random(-1.5, 1.5);
  float x1 = 0;
  float y1 =0;
  float d1;
  float dst;
  float vy1 = random(2);
  float vx1 = random(2);
  float alp = random(-PI, PI);
  float rot = random(-0.1, 0.1);
  boolean rep = false;
  int count=0;
  int childnum = 0;
  boolean child = false;
  Ball[] ChildBalls  = new Ball[2];
  color col;

  Ball(float xin, float yin, float din)
  {
    x1 = random(-width/2, width/2);
    y1 = random(-height/2, height/2);

    dst = d1 = din;
    alp = random( -PI *2, PI *2);
    child = false;
    col = color((int)random(70, 95),  (int)random(85, 115), (int)random(10) );

  }
  Ball(float xin, float yin, float din, float dir, float irot, float ilambda, int icount, color icol)
  {
    reset( xin, yin, din, dir, irot, ilambda, icount, icol);
    child = true;
  }

  void reset(float xin, float yin, float din, float dir, float irot, float ilambda, int icount, color icol)
  {
    x1 = xin;
    y1 = yin;
    dst = d1 = din ;
    alp = dir;
    rot = irot;
    count = icount;
    vy1 = random(2);
    vx1 = random(2);
    lambda = ilambda;
    child = true;
    col = icol;
  }

  void collide()
  {
  }

  boolean  isStoped()
  {
    if (childnum == 1)
    {
      return(ChildBalls[0].isStoped() && ChildBalls[1].isStoped());
    }
    if (d1 <  maxsize )
    {
      return(true);
    }
    return(false);
  }

  void move()
  {
    if (isStoped())
    {
      if ( child == false)
      {
            x1 = random(-width/2, width/2);
    y1 = random(-height/2, height/2);

        vy1 = random(2);
        vx1 = random(2);
        d1 = random(7, 13);
        alp = random(-PI * 2, PI * 2);
  rot = random(-0.175, 0.175);
          lambda = random(-1.5, 1.5);
        if (random(2) > 1)
          rot *= -1;
        childnum = 0;
        dst = d1;
             col = color((int)random(70, 95),  (int)random(85, 115), (int)random(10) );
      }
      count=0;
      rep = false;
    }
    if (childnum == 1)
    {
      ChildBalls[0].move();
      ChildBalls[1].move();
    }
    else {
      if (d1 >  maxsize)
      {
        x1 += vx1;
        y1 += vy1;
        alp += rot * sin(lambda + count / 50) * 0.5;
        vx1 = cos(alp)*1.2;
        vy1 = sin(alp)*1.2;
        count ++;
        d1 -= 0.01;

        if ((d1 *sepratio)< dst)
        {
          if (rep == false && childnum == 0)
          {
            float shiftin = random(-PI/4, PI/4 );
            ChildBalls[0] =  new Ball(x1, y1, d1/1.15, alp +shiftin, rot, lambda, count, col);
            ChildBalls[1] =  new Ball(x1, y1, d1/1.15, alp -shiftin, rot, lambda, count, col);
            childnum = 1;
          }
          else
            if (childnum != 0 && rep == false)
            {
              float shiftin = random(-PI/4, PI/4 );
              ChildBalls[0].reset(x1, y1, d1/1.15, alp +shiftin, rot, lambda, count, col);
              ChildBalls[1].reset(x1, y1, d1/1.15, alp -shiftin, rot, lambda, count,col);
            }
          rep = true;
        }
      }
      if (d1 <=  maxsize )
      {
        if ( child == false)
        {
             x1 = random(-width/2, width/2);
    y1 = random(-height/2, height/2);

          vy1 = random(2);
          vx1 = random(2);
          d1 = random(7, 13);
          alp = random(-PI * 2, PI * 2);
          rot = random(-0.75, 0.75);
          lambda = random(-1.5, 1.5);
          if (random(2) > 1)
            rot *= -1;
          dst = d1;
        }
        count=0;
        rep = false;
      }
    }
  }

  void display() 
  {
    if (childnum == 1 && !isStoped())
    {
      ChildBalls[0].display();
      ChildBalls[1].display();
    }
    else
      if (!isStoped())
        {
          fill(0, 0, 0,80);
          ellipse(x1+0.5, y1+0.5, d1+2.5, d1+2.5);
          fill(col);
          ellipse(x1, y1, d1, d1);
        }
  }
}


