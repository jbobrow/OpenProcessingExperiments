
class Robot
{
  //ground Y
  float groundY;
  
  float gravity = .1;
  float velocityX = 0;
  float velocityY = 0;
  
  float robFrameCount = 0;
  
  //rob prop
  float robX;
  float robY;
  float gridSize;  //gridSize determines the rob's size
  boolean direction = true;  // if value == true ,the rob will face to right
  
  //neck prop
  float neckAngle = 0;
  float neckAngleSeed = 0;
  
  // body prop
  float bodyHeight;
  float bodyHeightSeed = 0;
  float bodyHeightSpeed = .1;
  float bodyHeightAccelerate = .5;
  
  //wheel
  Wheel[] wheels;
  //wheel prop
  float wheelSpeed = PI/30;
  float wheelAngle = 0;
  float trackNumber = 20;
  float trackNoiseSeed = random(-5,5);
  
  boolean movingCheck = false;  //if a action is running the value will be true;
  
  
  Robot(float x_,float y_,float gridSize_,float groundY_)
  {
    this.robX = x_;
    this.robY = y_;
    this.gridSize = gridSize_;
    this.groundY = groundY_;
    
    bodyHeight = 2*this.gridSize;
    
    wheels = new Wheel[5];
    
    for (int i = 0 ; i < 5 ; i++)
    {
      wheels[i] = new Wheel((i*2-4)*this.gridSize , 1*this.gridSize , this.gridSize);
    }
  }
  
  void move()
  {
    this.robX = constrain(this.robX+this.velocityX , 0 , width);
    this.robY = constrain(this.robY+this.velocityY , 0 , this.groundY);
    
    if (this.robY + 2*this.gridSize < this.groundY)
    {
      this.velocityY += this.gravity;
    }else{
      this.robY = this.groundY - 2*this.gridSize;
      this.velocityY = 0;
    }
    
    if (this.velocityX == 0 && this.velocityY == 0)
    {
      //this.movingCheck = false;
      this.robFrameCount = 0;
    }
    
    if (this.movingCheck == true)
    {
      this.robFrameCount++;
    }
    
    if (this.velocityX > 0)
    {
      direction = true;
      this.trackNoiseSeed--;
      for (int i = 0 ; i < 5 ; i++)
      {
        wheels[i].scroll(wheelSpeed);
      }
      
      //neckAngle = -this.velocityX/10*PI;
      
    }else if(this.velocityX < 0){
      direction = false;
      this.trackNoiseSeed++;
      for (int i = 0 ; i < 5 ; i++)
      {
        wheels[i].scroll(-wheelSpeed);
      }
      
      //neckAngle = this.velocityX/10*PI;
    }
    
    if (this.robX < 5*this.gridSize || this.robX > width-5*this.gridSize)
    {
      this.velocityX = -this.velocityX;
    }
  }
  
  void movingAround()
  { 
    if (this.velocityX == 0)
    {
      this.velocityX = random(-4,4);
    }

    move();
  }
  
  void jump()
  {
    float jumpProbability = random(0,1);
    
    if (this.velocityY == 0)
    {
      this.velocityX = 0;
      
      if (jumpProbability<=.05)
      {
        this.velocityY = -random(4,7);
        this.velocityX = random(-5,5);
      }
    }
    if (this.direction == true)
    {
      wheelAngle = sin((this.robY + 2*this.gridSize - this.groundY)/height*PI/5);
    }else{
      wheelAngle = -sin((this.robY + 2*this.gridSize - this.groundY)/height*PI/5);
    }
    move();
  }
  
  void bodyMove()
  {
    this.bodyHeight += 5*sin(this.bodyHeightSeed);
    this.bodyHeightSeed += this.bodyHeightSpeed;
  }
  
