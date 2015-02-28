
public class Rain
{
  PVector position,pposition,speed;
  float col;

  
  public Rain()
  {
    position = new PVector(random(0,width),0);
    pposition = position;
    speed = new PVector(0,0);
    col = random(30,100);
  }
  
  void draw()
  {
    stroke(100,col);
    strokeWeight(2);
    //line(position.x,position.y,pposition.x,pposition.y);
    //ellipse(position.x,position.y,5,5);
    image(r,position.x,position.y,4,15);
  }
  
  void calculate()
  {
    pposition = new PVector(position.x,position.y);
    gravity();

  }
  
  void gravity()
  {
    //speed.y += .2;
    speed.y = 10;
    speed.x += .01;
    position.add(speed);
  }
}

public class Splash
{
  PVector position,speed;
  
  public Splash(float x,float y)
  {
    float angle = random(PI,TWO_PI);
    float distance = random(1,5);
    float xx = cos(angle)*distance;
    float yy = sin(angle)*distance;
    position = new PVector(x,y);
    speed = new PVector(xx,yy);
    
  }
  
  public void draw()
  {
    //strokeWeight(1);
    //stroke(55,40,80);
    noStroke();
    fill(180,250,230);
    float rs = random(2.5,4);
    ellipse(position.x,position.y,rs,rs);
  }
  
  void calculate()
  {
    gravity();
     
    speed.x*=0.98;
    speed.y*=0.98;
           
    position.add(speed);
  }
  
  void gravity()
  {
    speed.y+=.2;
  }
  
}

public class Gary  {
   PVector position;
   int mood;
   float moveDirection, velocity, ran, gsize;
   
   public Gary(float _velocity, float ypos, float garysize)
  {
    position = new PVector(random(0,width), ypos);
    velocity = _velocity;
    moveDirection = 1;
    mood =1;
    gsize = garysize;
  }
  void draw(int i)  {
    if(mood == 1)    {
       //drawG(1);
      if(velocity<0)  drawG(1,position.x,position.y,gsize*scaleFactor,gsize/15*13*scaleFactor,i);
      else if(velocity==0)   drawG(15,position.x,position.y,gsize*scaleFactor,gsize/15*13*scaleFactor,i);
      else  {
        pushMatrix(); scale(-1,1);
        drawG(1,-position.x,position.y,gsize*scaleFactor,gsize/15*13*scaleFactor,i);
        popMatrix();
      }
      
    }
    else if(mood==2) {
      if(velocity<0)   drawG(2,position.x,position.y,gsize*scaleFactor,gsize/15*13*scaleFactor,i);
      else  {
        pushMatrix(); scale(-1,1);
        drawG(2,-position.x,position.y,gsize*scaleFactor,gsize/15*13*scaleFactor,i);
        popMatrix();
      }
    }
    else if(mood==3)   {
             //drawG(3);
      if(velocity<0)  
        drawG(3,position.x,position.y,gsize*scaleFactor,gsize/15*13*scaleFactor,i);
      /*if(velocity==0) 
        image(stopGary,position.x,position.y,gsize*scaleFactor,gsize*scaleFactor/15*13);*/
      else  {
        pushMatrix(); scale(-1,1);
        drawG(3,-position.x,position.y,gsize*scaleFactor,gsize*scaleFactor/15*13,i);
        popMatrix();
      }
    }
  }
  void calculate()  {
    if(mood ==1)   {              // If mood is 1, gary is in the rain without umbrella
                                  // if mood is 2, gary found an umbrella and ran into that
                                  // if mood is 3, gary stands under the umbrealla
      // speed.x = 2*randomDirection;
      /*speed.x = 2;
      speed.y = height-20;
      position.add(speed);*/

        if(ran<=0.4)  velocity = -1;
        else if(ran>0.4&&ran<=1.6) velocity = 0;
        else velocity =1;
      
      position.x += velocity;
      
    }
    if(mood ==2)  {
      /*speed.x = 10*moveDirection;
      speed.y = height-50;
      position.add(speed);*/
      position.x += 10*velocity;
    }
    if(mood == 3)  {
      position.x += 0.5*velocity;
    }
  }
}

