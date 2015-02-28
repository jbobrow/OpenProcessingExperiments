
public class Avatar {
  
  private float x,y;
  final private int rad = 10;
  
  private float groundY;
  
  public int movement,jumping,damping = 0;
  
  final private float speed = 10, accel = 0.2, slope = 0.1, jumpLow = 8, jumpHigh = 15, frict = 0.96, rest = 0.66, grav = 1.2; 
  private float velX = 0.0, velY = 0.0;
  
  Avatar(float X, float Y){
    x = X;
    y = Y;
  }
  
  private void moveAvatar(){
    
    // check movement vars and add accel accordingly
    if(damping == 0){
      if(movement==1){
        velX += accel;
      }else if(movement==2){
        velX -= accel;
      }
      if(jumping==1){
        if(y>=groundY-1){
          float jumpPotent = jumpLow+(jumpLow*velX/speed);
          if(jumpPotent>jumpHigh){
            jumpPotent = jumpHigh;
          }
          velY -= jumpPotent;
          jumping = 0;
        }
      }
    }else if(damping == 1){
      velX *= frict;
    }
    
    // gravity constant
    velY += grav;
    
    // slide down slopes
    if(y>=groundY-1){
      // check next & previous 2 X positions for slope value
      float diffPrev = ((ground[int(x)]-ground[int(x-1)])+(ground[int(x-1)]-ground[int(x-2)]))/2;
      float diffNext = ((ground[int(x)]-ground[int(x+1)])+(ground[int(x+1)]-ground[int(x+2)]))/2;
      if(diffPrev>0){
        velX += slope+slope*diffPrev*0.1;
      }else if(diffNext>0){
        velX -= slope+slope*diffNext*0.1;
      }
    }
    
    // speed cap
    if(velX>speed){
      velX = speed;
    }
    if(velY>speed){
      velY = speed;
    }
    
    // add velocity
    y += velY;
    x += velX;
    
    // keep avatar on screen, moveRight() if pushing the middle of the screen
    if(x>ground.length/2){
      int dX = ceil(x-ground.length/2);
      x = ground.length/2;
      moveRight(dX);
    }else if(x-rad<20){
      x = 20+rad;
      velY *= rest;
      velX *= -frict;
    }
    if(y>groundY){
      y = groundY;
      velY *= -rest;
      velX *= frict;
    }
  }
  
  public void drawAvatar(){
    // get y value of the ground at the x position
    groundY = ground[int(x)];
    
    moveAvatar();
    
    stroke(0);
    fill(0,25,225);
    
    // stretching ellipse
    ellipse(x,y-rad,rad*2+rad*2*(-abs(velY/50)),rad*2+rad*2*(abs(velY/20)));
    fill(50,150,255);
    smooth();
    noStroke();
    ellipse(x+5,y-15,4,4);
    noSmooth();
    fill(0);
    stroke(0);
    //println(velY);
  }
  
  public float checkPos(){
    return x;
  }
  
}

