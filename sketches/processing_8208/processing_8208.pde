
class Bullet
{
   Particle P;
   color BulletCol;
   int BulletSize;
   int NrBulletHandle;
   float bounceFactor=0.9;
   boolean dragged;
   boolean colorHandle;
   ArrayList SpringList;
   
   Bullet(float X,float Y,float vX, float vY)
   {
     P = PS.makeParticle(5,X,Y,0);
     P.velocity().set(vX,vY,0);
     BulletCol = color(random(255),random(255),random(255));
     BulletSize=10;
     dragged=false;
     SpringList = new ArrayList();
     colorHandle=false;
     NrBulletHandle=5;
   }
   


//   Particle GetP(){return P;}
   void SetColor(color in){BulletCol=in;}
   color GetColor(){return BulletCol;}
   boolean GetColorHandle(){return colorHandle;}
   void SetColorHandle(boolean in){colorHandle=in;}
   void KillBullet()
   {
     RemoveSprings();
     PS.removeParticle(P);
   }

  void DrawAttachments()
     {
      if (!dragged) 
        {
        if (!colorHandle) stroke(100,100,100);
        else stroke(BulletCol);
        strokeWeight(1);
  
        for (int i=0;i<SpringList.size();i++)
          {
          S = (Spring) SpringList.get(i);
          line(S.getOneEnd().position().x(),S.getOneEnd().position().y(),S.getTheOtherEnd().position().x(),S.getTheOtherEnd().position().y());
          }
        }
     }
 void CheckBoarder()
    {
     if (P.position().x()<0) 
       {
         P.position().set(0,P.position().y(),0);
         P.velocity().set(abs(P.velocity().x())*bounceFactor,P.velocity().y(),0);
       }
     if (P.position().x()>=width) 
       {
         P.position().set(width-1,P.position().y(),0);
         P.velocity().set((-1)*abs(P.velocity().x())*bounceFactor,P.velocity().y(),0);
       }
     if (P.position().y()>=height) 
         {
           P.position().set(P.position().x(),height-1,0);
           P.velocity().set(P.velocity().x(),(-1)*abs(P.velocity().y())*bounceFactor,0);
         }
     if (P.position().y()<0) 
         {
           P.position().set(P.position().x(),0,0);
           P.velocity().set(P.velocity().x(),abs(P.velocity().y())*bounceFactor,0);
         }
    }
 
 void RemoveSprings()
   {
   for (int i=0; i<SpringList.size(); i++) 
      {
      S = (Spring) SpringList.get(i);
      PS.removeSpring(S);
      }
   SpringList = new ArrayList();
   }
   
 void AddClosestSprings(int maxSpring)
  {
  ArrayList Plist;
  Handle Ptest,BestH=new Handle(P);
  boolean  skipParticle;
  float minDist=width*10;
  float cDist;
  int minSH=-1;
  Plist = new ArrayList();
  for (int j=0; j<maxSpring; j++)      // loop to number of attractors
    {
    minDist=width*height;
     for (int i=0;i<HandleList.size();i++)  // test all handles
      {
        H = (Handle) HandleList.get(i);
        skipParticle=false;
        for (int k=0;k<Plist.size();k++)
          {
          Ptest = (Handle) Plist.get(k);
          if (Ptest==H) skipParticle=true;
          }
        if (!skipParticle)
          {      
          cDist = dist(H.GetPos().x,H.GetPos().y,P.position().x(),P.position().y());
          if (cDist<minDist)
                {
                  minDist=cDist;
                  BestH=H;
                }
          }
        }
      if (minDist<=BestH.GrabbingDistance) 
        {
          S = PS.makeSpring(P,BestH.P,BestH.SpringStrength,BestH.SpringDamping,BestH.RestDistance);
          SpringList.add(S);
          Plist.add(BestH);
        }
      }
    }

 void UpdateBullet()
  {
  // Check boarder conditions
  CheckBoarder();
  // check closest NrBulletHandle spring handles.
  RemoveSprings();
  AddClosestSprings(NrBulletHandle);
  }
}


