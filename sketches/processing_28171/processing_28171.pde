
//# use openGL
//import processing.opengl.*;

int wWidth = 800;
int wHight = 400;

int bodyMax = 3;
int boxMax = bodyMax * 11;
int panelMax = boxMax * 6;

int boxNum,bodyNum;
float x_sin,x_cos,y_sin,y_cos,z_sin,z_cos;
float centerX,centerY,centerZ,rollX,roolY,rollZ = 0;
int pNum[] = new int[panelMax];
float pPoint[][] = new float[panelMax][12];
float pPoint_depth[] = new float[panelMax];
float pPoint_cash[] = new float[panelMax];
float joint[][][] = new float[bodyMax*11][11][3];
float points[] = new float[3];

float jointDeg[][][] = new float[bodyMax*11][11][3];
float beginDeg[][][] = new float[bodyMax*11][11][3];
float targetDeg[][][] = new float[bodyMax*11][11][3];

float cashY;

int frame_num;



void setup()
{
  size(800,400);
  //# use openGL
  //size(wWidth,wHight,OPENGL);

  smooth();
  strokeJoin(ROUND);
  frameRate(30);
  background(255);

  for(int i = 0;i < panelMax;i++){
    pPoint_depth[i] = -10000;
  }
}



void draw()
{
  frame_num++;
  background(255);
  noStroke();

  //# motion bluar
//  fill(255,0,0,4);
//  rect(0,0,wWidth,wHight);

  stroke(0);
  strokeWeight(2);
  boxNum = 0;
  bodyNum = 0;


  drawStudyBody(int(frame_num*10),400,0,wHight/2);
  
  drawMoveBody(frame_num,800,0,wHight/2);
  
  setRoll(wWidth/2,0,wHight/2,0,0,frame_num/2);
  boxAffine((bodyNum-1)*11+0,11);

  for(int j = 0;j < 1;j++){
    for(int k = 0;k < 1;k++){
      drawWalkBody(int(frame_num*15),wWidth/2 + (j-2)*100,k*100,wHight/2-60);
    
      setRoll(wWidth/2,0,wHight/2,0,0,-frame_num*1.5);
      boxAffine((bodyNum-1)*11+0,11);
    }
  }



  //# depth_sort
  setRoll(wWidth/2,0,wHight/2,0,-19.47,-70.53);
  for(int i = 0;i < panelMax;i++){
    float afPoint[] = new float[3];

    afPoint[0] = (pPoint[i][0]+pPoint[i][3]+pPoint[i][6]+pPoint[i][9])/4;
    afPoint[1] = (pPoint[i][1]+pPoint[i][4]+pPoint[i][7]+pPoint[i][10])/4;
    afPoint[2] = (pPoint[i][2]+pPoint[i][5]+pPoint[i][8]+pPoint[i][11])/4;

    affine(afPoint);

    pPoint_depth[i] = afPoint[0];
    pPoint_cash[i] = afPoint[0];
  }

  pPoint_depth = sort(pPoint_depth);
  for(int i = 0;i < panelMax;i++){
    for(int j = 0;j < panelMax;j++){
      if(pPoint_depth[j] > -10000){
        
        if(pPoint_cash[i] == pPoint_depth[j]){
          pNum[j] = i;
          pPoint_depth[j] = -10000;
        }
      }
    }
  }




  //# panel_draw
  for(int i = 0;i < panelMax;i++){
    //# wire frame
    //noFill();

    fill(color(255,255,255,255));
    quad(
      cabinetX(pPoint[pNum[i]][0],pPoint[pNum[i]][1],pPoint[pNum[i]][2]),
      cabinetY(pPoint[pNum[i]][0],pPoint[pNum[i]][1],pPoint[pNum[i]][2]),
      cabinetX(pPoint[pNum[i]][3],pPoint[pNum[i]][4],pPoint[pNum[i]][5]),
      cabinetY(pPoint[pNum[i]][3],pPoint[pNum[i]][4],pPoint[pNum[i]][5]),
      cabinetX(pPoint[pNum[i]][6],pPoint[pNum[i]][7],pPoint[pNum[i]][8]),
      cabinetY(pPoint[pNum[i]][6],pPoint[pNum[i]][7],pPoint[pNum[i]][8]),
      cabinetX(pPoint[pNum[i]][9],pPoint[pNum[i]][10],pPoint[pNum[i]][11]),
      cabinetY(pPoint[pNum[i]][9],pPoint[pNum[i]][10],pPoint[pNum[i]][11])
    );
  }
}



