
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/11155*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
ArrayList Balls;
Ball B,B2;
float maxballs=50;
boolean DrawGravityLines=false;
PVector G,G2;
float k=1;
int ballsizeGlobal=3;
int maxcol=8;
boolean bounce=true;
boolean fade=true;
boolean showforce=false;

void setup()
{
  size(800,600,JAVA2D);
  startSetup(); 
}

void startSetup()
{
  Balls = new ArrayList();
  colorMode(HSB,maxcol,1,1);
  for (int j=0;j<maxcol;j++)
    {
    for (int i=0;i<maxballs;i++)
      {
        B = new Ball(new PVector(random(0,width),random(0,height)),ballsizeGlobal,color(j,1,1),color(j+1,1,1),color(0));
        Balls.add(B);
      }
    }
  for (int i=0;i<maxballs;i++)
      {
        B = new Ball(new PVector(random(0,width),random(0,height)),ballsizeGlobal,color(maxcol,1,1),color(0,1,1),color(0));
        Balls.add(B);
      }   
  colorMode(RGB,255,255,255);
}

void draw()
{
   if (fade)
   {
     fill(0,0,0,10);
     noStroke();
     fill(0,0,0,10);
      rect(0,0,width,height);
   }
   else background(0);
   showforce=false;
   if (keyPressed) if (key==' ') showforce=true; 

  PVector M = new PVector(mouseX,mouseY);
  for (int i=0; i<Balls.size();i++)
    {
      B = (Ball) Balls.get(i);
      B.DrawBall();
    }
  for (int i=0; i<Balls.size();i++)
    {
      B = (Ball) Balls.get(i);
      G = B.FindGravity(Balls,B.followcol);
     B.AdjustBall(G,true,1,showforce); // seek here
      
     G2 = B.FindGravity(Balls,B.fleecol);
      B.AdjustBall(G2,false,0.7,showforce);
      if (mousePressed) 
        {
          if (mouseButton==LEFT) B.AdjustBall(M,true,5,false);
          if (mouseButton==RIGHT) B.AdjustBall(M,false,15,false);
        }
      if (DrawGravityLines) 
        {
          stroke(color(255,0,0));
          strokeWeight(1);
          line(G.x,G.y,B.pos.x,B.pos.y);
        }
    }
  if (bounce) for (int i=0; i<Balls.size();i++)
    {
      B = (Ball) Balls.get(i);    
  
    // check other balls
      for (int j=i;j<Balls.size();j++)        // Check all balls which have not yet been checked (thus start with "i" rather than 0!)
        {
          B2 = (Ball) Balls.get(j);
          if (B!=B2)        // act not on the ball B itself!
            {
              PVector P = PVector.sub(B2.pos,B.pos);
              float d=P.mag();
              if (d<=(B.ballsize+B2.ballsize)) 
              {
                    P.normalize();                          // parallel vector in collision direction
                    // set back both balls along collision direction so that they are just touching again
                    // Use their speed as "weighening" of this shift
                        d -= (B.ballsize+B2.ballsize);
                        float n=B.speed.mag()+B2.speed.mag();
                        B.pos.add(PVector.mult(P,d*B.speed.mag()/(n)));
                        B2.pos.add(PVector.mult(P,-1*d*B2.speed.mag()/(n)));
                    // calculate speed components along and normal to collision direction
                      PVector N = new PVector(P.y,P.x*(-1),0); // normal vector to collision direction
                      float vp1 = B.speed.dot(P);     // velocity of P1 along collision direction
                      float vn1 = B.speed.dot(N);     // velocity of P1 normal to collision direction
                      float vp2 = B2.speed.dot(P);     // velocity of P2 along collision direction
                      float vn2 = B2.speed.dot(N);     // velocity of P2 normal to collision direction
                    // calculate collison
                        float vp1_after=0;
                        float vp2_after=0;
                        vp1_after = (B.mass*vp1+B2.mass*(2*vp2-vp1))/(B.mass+B2.mass)*1;
                        vp2_after = (B.mass*(2*vp1-vp2)+B2.mass*vp2)/(B.mass+B2.mass)*1;
                        B.speed=PVector.add(PVector.mult(P,vp1_after),PVector.mult(N,vn1));
                        B2.speed=PVector.add(PVector.mult(P,vp2_after),PVector.mult(N,vn2));
              }
            }
        }
  
  
  
    }
  for (int i=0; i<Balls.size();i++)
    {
      B = (Ball) Balls.get(i);    
      B.MoveBall();
    }
}

void keyReleased()
  {
    if (key=='f') fade=!fade;
    if (key=='b') bounce=!bounce;
  }

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


