
class ball        
  {
    PVector pos;
    PVector speed;      // speed of ball as used;
    boolean checked=false;  // flag to prevent checking ball collisions double
    float mass;            // radius of Point
    color ballCol;
    int SectorCount;
    float charge;
    float maxCharge=100;
  
    ball(float x, float y, float M){mass=M;speed=new PVector(random(-2,2),random(-2,2));pos=new PVector(x,y);charge=0;}
   
    void move()
      {
        checked=false;  // reset for collision testing
       // move ball. 
         pos.add(speed);
       // Constrain movement to the area. It would be nicer to do this correctly along the movement direction. 
       // But for simplicity, only the according component is constrained. The error is small, as long speed is small.
         pos.x=constrain(pos.x,mass,width-mass);
         pos.y=constrain(pos.y,mass,height-mass-20);
       // check boarder. This is simply "flipping" the according speed component
       // Also check "believing" borders)
           if (pos.x<=mass+2)       
              {
                speed.x=abs(speed.x);
                charge-=1;
              }
           if (pos.x>=width-mass-2)  
               {
                 speed.x=abs(speed.x)*(-1);
                 charge+=1;  
               }
           if (pos.y<=mass)        speed.y=abs(speed.y)*0.9;
           if (pos.y>=height-mass-20) speed.y=abs(speed.y)*(-0.9);
      }
      
     void AddToSector()
      {
        int t,l,b,r;  // 4 corners of ball
         l = floor((pos.x-mass)*SecNum/width);
         t = floor((pos.y-mass)*SecNum/height);
         r = floor((pos.x+mass)*SecNum/width);
         b = floor((pos.y+mass)*SecNum/height);
         l = constrain(l,0,SecNum-1);
         r = constrain(r,0,SecNum-1);
         t = constrain(t,0,SecNum-1);
         b = constrain(b,0,SecNum-1);

         Sector = (ArrayList) Sectors.get(l+t*SecNum);
         Sector.add(this);
         //SectorCount=1;
         // Now check if in more than one sector!
        if (l!=r) // there is at leat another sector involved
          {
           Sector = (ArrayList) Sectors.get(r+t*SecNum);
           Sector.add(this);
           //SectorCount++;
           if (t!=b)
             {
             Sector = (ArrayList) Sectors.get(r+b*SecNum);
             Sector.add(this);
             //SectorCount++;
             }             
          }
        if (t!=b)
             {
             Sector = (ArrayList) Sectors.get(l+b*SecNum);
             Sector.add(this);
             //SectorCount++;
             }
      } 
      
     void collide(ArrayList Others)
     {
      // check other balls
      checked=true;
      ball B2;
      for (int j=0;j<Others.size();j++)        // Check all balls which have not yet been checked (thus start with "i" rather than 0!)
        {
          B2 = (ball) Others.get(j);
          if ((this!=B2) && (!B2.checked))        // act only on "free" balls and not on the ball B itself!
            {
              PVector P = PVector.sub(B2.pos,pos);
              float d=P.mag();
              if (d<=(mass+B2.mass))  // Collide
              {
                this.Transfer(B2);              
                // Do the movement-collision
                P.normalize();                          // parallel vector in collision direction
                    // set back both balls along collision direction so that they are just touching again
                    // Use their speed as "weighening" of this shift
                        d -= (mass+B2.mass);
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
                        float vp1_after = (mass*vp1+B2.mass*(2*vp2-vp1))/(mass+B2.mass);
                        float vp2_after = (mass*(2*vp1-vp2)+B2.mass*vp2)/(mass+B2.mass);
                    // calculate new speed vectors from componentens after collision
                        speed=PVector.add(PVector.mult(P,vp1_after),PVector.mult(N,vn1));
                        B2.speed=PVector.add(PVector.mult(P,vp2_after),PVector.mult(N,vn2));
              }
            }
        }
     }
     void Transfer(ball B2)
       {
         float SIGNthis  = round(this.charge/abs(this.charge));
         float SIGNother = round(B2.charge/abs(B2.charge));     
         if (SIGNthis==SIGNother)
           {
             this.charge += SIGNthis;
             B2.charge+=SIGNother;
           }
         else
           {
             if (abs(this.charge)==abs(B2.charge))      // equal strength. 
               {
                 this.charge=0;
                 B2.charge=0;
               }
             else if (abs(this.charge)>abs(B2.charge))
               {
                 this.charge-=SIGNthis;
                 B2.charge+=SIGNthis*10;
               }
             else
               {
                 this.charge+=SIGNother*10;
                 B2.charge-=SIGNother;
               }
           }
          B2.charge=constrain(B2.charge,-maxCharge,maxCharge);
          this.charge=constrain(this.charge,-maxCharge,maxCharge);
       }
       
       
     void Draw()
     {
      if (charge<0)  
          {
           if (charge<-maxCharge)  ballCol=color(255,150,0);
           else if (charge<-50)  ballCol=color(200,0,0);
           else ballCol=color(200,150,150);
          }
      
      else if (charge>0)  
          {
           if (charge>maxCharge)  ballCol=color(0,150,255);
           else if (charge>50)  ballCol=color(0,0,200);
           else ballCol=color(150,150,200);
          }   
      else ballCol=color(200,200,200);
         
      if (mass>1)
          {
           fill(ballCol);
           noStroke();
           ellipse(pos.x,pos.y,mass*2,mass*2);
          }
       else
          {
            stroke(ballCol);
            point(pos.x,pos.y);
          }
      
     }
     
  }


