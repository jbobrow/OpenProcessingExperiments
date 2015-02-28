
class Ball
{
  PVector pos;
  PVector speed;
  float ballsize;
  color ballcol;
  color followcol;
  color fleecol;
  float searchradius;
  float damping;
  float maxspeed;
  float mass;
  
  Ball(PVector StartPos,float startsize,color startcolor,color startfollowcol,color startfleecol)
    {
      pos = StartPos;
      ballsize = startsize;
      ballcol = startcolor;
      fleecol = startfleecol;
      followcol = startfollowcol;
      speed = new PVector(0,0);
      searchradius = 100;
      damping=0.4;
      maxspeed=3;
      mass=ballsize;
    }
   
  void WarpWall()
   {
     if (pos.x<0) pos.x+=width;
     if (pos.x>=width) pos.x-=width;
     if (pos.y<0) pos.y+=height;
     if (pos.y>=height) pos.y-=height;
   }
  void BounceWall()
  {
     // Constrain movement to the area. It would be nicer to do this correctly along the movement direction. 
     // But for simplicity, only the according component is constrained. The error is small, as long speed is small.
       constrain(pos.x,ballsize,width-ballsize);
       constrain(pos.y,ballsize,height-ballsize);
     // check boarder. This is simply "flipping" the according speed component
         if (pos.x<=ballsize)        speed.x=abs(speed.x);
         if (pos.x>=width-ballsize)  speed.x=abs(speed.x)*(-1);
         if (pos.y<=ballsize)        speed.y=abs(speed.y);
         if (pos.y>=height-ballsize) speed.y=abs(speed.y)*(-1);
  }
  
  void MoveBall()
    {
      if (speed.mag()>maxspeed) 
        {
          speed.normalize();
          speed.mult(maxspeed);
        }
      pos.add(speed);
//      WarpWall();
      BounceWall();
    }
    
  void AdjustBall(PVector Goal, boolean attract, float strength,boolean bDRAW)
    {
      PVector Acc;
      if (bDRAW)
      {
        strokeWeight(1);
        if (attract) stroke(color(0,255,0,100));
        else stroke(color(255,0,0,100));
       // stroke(followcol);
        line(pos.x,pos.y,Goal.x,Goal.y);
      }
      Acc = PVector.sub(Goal,pos);
      Acc.normalize();
      Acc.mult(damping*strength);
      if (!attract) Acc.mult(-1);
      speed.add(Acc);
      
    //  println(" "+Acc.x+" / "+Acc.y);
      return;
    }
   
  PVector FindGravity(ArrayList Others,color checkcol)
    {
      Ball B;
      float count=0;
      PVector G = new PVector(0,0);
      for (int i=0;i<Others.size();i++)
        {
          B = (Ball) Others.get(i);
          if (this.pos.dist(B.pos)<=searchradius)
            {
               if ((checkcol==B.ballcol)||(B==this)||checkcol==color(0))
               {
                count++;
                G.add(B.pos);
                //println("follow ["+checkcol+"] has ["+B.ballcol+"]");
               }

            }
        }
        G.mult(1/count);
        //println("    "+count);
       return G;
    }
    
  void DrawBall()
    {
      stroke(ballcol);
      strokeWeight(ballsize*2);
      point(pos.x,pos.y);
    }
}

