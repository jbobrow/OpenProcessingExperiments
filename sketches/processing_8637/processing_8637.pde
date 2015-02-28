
class CollisionObject
{
  PVector pos;
  boolean moveable=false;
  boolean jumping=false;
  boolean sticky=false;
  ArrayList MovePath;
  PVector OldMovePos;
  int MoveStep=0;
  int MoveWait=300;
  int MoveCount;
  color col;
  float reflexstrength;
  boolean deadly;          // deadly object must not be touched!
  boolean goal;            // touching this field wins the level
  CollisionObject(float inX, float inY, color inCol)  
    {    
      goal=false; deadly=false; col=inCol;   pos = new PVector(inX,inY);  reflexstrength=1;
      MovePath= new ArrayList();MoveStep=0;MoveCount=MoveWait;
      OldMovePos = pos;
  }
  void Draw() {}
  boolean Collide(JumpMan J){return false;}
  void SetReflexStrength(float in){reflexstrength=in;}
  void SetDeadly(boolean in){deadly=in;}
  void SetGoal(boolean in){goal=in;}
  void UpdateMove()
     {
       PVector NewPos = ( PVector ) MovePath.get(MoveStep);
       float inter=float(MoveCount)/float(MoveWait);
       
       MoveCount++;
       if (MoveCount>MoveWait) 
         {
         MoveStep++;
         OldMovePos = NewPos;
         if (MoveStep>=MovePath.size()) MoveStep=0;     
         MoveCount=0;
         }
       if (!jumping) pos = new PVector(lerp(OldMovePos.x,NewPos.x,inter),lerp(OldMovePos.y,NewPos.y,inter));
       else          pos = NewPos;
     }
}

class CollisionBox extends CollisionObject
{
   float w,h;
   CollisionBox(float inX, float inY, float inX2,float inY2, color inCol) {
     super((inX2+inX)/2,(inY2+inY)/2,inCol);
     w=abs(inX2-inX); 
     h=abs(inY2-inY);
     }

    void Draw()
      {
      noStroke();

      fill(col);
      rectMode(CENTER);
      rect(pos.x,pos.y,w,h);
      
      }
    boolean Collide(JumpMan J)
      {
      PVector Jpos= J.GetPos();
      // first deal with the easy cases of a direct hit; Check the JM is straight above or below
      if ((Jpos.x>=pos.x-w/2)&&(Jpos.x<=pos.x+w/2)&&(abs(Jpos.y-pos.y)<=J.headsize+h/2))    // horizontally centered! & collission
        {
        // make velocity pointing AWAY from surface
        if (Jpos.y<=pos.y)  
            {
              J.P.velocity().set(J.P.velocity().x(),abs(J.P.velocity().y())*(-reflexstrength),J.P.velocity().z());
              // prevent "sinking in"
              J.P.position().set(J.P.position().x(),pos.y-(J.headsize+h/2),0);
              if (sticky) 
                  {
                    J.P.velocity().set(0,0,0);
                    J.P.position().set(pos.x,pos.y-(J.headsize+h/2),0);
                  }
            }
        else        
            {
            J.P.velocity().set(J.P.velocity().x(),abs(J.P.velocity().y())*(reflexstrength),J.P.velocity().z());
              // prevent "sinking in"
            J.P.position().set(J.P.position().x(),pos.y+(J.headsize+h/2),0);
            }
        return true;
        }
      else if ((Jpos.y>=pos.y-h/2)&&(Jpos.y<=pos.y+h/2)&&(abs(Jpos.x-pos.x)<=J.headsize+w/2))    // vertically centered! & collission
        {
        // make velocity pointing AWAY from surface
        if (Jpos.x<=pos.x)  J.P.velocity().set(abs(J.P.velocity().x())*(-reflexstrength),J.P.velocity().y(),J.P.velocity().z());
        else                J.P.velocity().set(abs(J.P.velocity().x())*(reflexstrength),J.P.velocity().y(),J.P.velocity().z());
        if (sticky) J.P.velocity().set(0,0,0);
        return true;
        }
       else // now deal with the 4 corners. First find the "closest" and then check collision against it
       {
         PVector[] CC = new PVector[4]; 
         CC[0] = new PVector(pos.x-w/2,pos.y-h/2);
         CC[1] = new PVector(pos.x+w/2,pos.y-h/2);
         CC[2] = new PVector(pos.x-w/2,pos.y+h/2);
         CC[3] = new PVector(pos.x+w/2,pos.y+h/2);
         for (int i=0; i<4;i++)
           {
           if (PVector.sub(Jpos,CC[i]).mag()<=J.headsize)  // collide from this corner
             {
               PVector Jvel = J.GetVel();
               PVector Dist = PVector.sub(CC[i],Jpos);  // get unit-vector from center of JumpMan to corner
               Dist.normalize();
               PVector Jvelp = PVector.mult(Dist,Jvel.dot(Dist));  // projection of vector along connection
               PVector Jveln = PVector.sub(Jvel,Jvelp);            // projection of vector normal to connection
               Jvelp.mult(-reflexstrength);
               Jvel = PVector.add(Jveln,Jvelp);
               J.P.velocity().set(Jvel.x,Jvel.y,J.P.velocity().z());
               if (sticky) J.P.velocity().set(0,0,0);
               return true;
             }
           } 
        
       }
      return false;
      }
}