void drawBody(int bodyNumber,float x,float y,float z,float rx,float ry,float rz)
{
  float baseSize = 10;
  float jointSpace = baseSize/3;

  float headSize   = baseSize * 2;
  float headLength = baseSize * 2;
  float bodyWidth  = baseSize * 3;
  float bodyDepth  = baseSize * 1.5;
  float armSize    = baseSize * 1;
  float arm0Length = baseSize * 2.5;
  float arm1Length = baseSize * 3;
  float legSize    = baseSize * 1.5;
  float leg0Length = baseSize * 4;
  float leg1Length = baseSize * 4;
  
  
  //# joint
  joint[bodyNumber][0][0] = x;
  joint[bodyNumber][0][1] = y;
  joint[bodyNumber][0][2] = z;

  joint[bodyNumber][1][0] = x;
  joint[bodyNumber][1][1] = y;
  joint[bodyNumber][1][2] = z;

  joint[bodyNumber][2][0] = x;
  joint[bodyNumber][2][1] = y;
  joint[bodyNumber][2][2] = z - arm0Length - jointSpace *2;

  joint[bodyNumber][3][0] = x - bodyWidth/2 - armSize/2 - jointSpace;
  joint[bodyNumber][3][1] = y;
  joint[bodyNumber][3][2] = z - arm0Length - jointSpace *2;

  joint[bodyNumber][4][0] = x + bodyWidth/2 + armSize/2 + jointSpace;
  joint[bodyNumber][4][1] = y;
  joint[bodyNumber][4][2] = z - arm0Length - jointSpace * 2;

  joint[bodyNumber][5][0] = x - legSize/2 - jointSpace;
  joint[bodyNumber][5][1] = y;
  joint[bodyNumber][5][2] = z + arm1Length + jointSpace * 2;

  joint[bodyNumber][6][0] = x + legSize/2 + jointSpace;
  joint[bodyNumber][6][1] = y;
  joint[bodyNumber][6][2] = z + arm1Length + jointSpace * 2;

  joint[bodyNumber][7][0] = x - bodyWidth/2 - armSize/2 - jointSpace;
  joint[bodyNumber][7][1] = y;
  joint[bodyNumber][7][2] = z;

  joint[bodyNumber][8][0] = x + bodyWidth/2 + armSize/2 + jointSpace;
  joint[bodyNumber][8][1] = y;
  joint[bodyNumber][8][2] = z;

  joint[bodyNumber][9][0] = x - legSize/2 - jointSpace;
  joint[bodyNumber][9][1] = y;
  joint[bodyNumber][9][2] = z + arm1Length + leg0Length + jointSpace * 4;

  joint[bodyNumber][10][0] = x + legSize/2 + jointSpace;
  joint[bodyNumber][10][1] = y;
  joint[bodyNumber][10][2] = z + arm1Length + leg0Length + jointSpace * 4;

  //# body parts
  //# upper body

  //# 0chest
  makeBox(
    x,
    y,
    z - arm0Length/2 - jointSpace,
    bodyWidth,
    bodyDepth,
    arm0Length
   );

  //# 1head
  makeBox(
    x,
    y,
    z - arm0Length - headLength/2 - jointSpace*3,
    headSize,
    headSize,
    headLength
  );

  //# 2right_arm0_upper
  makeBox(
    x - bodyWidth/2 - armSize/2 - jointSpace,
    y,
    z - arm0Length/2 - jointSpace,
    armSize,
    armSize,
    arm0Length
  );

  //# 3right_arm1_lower
  makeBox(
    x - bodyWidth/2 - armSize/2 - jointSpace,
    y,
    z + arm1Length/2 + jointSpace,
    armSize,
    armSize,
    arm1Length
  );

  //# 4left_arm0_upper
  makeBox(
    x + bodyWidth/2 + armSize/2 + jointSpace,
    y,
    z - arm0Length/2 - jointSpace,
    armSize,
    armSize,
    arm0Length
  );


  //# 5left_arm1_lower
  makeBox(
    x + bodyWidth/2 + armSize/2 + jointSpace,
    y,
    z + arm1Length/2 + jointSpace,
    armSize,
    armSize,
    arm1Length
  );


  //# lower body
  //# 6waist
  makeBox(
    x,
    y,
    z + arm1Length/2 + jointSpace,
    bodyWidth,
    bodyDepth,
    arm1Length
  );

  //# 7right_leg0_upper
  makeBox(
    x - legSize/2 - jointSpace,
    y,
    z + arm1Length +leg0Length/2 + jointSpace*3,
    legSize,
    legSize,
    leg0Length
  );

  //# 8right_leg1_lower
  makeBox(
    x - legSize/2 - jointSpace,
    y,
    z + arm1Length + leg0Length + leg1Length/2+ jointSpace*5,
    legSize,
    legSize,
    leg1Length
  );

  //# 9left_leg0_upper
  makeBox(
    x + legSize/2 + jointSpace,
    y,
    z + arm1Length +leg0Length/2 + jointSpace*3,
    legSize,
    legSize,
    leg0Length
  );

  //# 10left_leg1_lower
  makeBox(
    x + legSize/2 + jointSpace,
    y,
    z + arm1Length + leg0Length + leg1Length/2+ jointSpace*5,
    legSize,
    legSize,
    leg1Length
  );
}


