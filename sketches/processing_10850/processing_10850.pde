
class MovingPixel
{
   Particle P,Anchor;
   Spring S;
   Spring MouseS;
   ArrayList goals;
   boolean drawit=true;
   PVector pos;
   int   currentGoal    =-1;
   float SpringStrength = 01.131;
   float SpringDamping  = 1.80;
   float RestDistance   = 0;
   float MSpringStrength = 0.08;
   float MSpringDamping  = 0.02;
   float MRestDistance   = random(50);
   
   MovingPixel(float X,float Y)
   {
     P = PS.makeParticle(10,X,Y,0);
     Anchor = PS.makeParticle(5,X,Y,0);
     Anchor.makeFixed();
     S = PS.makeSpring(P,Anchor,SpringStrength,SpringDamping,RestDistance);
     P.velocity().set(0,0,0);
     goals = new ArrayList();
   }
   
   void AttachMouse()  // uses GLOABL particle!
     {
       MouseS = PS.makeSpring(P,MousePos,MSpringStrength,MSpringDamping,MRestDistance);
     }
   void DetachMouse()  // uses GLOABL particle!
     {
       PS.removeSpring(MouseS);
     }
   
   void addGoal(float X,float Y)
     {
       goals.add(new PVector(X,Y));
     }
   PVector lastGoal()
     {
       return (PVector) goals.get(goals.size()-1);
     }
   void DetachGoal()
     {
       PS.removeSpring(S);
     }
   void advanceGoal()
     {
       currentGoal++;
       if (currentGoal==goals.size()) currentGoal=0;
       pos = (PVector) goals.get(currentGoal);
       Anchor = PS.makeParticle(5,pos.x,pos.y,0);
       Anchor.makeFixed();
       PS.removeSpring(S);
       S = PS.makeSpring(P,Anchor,SpringStrength,SpringDamping,RestDistance);
     }
     
   void DrawPixel()
     {
       if (drawit) point(P.position().x(),P.position().y());
     }
}