  void neckMove()
  {
    this.neckAngle = sin(neckAngleSeed);
    neckAngleSeed+=.1;
  }
  
//  void jump()
//  {
//    this.movingCheck = true;
//    
//    if (robFrameCount < 30)
//    {
//      this.bodyHeight -= this.bodyHeightSpeed;
//      this.bodyHeightSpeed -= this.bodyHeightAccelerate;
//    }
//    
//  }
  //===============================draw functions===============================
  void drawRob()
  {
    pushMatrix();
    
    translate(robX,robY);
    
    pushStyle();
    
    noFill();
    stroke(#343434);
    
    drawRobHead();
    drawRobNeck();
    drawRobBody();
    drawRobWheel();
    
    popStyle();
    
    popMatrix();
  }
  
  void drawRobHead()
  {
    int positionPara;
    float anglePara;
    if (this.direction == true)
    {
      positionPara = 1;
      anglePara = 0;
    }else{
      positionPara = -1;
      anglePara = PI;
    }
    
    pushMatrix();
      
      float offsetX = sin(this.neckAngle)*2*this.gridSize;
      float offsetY = (1-cos(this.neckAngle))*2*this.gridSize;
    
      translate(offsetX , -bodyHeight-4*gridSize+offsetY);
      
      beginShape();
      
        vertex(-2*this.gridSize*positionPara , -3*this.gridSize);
        vertex(2*this.gridSize*positionPara , -3*this.gridSize);
        vertex(3*this.gridSize*positionPara , -2*this.gridSize);
        vertex(3*this.gridSize*positionPara , 0*this.gridSize);
        vertex(-2*this.gridSize*positionPara , 0*this.gridSize);
        vertex(-2*this.gridSize*positionPara , -3*this.gridSize);
      
      endShape();
      
      beginShape();
        
        vertex(1*this.gridSize*positionPara , -3*this.gridSize);
        vertex(1.5*this.gridSize*positionPara , -2*this.gridSize);
        vertex(1.5*this.gridSize*positionPara , 0*this.gridSize);
        
      endShape();
      
      beginShape();
        
        vertex(-1*this.gridSize*positionPara , -2*this.gridSize);
        vertex(.5*this.gridSize*positionPara , -2*this.gridSize);
        vertex(.5*this.gridSize*positionPara , -1*this.gridSize);
        vertex(-1*this.gridSize*positionPara , -1*this.gridSize);
        
      endShape();
      
      arc(-1*this.gridSize*positionPara , -1.5*this.gridSize , 1*this.gridSize , 1*this.gridSize , PI/2+anglePara , 3*PI/2+anglePara);
      
      beginShape();
        
        vertex(-2.5*this.gridSize*positionPara , -2.5*this.gridSize);
        vertex(-2*this.gridSize*positionPara , -2.5*this.gridSize);
        vertex(-2*this.gridSize*positionPara , -.5*this.gridSize);
        vertex(-2.5*this.gridSize*positionPara , -.5*this.gridSize);
        vertex(-2.5*this.gridSize*positionPara , -2.5*this.gridSize);
        
      endShape();
      
      
      pushStyle();
        noFill();
        stroke(#953423);
      
        arc(0*positionPara , -3*this.gridSize , 1*this.gridSize , 1*this.gridSize , -PI , 0);
        
      popStyle();
    popMatrix();
  }
  
  void drawRobNeck()
  {
    pushMatrix();
      
      translate(0 , -bodyHeight-2*gridSize);
      rotate(this.neckAngle);
      
      rect(-.5*this.gridSize , -2*this.gridSize , 1*this.gridSize , 2*this.gridSize);
      
      arc(-.5*this.gridSize , -1*this.gridSize , 1*this.gridSize , 1*this.gridSize , PI/2 , 3*PI/2);
      arc(.5*this.gridSize , -1*this.gridSize , 1*this.gridSize , 1*this.gridSize , -PI/2 , PI/2);
      
    popMatrix();
  }
  
  void drawRobBody()
  {
    int positionPara;
    float anglePara;
    if (this.direction == true)
    {
      positionPara = 1;
      anglePara = 0;
    }else{
      positionPara = -1;
      anglePara = PI;
    }
    
    pushMatrix();
      
      translate(0 , 0);
      
      pushMatrix();
      
        translate(0,-this.bodyHeight);
        
        arc(-1*this.gridSize*positionPara , -1*this.gridSize , 2*this.gridSize , 2*this.gridSize , PI/2+anglePara , 3*PI/2+anglePara);
      
        beginShape();
          
          vertex(-1*this.gridSize*positionPara , -2*this.gridSize);
          vertex(1.5*this.gridSize*positionPara , -2*this.gridSize);
          vertex(2*this.gridSize*positionPara , -1.5*this.gridSize);
          vertex(2*this.gridSize*positionPara , -.5*this.gridSize);
          vertex(1.5*this.gridSize*positionPara , 0*this.gridSize);
          vertex(-1*this.gridSize*positionPara , 0*this.gridSize);
          
        endShape();
        
        line(2*this.gridSize*positionPara , -1.5*this.gridSize , 3.5*this.gridSize*positionPara , -1.5*this.gridSize);
        
        line(2*this.gridSize*positionPara , -.5*this.gridSize , 3.5*this.gridSize*positionPara , -.5*this.gridSize);
        
        ellipse(3.75*this.gridSize*positionPara , -1.5*this.gridSize , .5*this.gridSize , .5*this.gridSize);
        
        arc(3.75*this.gridSize*positionPara , -.5*this.gridSize , .5*this.gridSize , .5*this.gridSize , 0 , PI);
        
        line(3.5*this.gridSize*positionPara , -1.5*this.gridSize , 3.5*this.gridSize*positionPara , -.5*this.gridSize);
        
        line(4*this.gridSize*positionPara , -1.5*this.gridSize , 4*this.gridSize*positionPara , -.5*this.gridSize);
        
        beginShape();
          
          vertex(4*this.gridSize*positionPara , -1.5*this.gridSize);
          vertex(4.5*this.gridSize*positionPara , -1.5*this.gridSize);
          vertex(5.5*this.gridSize*positionPara , -2.5*this.gridSize);
          vertex(6.5*this.gridSize*positionPara , -2.5*this.gridSize);
          vertex(6.5*this.gridSize*positionPara , -2*this.gridSize);
          vertex(5.5*this.gridSize*positionPara , -2*this.gridSize);
          vertex(5.5*this.gridSize*positionPara , 0*this.gridSize);
          vertex(6.5*this.gridSize*positionPara , 0*this.gridSize);
          vertex(6.5*this.gridSize*positionPara , .5*this.gridSize);
          vertex(5.5*this.gridSize*positionPara , .5*this.gridSize);
          vertex(4.5*this.gridSize*positionPara , -.5*this.gridSize);
          vertex(4*this.gridSize*positionPara , -.5*this.gridSize);
          
        endShape();
        
        
      popMatrix();
      
      line(-1*this.gridSize , 0 , -1*this.gridSize , -this.bodyHeight);
      line(1*this.gridSize , 0 , 1*this.gridSize , -this.bodyHeight);
      
      int tempNumber = floor(this.bodyHeight/(2*this.gridSize));
      
      for (int i = 0;i<tempNumber;i++)
      {
        beginShape();
          
          vertex(-1*this.gridSize*positionPara , -1.5*this.gridSize-i*2*this.gridSize);
          vertex(0*this.gridSize*positionPara , -1.5*this.gridSize-i*2*this.gridSize);
          vertex(0*this.gridSize*positionPara , -.5*this.gridSize-i*2*this.gridSize);
          vertex(-1*this.gridSize*positionPara , -.5*this.gridSize-i*2*this.gridSize);
          
        endShape();
      }
      
      float remainHeight = this.bodyHeight%(2*this.gridSize);
      
      if (remainHeight != 0)
      {
        beginShape();
      
          if (remainHeight<=1.5*this.gridSize)
          {
            vertex(-1*this.gridSize*positionPara , -tempNumber*2*this.gridSize-.5*this.gridSize);
            vertex(0*this.gridSize*positionPara , -tempNumber*2*this.gridSize-.5*this.gridSize);
            vertex(0*this.gridSize*positionPara , -this.bodyHeight);
          }else{
            vertex(-1*this.gridSize*positionPara , -tempNumber*2*this.gridSize-.5*this.gridSize);
            vertex(0*this.gridSize*positionPara , -tempNumber*2*this.gridSize-.5*this.gridSize);
            vertex(0*this.gridSize*positionPara , -tempNumber*2*this.gridSize-1.5*this.gridSize);
            vertex(-1*this.gridSize*positionPara , -tempNumber*2*this.gridSize-1.5*this.gridSize);
          }
        
        endShape();
      }
    popMatrix();
  }
  
  void drawRobWheel()
  {
    pushMatrix();
    
    rotate(wheelAngle);
    
      for (int i = 0 ; i < 5 ; i++)
      {
        wheels[i].drawWheel();
      }
      
      float trackPart = 8*this.gridSize / trackNumber;
      
      beginShape();
      for (int i = 0; i < trackNumber ;i++)
      {
        if (i == 0)
        {
          curveVertex(-4*this.gridSize+i*trackPart , 0);
          curveVertex(-4*this.gridSize+i*trackPart , 0);
        }else{
          curveVertex(-4*this.gridSize+i*trackPart , 6*noise(i+trackNoiseSeed)-3);
        }
      }
      curveVertex(4*this.gridSize , 0);
      curveVertex(4*this.gridSize , 0);
      
      endShape();
      
      beginShape();
      
      for (int j = 0; j < trackNumber ;j++)
      {
        if (j == 0)
        {
          curveVertex(4*this.gridSize , 2*this.gridSize);
          curveVertex(4*this.gridSize , 2*this.gridSize);
        }else{
          curveVertex(4*this.gridSize-j*trackPart , 2*this.gridSize+6*noise(j+trackNoiseSeed+trackNumber)-3);
        }
      }
      curveVertex(-4*this.gridSize , 2*this.gridSize);
      curveVertex(-4*this.gridSize , 2*this.gridSize);
      
      endShape();
      
      arc(-4*this.gridSize , 1*this.gridSize , 2*this.gridSize , 2*this.gridSize , PI/2 , 3*PI/2);
      arc(4*this.gridSize , 1*this.gridSize , 2*this.gridSize , 2*this.gridSize , -PI/2 , PI/2);
    
    popMatrix();
  }
}