void drawMoveBody(int frame_number,float x,float y,float z)
{
  int p,i;
  int T = 60;

  float timeCount = frame_number % T;
  float cosTC = cos(PI*timeCount/T);
  float maxZ = -100;

//  for(i = 0;i < 11;i++){
//    if(jointDeg[bodyNum+1][i][2] > maxZ){
//      maxZ = jointDeg[bodyNum+1][i][2];
//    }
//  }
  
  drawBody(bodyNum,x,y,z,0,0,0);
  
  if(timeCount == 0){
    for(i = 0;i < 11;i++){
      beginDeg[bodyNum][i][0] = jointDeg[bodyNum][i][0];
      beginDeg[bodyNum][i][1] = jointDeg[bodyNum][i][1];
      beginDeg[bodyNum][i][2] = jointDeg[bodyNum][i][2];
    }
    targetDeg[bodyNum][0][0]=random(-30,120);
    targetDeg[bodyNum][0][1]=random(-30,30);
    targetDeg[bodyNum][0][2]=random(-45,45);
    
    targetDeg[bodyNum][1][0]=random(-120+targetDeg[bodyNum][0][0],30+targetDeg[bodyNum][0][0]);
    targetDeg[bodyNum][1][1]=random(-30+targetDeg[bodyNum][0][1],30+targetDeg[bodyNum][0][1]);
    targetDeg[bodyNum][1][2]=random(-45+targetDeg[bodyNum][0][2],45+targetDeg[bodyNum][0][2]);
    
    targetDeg[bodyNum][2][0]=random(-60,60);
    targetDeg[bodyNum][2][1]=random(-45,45);
    targetDeg[bodyNum][2][2]=random(-60,60);
    
    targetDeg[bodyNum][3][0]=random(-210,45);
    targetDeg[bodyNum][3][1]=random(-120,30);
    targetDeg[bodyNum][3][2]=random(-75,90);
    
    targetDeg[bodyNum][4][0]=random(-210,45);
    targetDeg[bodyNum][4][1]=random(-30,120);
    targetDeg[bodyNum][4][2]=random(-90,75);
    
    targetDeg[bodyNum][5][0]=random(-120,30);
    targetDeg[bodyNum][5][1]=random(-60,15);
    targetDeg[bodyNum][5][2]=random(-30,60);
    
    targetDeg[bodyNum][6][0]=random(-120,30);
    targetDeg[bodyNum][6][1]=random(-15,60);
    targetDeg[bodyNum][6][2]=random(-60,30);
    
    targetDeg[bodyNum][7][0]=random(-150,0);
    targetDeg[bodyNum][7][1]=random(0,0);
    targetDeg[bodyNum][7][2]=random(0,0);
    
    targetDeg[bodyNum][8][0]=random(-150,0);
    targetDeg[bodyNum][8][1]=random(0,0);
    targetDeg[bodyNum][8][2]=random(0,0);
    
    targetDeg[bodyNum][9][0]=random(0,150);
    targetDeg[bodyNum][9][1]=random(0,0);
    targetDeg[bodyNum][9][2]=random(0,0);
    
    targetDeg[bodyNum][10][0]=random(0,150);
    targetDeg[bodyNum][10][1]=random(0,0);
    targetDeg[bodyNum][10][2]=random(0,0);
  }
  
  for(i = 0;i < 11;i++){
    jointDeg[bodyNum][i][0] = (beginDeg[bodyNum][i][0]*(1+cosTC)+targetDeg[bodyNum][i][0]*(1-cosTC))/2;
    jointDeg[bodyNum][i][1] = (beginDeg[bodyNum][i][1]*(1+cosTC)+targetDeg[bodyNum][i][1]*(1-cosTC))/2;
    jointDeg[bodyNum][i][2] = (beginDeg[bodyNum][i][2]*(1+cosTC)+targetDeg[bodyNum][i][2]*(1-cosTC))/2;
  }

  
  p = 7;
  setRoll(
    joint[bodyNum][p][0],
    joint[bodyNum][p][1],
    joint[bodyNum][p][2],
    jointDeg[bodyNum][7][0],
    jointDeg[bodyNum][7][1],
    jointDeg[bodyNum][7][2]
  );
  boxAffine(bodyNum*11+3,1);
  
  p = 8;
    setRoll(
    joint[bodyNum][p][0],
    joint[bodyNum][p][1],
    joint[bodyNum][p][2],
    jointDeg[bodyNum][8][0],
    jointDeg[bodyNum][8][1],
    jointDeg[bodyNum][8][2]
  );
  boxAffine(bodyNum*11+5,1);
  
  p = 9;
  setRoll(
    joint[bodyNum][p][0],
    joint[bodyNum][p][1],
    joint[bodyNum][p][2],
    jointDeg[bodyNum][9][0],
    jointDeg[bodyNum][9][1],
    jointDeg[bodyNum][9][2]
  );
  boxAffine(bodyNum*11+8,1);

  p = 10;
  setRoll(
    joint[bodyNum][p][0],
    joint[bodyNum][p][1],
    joint[bodyNum][p][2],
    jointDeg[bodyNum][10][0],
    jointDeg[bodyNum][10][1],
    jointDeg[bodyNum][10][2]
  );
  boxAffine(bodyNum*11+10,1);

  p = 2;
  setRoll(
    joint[bodyNum][p][0],
    joint[bodyNum][p][1],
    joint[bodyNum][p][2],
    jointDeg[bodyNum][2][0],
    jointDeg[bodyNum][2][1],
    jointDeg[bodyNum][2][2]
  );
  boxAffine(bodyNum*11+1,1);

  p = 3;
  setRoll(
    joint[bodyNum][p][0],
    joint[bodyNum][p][1],
    joint[bodyNum][p][2],
    jointDeg[bodyNum][3][0],
    jointDeg[bodyNum][3][1],
    jointDeg[bodyNum][3][2]
  );
  boxAffine(bodyNum*11+2,2);

  p = 4;
  setRoll(
    joint[bodyNum][p][0],
    joint[bodyNum][p][1],
    joint[bodyNum][p][2],
    jointDeg[bodyNum][4][0],
    jointDeg[bodyNum][4][1],
    jointDeg[bodyNum][4][2]
  );
  boxAffine(bodyNum*11+4,2);

  p = 5;
  setRoll(
    joint[bodyNum][p][0],
    joint[bodyNum][p][1],
    joint[bodyNum][p][2],
    jointDeg[bodyNum][5][0],
    jointDeg[bodyNum][5][1],
    jointDeg[bodyNum][5][2]
  );
  boxAffine(bodyNum*11+7,2);

  p = 6;
  setRoll(
    joint[bodyNum][p][0],
    joint[bodyNum][p][1],
    joint[bodyNum][p][2],
    jointDeg[bodyNum][6][0],
    jointDeg[bodyNum][6][1],
    jointDeg[bodyNum][6][2]
  );
  boxAffine(bodyNum*11+9,2);
  
  p = 0;
  setRoll(
    joint[bodyNum][p][0],
    joint[bodyNum][p][1],
    joint[bodyNum][p][2],
    jointDeg[bodyNum][0][0],
    jointDeg[bodyNum][0][1],
    jointDeg[bodyNum][0][2]
  );
  boxAffine(bodyNum*11+0,6);
  
  p = 1;
  setRoll(
    joint[bodyNum][p][0],
    joint[bodyNum][p][1],
    joint[bodyNum][p][2],
    jointDeg[bodyNum][1][0],
    jointDeg[bodyNum][1][1],
    jointDeg[bodyNum][1][2]
  );
  boxAffine(bodyNum*11+6,5);
  
  //# body_rool
  p = 0;
  setRoll(
    joint[bodyNum][p][0],
    joint[bodyNum][p][1],
    joint[bodyNum][p][2],
    0,
    0,
    0
  );
  boxAffine(bodyNum*11+0,11);

  bodyNum++;
}

