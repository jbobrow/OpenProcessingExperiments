
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
  //if(key == 'r')
    //rorschach = !rorschach;
 
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
int nBalls;
int nSteps;
float thresh;
float vMax;
//i, x,y,vx,vy
float[][] balls;
 
int ballShapeMode;
int numBallShapes = 4;
int movementMode;
boolean applyThreshold;
boolean renderDiscretely;
boolean rorschach;
boolean pause;
boolean invertAlpha;
boolean blackBackground;
boolean smileyMode;
color backgroundColor;
color ballColor;
boolean randomColor;
 
PImage ballImage;
 
int radius;
 
void setup(){
  frameRate(30);
  smooth();
  noStroke();
   
  resetParams();
   
  size(radius*10,radius*10); 
   
  generateImage();
  generateBalls();
}
 
void resetParams(){
  movementMode = 0;
  ballShapeMode = 0;
  applyThreshold = true;
  renderDiscretely = false;
  rorschach = true;
  pause = false;
  invertAlpha = false;
  blackBackground = false;
  smileyMode = true;
  randomColor = false;
   
  nBalls = 30;
  nSteps = 6;
  thresh = .1;
  vMax = 3;
  balls = new float[nBalls][4];
  backgroundColor = color(255);
  ballColor = color(0);
  radius = 50;
}
 
void draw(){
  if(!pause)
    moveBalls();
  background(255);
  for(int i=0; i<nBalls; i++){
    if(!rorschach){
      image(ballImage,balls[i][0]-radius,balls[i][1]-radius);
    }
    else{
      image(ballImage,(width-balls[i][0])-radius,balls[i][1]-radius);
      image(ballImage,balls[i][0]-radius,balls[i][1]-radius);
    }
  }
if(applyThreshold){
    filter(THRESHOLD,thresh);
   
  //apply color changes
  loadPixels();
  for(int i=0; i<pixels.length;i++){
    if(red(pixels[i])==255)
      pixels[i] = backgroundColor;
    else
      pixels[i] = ballColor;
  } 
  updatePixels();
  }
  if(blackBackground)
    filter(INVERT);
}
 
 
 
void generateBalls(){
  for(int i=0; i<nBalls; i++)
    generateBall(i);
}
 
