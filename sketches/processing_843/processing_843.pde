
class bullet
{
  boolean active;
  int owner;
  float bulletRadius;
  PVector position;
  PVector velocity;
  
  bullet()
  {
    active = false;
    owner = -1;
    bulletRadius = 20;
    position = new PVector();
    velocity = new PVector();
  }
  
 bullet(PVector pos, PVector moveTarget, float speed, int bulletOwner)
 {
     active = true;
     bulletRadius = 5;
     position = new PVector();
     velocity = new PVector();
     position.x = pos.x;
     position.y = pos.y;
     velocity.x=moveTarget.x;
     velocity.y=moveTarget.y;
     velocity.sub(position);
     velocity.normalize();
     velocity.mult(speed);
     owner = bulletOwner;
 }
 
 void update()
 {
   if(active)
   {
     position.add(velocity);
     if(position.x<0||position.x>width||position.y<0||position.y>height)
     {
       active = false; 
     }
     if(active)
     {
       for(int i = 0; i < numDudes; i++)
      {
         if(dudes[i].active && dudes[i].team != owner)
         {
           if(dudes[i].position.dist(position)<30)
           {
             if(dudes[i].team==0)
             {
              fill(255,0,0);
             }
             else
             {
               fill(0,0,255);
             }
              rect(dudes[i].position.x,dudes[i].position.y,20,20);
              noFill();
              dudes[i].active = false;
           }
         }
        } 
     }
   }
 }
 
 void render()
 {
   if(active)
  {
     stroke(0,0,0);
     strokeWeight(1);
     fill(0,0,0);
     ellipse((int)position.x,(int)position.y,5,5);
     noFill();
  } 
 }
  
  
}

