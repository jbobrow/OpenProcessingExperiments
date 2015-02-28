
class ball
{
  PVector pos;
  PVector speed;
  float radius=10;
  color ballcol=color(200,0,0);
  float xMin,xMax;
  float yMin,yMax;
  boolean checked;
  int section;
  float minSpeed=0.1;
  float maxSpeed=2.1;
  
  ball(int s, float x, float y, float sx, float sy, float r){pos = new PVector(x,y);speed = new PVector(sx,sy);radius=r;section=s;}
  void SetWalls(float x1, float y1, float x2, float y2)
  {
    xMin=x1+radius;
    xMax=x2-radius;
    yMin=y1+radius;
    yMax=y2-radius;
  }
  
  void move()
      {
         pos.add(speed);
       // Constrain movement to the area. It would be nicer to do this correctly along the movement direction. 
       // But for simplicity, only the according component is constrained. The error is small, as long speed is small.
         pos.x=constrain(pos.x,xMin,xMax);
         pos.y=constrain(pos.y,yMin,yMax);
       // check boarder. This is simply "flipping" the according speed component
           if (pos.x<=xMin) 
             {
               speed.x=abs(speed.x);
               if (section==1) wallShift-=speed.x;
             }
           if (pos.x>=xMax) 
             {
               speed.x=abs(speed.x)*(-1);
               if (section==0) wallShift-=speed.x;
             }
           if (pos.y<=yMin) speed.y=abs(speed.y);
           if (pos.y>=yMax) speed.y=abs(speed.y)*(-1);
       checked=false;
       
       if (speed.mag()>maxSpeed*2) 
         {
           speed.normalize();
           speed.mult(0.9);
         }
       if (speed.mag()<minSpeed) 
         {
           speed.normalize();
           speed.mult(minSpeed);
         }

      }
  
  void collide(ArrayList Others)
     {
      // check other balls
      checked=true;
      ball B2;
      for (int j=0;j<Others.size();j++)        
        {
          B2 = (ball) Others.get(j);
          if ((this!=B2) && (!B2.checked))        // act only on "free" balls and not on the ball B itself!
            {
              PVector P = PVector.sub(B2.pos,pos);
              float d=P.mag();
              if (d<=(radius+B2.radius))  // Collide
              {
                P.normalize();                          // parallel vector in collision direction
                    // set back both balls along collision direction so that they are just touching again
                    // Use their speed as "weighening" of this shift
                        d -= (radius+B2.radius);
                        float n=speed.mag()+B2.speed.mag();
                        pos.add(PVector.mult(P,d*speed.mag()/(n)));
                        B2.pos.add(PVector.mult(P,-1*d*B2.speed.mag()/(n)));
                    // calculate speed components along and normal to collision direction
                      PVector N = new PVector(P.y,P.x*(-1),0); // normal vector to collision direction
                      float vp1 = speed.dot(P);     // velocity of P1 along collision direction
                      float vn1 = speed.dot(N);     // velocity of P1 normal to collision direction
                      float vp2 = B2.speed.dot(P);     // velocity of P2 along collision direction
                      float vn2 = B2.speed.dot(N);     // velocity of P2 normal to collision direction
                    // calculate collison
                    // fully elastic collision (energy & momentum preserved)
                        float vp1_after = (radius*vp1+B2.radius*(2*vp2-vp1))/(radius+B2.radius);
                        float vp2_after = (radius*(2*vp1-vp2)+B2.radius*vp2)/(radius+B2.radius);
                    // calculate new speed vectors from componentens after collision
                        speed=PVector.add(PVector.mult(P,vp1_after),PVector.mult(N,vn1));
                        B2.speed=PVector.add(PVector.mult(P,vp2_after),PVector.mult(N,vn2));
              }
            }
        }
     }
  void findColor()
  {
    /*
    float s=speed.mag();
    if (s<((minSpeed+maxSpeed)/2)) ballcol= color(0,0,200);
    else ballcol=color(200,0,0);
    */
    float avSpeed=0;
    if (section==0) avSpeed=avSpeedL;
    if (section==1) avSpeed=avSpeedR;
    avSpeed-=minSpeed;
    avSpeed/=maxSpeed;
    if (avSpeed<0.1) ballcol= color(00,90,200);
    else if (avSpeed<0.2) ballcol= color(00,50,200);
    else if (avSpeed<0.3) ballcol= color(0,0,200);
    else if (avSpeed<0.45) ballcol= color(40,0,200);
    else if (avSpeed<0.5) ballcol= color(80,20,80);
    else if (avSpeed<0.55) ballcol= color(200,0,40);
    else if (avSpeed<0.7) ballcol= color(200,0,00);
    else if (avSpeed<0.8) ballcol= color(200,50,0);
    else if (avSpeed<0.9) ballcol= color(200,90,0);
    else if (avSpeed<0.95) ballcol= color(200,100,0);
    else ballcol=color(250,200,0);
  }
  void Draw()
  {
    noStroke();
    fill(ballcol);
    ellipse(pos.x,pos.y,radius*2,radius*2);
  }
}

