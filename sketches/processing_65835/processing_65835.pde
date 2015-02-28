
//UCLA SUMMER2012 DMA28
//made by Elaine Zhao

class MyRobot{
  
  float x;
  float y;
  float bodyDiameter;
  
  float eyeX1;
  float eyeY1;
  float eyeX2;
  float eyeY2;

  float legY1;
  float legY2;
  float legY3;

  float legX1;
  float legX2;
  float legX3;
  
  float angleEye = 0;
  float scalarEye = 3.5;
  
  float angleLeg = 0;
  float scalarLeg = 1;
  
  //for up and down
  float angleY = 0.0;
  float scalarY = 5;
  
  float creepX;
  float creepSpeed = 0.5;
  int direction = 1;
  
  MyRobot(float Tx, float Ty, float TbodyDiameter, float TeyeX1, float TeyeY1, float TeyeX2, float TeyeY2, float TlegY1, float TlegY2, float TlegY3, float TlegX1, float TlegX2, float TlegX3, float TscalarLeg){
   
    x = Tx;//whole position
    y = Ty;//whole position
    bodyDiameter = TbodyDiameter;
   
    eyeX1 = TeyeX1;//should be between -12,12
    eyeY1 = TeyeY1;//should be between -12,12
    eyeX2 = TeyeX2;//should be between -12,12
    eyeY2 = TeyeY2;//should be between -12,12
    
    legY1 = TlegY1;//>y
    legY2 = TlegY2;//>y
    legY3 = TlegY3;//>y
    
    legX1 = TlegX1;//>0
    legX2 = TlegX2;//>0
    legX3 = TlegX3;//>0
    
    scalarLeg = TscalarLeg;//the scale of leg movement
    
    ellipseMode(CENTER);
  }
  
  void movement(){
    //leg move
    //every leg is made of 2 segments
    stroke(133);
    strokeWeight(4);
    //right leg1
    line(x + bodyDiameter/4,y,x + bodyDiameter/2,y - legY1);
    line(x + bodyDiameter/2,y - legY1,x + bodyDiameter/2 + legX1 + sin(angleLeg) * scalarLeg,y);
    //right leg2
    line(x + bodyDiameter/4,y,x + bodyDiameter/2,y - legY2);
    line(x + bodyDiameter/2,y - legY2,x + bodyDiameter/2 + legX2 + sin(angleLeg) * scalarLeg,y);
    //right leg3
    line(x + bodyDiameter/4,y,x + bodyDiameter/2,y - legY3);
    line(x + bodyDiameter/2,y - legY3,x + bodyDiameter/2 + legX3 + sin(angleLeg) * scalarLeg,y);
    //left leg1
    line(x - bodyDiameter/4,y,x - bodyDiameter/2,y - legY1);
    line(x - bodyDiameter/2,y - legY1 ,x - bodyDiameter/2 - legX1 - sin(angleLeg) * scalarLeg,y);
    //left leg2
    line(x - bodyDiameter/4,y,x - bodyDiameter/2,y - legY2);
    line(x - bodyDiameter/2,y - legY2 ,x - bodyDiameter/2 - legX2 - sin(angleLeg) * scalarLeg,y);
    //left leg3
    line(x - bodyDiameter/4,y,x - bodyDiameter/2,y - legY3);
    line(x - bodyDiameter/2,y - legY3,x - bodyDiameter/2 - legX3 - sin(angleLeg) * scalarLeg,y);
    noStroke();
    angleLeg += 0.3;
    println(angleLeg);
    
    //body
    fill(30);
    arc(x,y,bodyDiameter,bodyDiameter,PI,PI * 2);
    
    //eyeball
    fill(255);
    ellipse(x - bodyDiameter/4,y,30,30);//left eyeball
    ellipse(x + bodyDiameter/4,y,30,30);//right eyeball
    
    //eyeblack
    fill(0);
    ellipse(x - bodyDiameter/4 + eyeX1 + sin(angleEye) * scalarEye, y + eyeY1,8,8);//left
    ellipse(x + bodyDiameter/4 + eyeX2 + sin(angleEye) * scalarEye, y + eyeY2,8,8);//right
    angleEye += 0.05;
    println(angleEye);
  }
  
  void upDown(){
    y += sin(angleY) * scalarY;
    angleY += 0.05;
    //halabe
    stroke(250);
    strokeWeight(2);
    line(x,0,x,y);
    noStroke();
  }
  
  //creep function
  void creep(){
    if(x >= 430 || x <= 200){
      direction = -direction;
    }
    x += creepSpeed * direction;  
  }
}