void drawWalkBody(int frame_number,float x,float y,float z)
{
  int p;

  drawBody(bodyNum,x,y,z,0,0,0);

  //# nee_degree
  float valA = (TWO_PI * (frame_number+150))/180;
  float valB = (TWO_PI * (frame_number-25))/180;
  float valC = (TWO_PI * (frame_number-30))/180;
  float valD = (TWO_PI * (frame_number-205))/180;
  
  float nee_degree0 = (0.1*(3.5*cos(0.5*valA)+0.5*sin(valA))+0.5)*(35*sin(valB)+45);
  float nee_degree1 = (0.1*(3.5*cos(0.5*valC)+0.5*sin(valC))+0.5)*(35*sin(valD)+45);

  p = 9;
  setRoll(
    joint[bodyNum][p][0],
    joint[bodyNum][p][1],
    joint[bodyNum][p][2],
    nee_degree0,
    5*sin(TWO_PI*(frame_number-180)/360),
    0
  );
  boxAffine(bodyNum*11+8,1);

  p = 10;
  setRoll(
    joint[bodyNum][p][0],
    joint[bodyNum][p][1],
    joint[bodyNum][p][2],
    nee_degree1,
    -5*sin(TWO_PI*(frame_number)/360),
    0
  );
  boxAffine(bodyNum*11+10,1);

  p = 3;
  setRoll(
    joint[bodyNum][p][0],
    joint[bodyNum][p][1],
    joint[bodyNum][p][2],
    15*sin(TWO_PI*(frame_number-180)/360),
    0,
    0
  );
  boxAffine(bodyNum*11+2,2);

  p = 4;
  setRoll(
    joint[bodyNum][p][0],
    joint[bodyNum][p][1],
    joint[bodyNum][p][2],
    15*sin(TWO_PI*frame_number/360),
    0,
    0
  );
  boxAffine(bodyNum*11+4,2);

  p = 5;
  setRoll(
    joint[bodyNum][p][0],
    joint[bodyNum][p][1],
    joint[bodyNum][p][2],
    20*cos(TWO_PI*(frame_number-180)/360),
    1*sin(TWO_PI*(frame_number-180)/360),
    0);
  boxAffine(bodyNum*11+7,2);

  p = 6;
  setRoll(
    joint[bodyNum][p][0],
    joint[bodyNum][p][1],
    joint[bodyNum][p][2],
    20*cos(TWO_PI*(frame_number)/360),
    -1*sin(TWO_PI*(frame_number)/360),
    0
  );
  boxAffine(bodyNum*11+9,2);

  bodyNum++;
}


