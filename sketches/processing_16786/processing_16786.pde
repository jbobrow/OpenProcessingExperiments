
ArrayList balls;  

int nrBalls=10;  

int colType=2;      

ball B,B2;  

float k=0;        // fully inelastic collision  



// variables below are just for interactivity  

boolean startBall=false;  

ball newB;  

boolean drawTraj=false;  

boolean fade=true;  





// The simple ball-class is mainly to keep variables of a ball (position, speed, mass) together  

class ball          

{  

  PVector speed;  

  PVector pos;  

  PVector handle;  // just for grabbbing and releasing  

  float mass;  

  boolean grabbed=false;
  color bColor;

  ball(float x, float y) {
    mass=int (random(10,50));
    speed=new PVector(0,0);
    pos=new PVector(x,y);
    bColor = color(int(random(255)),int(random(255)),int(random(255)));
    //bColor = color(255,255,255);
  }  

  boolean isOver(float x,float y)  

  {  

    if (dist(x,y,pos.x,pos.y)<mass) return true;  

    return false;
  }
}  



void setup()  

{  

  frameRate(60);  

  size(800,600);   

  smooth();  

  // simple initial ball sequence         

  balls = new ArrayList();  

  B = new ball(140,height/2);  

  B.speed = new PVector(2,0);  

  B.mass=35;  

  balls.add(B);  

  fade=true;  

  B = new ball(width-140,height/2+10);  

  B.speed = new PVector(-3,0);  

  B.mass=15;  

  balls.add(B);
}  



// For simplicity of the code and showing the necessary physic-calculations, all things have been kept within the draw() function.  

void draw()  

{  

  if ((fade)||(drawTraj))  

  {  

    if (drawTraj) fill(0,0,0,3);  

    else fill(0,0,0,20);  

    noStroke();  

    rect(0,0,width,height);
  }  

  else background(0);  



  if (startBall)   

  {  

    stroke(255,0,0,100);  

    strokeWeight(newB.mass*2);  

    point(newB.pos.x,newB.pos.y);
  }  

  for (int i=0;i<balls.size();i++)  

  {  

    B = (ball) balls.get(i);  

    if (drawTraj)   

    {  

      strokeWeight(2);  

      stroke(B.bColor,200);
    }  

    else  

    {  

      strokeWeight(B.mass*2);  

      stroke(B.bColor,100);
    }  

    point(B.pos.x,B.pos.y);  



    // move ball.   

    B.pos.add(B.speed);  

    // Constrain movement to the area. It would be nicer to do this correctly along the movement direction.   

    // But for simplicity, only the according component is constrained. The error is small, as long speed is small.  

    constrain(B.pos.x,B.mass,width-B.mass);  

    constrain(B.pos.y,B.mass,height-B.mass);  

    // check boarder. This is simply "flipping" the according speed component  

    if (B.pos.x<=B.mass)        B.speed.x=abs(B.speed.x);  

    if (B.pos.x>=width-B.mass)  B.speed.x=abs(B.speed.x)*(-1);  

    if (B.pos.y<=B.mass)        B.speed.y=abs(B.speed.y);  

    if (B.pos.y>=height-B.mass) B.speed.y=abs(B.speed.y)*(-1);  

    // check other balls  

    for (int j=i;j<balls.size();j++)        // Check all balls which have not yet been checked (thus start with "i" rather than 0!)  

    {  

      B2 = (ball) balls.get(j);  

      if ((B!=B2) && (!B2.grabbed) && (!B.grabbed))        // act only on "free" balls and not on the ball B itself!  

      {  

        PVector P = PVector.sub(B2.pos,B.pos);  

        float d=P.mag();  

        if (d<=(B.mass+B2.mass))   

        {  

          P.normalize();                          // parallel vector in collision direction  

          // set back both balls along collision direction so that they are just touching again  

          // Use their speed as "weighening" of this shift  

          d -= (B.mass+B2.mass);  

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

          // simple collision: "flip"  

          float vp1_after=0;  

          float vp2_after=0;  

          switch (colType)  

          {  

          case 1:  // simple flip  

            vp1_after = vp1*(-1);  

            vp2_after = vp2*(-1);  

            break;  

          case 2: // fully elastic collision (energy & momentum preserved)  

            vp1_after = (B.mass*vp1+B2.mass*(2*vp2-vp1))/(B.mass+B2.mass);  

            vp2_after = (B.mass*(2*vp1-vp2)+B2.mass*vp2)/(B.mass+B2.mass);  

            break;  

          case 3: // combined elastic/inelastic collision (momentum preserved, factor k=1 fully elastic, k=0 fully inelastic)  

            vp1_after = (-1)*(sqrt(k)*B2.mass*abs(vp1-vp2)-B.mass*vp1-B2.mass*vp2)/(B.mass+B2.mass);  

            vp2_after =      (sqrt(k)*B.mass*abs(vp1-vp2)+B.mass*vp1+B2.mass*vp2)/(B.mass+B2.mass);  

            break;  

          case 4: // transfer 100% of the component  

            vp1_after = vp2;  

            vp2_after = vp1;  

            break;  

          case 5: // stop all movement along collision direction.  

            vp1_after = 0;  

            vp2_after = 0;  

            break;  

          case 6: // swap all speed vectors between balls.  

            vp1_after = vp2;  

            vp2_after = vp1;  

            vp2=vn2;  

            vn2=vn1;  

            vn1=vp2;  

            break;  

          case 7: // 100% reflection into the collision direction  

            vp1_after = (-1)*B.speed.mag();  

            vn1=0;  

            vn2=0;  

            vp2_after = (1)*B2.speed.mag();  

            break;  

          case 8: // merging of colliding balls  

            B.speed = PVector.add(PVector.mult(B.speed,B.mass),PVector.mult(B2.speed,B2.mass));  

            B.mass = sqrt(B.mass*B.mass+B2.mass*B2.mass);  

            B.speed.mult(1/B.mass);  

            B.pos.add(B2.pos);  

            B.pos.mult(0.5);  

            balls.remove(j);  

            break;
          }  



          // calculate new speed vectors from componentens after collision  

          if (colType!=8)  

          {  

            B.speed=PVector.add(PVector.mult(P,vp1_after),PVector.mult(N,vn1));  

            B2.speed=PVector.add(PVector.mult(P,vp2_after),PVector.mult(N,vn2));
          }
        }
      }
    }
  }
}  

