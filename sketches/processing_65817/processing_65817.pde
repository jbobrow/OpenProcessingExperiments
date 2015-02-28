
class CleaningRobot
{
  int y;
  color lightColor;
  int wasteAmount;

  float x;
  boolean walkDirection;
  float walkSpeed =.8;

  float broomSize;
  float broomPara = 0;
  float broomSpeed = .1;

  float mouthSize;  
  float mouthPara = 0;
  float mouthSpeed = .08;

  float earSize;  
  float earPara = 0;
  float earSpeed = .05;
  
  float eyeSize;
  float eyePara = 0;
  float eyeSpeed = .08;  

  float neckHeight;
  float neckPara = 0;
  float neckSpeed = .05;  

  
  CleaningRobot(int x_,int y_,color lightColor_,float earSize_,float eyeSize_,float neckHeight_,int wasteAmount_,float mouthSize_,float broomSize_)
  {
    x = x_;
    y = y_;
    lightColor = lightColor_;
    earSize = earSize_;
    eyeSize = eyeSize_;
    neckHeight = neckHeight_;
    wasteAmount = wasteAmount_;
    mouthSize = mouthSize_;
    broomSize = broomSize_;
    
  }
  
  void robotClean()
  {
    broomSize = 60+18*sin(broomPara);
    broomPara += broomSpeed;
  }
  
  
  void robotMouth()
  {
    mouthSize = 10+30*sin(mouthPara);
    mouthPara += mouthSpeed;
    
  }
    
  
   void robotEar()
  {
    earSize = 12+3*sin(earPara);
    earPara += earSpeed;
    
  } 
  
   void robotEye()
  {
    eyeSize = 30-15*sin(eyePara);
    eyePara += eyeSpeed;
    
  }   
  
   void robotNeck()
  {
    neckHeight = 20-15*sin(neckPara);
    neckPara += neckSpeed;
    
  }   
  


  
   void robotWaste()
  {
    int n=frameCount%360;
    wasteAmount=n/60;
    
    if(0<n && n<=120){
      lightColor=#7cc315;          
  
    }else if(120<n && n<=240){
      lightColor=#e2c421;  
    
    }else{
      lightColor=#c31515;        
    }
    
  }   
  
  void robotWalk(){
    if (x>190 || x<130)
    {
      walkSpeed = -walkSpeed;
    }
    
    x+=walkSpeed;
  }
  
  
  
  void drawRobot()
  {
    pushMatrix();
    translate(x,y);
  
  
  //draw body
    fill(0);
    stroke(0);
    strokeWeight(10);
    strokeJoin(ROUND);
    rect(x-40,y-85,80,100);
    
    
  //draw switch
    fill(255);
    noStroke();
    ellipse(x,y,12,12);
    stroke(0);
    strokeWeight(1.5);
    line(x,y-2,x,y+2);
    
  //draw  wasteAmount
    stroke(255);
    strokeWeight(2);
    
    for(int n=1;n<=wasteAmount;n++)
    {
      line(x-35+n*3,y-n*15,x+35-n*3,y-n*15);  
    }
    
    
  //draw neck
    stroke(0);
    line(x-30,y-90,x+30,y-90-neckHeight/4);
    line(x-30,y-90-neckHeight/2,x+30,y-90-neckHeight/4);
    line(x-30,y-90-neckHeight/2,x+30,y-90-neckHeight*2/3);
    line(x-30,y-90-neckHeight,x+30,y-90-neckHeight*2/3);
    
  //draw light
    noStroke();
    fill(lightColor);
    ellipse(x,y-160-neckHeight,70,40);
  
  //draw ear
    noStroke();
    fill(0);
    rect(x-65-earSize,y-160-neckHeight+35-earSize,2*earSize+130,2*earSize);
  
  
  //draw head
    stroke(255);
    strokeWeight(1);
    rect(x-65,y-160-neckHeight,130,70);
    fill(0);
  
  //draw eyes
    noStroke();
    fill(255);
    ellipse(x-35,y-neckHeight-125,eyeSize,eyeSize);
    ellipse(x+35,y-neckHeight-125,eyeSize,eyeSize);
  
    fill(0);
    ellipse(x-35,y-neckHeight-125,eyeSize/4,eyeSize/4);
    ellipse(x+35,y-neckHeight-125,eyeSize/4,eyeSize/4);
    
  //draw mouthSize
    stroke(255);
    strokeWeight(4);
    line(x-mouthSize,y-neckHeight-100,x+mouthSize,y-neckHeight-100);
    
  
  //draw Broom
    noStroke();
    fill(0);
    quad(x-60,y+27,x+60,y+27,x+broomSize,y+60,x-broomSize,y+60);
    
    
    stroke(255);
    strokeWeight(2);
    line(x-40,y+40,x-broomSize*2/3,y+60);
    line(x-20,y+40,x-broomSize/3,y+60);
    line(x,y+40,x,y+60);
    line(x+20,y+40,x+broomSize/3,y+60);
    line(x+40,y+40,x+broomSize*2/3,y+60);
  
    
  
    popMatrix();
  }
}