void drawStudyBody(int frame_number,float x,float y,float z){
  int p = 0;

  drawBody(bodyNum,x,y,z,0,0,0);
  p = 7;
  setRoll(joint[bodyNum][p][0],joint[bodyNum][p][1],joint[bodyNum][p][2],-100,5*sin(TWO_PI*frame_number/360),0);
  boxAffine(bodyNum*11+3,1);

  p = 8;
  setRoll(joint[bodyNum][p][0],joint[bodyNum][p][1],joint[bodyNum][p][2],-90,0,0);
  boxAffine(bodyNum*11+5,1);

  p = 9;
  setRoll(joint[bodyNum][p][0],joint[bodyNum][p][1],joint[bodyNum][p][2],90,0,0);
  boxAffine(bodyNum*11+8,1);

  p = 10;
  setRoll(joint[bodyNum][p][0],joint[bodyNum][p][1],joint[bodyNum][p][2],90,0,0);
  boxAffine(bodyNum*11+10,1);

  p = 5;
  setRoll(joint[bodyNum][p][0],joint[bodyNum][p][1],joint[bodyNum][p][2],-90,0,5);
  boxAffine(bodyNum*11+7,2);

  p = 6;
  setRoll(joint[bodyNum][p][0],joint[bodyNum][p][1],joint[bodyNum][p][2],-90,0,-5);
  boxAffine(bodyNum*11+9,2);

  bodyNum++;
}