/* The remaining code is just to add interactivity to the sketch, so that balls can be created/deleted/dragged */





void mousePressed()  

{  

  boolean overBall=false;  

  for (int j=0;j<balls.size();j++)         

  {  

    B = (ball) balls.get(j);  

    if (B.isOver(mouseX,mouseY))   

    {  

      overBall=true;  

      if (mouseButton==LEFT)  

      {  

        B.grabbed=true;  

        B.handle=PVector.sub(B.pos,new PVector(mouseX,mouseY));
      }  

      else if (mouseButton==RIGHT)  

      {  

        balls.remove(j);  

        j--;
      }
    }
  }  

  if (!overBall)  

  {  

    if (mouseButton==LEFT)  

    {  

      if (!startBall)   

      {  

        startBall=true;  

        newB = new ball(mouseX,mouseY);  

        newB.mass=1;
      }
    }
  }
}  

void mouseDragged()  

{  

  if (startBall)  

  {  

    newB.mass=dist(mouseX,mouseY,newB.pos.x,newB.pos.y);  

    return;
  }  

  for (int j=0;j<balls.size();j++)        // Check all balls which have not yet been checked (thus start with "i" rather than 0!)  

  {  

    B = (ball) balls.get(j);  

    if (B.grabbed)   

    {  

      B.pos=PVector.add(new PVector(mouseX,mouseY),B.handle);  

      B.speed.mult(0);
    }
  }
}  

void mouseReleased()  

{  

  if (startBall)  

  {  

    startBall=false;  

    balls.add(newB);  

    return;
  }  

  for (int j=0;j<balls.size();j++)         

  {  

    B = (ball) balls.get(j);  

    if (B.grabbed) B.speed=new PVector(mouseX-pmouseX,mouseY-pmouseY);  

    B.grabbed=false;
  }
}  



void keyReleased()  

{  

  if (key=='1') colType=1;  

  if (key=='2') colType=2;  

  if (key=='3') colType=3;  

  if (key=='4') colType=4;  

  if (key=='5') colType=5;  

  if (key=='6') colType=6;  

  if (key=='7') colType=7;  

  if (key=='8') colType=8;  



  if (key=='p') for (int j=0;j<balls.size();j++)         

  {  

    B = (ball) balls.get(j);  

    B.speed.mult(0);
  }  

  if (key=='b') for (int j=0;j<balls.size();j++)         

  {  

    B = (ball) balls.get(j);  

    B.speed.mult(0.9);
  }  

  if (key=='a') for (int j=0;j<balls.size();j++)         

  {  

    B = (ball) balls.get(j);  

    B.speed.mult(1.1);
  }  

  if (key=='f')   fade = !fade;   

  if (key=='t')   drawTraj = !drawTraj;   

  if (key==' ')   

  {  

    balls = new ArrayList();  

    if ( colType==8)  

    {  

      for (int i=0;i<400;i++)   

      {  

        B= new ball(0,0);  

        B.speed = new PVector(random(-5,5),random(-5,5));  

        B.mass=random(1,5);  

        B.pos = new PVector(random(B.mass,width-B.mass),random(B.mass,height-B.mass));  

        balls.add(B);
      }
    }  

    else 

    {  

      for (int i=0;i<nrBalls;i++)   

      {  

        B= new ball(0,0);  

        B.speed = new PVector(random(-5,5),random(-5,5));  

        B.mass=random(3,20);  

        B.pos = new PVector(random(B.mass,width-B.mass),random(B.mass,height-B.mass));  

        balls.add(B);
      }
    }
  }
} 


