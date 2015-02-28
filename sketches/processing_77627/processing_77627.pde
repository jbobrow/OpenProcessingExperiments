
//Dan Sztanga
//dan.sztanga@gmail.com
//(C) 2012. Pittsburgh, PA. All Rights Reserved.
//HW11_ A Screen Saver

int MAX = 10;

float [] x1 = new float [MAX];
float [] y1 = new float [MAX];
float [] z1 = new float [MAX];

float [] x2 = new float [MAX];
float [] y2 = new float [MAX];
float [] z2 = new float [MAX];

float [] x3 = new float [MAX];
float [] y3 = new float [MAX];
float [] z3 = new float [MAX];

float [] x4 = new float [MAX];
float [] y4 = new float [MAX];
float [] z4 = new float [MAX];

float [] xDelt1 = new float [MAX];
float [] yDelt1 = new float [MAX];
float [] zDelt1 = new float [MAX];

float [] xDelt2 = new float [MAX];
float [] yDelt2 = new float [MAX];
float [] zDelt2 = new float [MAX];

float [] xDelt3 = new float [MAX];
float [] yDelt3 = new float [MAX];
float [] zDelt3 = new float [MAX];

float [] xDelt4 = new float [MAX];
float [] yDelt4 = new float [MAX];
float [] zDelt4 = new float [MAX];

float speed;
float noiseScale;

void setup(){
  size(800,450,P3D);
  background(0);
  smooth();
  
  x1 = initializeX();
  y1 = initializeY();
  z1 = initializeZ();
  
  x2 = initializeX();
  y2 = initializeY();
  z2 = initializeZ();
  
  x3 = initializeX();
  y3 = initializeY();
  z3 = initializeZ();
  
  x4 = initializeX();
  y4 = initializeY();
  z4 = initializeZ();
  
  for(int i = 0; i <MAX; i++){
    speed = random(1,3);
    xDelt1[i] = speed;
    yDelt1[i] = speed;
    zDelt1[i] = speed;
    
    xDelt2[i] = speed;
    yDelt2[i] = speed;
    zDelt2[i] = speed;
    
    xDelt3[i] = speed;
    yDelt3[i] = speed;
    zDelt3[i] = speed;
    
    xDelt4[i] = speed;
    yDelt4[i] = speed;
    zDelt4[i] = speed;
  }
}

void draw(){
  camera(width/2, height/2, 389, width/2, height/2, 0, 0, 1, 0);
  fade();
  moveCurve();
  bounceEnds();
  drawCurve();
}

float[] initializeX (){
  float[] temp = new float[0];
  for(int i = 0; i <MAX; i++){
    temp = append(temp, random(width));
  }
  return temp;
}

float[] initializeY (){
  float[] temp = new float[0];
  for(int i = 0; i <MAX; i++){
    temp = append(temp, random(height));
  }
  return temp;
}

float[] initializeZ (){
  float[] temp = new float[0];
  for(int i = 0; i <MAX; i++){
    temp = append(temp, random(1000));
  }
  return temp;
}

void fade(){
  fill(0,10);
  rect(0,0,width,height);
}

void drawCurve(){
  //fill(255, 10);
  stroke(255);
  strokeWeight(.5);
  for(int i = 0; i < MAX; i++){
    bezier(x1[i], y1[i], z1[i], x2[i], y2[i], z2[i], x3[i], y3[i], z3[i], x4[i], y4[i], z4[1]);
  }
}

void moveCurve(){
  for(int i = 0; i < MAX; i++){
    x1[i] = x1[i]+xDelt1[i];
    y1[i] = y1[i]+yDelt1[i];
    z1[i] = z1[i]+zDelt1[i];
    
    x2[i] = x2[i]+xDelt2[i];
    y2[i] = y2[i]+yDelt2[i];
    z2[i] = z2[i]+zDelt2[i];
    
    x3[i] = x3[i]+xDelt3[i];
    x3[i] = x3[i]+xDelt3[i];
    z3[i] = z3[i]+zDelt3[i];
    
    x4[i] = x4[i]+xDelt4[i];
    x4[i] = x4[i]+xDelt4[i];
    z4[i] = z4[i]+zDelt4[i];
  }
}

void bounceEnds(){
  for(int i = 0; i < MAX; i++){
    
    if (x1[i] < 0){
      xDelt1[i] = -xDelt1[i];
    }
    if (x1[i] > width){
      xDelt1[i] = -xDelt1[i];
    }
    
    if (x2[i] < 0){
      xDelt2[i] = -xDelt2[i];
    }
    if (x2[i] > width){
      xDelt2[i] = -xDelt2[i];
    }
    
    if (x3[i] < 0){
      xDelt3[i] = -xDelt3[i];
    }
    else if (x3[i] > width){
      xDelt3[i] = -xDelt3[i];
    }
    
    if (x4[i] < 0){
      xDelt4[i] = -xDelt4[i];
    }
    else if (x4[i] > width){
      xDelt4[i] = -xDelt4[i];
    }
    
    if (y1[i] < 0){
      yDelt1[i] = -yDelt1[i];
    }
    if (y1[i] > height){
      yDelt1[i] = -yDelt1[i];
    }
    
    if (y2[i] < 0){
      yDelt2[i] = -yDelt2[i];
    }
    if (y2[i] > height){
      yDelt2[i] = -yDelt2[i];
    }
    
    if (y3[i] < 0){
      yDelt3[i] = -yDelt3[i];
    }
    else if (y3[i] > height){
      yDelt3[i] = -yDelt3[i];
    }
    
    if (y4[i] < 0){
      yDelt4[i] = -yDelt4[i];
    }
    else if (y4[i] > height){
      yDelt4[i] = -yDelt4[i];
    }
    
    if (z1[i] < 0){
      zDelt1[i] = -zDelt1[i];
    }
    if (z1[i] > 100){
      zDelt1[i] = -zDelt1[i];
    }
    
    if (z2[i] < 0){
      zDelt2[i] = -zDelt2[i];
    }
    if (z2[i] > 100){
      zDelt2[i] = -zDelt2[i];
    }
    
    if (z3[i] < 0){
      zDelt3[i] = -zDelt3[i];
    }
    else if (z3[i] > 100){
      zDelt3[i] = -zDelt3[i];
    }
    
    if (y4[i] < 0){
      zDelt4[i] = -zDelt4[i];
    }
    else if (y4[i] > 100){
      zDelt4[i] = -zDelt4[i];
    }
  }
}