void makeBox(float x,float y,float z,float width,float depth,float hight)
{
  int p,a,b,c,d;
  float x0 = x - width/2;
  float x1 = x + width/2;
  float y0 = y - depth/2;
  float y1 = y + depth/2;
  float z0 = z + hight/2;
  float z1 = z - hight/2;
  float boxPointX[] = new float[8];
  float boxPointY[] = new float[8];
  float boxPointZ[] = new float[8];

  boxPointX[0] = x0;
  boxPointY[0] = y0;
  boxPointZ[0] = z0;

  boxPointX[1] = x1;
  boxPointY[1] = y0;
  boxPointZ[1] = z0;

  boxPointX[2] = x0;
  boxPointY[2] = y1;
  boxPointZ[2] = z0;

  boxPointX[3] = x1;
  boxPointY[3] = y1;
  boxPointZ[3] = z0;

  boxPointX[4] = x0;
  boxPointY[4] = y0;
  boxPointZ[4] = z1;

  boxPointX[5] = x1;
  boxPointY[5] = y0;
  boxPointZ[5] = z1;

  boxPointX[6] = x0;
  boxPointY[6] = y1;
  boxPointZ[6] = z1;

  boxPointX[7] = x1;
  boxPointY[7] = y1;
  boxPointZ[7] = z1;

  a = 0;
  b = 1;
  c = 3;
  d = 2;

  for(p = 0;p < 6;p++){
    if(p == 0){
      a = 0;
      b = 1;
      c = 3;
      d = 2;
    }
    if(p == 1){
      a = 0;
      b = 1;
      c = 5;
      d = 4;
    }
    if(p == 2){
      a = 0;
      b = 2;
      c = 6;
      d = 4;
    }
    if(p == 3){
      a = 1;
      b = 3;
      c = 7;
      d = 5;
    }
    if(p == 4){
      a = 2;
      b = 3;
      c = 7;
      d = 6;
    }
    if(p == 5){
      a = 4;
      b = 5;
      c = 7;
      d = 6;
    }

    pPoint[boxNum*6+p][0]   = boxPointX[a];
    pPoint[boxNum*6+p][1]   = boxPointY[a];
    pPoint[boxNum*6+p][2]   = boxPointZ[a];

    pPoint[boxNum*6+p][3]   = boxPointX[b];
    pPoint[boxNum*6+p][4]   = boxPointY[b];
    pPoint[boxNum*6+p][5]   = boxPointZ[b];

    pPoint[boxNum*6+p][6]   = boxPointX[c];
    pPoint[boxNum*6+p][7]   = boxPointY[c];
    pPoint[boxNum*6+p][8]   = boxPointZ[c];

    pPoint[boxNum*6+p][9]   = boxPointX[d];
    pPoint[boxNum*6+p][10] = boxPointY[d];
    pPoint[boxNum*6+p][11] = boxPointZ[d];
  }
  boxNum++;
}