void generateBall(int i){
  balls[i][0] = random(radius,width-radius);
  balls[i][1] = random(radius,height-radius);
  balls[i][2] = random(-vMax,vMax);
  balls[i][3] = random(-vMax,vMax);
}
void moveBalls(){
  //bouncing off edges!
  if(movementMode ==0){
    for(int i=0; i<nBalls; i++){
      if(balls[i][0]-radius <= 0 || balls[i][0]+radius >= width)
        balls[i][2] = -balls[i][2];
   
      if(balls[i][1]-radius <= 0 || balls[i][1]+radius >= height)
        balls[i][3] = -balls[i][3];
       
      balls[i][2]+=random(-.1,.1);
      balls[i][3]+=random(-.1,.1);
      balls[i][2] = constrain(balls[i][2],-vMax,vMax);
      balls[i][3] = constrain(balls[i][3],-vMax,vMax);
       
      balls[i][0] +=balls[i][2];
      balls[i][1] +=balls[i][3];
    }
  }
 
  //a fountain!
  if(movementMode ==1){
    float v = -(height+radius)/50;
    float theta = 0;
    for(int i=0; i<nBalls; i++){
      if(balls[i][0] < -2*radius || balls[i][0] > width+radius ||
         balls[i][1] > height+radius){
        v += random(-2,2);
        theta = random(-.2,.2);
        balls[i][0] = width/2;
        balls[i][1] = height-radius;
        balls[i][2] = v*sin(theta);
        balls[i][3] = v*cos(theta);
      }
       
      balls[i][3]-= v/50;
       
      balls[i][0] +=balls[i][2];
      balls[i][1] +=balls[i][3];
    }
  }
   
  //swirling around
  if(movementMode ==2){
    for(int i=0; i<nBalls; i++){
      if(balls[i][0] >=radius && balls[i][0] <= width-radius &&
         balls[i][1] >=radius && balls[i][1] <= height-radius){
        balls[i][2]+= (width/2-balls[i][0])/(width/2)*random(.9,1.1);
        balls[i][3]+= (height/2-balls[i][1])/(height/2)*random(.9,1.1);
        balls[i][0]+= balls[i][2];
        balls[i][1]+= balls[i][3];
      }
      else{
        balls[i][0] = random(radius,width-radius);
        balls[i][1] = random(radius,height-radius);
        balls[i][2] = 0;
        balls[i][3] = 0;
      }
       
      balls[i][0] +=balls[i][2];
      balls[i][1] +=balls[i][3];
    }
  }
//orbits!
  if(movementMode ==3){
    float rSquared = 0;
    float theta = 0;
    float vel0 = max(width,height)/150;
    float vel = vel0+0;
    for(int i=0; i<nBalls; i++){
      rSquared = (balls[i][0]-width/2)*(balls[i][0]-width/2)+
                 (balls[i][1]-height/2)*(balls[i][1]-height/2);
      theta = atan2(balls[i][1]-height/2,balls[i][0]-width/2);
 
      if(rSquared > max(width+radius,height+radius)*max(width+radius,height+radius)*.25){
        println("escape");
          balls[i][0] = random(radius,width-radius);
          balls[i][1] = random(radius,height-radius);
          balls[i][2] = 0;
          balls[i][3] = 0;
         }
      vel = vel0*(1-rSquared/(width*width/(3*3)));
      balls[i][0]+= vel*cos(theta+PI/2);
      balls[i][1]+= vel*sin(theta+PI/2);
    }
  }
   
  //swirl in!
  if(movementMode == 4){
    float rSquared = 0;
    float theta = 0;
    float vel0 = max(width,height)/150;
    float vel = vel0+0;
    float rSquaredMax = (width/2+radius)*(width/2+radius);
    for(int i=0; i<nBalls; i++){
      rSquared = (balls[i][0]-width/2)*(balls[i][0]-width/2)+
                 (balls[i][1]-height/2)*(balls[i][1]-height/2);
      theta = atan2(balls[i][1]-height/2,balls[i][0]-width/2);
       
      if(rSquared > rSquaredMax || rSquared < 200.0){
        rSquared = (width/2+radius/2)*(width/2+radius/2);//rSquaredMax*.9;
        theta = random(TWO_PI);
        balls[i][0] = width/2+sqrt(rSquared)*cos(theta);
        balls[i][1] = height/2+sqrt(rSquared)*sin(theta);
        balls[i][2] = 0;
        balls[i][3] = 0;
       }
 
      balls[i][0]-= (4*cos(theta+PI/2)+cos(theta)*(1+rSquared/rSquaredMax));
      balls[i][1]-= (4*sin(theta+PI/2)+sin(theta)*(1+rSquared/rSquaredMax));
    }
  }
 //They're all repulsive!
  if(movementMode == 5){
    float rSquared = 0;
    float force = 0;
    float theta = 0;
    for(int i=0; i<nBalls; i++){
      for(int j=0; j<nBalls; j++)
        if(i!=j){
          rSquared = (balls[i][0]-balls[j][0])*(balls[i][0]-balls[j][0])+
                     (balls[i][1]-balls[j][1])*(balls[i][1]-balls[j][1]);
          theta = atan2(balls[j][1]-balls[i][1],balls[j][0]-balls[i][0]);
     
          balls[i][2]+= -1/rSquared*cos(theta)*2E2;
          balls[i][3]+= -1/rSquared*sin(theta)*2E2;
      }
      balls[i][2] += (1/balls[i][0]+1/((balls[i][0]-width )))*nBalls/10;
      balls[i][3] += (1/balls[i][1]+1/((balls[i][1]-height)))*nBalls/10;
       
      balls[i][2] = balls[i][2]*.95;
      balls[i][3] = balls[i][3]*.95;
       
      balls[i][0] += balls[i][2];
      balls[i][1] += balls[i][3];
    }
  }
   
  //They're repulsive, attractive!
  if(movementMode == 6){
    float rSquared = 0;
    float force = 0;
    float theta = 0;
    for(int i=0; i<nBalls; i++){
      for(int j=0; j<nBalls; j++)
        if(i!=j){
          rSquared = (balls[i][0]-balls[j][0])*(balls[i][0]-balls[j][0])+
                     (balls[i][1]-balls[j][1])*(balls[i][1]-balls[j][1]);
          theta = atan2(balls[j][1]-balls[i][1],balls[j][0]-balls[i][0]);
     
          balls[i][2]+= -(3*radius/rSquared-1/sqrt(rSquared))*cos(theta)*20.0/nBalls;
          balls[i][3]+= -(3*radius/rSquared-1/sqrt(rSquared))*sin(theta)*20.0/nBalls;
      }
      balls[i][2] += (1/balls[i][0]+1/((balls[i][0]-width )))*nBalls/10;
      balls[i][3] += (1/balls[i][1]+1/((balls[i][1]-height)))*nBalls/10;
       
      balls[i][2] = balls[i][2]*.99;
      balls[i][3] = balls[i][3]*.99;
       
      balls[i][0] += balls[i][2];
      balls[i][1] += balls[i][3];
    }
  }
}
void generateImage(){
  if(ballShapeMode == 0)
    generateCircleImage();
  if(ballShapeMode == 1)
    generateRingImage();
  if(ballShapeMode == 2)
    generateSquareImage();
  if(ballShapeMode == 3)   
    generateHyperbolicImage();
}
   
