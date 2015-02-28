
class Fish{
  float mov = 0;
  float mi = 0.1;
  float targetX=random(0,width),targetY=random(0,height);
  float xspeed,yspeed,speed;
  float circlex,circley;
  float [] xpos = new float [fishSize];
  float [] ypos = new float [fishSize];
  float range;
  float stepRange;//the range that detects fishes
  int otherNum;//the number of the current detected fish
  float midX,midY;
  float xtemp,ytemp;//temporary target value
  int flag;
  float depth=random(0.27,27);
  float md = 0.027;
  
  void init(){
    for(int i=0;i<xpos.length;i++){
      xpos[i]=0;
      ypos[i]=0;
    }
  }
  
  void display(){
    
    mov = mov + mi;
    
    if (mov > .4 || mov < -.4){
      mi = mi *-1;
    }
    
    md *= random(0.8,1.2);
    if(abs(md)>0.1||abs(md)<0.0027){
      if(md>0) md=0.027;
      if(md<0) md=-0.027;
    }
    depth = depth + md;
    
    
    if(depth > 27 || depth < 0.27){
      md = md * -1;
    }
    
    
    /*
    if(rainState==1){
      if(depth>20 || depth<0.27){
        md = md * -1;
      }
    }
    
    if(rainState==2){
      if(depth>14 || depth<0.27){
        md= md* -1;
      }
    }
    
    if(rainState==3){
      if(depth>7 || depth < 0.27){
        md= md* -1;
      }
    }*/
    
    if(rain>27){
      if(depth>7){
        md=-0.27;
      }
    }
    
     if(rain>40){
      if(depth>2.7){
        md=-0.72;
      }
    }
    
   /* xspeed = (targetX-circlex)/144;
    yspeed = (targetY-circley)/144;
    circlex += xspeed + mov/2;
    circley += yspeed + mov;//update fish location and speed */
    
    /*if (circlex >width||circlex<0||circley>height||circley<0){
      targetX=random(width);
      targetY=random(height);
    }*/
    
    for (int i=0; i<xpos.length-1;i++){
      
      xpos[i] = xpos[i+1];
      ypos[i] = ypos[i+1];
      
    }
    
    xpos[xpos.length-1] = circlex;
    ypos[ypos.length-1] = circley;
    
    //detect collision with other fish
    boolean touching = false;
    for (int i=0; i<fishNum;i++){
      Fish other= fish[i];
      if(other !=this){
        float dis = dist(circlex,circley,other.circlex,other.circley);
        if(dis<27){
          touching=true;
          otherNum=i;
          break;
        }
      }
    }
    
    if(touching){
      midX=(targetX+fish[otherNum].targetX)/2;
      midY=(targetY+fish[otherNum].targetY)/2;
      if(circlex<fish[otherNum].circlex){
        targetX=midX-27;
      }else targetX=midX+27;
      /*if(circley<fish[otherNum].circley){
        targetY=midY-50;
      }else targetY=midY+50;*/
    }
    
    stepRange = dist(circlex,circley,stepX,stepY);
    if(stepRange<100){
      if(count==72){
        flag=1;
      float k= (stepY-circley)/(stepX-circlex);
      targetX=(circlex-stepX)/abs(circlex-stepX)* 300*sqrt((stepX-circlex)*(stepX-circlex)/((stepX-circlex)*(stepX-circlex)+(stepY-circley)*(stepY-circley)))+circlex;
      if (targetX>width){
        targetX=width;
      }else if(targetX<0){
        targetX=0;
      }
      targetY=k*(targetX-circlex)+circley;
      if(targetY>height){
        targetY=height;
      }else if(targetY<0){
        targetY=0;
      }
      xtemp=targetX;
      ytemp=targetY;
      }
      if(flag==1){
      targetX=xtemp;
      targetY=ytemp;
      
     depth -= 0.27;
     md= -0.027;
     if(depth < 0.27){
       depth=0.27;

     }
      
      xspeed=(targetX-circlex)/72;
      yspeed=(targetY-circley)/72;
      }
    }
      if(stepRange>=100){
      xspeed=(targetX-circlex)/144;
      yspeed=(targetY-circley)/144;
      }
      
      circlex += xspeed + mov/2;
      circley += yspeed + mov;
      
    range=dist(circlex,circley,targetX,targetY);
    if(range<72){
      targetX=random(-27,width+27);
      targetY=random(-27,height+27);
    }
    if(count ==0){
    range=dist(circlex,circley,targetX,targetY);
    if(range>372){
      targetX=random(0,width);
      targetY=random(0,height);
    }
    }
    
    if(targetX>width-7||targetX<7){
      targetX = random(27,width-27);
    }
    
    if (targetY>height-7||targetY<7){
      targetY = random(27,height-27);
    }
    
    speed=sqrt(xspeed*xspeed+yspeed*yspeed);
    if(speed>2.2){
      createRipple(int(circlex),int (circley),1.27*speed*depth*depth/27/27);
    }
    
    for (int i=0; i< xpos.length; i++)
    {
      noStroke();
      float r=(255-i*7)*(0.1+bri/width);
      fill(r,0,0,depth);
      ellipse(xpos[i],ypos[i],(xpos.length)/3-i,(xpos.length)/2-i);//draw fish with ellipse
    }
    
    
      
    
  }
}