float cabinetX(float x,float y,float z)
{
  //Cabinet
  cashY = 0.35355 * y;
  float newX = x - cashY;

  //Isometric
//  newX = 1.7320508*(x-y)/2;

  //Perspective
//  newX = (x-wWidth/2) * pow(1.001,y-20) + wWidth/2;


  return newX;
}

float cabinetY(float x,float y,float z)
{
  //Cabinet
  float newY = z + cashY;

  //Isometric
//  newY = (x+y)/2 + z;

  //Perspective
//  newY = (z-wHight/2) * pow(1.001,y-20) + wHight/2;


  return newY;
}

void setRoll(float cx,float cy,float cz,float rx,float ry,float rz)
{
  float value = TWO_PI/360;
  float valueX = value*rx;
  float valueY = value*ry;
  float valueZ = value*rz;
  centerX = cx;
  centerY = cy;
  centerZ = cz;
  x_sin = sin(valueX);
  x_cos = cos(valueX);
  y_sin = sin(valueY);
  y_cos = cos(valueY);
  z_sin = sin(valueZ);
  z_cos = cos(valueZ);
}

float[] affine(float[] value)
{
  int os_num,ns_num;
  float af_x[] = new float[4];
  float af_y[] = new float[4];
  float af_z[] = new float[4];
  float x,y,z;
  
  x = value[0] - centerX;
  y = value[1] - centerY;
  z = value[2] - centerZ;
  
  float fixed0 = x*z_cos;
  float fixed1 = y*z_sin;
  
  float fixed2 = x*z_sin;
  float fixed3 = y_sin*x_sin;
  float fixed4 = y_sin*x_cos; 
  

  value[0] =  z*y_sin  +  fixed0*y_cos  -  fixed1*y_cos  +  centerX;
  value[1] =  fixed2*x_cos  +  y*z_cos*x_cos -  z*y_cos*x_sin  +  fixed0*fixed3  -  fixed1*fixed3   +   centerY;
  value[2] =  fixed2*x_sin  +  y*z_cos*x_sin  +  z*y_cos*x_cos  -   fixed0*fixed4  +  fixed1*fixed4   +   centerZ;

//  af_x[0] = value[0] - centerX;
//  af_y[0] = value[1] - centerY;
//  af_z[0] = value[2] - centerZ;
//
//  os_num = 0;ns_num = 1;
//  //z-roll
//  af_x[ns_num] = af_x[os_num]*z_cos-af_y[os_num]*z_sin;
//  af_y[ns_num] = af_x[os_num]*z_sin+af_y[os_num]*z_cos;
//  af_z[ns_num] = af_z[os_num];
//
//  os_num = 1;ns_num = 2;
//  //y-roll
//  af_z[ns_num] = af_z[os_num]*y_cos-af_x[os_num]*y_sin;
//  af_x[ns_num] = af_z[os_num]*y_sin+af_x[os_num]*y_cos;
//  af_y[ns_num] = af_y[os_num];
//
//  os_num = 2;ns_num = 3;
//  //x-roll
//  af_y[ns_num] = af_y[os_num]*x_cos-af_z[os_num]*x_sin;
//  af_z[ns_num] = af_y[os_num]*x_sin+af_z[os_num]*x_cos;
//  af_x[ns_num] = af_x[os_num];
//
//  os_num = 3;
//  value[0] = af_x[os_num] + centerX;
//  value[1] = af_y[os_num] + centerY;
//  value[2] = af_z[os_num] + centerZ;
  return value;
}

void boxAffine(int boxNumber,int loopNum)
{
  int b,p,i;
  float baPoint[] = new float[3];

  for(b = 0;b < loopNum;b++){
    for(p = 0;p < 6;p++){
      for(i = 0;i < 4;i++){
        baPoint[0] = pPoint[boxNumber*6 + p][3*i+0];
        baPoint[1] = pPoint[boxNumber*6 + p][3*i+1];
        baPoint[2] = pPoint[boxNumber*6 + p][3*i+2];
        affine(baPoint);
        pPoint[boxNumber*6 + p][3*i+0] = baPoint[0];
        pPoint[boxNumber*6 + p][3*i+1] = baPoint[1];
        pPoint[boxNumber*6 + p][3*i+2] = baPoint[2];
      }
    }
    boxNumber++;
  }
}                               