void generateSquareImage(){
  ballImage = createImage(radius*2,radius*2,ARGB);
  color thisColor = color(0,0,0,0);
  float delta = 0;
    for(int x= 0; x<=radius; x++)
      for(int y= x; y<=radius; y++){
        delta = x;
        if(renderDiscretely){
          if(invertAlpha)
            thisColor = color(0,0,0,
                              255*(nSteps-1-(int)(delta/(radius)*(nSteps)))/(nSteps-1));
          else
            thisColor = color(0,0,0,
                              255*((int)(delta/(radius)*(nSteps))+1)/(nSteps));
        }
        else{
          if(invertAlpha)
            thisColor = color(0,0,0,
                        255*(1.0-delta/(radius)));
          else
            thisColor = color(0,0,0,255*(delta/(radius)));
        }
        ballImage.set(x,y,thisColor);
        ballImage.set(y,x,thisColor);
        ballImage.set(2*radius-x,y,thisColor);
        ballImage.set(y,2*radius-x,thisColor);
        ballImage.set(2*radius-x,2*radius-y,thisColor);
        ballImage.set(2*radius-y,2*radius-x,thisColor);
        ballImage.set(x,2*radius-y,thisColor);
        ballImage.set(2*radius-y,x,thisColor);
      }
}
 
void generateRingImage(){
  ballImage = createImage(radius*2,radius*2,ARGB);
  color thisColor = color(0,0,0,0);
  float delta = 0;
    for(int x= 0; x<=radius*2; x++)
      for(int y= 0; y<=radius*2; y++){
        delta = sqrt(pow(x-radius,2)+pow(y-radius,2));
        if(delta<radius){
          if(renderDiscretely){
            if(invertAlpha)
              thisColor = color(0,0,0,
                          255.0*( (int)(2*abs(delta/(float)radius-.5)*nSteps)/(nSteps-1.0) ));
            else
              thisColor = color(0,0,0,
                          255.0*( (int)(nSteps+1-2*abs(delta/(float)radius-.5)*nSteps)/(nSteps+0.0) ));
          }
          else{
            if(invertAlpha)
              thisColor = color(0,0,0,
                          255*(2*abs(delta/(float)radius-.5)));
            else
              thisColor = color(0,0,0,
                          255*(1-2*abs(delta/(float)radius-.5)));
          }
          ballImage.set(x,y,thisColor);
        }
        else{
          ballImage.set(x,y,color(0,0,0,0));
        }
      }
} 
void generateCircleImage(){
  ballImage = createImage(radius*2,radius*2,ARGB);
  color thisColor = color(0,0,0,0);
  float rSquared = 0;
  for(int x= 0; x<=radius; x++)
    for(int y= 0; y<=radius; y++){
      rSquared = pow(x-radius,2)+pow(y-radius,2);
      if(rSquared<radius*radius){
        if(renderDiscretely){
          if(invertAlpha)
            thisColor = color(0,0,0,
                        255*((int)(sqrt(rSquared)/radius*nSteps)+1)/nSteps);
          else
            thisColor = color(0,0,0,
                        255*(nSteps-(int)(sqrt(rSquared)/radius*nSteps))/nSteps);
        }
        else{
          if(invertAlpha)
            thisColor = color(0,0,0,
                        255*(rSquared/(radius*radius)));
          else
            thisColor = color(0,0,0,
                        255*(1-rSquared/(radius*radius)));
        }
        ballImage.set(x,y,thisColor);
        ballImage.set(2*radius-x,y,thisColor);
        ballImage.set(2*radius-x,2*radius-y,thisColor);
        ballImage.set(x,2*radius-y,thisColor);
      }
      else
        ballImage.set(x,y,color(0,0,0,0));
    }
}
 
void generateHyperbolicImage(){
  ballImage = createImage(radius*2,radius*2,ARGB);
  color thisColor = color(0,0,0,0);
  float delta = 0;
    for(int x= 0; x<=radius; x++)
      for(int y= 0; y<=radius; y++){
        delta = 2*radius/(float)(2*radius-x)-1;
        delta+= 2*radius/(float)(2*radius-y)-1;
        delta = delta/2.0;
        if(renderDiscretely){
          if(invertAlpha)
            thisColor = color(0,0,0,
                              255*(nSteps-1-(int)(delta*nSteps))/(nSteps-1));
          else
            thisColor = color(0,0,0,
                              255*((int)(delta*nSteps)+1)/(nSteps));
        }
        else{
          if(invertAlpha)
            thisColor = color(0,0,0,
                        255*(1.0-delta));
          else
            thisColor = color(0,0,0,255*(delta));
        }
        ballImage.set(x,y,thisColor);
        ballImage.set(y,x,thisColor);
        ballImage.set(2*radius-x,y,thisColor);
        ballImage.set(y,2*radius-x,thisColor);
        ballImage.set(2*radius-x,2*radius-y,thisColor);
        ballImage.set(2*radius-y,2*radius-x,thisColor);
        ballImage.set(x,2*radius-y,thisColor);
        ballImage.set(2*radius-y,x,thisColor);
      }
}

//Direct credit given to Esteben Hufstedler and his Rorshach Generator Sketch
