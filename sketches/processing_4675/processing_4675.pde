
void mouseClicked(){
  generateBalls();
}

void keyTyped(){
  //switch movement modes
  if(key =='1'){
    movementMode = 0;
    generateBalls();
  }
  if(key =='2'){
    movementMode = 1;
    generateBalls();
  }
  if(key =='3'){
    movementMode = 2;
    generateBalls();
  }
  if(key =='4'){
    movementMode = 3;
    generateBalls();
  }
  if(key =='5'){
    movementMode = 4;
    generateBalls();
  }
  if(key =='6'){
    movementMode = 5;
    generateBalls();
  }
  if(key =='7'){
    movementMode = 6;
    generateBalls();
  } 
  //use discrete steps or smooth gradation?
  if(key =='d'){
    renderDiscretely = !renderDiscretely;
    generateImage();
  }
  
  //apply filter?
  if(key == 'f')
    applyThreshold = !applyThreshold;
  
  //invert color of shapes
  if(key == 'i'){
    invertAlpha = !invertAlpha;
    generateImage();
  }
  
  //double the image along x
  if(key == 'r')
    rorschach = !rorschach;

  //use squares or circles?
  if(key == 's'){
    ballShapeMode++;
    if(ballShapeMode == numBallShapes)
      ballShapeMode =0;
    generateImage();
  }
  
  if(key=='c'){
    randomColor = !randomColor;
    if(randomColor){
      backgroundColor = color(random(255),random(255),random(255));
      ballColor = color(random(255),random(255),random(255));
    }
    else{
      backgroundColor = color(255);
      ballColor = color(0);
    }
  }
  if(key=='z'){
    resetParams();
    generateBalls();
    generateImage();
  }

  
  //pause motion
  if(key == 'p')
    pause = !pause;
  
  //invert all colors?
  if(key == 'b')
    blackBackground = !blackBackground;
  
  //shrink/grow balls
  if(key == '-' && radius>10){
    radius = (int)(radius/1.2);
    println("radius: "+radius);
    generateImage();
  }
  if(key == '=' && radius<width/3){
    radius = (int)(radius*1.2);
    println("radius: "+radius);
    generateImage();
  }
  
  //change drawing threshold
  if(key =='[' && thresh>0){
    thresh = thresh/1.2;
    println("threshold: "+thresh);
  }
  if(key ==']' && thresh*1.2<1){
    thresh = thresh*1.2;
    println("threshold: "+thresh);
  }
  
  //change the number of steps in the discretized image
  if(key =='{' && nSteps>3){
    nSteps--;
    generateImage();
    println("nSteps: "+nSteps);
  }
  if(key =='}'){
    nSteps++;
    generateImage();
    println("nSteps: "+nSteps);
  }
  
  
  //add/remove balls
  if(key =='_'){
    int newNBalls = nBalls;
    if(nBalls>0)
      newNBalls = (int)(nBalls/1.2);
      
    println("nBalls: "+nBalls+" to "+newNBalls);

    float[][] newBalls = new float[newNBalls][4];
    for(int i =0; i<newNBalls;i++)
        newBalls[i] = balls[i];
        
    nBalls = newNBalls;
    balls = newBalls;
  }
  if(key =='+'){
    int newNBalls = nBalls+0;
    if(nBalls<5)
      newNBalls++;
    else
      newNBalls = (int)(nBalls*1.2);
    println("nBalls: "+nBalls+" to "+newNBalls);
    float[][] newBalls = new float[newNBalls][4];
    for(int i =0; i<nBalls;i++)
      newBalls[i] = balls[i];
    
    balls = newBalls;
    for(int i =nBalls; i<newNBalls;i++)
      generateBall(i);
    
    nBalls = newNBalls;
    println(balls.length);
  }
}

