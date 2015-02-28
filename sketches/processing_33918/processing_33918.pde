
 int ballAmount= 1000;
  float centerX []= new float[ballAmount];
  float centerY []= new float[ballAmount];
  float speedX  []= new float[ballAmount];
  float speedY  []= new float[ballAmount];
  
void setup(){
  size(600,600);
 
  
  
  for (int i=0; i < ballAmount;i++) {//int i = first space
    centerX [i]=random(50,550);
    centerY [i]=random(50,550);
    
    speedX  [i]=random(20);
    speedY  [i]=random(20);
  }
}
void draw(){
  background(0);
  
  for (int i=0; i < ballAmount; i++) {
    
    centerX[i]=centerX[i] + speedX[i];//speed x = how much it moves on the x axis
    centerY[i]=centerY[i] + speedY [i];
    /*
    ifthe ball is less than 50 then bounce left if the ball is greater than 550 bounce right
    if ball is 
    */
    if (centerX[i] < 50) { 
        speedX[i]= speedX[i]*-1;  //move left
    }else if (centerX[i] > 550) {
          speedX[i] *= -1;//move right
    }
    if (centerY[i] < 50){
        speedY[i]=speedY[i]*-1; //move down
    }else if (centerY[i] > 550){
         speedY[i]*= -1;
    } // move up 
    
    ellipse(centerX[i],centerY[i],10,10);
  
  }
}

                
                
